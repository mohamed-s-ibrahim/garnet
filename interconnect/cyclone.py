"""
This implementation is converted from
https://github.com/Kuree/cgra_pnr/blob/master/cyclone/src/graph.hh
with adjustments due to language difference.

"""
import enum
from typing import List, Tuple, Dict, Set
from abc import ABC, abstractmethod
import magma


@enum.unique
class NodeType(enum.Enum):
    SwitchBox = enum.auto()
    Port = enum.auto()
    Register = enum.auto()
    Generic = enum.auto()


@enum.unique
class SwitchBoxSide(enum.Enum):
    """
       3
      ---
    2 | | 0
      ---
       1
    """
    NORTH = 3
    SOUTH = 1
    EAST = 0
    WEST = 2

    def __repr__(self):
        side = self
        if side == SwitchBoxSide.NORTH:
            return "north"
        elif side == SwitchBoxSide.SOUTH:
            return "south"
        elif side == SwitchBoxSide.EAST:
            return "east"
        elif side == SwitchBoxSide.WEST:
            return "west"
        else:
            raise ValueError("unknown value", side)

    def get_opposite_side(self) -> "SwitchBoxSide":
        side = self
        if side == SwitchBoxSide.NORTH:
            return SwitchBoxSide.SOUTH
        elif side == SwitchBoxSide.SOUTH:
            return SwitchBoxSide.NORTH
        elif side == SwitchBoxSide.EAST:
            return SwitchBoxSide.WEST
        elif side == SwitchBoxSide.WEST:
            return SwitchBoxSide.EAST
        else:
            raise ValueError("unknown value", side)


class SwitchBoxIO(enum.Enum):
    SB_IN = 0
    SB_OUT = 1


class NodeABC(ABC):
    TOKEN = "NODE"

    def __init__(self, x: int, y: int, width: int):
        self.x = x
        self.y = y
        self.width = width

        # holds circuit
        self.circuit = None

    @abstractmethod
    def __repr__(self):
        return ""

    @abstractmethod
    def __eq__(self, other):
        pass

    @abstractmethod
    def __iter__(self):
        pass

    @abstractmethod
    def __len__(self):
        pass

    @abstractmethod
    def add_edge(self, node: "NodeABC", delay: int = 0):
        pass

    @abstractmethod
    def remove_edge(self, node: "NodeABC"):
        pass

    def get_conn_in(self) -> List["NodeABC"]:
        pass


class Node(NodeABC):
    MAX_DEFAULT_DELAY = 100000

    def __init__(self, name: str, node_type: NodeType, x: int, y: int,
                 track: int, width: int):
        super().__init__(x, y, width)
        self.name = name
        self.type = node_type
        self.track = track

        self.__neighbors = []
        self.__conn_ins = []
        self.__edge_cost = dict()

    def add_edge(self, node: "Node", delay: int = 0):
        # basically we want an ordered set, which is implemented as a list
        if node not in self.__neighbors:
            assert self.width == node.width
            self.__neighbors.append(node)
            node.__conn_ins.append(self)
            self.__edge_cost[node] = delay

    def remove_edge(self, node: "Node"):
        if node in self.__neighbors:
            self.__edge_cost.pop(node)
            self.__neighbors.remove(node)

            # remove the incoming connections as well
            node.__conn_ins.remove(self)

    @abstractmethod
    def __hash__(self):
        pass

    def _default_hash(self):
        return self.name.__hash__() ^ self.type.__hash__() ^ \
               self.x.__hash__() ^ self.y.__hash__() ^ \
               self.width.__hash__() ^ self.track.__hash__()

    def get_edge_cost(self, node: "Node") -> int:
        if node not in self.__edge_cost:
            return self.MAX_DEFAULT_DELAY
        else:
            return self.__edge_cost[node]

    def get_conn_in(self):
        return self.__conn_ins

    def __eq__(self, other):
        if not isinstance(other, Node):
            return False
        if not self.type == other.type:
            return False

        # only compares x, y, and width
        return self.x == other.x and self.y == other.y and \
            self.width == other.width

    def __iter__(self):
        return iter(self.__neighbors)

    def __len__(self):
        return len(self.__neighbors)


class PortNode(Node):
    TOKEN = "PORT"

    def __init__(self, name: str, x: int, y: int, width: int):
        super().__init__(name, NodeType.Port, x, y, 0, width)

    def __repr__(self):
        return f"{self.TOKEN} {self.name} ({self.x}, {self.y}, {self.width})"

    def __eq__(self, other):
        if not super(Node).__eq__(other):
            return False
        return self.name == other.name

    def __hash__(self):
        return super()._default_hash()


class RegisterNode(Node):
    TOKEN = "REG"

    def __init__(self, name: str, x: int, y: int, track: int, width: int):
        super().__init__(name, NodeType.Port, x, y, track, width)

    def __repr__(self):
        return f"{self.TOKEN} {self.name} ({self.track}, {self.x},"\
            f" {self.y}, {self.width})"

    def __eq__(self, other):
        if not super(Node).__eq__(other):
            return False
        return self.track == other.track and self.name == other.name

    def __hash__(self):
        return super()._default_hash()


class SwitchBoxNode(Node):
    TOKEN = "SB"

    def __init__(self, x: int, y: int, track: int, width: int,
                 side: SwitchBoxSide, io: SwitchBoxIO):
        super().__init__("", NodeType.SwitchBox, x, y, track, width)
        self.side = side
        self.io = io

    def __repr__(self):
        return f"{self.TOKEN} ({self.track}, {self.x}, {self.y}, " + \
               f"{self.side.value}, {self.io.value}, {self.width})"

    def __eq__(self, other):
        if not super().__eq__(other):
            return False
        return self.track == other.track and self.side == other.side and \
            self.io == other.io

    def __hash__(self):
        return super()._default_hash() ^ self.side.__hash__() \
               ^ self.io.__hash__()


class Switch:
    TOKEN = "SWITCH"
    NUM_SIDES = 4
    NUM_IOS = 2

    def __init__(self, x: int, y: int, num_track: int, width: int,
                 internal_wires: List[Tuple[int, SwitchBoxSide,
                                            int, SwitchBoxSide]]):
        self.x = x
        self.y = y
        self.width = width

        self.__sbs = \
            [[[None for _ in range(num_track)]
             for _ in range(Switch.NUM_IOS)] for _ in range(Switch.NUM_SIDES)]

        self.num_track = num_track
        # construct the internal connections
        for side in SwitchBoxSide:
            for io in SwitchBoxIO:
                for track in range(num_track):
                    node = SwitchBoxNode(x, y, track, width,
                                         side,
                                         io)
                    self.__sbs[side.value][io.value][track] = node

        # assign internal wiring
        # the order is in -> out
        for conn in internal_wires:
            track_from, side_from, track_to, side_to = conn
            sb_from = \
                self.__sbs[side_from.value][SwitchBoxIO.SB_IN.value][track_from]
            sb_to = \
                self.__sbs[side_to.value][SwitchBoxIO.SB_OUT.value][track_to]
            # internal sb connection has no delay
            sb_from.add_edge(sb_to, 0)

        self.internal_wires = internal_wires

        # used to identify different types of switches
        self.id = 0

    def __eq__(self, other):
        if not isinstance(other, Switch):
            return False
        if len(self.internal_wires) != len(other.internal_wires):
            return False
        # check bijection
        for conn in self.internal_wires:
            if conn not in other.internal_wires:
                return False
        return True

    def __repr__(self):
        return f"{self.TOKEN} {self.width} {self.id} {self.num_track}"

    def __getitem__(self, item: Tuple[SwitchBoxSide, int, SwitchBoxIO]):
        if not isinstance(item, tuple):
            raise ValueError("index has to be a tuple")
        if len(item) != 3:
            raise ValueError("index has to be length 3")
        if not isinstance(item[0], SwitchBoxSide):
            raise ValueError(item[0])
        if not isinstance(item[-1], SwitchBoxIO):
            raise ValueError(item[-1])
        side, track, io = item
        return self.__sbs[side.value][io.value][track]

    def get_all_sbs(self) -> List[SwitchBoxNode]:
        result = []
        for track in range(self.num_track):
            for side in range(self.NUM_SIDES):
                for io in range(self.NUM_IOS):
                    # we may have removed the nodes
                    if track < len(self.__sbs[side][io]):
                        result.append(self.__sbs[side][io][track])
        return result

    def remove_side_sbs(self, side: SwitchBoxSide, io: SwitchBoxIO):
        # first remove the connections and nodes
        for sb in self.__sbs[side.value][io.value]:
            # create a snapshot before removes them
            nodes_to_remove = list(sb)
            for node in nodes_to_remove:
                sb.remove_edge(node)
            for node in sb.get_conn_in():
                node.remove_edge(sb)

        self.__sbs[side.value][io.value].clear()
        # then remove the internal wires
        wires_to_remove = set()
        for conn in self.internal_wires:
            _, side_from, _, side_to = conn
            if io == SwitchBoxIO.SB_IN and side_from == side:
                wires_to_remove.add(conn)
            elif io == SwitchBoxIO.SB_OUT and side_to == side:
                wires_to_remove.add(conn)
        for conn in wires_to_remove:
            self.internal_wires.remove(conn)


class Tile:
    TOKEN = "TILE"

    def __init__(self, x: int, y: int, track_width: int, switchbox: Switch,
                 height: int = 1):
        self.x = x
        self.y = y
        self.track_width = track_width
        self.height = height

        # create a copy of switch box because the switchbox nodes have to be
        # created
        self.switchbox = Switch(x, y, switchbox.num_track,
                                switchbox.width,
                                switchbox.internal_wires)

        self.ports = {}
        self.registers = {}

        self.inputs = set()
        self.outputs = set()

        # used to hold port references
        self.port_references = {}

    def __eq__(self, other):
        if not isinstance(other, Tile):
            return False
        return self.x == other.x and self.y == other.y and \
            self.height == other.height

    def __repr__(self):
        return f"{self.TOKEN} ({self.x}, {self.y}, {self.height}, " +\
               f"{self.switchbox.id})"

    def set_core(self, core):
        self.inputs.clear()
        self.outputs.clear()
        self.ports.clear()

        # this is to clear to core
        if core is None:
            return

        for port in core.inputs():
            port_name = port.qualified_name()
            width = self.__get_bit_width(port)
            if width == self.track_width:
                self.inputs.add(port_name)
                # create node
                self.ports[port_name] = PortNode(port_name, self.x, self.y,
                                                 self.track_width)
                self.port_references[port_name] = port
        for port in core.outputs():
            port_name = port.qualified_name()
            width = self.__get_bit_width(port)
            if width == self.track_width:
                self.outputs.add(port_name)
                # create node
                self.ports[port_name] = PortNode(port_name, self.x, self.y,
                                                 self.track_width)
                self.port_references[port_name] = port

    @staticmethod
    def __get_bit_width(port):
        # nasty function to get the actual bitwidth from the port reference
        t = port.type()
        if isinstance(t, magma.BitKind):
            return 1
        if isinstance(port.type(), magma.BitsKind):
            return len(t)
        raise NotImplementedError(t, type(t))

    def core_has_input(self, port: str):
        return port in self.inputs

    def core_has_output(self, port: str):
        return port in self.outputs

    def name(self):
        return str(self)

    @staticmethod
    def create_tile(x: int, y: int, num_tracks: int, bit_width: int,
                    internal_wires: List[Tuple[int, SwitchBoxSide,
                                               int, SwitchBoxSide]],
                    height: int = 1):
        switch = Switch(x, y, num_tracks, bit_width, internal_wires)
        tile = Tile(x, y, bit_width, switch, height)
        return tile


class Graph:
    def __init__(self):
        self.__grid = {}
        self.__switch_ids = {}

    def add_tile(self, tile: Tile):
        tile.switchbox.id = self.__assign_id(tile.switchbox)
        self.__grid[(tile.x, tile.y)] = tile

    def __assign_id(self, switch: Switch) -> int:
        for switch_id, s in self.__switch_ids.items():
            if switch == s:
                return switch_id
        switch_id = len(self.__switch_ids)
        self.__switch_ids[switch_id] = switch
        return switch_id

    def remove_tile(self, coord: Tuple[int, int]):
        if coord in self.__grid:
            self.__grid.pop(coord)

    def __getitem__(self, item: Tuple[int, int]):
        return self.__grid[item]

    def dump_graph(self, filename: str):
        with open(filename, "w+") as f:
            padding = "  "
            begin = "BEGIN"
            end = "END"

            def write_line(value):
                f.write(value + "\n")

            def write_conn(node_):
                if len(node_) == 0:
                    # don't output if it doesn't have any connections
                    return
                # TODO: need to test if it is deterministic
                write_line(padding + str(node_))
                write_line(padding + begin)
                for n in node_:
                    write_line(padding * 3 + str(n))
                write_line(padding + end)

            for _, switch in self.__switch_ids.items():
                write_line(str(switch))
                write_line(begin)
                for conn in switch.internal_wires:
                    track_from, side_from, track_to, side_to = conn
                    write_line(padding + " ".join([str(track_from),
                                                  str(side_from.value),
                                                  str(track_to),
                                                  str(side_to.value)]))
                write_line(end)
            for _, tile in self.__grid.items():
                write_line(str(tile))
                sbs = tile.switchbox.get_all_sbs()
                for sb in sbs:
                    write_conn(sb)
                for _, node in tile.ports.items():
                    write_conn(node)
                for _, reg in tile.registers.items():
                    write_conn(reg)