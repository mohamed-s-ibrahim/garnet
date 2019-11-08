import argparse
import fault
import magma
import textwrap
import types
import struct
import json
import random
import re
from shutil import copyfile
import sys
import tempfile
import time
from commands import *
from applications import OneShotValid, OneShotStall, Tiled, OuterProduct, Conv3x3ReLU
from PIL import Image

import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

class AppTester(fault.Tester):
    def zero_inputs(self):
        # circuit.jtag_tck = 0
        self.poke(self._circuit.jtag_tck, 0)
        # circuit.jtag_tdi = 0
        self.poke(self._circuit.jtag_tdi, 0)
        # circuit.jtag_tms = 0
        self.poke(self._circuit.jtag_tms, 0)
        # circuit.jtag_trst_n = 1
        self.poke(self._circuit.jtag_trst_n, 1)

        # circuit.axi4_ctrl_araddr = 0
        self.poke(self._circuit.axi4_ctrl_araddr, 0)
        # circuit.axi4_ctrl_arvalid = 0
        self.poke(self._circuit.axi4_ctrl_arvalid, 0)
        # circuit.axi4_ctrl_rready = 0
        self.poke(self._circuit.axi4_ctrl_rready, 0)
        # circuit.axi4_ctrl_awaddr = 0
        self.poke(self._circuit.axi4_ctrl_awaddr, 0)
        # circuit.axi4_ctrl_awvalid = 0
        self.poke(self._circuit.axi4_ctrl_awvalid, 0)
        # circuit.axi4_ctrl_wdata = 0
        self.poke(self._circuit.axi4_ctrl_wdata, 0)
        # circuit.axi4_ctrl_wvalid = 0
        self.poke(self._circuit.axi4_ctrl_wvalid, 0)


def test_flow(args):
    if args.from_verilog:
        # Magma is slow, so we create a stub dynamically and tell it
        # to only parse the top level module.
        with open('garnet.v', 'r') as f:
            v = f.read()
            match = re.search(r"module Garnet \([^)]*\);", v)
            s = v[match.start():match.end()] + "\nendmodule"

            if args.width is None:
                args.width = max(map(lambda x: int(x, 16), re.findall(r"glb2io_16_X([0-9a-fA-F]+)", v))) + 1

        dut = magma.DefineFromVerilog(
            s,
            target_modules=['Garnet'],
            type_map={
                "clk_in": magma.In(magma.Clock)
            },
            shallow=True,
        )[0]
    else:
        # this import is kinda slow so only do it if needed
        from garnet import Garnet
        dut = Garnet(width=32, height=16, add_pd=False).circuit

    if args.width is None:
        args.width = 32

    print(dut)

    tester = AppTester(dut, clock=dut.clk_in)
    tester.circuit.clk_in = 0

    # Reset the CGRA (active high)
    def reset_cgra():
        tester.circuit.reset_in = 0
        tester.eval()
        tester.step(2)

        tester.circuit.reset_in = 1
        tester.eval()
        tester.step(2)

        tester.circuit.reset_in = 0
        tester.eval()
        tester.step(2)

    reset_cgra()

    seed = random.randrange(sys.maxsize)
    rng = random.seed(seed)
    print("Seed was:", seed)

    commands = [
        # Verify AXI working with TEST_REG
        WRITE_REG(TEST_REG, 0xDEADBEEF),
        READ_REG(TEST_REG, 0xDEADBEEF),
    ]

    # Poke and read all registers on the CGRA
    # commands = []
    # with open('config.json', 'r') as f:
    #     reglist = json.load(f)
    #     for reg in reglist:
    #         for _ in range(10):
    #             val = random.randrange(reg['range'])
    #             commands += [
    #                 WRITE_REG(CGRA_CONFIG_ADDR_REG, reg['addr']),
    #                 WRITE_REG(CGRA_CONFIG_DATA_REG, val),
    #                 # WRITE_REG(CGRA_CONFIG_ADDR_REG, reg['addr']),
    #                 READ_REG(CGRA_CONFIG_DATA_REG, val),
    #             ]

    import numpy as np
    np.set_printoptions(formatter={'int': hex})

    # im = np.fromfile(
    #     'applications/conv_1_2/conv_1_2_input.raw',
    #     dtype=np.uint8
    # ).astype(np.uint16)

    # gold = np.fromfile(
    #     'applications/conv_1_2/conv_1_2_gold.raw',
    #     dtype=np.uint8
    # ).astype(np.uint16)

    # print(im[0:4])

    # conv_1_2 = [
    #     WRITE_REG(GLOBAL_RESET_REG, 1),
    #     # Stall the CGRA
    #     WRITE_REG(STALL_REG, 0b1111),

    #     # Configure the CGRA
    #     *gc_config_bitstream('applications/conv_1_2_valid/conv_1_2.bs'),

    #     # Set up global buffer for pointwise
    #     *configure_io(IO_INPUT_STREAM, BANK_ADDR(0), len(im), mask=0b1111, width=args.width),
    #     *configure_io(IO_OUTPUT_STREAM, BANK_ADDR(16), len(gold), mask=0b1111, width=args.width),

    #     # Put image into global buffer
    #     WRITE_DATA(BANK_ADDR(0), 0xc0ffee, im.nbytes, im),

    #     # Start the application
    #     WRITE_REG(CGRA_SOFT_RESET_EN_REG, 1),
    #     WRITE_REG(SOFT_RESET_DELAY_REG, 2),
    #     NOP(),
    #     NOP(),
    #     NOP(),
    #     NOP(),
    #     NOP(),
    #     NOP(),
    #     WRITE_REG(STALL_REG, 0),
    #     NOP(),
    #     NOP(),
    #     NOP(),
    #     NOP(),
    #     PEND(0b01, "start"),
    #     WRITE_REG(CGRA_START_REG, 1),

    #     # TODO Wait a bit
    #     WAIT(0b01, "start"),
    #     READ_DATA(
    #         BANK_ADDR(16),
    #         gold.nbytes,
    #         gold,
    #         _file=tester.file_open("logs/conv_1_2_out.raw", "wb", 8)
    #     ),
    # ]

    # # This command sequence feeds the output of the conv_1_2 back into itself
    # commands = [
    #     WRITE_REG(GLOBAL_RESET_REG, 1),
    #     # Stall the CGRA
    #     WRITE_REG(STALL_REG, 0b1111),

    #     # Configure the CGRA
    #     *gc_config_bitstream('applications/conv_1_2_valid/conv_1_2.bs'),

    #     # Set up global buffer for pointwise
    #     *configure_io(IO_INPUT_STREAM, BANK_ADDR(0), 4096, width=args.width),
    #     *configure_io(IO_OUTPUT_STREAM, BANK_ADDR(16), 4096-64, width=args.width),

    #     # Put image into global buffer
    #     WRITE_DATA(BANK_ADDR(0), 0xc0ffee, im.nbytes, im),

    #     # Start the application
    #     WRITE_REG(STALL_REG, 0),

    #     PEND(0b01, "start1"),
    #     WRITE_REG(CGRA_START_REG, 1),
    #     WAIT(0b01, "start1"),

    #     *configure_io(IO_INPUT_STREAM, BANK_ADDR(16), 4096-64, io_ctrl=0, mask=0b1111, width=args.width),
    #     *configure_io(IO_OUTPUT_STREAM, BANK_ADDR(17), 4096-64-64, width=args.width),

    #     PEND(0b01, "start2"),
    #     WRITE_REG(CGRA_START_REG, 1),
    #     WAIT(0b01, "start2"),

    #     READ_DATA(
    #         BANK_ADDR(17),
    #         4096-64-64,
    #         gold,
    #         _file=tester.file_open('logs/loopback.raw', "wb", 8),
    #     ),
    # ]

    app = OneShotValid(
        bitstream = 'applications/conv_3_3/conv_3_3.bs',
        infile = 'applications/conv_3_3/conv_3_3_input.raw',
        goldfile = 'applications/conv_3_3/conv_3_3_gold.raw',
        outfile = 'logs/conv_3_3.raw',
        args = args,
    )

    # app = OneShotStall(
    #     bitstream = 'applications/conv_3_3/conv_3_3.bs',
    #     infile = 'applications/conv_3_3/conv_3_3_input.raw',
    #     goldfile = 'applications/conv_3_3/conv_3_3_gold.raw',
    #     outfile = 'logs/conv_3_3.raw',
    #     args = args,
    # )

    # app = OuterProduct(
    #    bitstream = 'applications/outerprod/handcrafted_ub_outerprod_gb.bs',
    #    weightfiles = [
    #        'applications/outerprod/weights.gray',  # TODO: hack
    #    ],
    #    infiles = [
    #        'applications/outerprod/input.gray',  # TODO: hack
    #    ],
    #    goldfile = 'applications/outerprod/handcrafted_ub_outerprod_gb_gold.raw',
    #    outfile = 'logs/outerprod.gray',  # TODO: hack
    #    args = args,
    # )

    # app = Conv3x3ReLU(
    #     bitstream = 'applications/simple_layer/handcrafted_ub_layer_gb.bs',
    #     weightfiles = [
    #         'applications/simple_layer/weights.gray',
    #     ],
    #     infiles = [
    #         'applications/simple_layer/input.gray',
    #     ],
    #     goldfile = 'applications/simple_layer/gold.gray',
    #     outfile = 'logs/conv3x3relu.raw',
    #     args = args,
    # )

    #app = Tiled(
    #    bitstream = 'applications/conv_3_3/conv_3_3.bs',
    #    infiles = [
    #        'applications/conv_3_3/conv_3_3_input.raw',
    #        'applications/conv_3_3/conv_3_3_input.raw',
    #        'applications/conv_3_3/conv_3_3_input.raw',
    #        'applications/conv_3_3/conv_3_3_input.raw',
    #    ],
    #    goldfiles = [
    #        'applications/conv_3_3/conv_3_3_gold.raw',
    #        'applications/conv_3_3/conv_3_3_gold.raw',
    #        'applications/conv_3_3/conv_3_3_gold.raw',
    #        'applications/conv_3_3/conv_3_3_gold.raw',
    #    ],
    #    outfiles = [
    #        'logs/conv_3_3.0.raw',
    #        'logs/conv_3_3.1.raw',
    #        'logs/conv_3_3.2.raw',
    #        'logs/conv_3_3.3.raw',
    #    ],
    #    args = args,
    #)

    # print("\n".join(map(str, app.commands())))

    # app = OneShotValid(
    #     bitstream = 'applications/conv_1_2_valid/conv_1_2.bs',
    #     infile = 'applications/conv_1_2_valid/conv_1_2_input.raw',
    #     goldfile = 'applications/conv_1_2_valid/conv_1_2_gold.raw',
    #     outfile = 'logs/conv_1_2_valid.raw',
    #     args = args,
    # )

    commands = app.commands()

    print(f"Command list has {len(commands)} commands.")
    print("Generating testbench...")
    start = time.time()

    create_testbench(tester, commands)
    print(f"Testbench generation done. (Took {time.time() - start}s)")

    start = time.time()
    # Generate straightline C code
    with open("tests/build/test.c", "w") as f:
        f.write(create_straightline_code(commands))

    print(f"Generating straightline code took {time.time() - start} sec.")

    if not args.no_sim:
        print("Running test...")

        # HACK: magma expects Garnet.v but we hid it because magma is
        # slow so we just created a stub of the module to parse
        # instead, so Garnet.v has no body, and instantiates a blank
        # design.
        copyfile("garnet.v", "tests/build/Garnet.v")

        VCS = True
        if VCS:
            tester.compile_and_run(
                target="system-verilog",
                simulator="vcs",
                directory="tests/build/",
                include_verilog_libraries=[
                    "AO22D0BWP16P90.sv",
                    "AN2D0BWP16P90.sv",
                    "memory_core.sv",
                    "mem_unq1.v",
                    "sram_stub_unq1.v",
                    "doublebuffer_control_unq1.sv",
                    "sram_control_unq1.sv",
                    "fifo_control_unq1.sv",
                    "linebuffer_control_unq1.sv",
                    "global_buffer.sv",
                    "global_buffer_int.sv",
                    "memory_bank.sv",
                    "bank_controller.sv",
                    "glbuf_memory_core.sv",
                    "cfg_controller.sv",
                    "cfg_address_generator.sv",
                    "sram_controller.sv",
                    "memory.sv",
                    "io_controller.sv",
                    "io_address_generator.sv",
                    "sram_gen.sv",
                    "TS1N16FFCLLSBLVTC2048X64M8SW.sv",
                    "host_bank_interconnect.sv",
                    "global_controller.sv",
                    "DW_fp_add.v",
                    "DW_fp_mult.v",
                    "axi_ctrl_unq1.sv",
                    "jtag_unq1.sv",
                    "cfg_and_dbg_unq1.sv",
                    "flop_unq3.sv",
                    "flop_unq2.sv",
                    "flop_unq1.sv",
                    "tap_unq1.sv",
                    "CW_tap.v",
                ],
                skip_compile=not args.recompile,
                magma_output='verilog',
            )
        else:
            tester.compile_and_run(
                target="verilator",
                directory="tests/build/",
                # circuit_name="Garnet",
                # include_verilog_libraries=["garnet.v"],
                flags=[
                    '-Wno-UNUSED',
                    '-Wno-PINNOCONNECT',
                    '-Wno-fatal',
                    # '--debug',
                    '--trace' if args.debug else '',
                    f'--trace-max-array {2**17}' if args.trace_mem else '',
                    # '--no-debug-leak',
                ],
                skip_compile=not args.recompile,  # turn on to skip DUT compilation
                skip_verilator=not args.recompile,  # turn on to skip DUT compilation
                magma_output='verilog',
                magma_opts={"verilator_debug": True},
            )

    result = np.fromfile(
        "tests/build/" + app.outfile,
        dtype=np.uint16,
    ).astype(np.uint8)
    assert app.verify(result)

    # result = np.loadtxt(
    #     'soc.txt',
    #     dtype=np.uint64,
    #     converters={0: lambda x: int(x, 16)}
    # ).view(np.uint16).astype(np.uint8)
    # print("Verifying SoC outputs...")
    # app.verify(result)

def main():
    parser = argparse.ArgumentParser(description="""
    A simple SoC stub to test application flow of the CGRA.
    """)

    parser.add_argument('--recompile', action='store_true')
    parser.add_argument('--from-verilog', action='store_true')
    parser.add_argument('--debug', action='store_true')
    parser.add_argument('--trace-mem', action='store_true')
    parser.add_argument('--profile', action='store_true')
    parser.add_argument('--width', type=int, default=None)
    parser.add_argument('--no-sim', action='store_true')
    # parser.add_argument('--height', type=int, default=2)
    # parser.add_argument("--input-netlist", type=str, default="", dest="input")
    # parser.add_argument("--output-bitstream", type=str, default="",
    #                     dest="output")
    # parser.add_argument("-v", "--verilog", action="store_true")
    # parser.add_argument("--no-pd", "--no-power-domain", action="store_true")
    args = parser.parse_args()

    # assert args.width % 4 == 0 and args.width >= 4
    # garnet = Garnet(width=args.width, height=args.height, add_pd=not args.no_pd) # noqa
    if args.profile:
        cProfile.run('test_flow(args)', 'flow.prof')
    else:
        test_flow(args)

    # if args.verilog:
    #     garnet_circ = garnet.circuit()
    #     magma.compile("garnet", garnet_circ, output="coreir-verilog")
    # if len(args.input) > 0 and len(args.output) > 0:
    #     # do PnR and produce bitstream
    #     bitstream = garnet.compile(args.input)
    #     with open(args.output, "w+") as f:
    #         bs = ["{0:08X} {1:08X}".format(entry[0], entry[1]) for entry
    #               in bitstream]
    #         f.write("\n".join(bs))


if __name__ == "__main__":
    main()