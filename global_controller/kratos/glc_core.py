from kratos import *
from interface.handshake_if import Handshake
from math import log2, ceil

class _Reg:
    def __init__(self, _module, _name, _width, _addr):
        self._name = _name
        self._addr = _addr
        self._width = _width
        self._reg = _module.var(self._name, self._width)

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, value):
        self._name = value

    @property
    def width(self):
        return self._width

    @width.setter
    def width(self, value):
        self._width = value

    @property
    def addr(self):
        return self._addr

    @addr.setter
    def addr(self, value):
        self._addr = value

    @property
    def reg(self):
        return self._reg

    @reg.setter
    def reg(self, value):
        self._reg = value

class GlcCore(Generator):
    def __init__(self, p_glc_hs_awidth, p_glc_hs_dwidth):
        super().__init__("glc_axil_controller", True)

        # python variables
        self._global_addr = 0
        self._regs = []

        # Parameters
        self.p_glc_hs_awidth = p_glc_hs_awidth
        self.p_glc_hs_dwidth = p_glc_hs_dwidth
        self.p_glc_hs_byte_offset = ceil(log2(p_glc_hs_dwidth/8))

        # Global Controller internal interface
        self.glc_hs_if = Handshake(self.p_glc_hs_awidth, self.p_glc_hs_dwidth)

        # declare ports
        self.clk = self.clock("clk")
        self.rst_n = self.reset("rst_n")

        # glc handshake slave ports
        self.glc_hs_s = self.port_bundle("glc_hs_s", self.glc_hs_if.slave())

        self.declare_internal_vars()
        self.define_reg()
        self.add_code(self.seq_reg_read)

    def add_reg(self, _name, _width):
        _reg = _Reg(self, _name, _width, self._global_addr)
        self._regs.append(_reg)
        self._global_addr += 1
        return _reg

    def define_reg(self):
        self._ier = self.add_reg("ier", 2)
        self._isr = self.add_reg("_isr", 2)
        self._cgra_wr_en = self.add_reg("_cgra_wr_en", 1)
        self._cgra_rd_en = self.add_reg("_cgra_rd_en", 1)
        self._cgra_addr = self.add_reg("_cgra_addr", 32)
        self._cgra_wr_data = self.add_reg("_cgra_wr_data", 32)
        self._cgra_rd_data = self.add_reg("_cgra_rd_data", 32)

    def declare_internal_vars(self):
        self._rd_addr = self.var("_rd_addr",
                self.p_glc_hs_awidth - self.p_glc_hs_byte_offset)
        self._rd_addr.assign(self.glc_hs_s.rd_addr[self.p_glc_hs_awidth - 1,
                                                   self.p_glc_hs_byte_offset])

        self._wr_addr = self.var("_wr_addr",
                self.p_glc_hs_awidth - self.p_glc_hs_byte_offset)
        self._wr_addr.assign(self.glc_hs_s.wr_addr[self.p_glc_hs_awidth - 1,
                                                   self.p_glc_hs_byte_offset])

        self._rd_data = self.var("_rd_data", self.p_glc_hs_dwidth)
        # self.glc_hs_s.rd_data.assign(self._rd_data)
        self.wire(self.glc_hs_s.rd_data, self._rd_data)

    @always((posedge, "clk"), (negedge, "rst_n"))
    def seq_reg_write(self):
        if ~self.rst_n:
            for idx in range(len(self._regs)):
                if self._wr_addr == self._regs[idx].addr:
                    self._regs[idx].reg = 0
            self.glc_hs_s.wr_ack = 0
        elif (self.glc_hs_s.wr_req):
            self.glc_hs_s.wr_ack = 1
            for idx in range(len(self._regs)):
                if self._wr_addr == self._regs[idx].addr:
                    self._regs[idx].reg = self.glc_hs_s.wr_data
        else:
            self.glc_hs_s.wr_ack = 0

    @always((posedge, "clk"), (negedge, "rst_n"))
    def seq_reg_read(self):
        if ~self.rst_n:
            self._rd_data = 0
            self.glc_hs_s.rd_ack = 0
        elif (self.glc_hs_s.rd_req):
            self.glc_hs_s.rd_ack = 1
            for idx in range(len(self._regs)):
                if self._rd_addr == self._regs[idx].addr:
                    self._rd_data = ext(self._regs[idx].reg, self._rd_data.width)
        else:
            self.glc_hs_s.rd_ack = 0

