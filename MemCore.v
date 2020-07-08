module coreir_wrap (
    input in,
    output out
);
  assign out = in;
endmodule

module coreir_slice #(
    parameter hi = 1,
    parameter lo = 0,
    parameter width = 1
) (
    input [width-1:0] in,
    output [hi-lo-1:0] out
);
  assign out = in[hi-1:lo];
endmodule

module coreir_reg_arst #(
    parameter width = 1,
    parameter arst_posedge = 1,
    parameter clk_posedge = 1,
    parameter init = 1
) (
    input clk,
    input arst,
    input [width-1:0] in,
    output [width-1:0] out
);
  reg [width-1:0] outReg;
  wire real_rst;
  assign real_rst = arst_posedge ? arst : ~arst;
  wire real_clk;
  assign real_clk = clk_posedge ? clk : ~clk;
  always @(posedge real_clk, posedge real_rst) begin
    if (real_rst) outReg <= init;
    else outReg <= in;
  end
  assign out = outReg;
endmodule

module coreir_orr #(
    parameter width = 1
) (
    input [width-1:0] in,
    output out
);
  assign out = |in;
endmodule

module coreir_or #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output [width-1:0] out
);
  assign out = in0 | in1;
endmodule

module coreir_not #(
    parameter width = 1
) (
    input [width-1:0] in,
    output [width-1:0] out
);
  assign out = ~in;
endmodule

module coreir_mux #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    input sel,
    output [width-1:0] out
);
  assign out = sel ? in1 : in0;
endmodule

module coreir_eq #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output out
);
  assign out = in0 == in1;
endmodule

module coreir_const #(
    parameter width = 1,
    parameter value = 1
) (
    output [width-1:0] out
);
  assign out = value;
endmodule

module corebit_term (
    input in
);

endmodule

module corebit_const #(
    parameter value = 1
) (
    output out
);
  assign out = value;
endmodule

module corebit_and (
    input in0,
    input in1,
    output out
);
  assign out = in0 & in1;
endmodule

module commonlib_muxn__N2__width7 (
    input [6:0] in_data_0,
    input [6:0] in_data_1,
    input [0:0] in_sel,
    output [6:0] out
);
wire [6:0] _join_out;
coreir_mux #(
    .width(7)
) _join (
    .in0(in_data_0),
    .in1(in_data_1),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width6 (
    input [5:0] in_data_0,
    input [5:0] in_data_1,
    input [0:0] in_sel,
    output [5:0] out
);
wire [5:0] _join_out;
coreir_mux #(
    .width(6)
) _join (
    .in0(in_data_0),
    .in1(in_data_1),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width4 (
    input [3:0] in_data_0,
    input [3:0] in_data_1,
    input [0:0] in_sel,
    output [3:0] out
);
wire [3:0] _join_out;
coreir_mux #(
    .width(4)
) _join (
    .in0(in_data_0),
    .in1(in_data_1),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width32 (
    input [31:0] in_data_0,
    input [31:0] in_data_1,
    input [0:0] in_sel,
    output [31:0] out
);
wire [31:0] _join_out;
coreir_mux #(
    .width(32)
) _join (
    .in0(in_data_0),
    .in1(in_data_1),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N4__width32 (
    input [31:0] in_data_0,
    input [31:0] in_data_1,
    input [31:0] in_data_2,
    input [31:0] in_data_3,
    input [1:0] in_sel,
    output [31:0] out
);
wire [31:0] _join_out;
wire [31:0] muxN_0_out;
wire [31:0] muxN_1_out;
wire [0:0] sel_slice0_out;
wire [0:0] sel_slice1_out;
coreir_mux #(
    .width(32)
) _join (
    .in0(muxN_0_out),
    .in1(muxN_1_out),
    .sel(in_sel[1]),
    .out(_join_out)
);
commonlib_muxn__N2__width32 muxN_0 (
    .in_data_0(in_data_0),
    .in_data_1(in_data_1),
    .in_sel(sel_slice0_out),
    .out(muxN_0_out)
);
commonlib_muxn__N2__width32 muxN_1 (
    .in_data_0(in_data_2),
    .in_data_1(in_data_3),
    .in_sel(sel_slice1_out),
    .out(muxN_1_out)
);
coreir_slice #(
    .hi(1),
    .lo(0),
    .width(2)
) sel_slice0 (
    .in(in_sel),
    .out(sel_slice0_out)
);
coreir_slice #(
    .hi(1),
    .lo(0),
    .width(2)
) sel_slice1 (
    .in(in_sel),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N8__width32 (
    input [31:0] in_data_0,
    input [31:0] in_data_1,
    input [31:0] in_data_2,
    input [31:0] in_data_3,
    input [31:0] in_data_4,
    input [31:0] in_data_5,
    input [31:0] in_data_6,
    input [31:0] in_data_7,
    input [2:0] in_sel,
    output [31:0] out
);
wire [31:0] _join_out;
wire [31:0] muxN_0_out;
wire [31:0] muxN_1_out;
wire [1:0] sel_slice0_out;
wire [1:0] sel_slice1_out;
coreir_mux #(
    .width(32)
) _join (
    .in0(muxN_0_out),
    .in1(muxN_1_out),
    .sel(in_sel[2]),
    .out(_join_out)
);
commonlib_muxn__N4__width32 muxN_0 (
    .in_data_0(in_data_0),
    .in_data_1(in_data_1),
    .in_data_2(in_data_2),
    .in_data_3(in_data_3),
    .in_sel(sel_slice0_out),
    .out(muxN_0_out)
);
commonlib_muxn__N4__width32 muxN_1 (
    .in_data_0(in_data_4),
    .in_data_1(in_data_5),
    .in_data_2(in_data_6),
    .in_data_3(in_data_7),
    .in_sel(sel_slice1_out),
    .out(muxN_1_out)
);
coreir_slice #(
    .hi(2),
    .lo(0),
    .width(3)
) sel_slice0 (
    .in(in_sel),
    .out(sel_slice0_out)
);
coreir_slice #(
    .hi(2),
    .lo(0),
    .width(3)
) sel_slice1 (
    .in(in_sel),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width30 (
    input [29:0] in_data_0,
    input [29:0] in_data_1,
    input [0:0] in_sel,
    output [29:0] out
);
wire [29:0] _join_out;
coreir_mux #(
    .width(30)
) _join (
    .in0(in_data_0),
    .in1(in_data_1),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width2 (
    input [1:0] in_data_0,
    input [1:0] in_data_1,
    input [0:0] in_sel,
    output [1:0] out
);
wire [1:0] _join_out;
coreir_mux #(
    .width(2)
) _join (
    .in0(in_data_0),
    .in1(in_data_1),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width16 (
    input [15:0] in_data_0,
    input [15:0] in_data_1,
    input [0:0] in_sel,
    output [15:0] out
);
wire [15:0] _join_out;
coreir_mux #(
    .width(16)
) _join (
    .in0(in_data_0),
    .in1(in_data_1),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width12 (
    input [11:0] in_data_0,
    input [11:0] in_data_1,
    input [0:0] in_sel,
    output [11:0] out
);
wire [11:0] _join_out;
coreir_mux #(
    .width(12)
) _join (
    .in0(in_data_0),
    .in1(in_data_1),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width10 (
    input [9:0] in_data_0,
    input [9:0] in_data_1,
    input [0:0] in_sel,
    output [9:0] out
);
wire [9:0] _join_out;
coreir_mux #(
    .width(10)
) _join (
    .in0(in_data_0),
    .in1(in_data_1),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width1 (
    input [0:0] in_data_0,
    input [0:0] in_data_1,
    input [0:0] in_sel,
    output [0:0] out
);
wire [0:0] _join_out;
coreir_mux #(
    .width(1)
) _join (
    .in0(in_data_0),
    .in1(in_data_1),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N1__width32 (
    input [31:0] in_data_0,
    input [0:0] in_sel,
    output [31:0] out
);
corebit_term term_sel (
    .in(in_sel[0])
);
assign out = in_data_0;
endmodule

module commonlib_muxn__N16__width32 (
    input [31:0] in_data_0,
    input [31:0] in_data_1,
    input [31:0] in_data_10,
    input [31:0] in_data_11,
    input [31:0] in_data_12,
    input [31:0] in_data_13,
    input [31:0] in_data_14,
    input [31:0] in_data_15,
    input [31:0] in_data_2,
    input [31:0] in_data_3,
    input [31:0] in_data_4,
    input [31:0] in_data_5,
    input [31:0] in_data_6,
    input [31:0] in_data_7,
    input [31:0] in_data_8,
    input [31:0] in_data_9,
    input [3:0] in_sel,
    output [31:0] out
);
wire [31:0] _join_out;
wire [31:0] muxN_0_out;
wire [31:0] muxN_1_out;
wire [2:0] sel_slice0_out;
wire [2:0] sel_slice1_out;
coreir_mux #(
    .width(32)
) _join (
    .in0(muxN_0_out),
    .in1(muxN_1_out),
    .sel(in_sel[3]),
    .out(_join_out)
);
commonlib_muxn__N8__width32 muxN_0 (
    .in_data_0(in_data_0),
    .in_data_1(in_data_1),
    .in_data_2(in_data_2),
    .in_data_3(in_data_3),
    .in_data_4(in_data_4),
    .in_data_5(in_data_5),
    .in_data_6(in_data_6),
    .in_data_7(in_data_7),
    .in_sel(sel_slice0_out),
    .out(muxN_0_out)
);
commonlib_muxn__N8__width32 muxN_1 (
    .in_data_0(in_data_8),
    .in_data_1(in_data_9),
    .in_data_2(in_data_10),
    .in_data_3(in_data_11),
    .in_data_4(in_data_12),
    .in_data_5(in_data_13),
    .in_data_6(in_data_14),
    .in_data_7(in_data_15),
    .in_sel(sel_slice1_out),
    .out(muxN_1_out)
);
coreir_slice #(
    .hi(3),
    .lo(0),
    .width(4)
) sel_slice0 (
    .in(in_sel),
    .out(sel_slice0_out)
);
coreir_slice #(
    .hi(3),
    .lo(0),
    .width(4)
) sel_slice1 (
    .in(in_sel),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N32__width32 (
    input [31:0] in_data_0,
    input [31:0] in_data_1,
    input [31:0] in_data_10,
    input [31:0] in_data_11,
    input [31:0] in_data_12,
    input [31:0] in_data_13,
    input [31:0] in_data_14,
    input [31:0] in_data_15,
    input [31:0] in_data_16,
    input [31:0] in_data_17,
    input [31:0] in_data_18,
    input [31:0] in_data_19,
    input [31:0] in_data_2,
    input [31:0] in_data_20,
    input [31:0] in_data_21,
    input [31:0] in_data_22,
    input [31:0] in_data_23,
    input [31:0] in_data_24,
    input [31:0] in_data_25,
    input [31:0] in_data_26,
    input [31:0] in_data_27,
    input [31:0] in_data_28,
    input [31:0] in_data_29,
    input [31:0] in_data_3,
    input [31:0] in_data_30,
    input [31:0] in_data_31,
    input [31:0] in_data_4,
    input [31:0] in_data_5,
    input [31:0] in_data_6,
    input [31:0] in_data_7,
    input [31:0] in_data_8,
    input [31:0] in_data_9,
    input [4:0] in_sel,
    output [31:0] out
);
wire [31:0] _join_out;
wire [31:0] muxN_0_out;
wire [31:0] muxN_1_out;
wire [3:0] sel_slice0_out;
wire [3:0] sel_slice1_out;
coreir_mux #(
    .width(32)
) _join (
    .in0(muxN_0_out),
    .in1(muxN_1_out),
    .sel(in_sel[4]),
    .out(_join_out)
);
commonlib_muxn__N16__width32 muxN_0 (
    .in_data_0(in_data_0),
    .in_data_1(in_data_1),
    .in_data_10(in_data_10),
    .in_data_11(in_data_11),
    .in_data_12(in_data_12),
    .in_data_13(in_data_13),
    .in_data_14(in_data_14),
    .in_data_15(in_data_15),
    .in_data_2(in_data_2),
    .in_data_3(in_data_3),
    .in_data_4(in_data_4),
    .in_data_5(in_data_5),
    .in_data_6(in_data_6),
    .in_data_7(in_data_7),
    .in_data_8(in_data_8),
    .in_data_9(in_data_9),
    .in_sel(sel_slice0_out),
    .out(muxN_0_out)
);
commonlib_muxn__N16__width32 muxN_1 (
    .in_data_0(in_data_16),
    .in_data_1(in_data_17),
    .in_data_10(in_data_26),
    .in_data_11(in_data_27),
    .in_data_12(in_data_28),
    .in_data_13(in_data_29),
    .in_data_14(in_data_30),
    .in_data_15(in_data_31),
    .in_data_2(in_data_18),
    .in_data_3(in_data_19),
    .in_data_4(in_data_20),
    .in_data_5(in_data_21),
    .in_data_6(in_data_22),
    .in_data_7(in_data_23),
    .in_data_8(in_data_24),
    .in_data_9(in_data_25),
    .in_sel(sel_slice1_out),
    .out(muxN_1_out)
);
coreir_slice #(
    .hi(4),
    .lo(0),
    .width(5)
) sel_slice0 (
    .in(in_sel),
    .out(sel_slice0_out)
);
coreir_slice #(
    .hi(4),
    .lo(0),
    .width(5)
) sel_slice1 (
    .in(in_sel),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N64__width32 (
    input [31:0] in_data_0,
    input [31:0] in_data_1,
    input [31:0] in_data_10,
    input [31:0] in_data_11,
    input [31:0] in_data_12,
    input [31:0] in_data_13,
    input [31:0] in_data_14,
    input [31:0] in_data_15,
    input [31:0] in_data_16,
    input [31:0] in_data_17,
    input [31:0] in_data_18,
    input [31:0] in_data_19,
    input [31:0] in_data_2,
    input [31:0] in_data_20,
    input [31:0] in_data_21,
    input [31:0] in_data_22,
    input [31:0] in_data_23,
    input [31:0] in_data_24,
    input [31:0] in_data_25,
    input [31:0] in_data_26,
    input [31:0] in_data_27,
    input [31:0] in_data_28,
    input [31:0] in_data_29,
    input [31:0] in_data_3,
    input [31:0] in_data_30,
    input [31:0] in_data_31,
    input [31:0] in_data_32,
    input [31:0] in_data_33,
    input [31:0] in_data_34,
    input [31:0] in_data_35,
    input [31:0] in_data_36,
    input [31:0] in_data_37,
    input [31:0] in_data_38,
    input [31:0] in_data_39,
    input [31:0] in_data_4,
    input [31:0] in_data_40,
    input [31:0] in_data_41,
    input [31:0] in_data_42,
    input [31:0] in_data_43,
    input [31:0] in_data_44,
    input [31:0] in_data_45,
    input [31:0] in_data_46,
    input [31:0] in_data_47,
    input [31:0] in_data_48,
    input [31:0] in_data_49,
    input [31:0] in_data_5,
    input [31:0] in_data_50,
    input [31:0] in_data_51,
    input [31:0] in_data_52,
    input [31:0] in_data_53,
    input [31:0] in_data_54,
    input [31:0] in_data_55,
    input [31:0] in_data_56,
    input [31:0] in_data_57,
    input [31:0] in_data_58,
    input [31:0] in_data_59,
    input [31:0] in_data_6,
    input [31:0] in_data_60,
    input [31:0] in_data_61,
    input [31:0] in_data_62,
    input [31:0] in_data_63,
    input [31:0] in_data_7,
    input [31:0] in_data_8,
    input [31:0] in_data_9,
    input [5:0] in_sel,
    output [31:0] out
);
wire [31:0] _join_out;
wire [31:0] muxN_0_out;
wire [31:0] muxN_1_out;
wire [4:0] sel_slice0_out;
wire [4:0] sel_slice1_out;
coreir_mux #(
    .width(32)
) _join (
    .in0(muxN_0_out),
    .in1(muxN_1_out),
    .sel(in_sel[5]),
    .out(_join_out)
);
commonlib_muxn__N32__width32 muxN_0 (
    .in_data_0(in_data_0),
    .in_data_1(in_data_1),
    .in_data_10(in_data_10),
    .in_data_11(in_data_11),
    .in_data_12(in_data_12),
    .in_data_13(in_data_13),
    .in_data_14(in_data_14),
    .in_data_15(in_data_15),
    .in_data_16(in_data_16),
    .in_data_17(in_data_17),
    .in_data_18(in_data_18),
    .in_data_19(in_data_19),
    .in_data_2(in_data_2),
    .in_data_20(in_data_20),
    .in_data_21(in_data_21),
    .in_data_22(in_data_22),
    .in_data_23(in_data_23),
    .in_data_24(in_data_24),
    .in_data_25(in_data_25),
    .in_data_26(in_data_26),
    .in_data_27(in_data_27),
    .in_data_28(in_data_28),
    .in_data_29(in_data_29),
    .in_data_3(in_data_3),
    .in_data_30(in_data_30),
    .in_data_31(in_data_31),
    .in_data_4(in_data_4),
    .in_data_5(in_data_5),
    .in_data_6(in_data_6),
    .in_data_7(in_data_7),
    .in_data_8(in_data_8),
    .in_data_9(in_data_9),
    .in_sel(sel_slice0_out),
    .out(muxN_0_out)
);
commonlib_muxn__N32__width32 muxN_1 (
    .in_data_0(in_data_32),
    .in_data_1(in_data_33),
    .in_data_10(in_data_42),
    .in_data_11(in_data_43),
    .in_data_12(in_data_44),
    .in_data_13(in_data_45),
    .in_data_14(in_data_46),
    .in_data_15(in_data_47),
    .in_data_16(in_data_48),
    .in_data_17(in_data_49),
    .in_data_18(in_data_50),
    .in_data_19(in_data_51),
    .in_data_2(in_data_34),
    .in_data_20(in_data_52),
    .in_data_21(in_data_53),
    .in_data_22(in_data_54),
    .in_data_23(in_data_55),
    .in_data_24(in_data_56),
    .in_data_25(in_data_57),
    .in_data_26(in_data_58),
    .in_data_27(in_data_59),
    .in_data_28(in_data_60),
    .in_data_29(in_data_61),
    .in_data_3(in_data_35),
    .in_data_30(in_data_62),
    .in_data_31(in_data_63),
    .in_data_4(in_data_36),
    .in_data_5(in_data_37),
    .in_data_6(in_data_38),
    .in_data_7(in_data_39),
    .in_data_8(in_data_40),
    .in_data_9(in_data_41),
    .in_sel(sel_slice1_out),
    .out(muxN_1_out)
);
coreir_slice #(
    .hi(5),
    .lo(0),
    .width(6)
) sel_slice0 (
    .in(in_sel),
    .out(sel_slice0_out)
);
coreir_slice #(
    .hi(5),
    .lo(0),
    .width(6)
) sel_slice1 (
    .in(in_sel),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N17__width32 (
    input [31:0] in_data_0,
    input [31:0] in_data_1,
    input [31:0] in_data_10,
    input [31:0] in_data_11,
    input [31:0] in_data_12,
    input [31:0] in_data_13,
    input [31:0] in_data_14,
    input [31:0] in_data_15,
    input [31:0] in_data_16,
    input [31:0] in_data_2,
    input [31:0] in_data_3,
    input [31:0] in_data_4,
    input [31:0] in_data_5,
    input [31:0] in_data_6,
    input [31:0] in_data_7,
    input [31:0] in_data_8,
    input [31:0] in_data_9,
    input [4:0] in_sel,
    output [31:0] out
);
wire [31:0] _join_out;
wire [31:0] muxN_0_out;
wire [31:0] muxN_1_out;
wire [3:0] sel_slice0_out;
wire [0:0] sel_slice1_out;
coreir_mux #(
    .width(32)
) _join (
    .in0(muxN_0_out),
    .in1(muxN_1_out),
    .sel(in_sel[4]),
    .out(_join_out)
);
commonlib_muxn__N16__width32 muxN_0 (
    .in_data_0(in_data_0),
    .in_data_1(in_data_1),
    .in_data_10(in_data_10),
    .in_data_11(in_data_11),
    .in_data_12(in_data_12),
    .in_data_13(in_data_13),
    .in_data_14(in_data_14),
    .in_data_15(in_data_15),
    .in_data_2(in_data_2),
    .in_data_3(in_data_3),
    .in_data_4(in_data_4),
    .in_data_5(in_data_5),
    .in_data_6(in_data_6),
    .in_data_7(in_data_7),
    .in_data_8(in_data_8),
    .in_data_9(in_data_9),
    .in_sel(sel_slice0_out),
    .out(muxN_0_out)
);
commonlib_muxn__N1__width32 muxN_1 (
    .in_data_0(in_data_16),
    .in_sel(sel_slice1_out),
    .out(muxN_1_out)
);
coreir_slice #(
    .hi(4),
    .lo(0),
    .width(5)
) sel_slice0 (
    .in(in_sel),
    .out(sel_slice0_out)
);
coreir_slice #(
    .hi(1),
    .lo(0),
    .width(5)
) sel_slice1 (
    .in(in_sel),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N81__width32 (
    input [31:0] in_data_0,
    input [31:0] in_data_1,
    input [31:0] in_data_10,
    input [31:0] in_data_11,
    input [31:0] in_data_12,
    input [31:0] in_data_13,
    input [31:0] in_data_14,
    input [31:0] in_data_15,
    input [31:0] in_data_16,
    input [31:0] in_data_17,
    input [31:0] in_data_18,
    input [31:0] in_data_19,
    input [31:0] in_data_2,
    input [31:0] in_data_20,
    input [31:0] in_data_21,
    input [31:0] in_data_22,
    input [31:0] in_data_23,
    input [31:0] in_data_24,
    input [31:0] in_data_25,
    input [31:0] in_data_26,
    input [31:0] in_data_27,
    input [31:0] in_data_28,
    input [31:0] in_data_29,
    input [31:0] in_data_3,
    input [31:0] in_data_30,
    input [31:0] in_data_31,
    input [31:0] in_data_32,
    input [31:0] in_data_33,
    input [31:0] in_data_34,
    input [31:0] in_data_35,
    input [31:0] in_data_36,
    input [31:0] in_data_37,
    input [31:0] in_data_38,
    input [31:0] in_data_39,
    input [31:0] in_data_4,
    input [31:0] in_data_40,
    input [31:0] in_data_41,
    input [31:0] in_data_42,
    input [31:0] in_data_43,
    input [31:0] in_data_44,
    input [31:0] in_data_45,
    input [31:0] in_data_46,
    input [31:0] in_data_47,
    input [31:0] in_data_48,
    input [31:0] in_data_49,
    input [31:0] in_data_5,
    input [31:0] in_data_50,
    input [31:0] in_data_51,
    input [31:0] in_data_52,
    input [31:0] in_data_53,
    input [31:0] in_data_54,
    input [31:0] in_data_55,
    input [31:0] in_data_56,
    input [31:0] in_data_57,
    input [31:0] in_data_58,
    input [31:0] in_data_59,
    input [31:0] in_data_6,
    input [31:0] in_data_60,
    input [31:0] in_data_61,
    input [31:0] in_data_62,
    input [31:0] in_data_63,
    input [31:0] in_data_64,
    input [31:0] in_data_65,
    input [31:0] in_data_66,
    input [31:0] in_data_67,
    input [31:0] in_data_68,
    input [31:0] in_data_69,
    input [31:0] in_data_7,
    input [31:0] in_data_70,
    input [31:0] in_data_71,
    input [31:0] in_data_72,
    input [31:0] in_data_73,
    input [31:0] in_data_74,
    input [31:0] in_data_75,
    input [31:0] in_data_76,
    input [31:0] in_data_77,
    input [31:0] in_data_78,
    input [31:0] in_data_79,
    input [31:0] in_data_8,
    input [31:0] in_data_80,
    input [31:0] in_data_9,
    input [6:0] in_sel,
    output [31:0] out
);
wire [31:0] _join_out;
wire [31:0] muxN_0_out;
wire [31:0] muxN_1_out;
wire [5:0] sel_slice0_out;
wire [4:0] sel_slice1_out;
coreir_mux #(
    .width(32)
) _join (
    .in0(muxN_0_out),
    .in1(muxN_1_out),
    .sel(in_sel[6]),
    .out(_join_out)
);
commonlib_muxn__N64__width32 muxN_0 (
    .in_data_0(in_data_0),
    .in_data_1(in_data_1),
    .in_data_10(in_data_10),
    .in_data_11(in_data_11),
    .in_data_12(in_data_12),
    .in_data_13(in_data_13),
    .in_data_14(in_data_14),
    .in_data_15(in_data_15),
    .in_data_16(in_data_16),
    .in_data_17(in_data_17),
    .in_data_18(in_data_18),
    .in_data_19(in_data_19),
    .in_data_2(in_data_2),
    .in_data_20(in_data_20),
    .in_data_21(in_data_21),
    .in_data_22(in_data_22),
    .in_data_23(in_data_23),
    .in_data_24(in_data_24),
    .in_data_25(in_data_25),
    .in_data_26(in_data_26),
    .in_data_27(in_data_27),
    .in_data_28(in_data_28),
    .in_data_29(in_data_29),
    .in_data_3(in_data_3),
    .in_data_30(in_data_30),
    .in_data_31(in_data_31),
    .in_data_32(in_data_32),
    .in_data_33(in_data_33),
    .in_data_34(in_data_34),
    .in_data_35(in_data_35),
    .in_data_36(in_data_36),
    .in_data_37(in_data_37),
    .in_data_38(in_data_38),
    .in_data_39(in_data_39),
    .in_data_4(in_data_4),
    .in_data_40(in_data_40),
    .in_data_41(in_data_41),
    .in_data_42(in_data_42),
    .in_data_43(in_data_43),
    .in_data_44(in_data_44),
    .in_data_45(in_data_45),
    .in_data_46(in_data_46),
    .in_data_47(in_data_47),
    .in_data_48(in_data_48),
    .in_data_49(in_data_49),
    .in_data_5(in_data_5),
    .in_data_50(in_data_50),
    .in_data_51(in_data_51),
    .in_data_52(in_data_52),
    .in_data_53(in_data_53),
    .in_data_54(in_data_54),
    .in_data_55(in_data_55),
    .in_data_56(in_data_56),
    .in_data_57(in_data_57),
    .in_data_58(in_data_58),
    .in_data_59(in_data_59),
    .in_data_6(in_data_6),
    .in_data_60(in_data_60),
    .in_data_61(in_data_61),
    .in_data_62(in_data_62),
    .in_data_63(in_data_63),
    .in_data_7(in_data_7),
    .in_data_8(in_data_8),
    .in_data_9(in_data_9),
    .in_sel(sel_slice0_out),
    .out(muxN_0_out)
);
commonlib_muxn__N17__width32 muxN_1 (
    .in_data_0(in_data_64),
    .in_data_1(in_data_65),
    .in_data_10(in_data_74),
    .in_data_11(in_data_75),
    .in_data_12(in_data_76),
    .in_data_13(in_data_77),
    .in_data_14(in_data_78),
    .in_data_15(in_data_79),
    .in_data_16(in_data_80),
    .in_data_2(in_data_66),
    .in_data_3(in_data_67),
    .in_data_4(in_data_68),
    .in_data_5(in_data_69),
    .in_data_6(in_data_70),
    .in_data_7(in_data_71),
    .in_data_8(in_data_72),
    .in_data_9(in_data_73),
    .in_sel(sel_slice1_out),
    .out(muxN_1_out)
);
coreir_slice #(
    .hi(6),
    .lo(0),
    .width(7)
) sel_slice0 (
    .in(in_sel),
    .out(sel_slice0_out)
);
coreir_slice #(
    .hi(5),
    .lo(0),
    .width(7)
) sel_slice1 (
    .in(in_sel),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N128__width32 (
    input [31:0] in_data_0,
    input [31:0] in_data_1,
    input [31:0] in_data_10,
    input [31:0] in_data_100,
    input [31:0] in_data_101,
    input [31:0] in_data_102,
    input [31:0] in_data_103,
    input [31:0] in_data_104,
    input [31:0] in_data_105,
    input [31:0] in_data_106,
    input [31:0] in_data_107,
    input [31:0] in_data_108,
    input [31:0] in_data_109,
    input [31:0] in_data_11,
    input [31:0] in_data_110,
    input [31:0] in_data_111,
    input [31:0] in_data_112,
    input [31:0] in_data_113,
    input [31:0] in_data_114,
    input [31:0] in_data_115,
    input [31:0] in_data_116,
    input [31:0] in_data_117,
    input [31:0] in_data_118,
    input [31:0] in_data_119,
    input [31:0] in_data_12,
    input [31:0] in_data_120,
    input [31:0] in_data_121,
    input [31:0] in_data_122,
    input [31:0] in_data_123,
    input [31:0] in_data_124,
    input [31:0] in_data_125,
    input [31:0] in_data_126,
    input [31:0] in_data_127,
    input [31:0] in_data_13,
    input [31:0] in_data_14,
    input [31:0] in_data_15,
    input [31:0] in_data_16,
    input [31:0] in_data_17,
    input [31:0] in_data_18,
    input [31:0] in_data_19,
    input [31:0] in_data_2,
    input [31:0] in_data_20,
    input [31:0] in_data_21,
    input [31:0] in_data_22,
    input [31:0] in_data_23,
    input [31:0] in_data_24,
    input [31:0] in_data_25,
    input [31:0] in_data_26,
    input [31:0] in_data_27,
    input [31:0] in_data_28,
    input [31:0] in_data_29,
    input [31:0] in_data_3,
    input [31:0] in_data_30,
    input [31:0] in_data_31,
    input [31:0] in_data_32,
    input [31:0] in_data_33,
    input [31:0] in_data_34,
    input [31:0] in_data_35,
    input [31:0] in_data_36,
    input [31:0] in_data_37,
    input [31:0] in_data_38,
    input [31:0] in_data_39,
    input [31:0] in_data_4,
    input [31:0] in_data_40,
    input [31:0] in_data_41,
    input [31:0] in_data_42,
    input [31:0] in_data_43,
    input [31:0] in_data_44,
    input [31:0] in_data_45,
    input [31:0] in_data_46,
    input [31:0] in_data_47,
    input [31:0] in_data_48,
    input [31:0] in_data_49,
    input [31:0] in_data_5,
    input [31:0] in_data_50,
    input [31:0] in_data_51,
    input [31:0] in_data_52,
    input [31:0] in_data_53,
    input [31:0] in_data_54,
    input [31:0] in_data_55,
    input [31:0] in_data_56,
    input [31:0] in_data_57,
    input [31:0] in_data_58,
    input [31:0] in_data_59,
    input [31:0] in_data_6,
    input [31:0] in_data_60,
    input [31:0] in_data_61,
    input [31:0] in_data_62,
    input [31:0] in_data_63,
    input [31:0] in_data_64,
    input [31:0] in_data_65,
    input [31:0] in_data_66,
    input [31:0] in_data_67,
    input [31:0] in_data_68,
    input [31:0] in_data_69,
    input [31:0] in_data_7,
    input [31:0] in_data_70,
    input [31:0] in_data_71,
    input [31:0] in_data_72,
    input [31:0] in_data_73,
    input [31:0] in_data_74,
    input [31:0] in_data_75,
    input [31:0] in_data_76,
    input [31:0] in_data_77,
    input [31:0] in_data_78,
    input [31:0] in_data_79,
    input [31:0] in_data_8,
    input [31:0] in_data_80,
    input [31:0] in_data_81,
    input [31:0] in_data_82,
    input [31:0] in_data_83,
    input [31:0] in_data_84,
    input [31:0] in_data_85,
    input [31:0] in_data_86,
    input [31:0] in_data_87,
    input [31:0] in_data_88,
    input [31:0] in_data_89,
    input [31:0] in_data_9,
    input [31:0] in_data_90,
    input [31:0] in_data_91,
    input [31:0] in_data_92,
    input [31:0] in_data_93,
    input [31:0] in_data_94,
    input [31:0] in_data_95,
    input [31:0] in_data_96,
    input [31:0] in_data_97,
    input [31:0] in_data_98,
    input [31:0] in_data_99,
    input [6:0] in_sel,
    output [31:0] out
);
wire [31:0] _join_out;
wire [31:0] muxN_0_out;
wire [31:0] muxN_1_out;
wire [5:0] sel_slice0_out;
wire [5:0] sel_slice1_out;
coreir_mux #(
    .width(32)
) _join (
    .in0(muxN_0_out),
    .in1(muxN_1_out),
    .sel(in_sel[6]),
    .out(_join_out)
);
commonlib_muxn__N64__width32 muxN_0 (
    .in_data_0(in_data_0),
    .in_data_1(in_data_1),
    .in_data_10(in_data_10),
    .in_data_11(in_data_11),
    .in_data_12(in_data_12),
    .in_data_13(in_data_13),
    .in_data_14(in_data_14),
    .in_data_15(in_data_15),
    .in_data_16(in_data_16),
    .in_data_17(in_data_17),
    .in_data_18(in_data_18),
    .in_data_19(in_data_19),
    .in_data_2(in_data_2),
    .in_data_20(in_data_20),
    .in_data_21(in_data_21),
    .in_data_22(in_data_22),
    .in_data_23(in_data_23),
    .in_data_24(in_data_24),
    .in_data_25(in_data_25),
    .in_data_26(in_data_26),
    .in_data_27(in_data_27),
    .in_data_28(in_data_28),
    .in_data_29(in_data_29),
    .in_data_3(in_data_3),
    .in_data_30(in_data_30),
    .in_data_31(in_data_31),
    .in_data_32(in_data_32),
    .in_data_33(in_data_33),
    .in_data_34(in_data_34),
    .in_data_35(in_data_35),
    .in_data_36(in_data_36),
    .in_data_37(in_data_37),
    .in_data_38(in_data_38),
    .in_data_39(in_data_39),
    .in_data_4(in_data_4),
    .in_data_40(in_data_40),
    .in_data_41(in_data_41),
    .in_data_42(in_data_42),
    .in_data_43(in_data_43),
    .in_data_44(in_data_44),
    .in_data_45(in_data_45),
    .in_data_46(in_data_46),
    .in_data_47(in_data_47),
    .in_data_48(in_data_48),
    .in_data_49(in_data_49),
    .in_data_5(in_data_5),
    .in_data_50(in_data_50),
    .in_data_51(in_data_51),
    .in_data_52(in_data_52),
    .in_data_53(in_data_53),
    .in_data_54(in_data_54),
    .in_data_55(in_data_55),
    .in_data_56(in_data_56),
    .in_data_57(in_data_57),
    .in_data_58(in_data_58),
    .in_data_59(in_data_59),
    .in_data_6(in_data_6),
    .in_data_60(in_data_60),
    .in_data_61(in_data_61),
    .in_data_62(in_data_62),
    .in_data_63(in_data_63),
    .in_data_7(in_data_7),
    .in_data_8(in_data_8),
    .in_data_9(in_data_9),
    .in_sel(sel_slice0_out),
    .out(muxN_0_out)
);
commonlib_muxn__N64__width32 muxN_1 (
    .in_data_0(in_data_64),
    .in_data_1(in_data_65),
    .in_data_10(in_data_74),
    .in_data_11(in_data_75),
    .in_data_12(in_data_76),
    .in_data_13(in_data_77),
    .in_data_14(in_data_78),
    .in_data_15(in_data_79),
    .in_data_16(in_data_80),
    .in_data_17(in_data_81),
    .in_data_18(in_data_82),
    .in_data_19(in_data_83),
    .in_data_2(in_data_66),
    .in_data_20(in_data_84),
    .in_data_21(in_data_85),
    .in_data_22(in_data_86),
    .in_data_23(in_data_87),
    .in_data_24(in_data_88),
    .in_data_25(in_data_89),
    .in_data_26(in_data_90),
    .in_data_27(in_data_91),
    .in_data_28(in_data_92),
    .in_data_29(in_data_93),
    .in_data_3(in_data_67),
    .in_data_30(in_data_94),
    .in_data_31(in_data_95),
    .in_data_32(in_data_96),
    .in_data_33(in_data_97),
    .in_data_34(in_data_98),
    .in_data_35(in_data_99),
    .in_data_36(in_data_100),
    .in_data_37(in_data_101),
    .in_data_38(in_data_102),
    .in_data_39(in_data_103),
    .in_data_4(in_data_68),
    .in_data_40(in_data_104),
    .in_data_41(in_data_105),
    .in_data_42(in_data_106),
    .in_data_43(in_data_107),
    .in_data_44(in_data_108),
    .in_data_45(in_data_109),
    .in_data_46(in_data_110),
    .in_data_47(in_data_111),
    .in_data_48(in_data_112),
    .in_data_49(in_data_113),
    .in_data_5(in_data_69),
    .in_data_50(in_data_114),
    .in_data_51(in_data_115),
    .in_data_52(in_data_116),
    .in_data_53(in_data_117),
    .in_data_54(in_data_118),
    .in_data_55(in_data_119),
    .in_data_56(in_data_120),
    .in_data_57(in_data_121),
    .in_data_58(in_data_122),
    .in_data_59(in_data_123),
    .in_data_6(in_data_70),
    .in_data_60(in_data_124),
    .in_data_61(in_data_125),
    .in_data_62(in_data_126),
    .in_data_63(in_data_127),
    .in_data_7(in_data_71),
    .in_data_8(in_data_72),
    .in_data_9(in_data_73),
    .in_sel(sel_slice1_out),
    .out(muxN_1_out)
);
coreir_slice #(
    .hi(6),
    .lo(0),
    .width(7)
) sel_slice0 (
    .in(in_sel),
    .out(sel_slice0_out)
);
coreir_slice #(
    .hi(6),
    .lo(0),
    .width(7)
) sel_slice1 (
    .in(in_sel),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N209__width32 (
    input [31:0] in_data_0,
    input [31:0] in_data_1,
    input [31:0] in_data_10,
    input [31:0] in_data_100,
    input [31:0] in_data_101,
    input [31:0] in_data_102,
    input [31:0] in_data_103,
    input [31:0] in_data_104,
    input [31:0] in_data_105,
    input [31:0] in_data_106,
    input [31:0] in_data_107,
    input [31:0] in_data_108,
    input [31:0] in_data_109,
    input [31:0] in_data_11,
    input [31:0] in_data_110,
    input [31:0] in_data_111,
    input [31:0] in_data_112,
    input [31:0] in_data_113,
    input [31:0] in_data_114,
    input [31:0] in_data_115,
    input [31:0] in_data_116,
    input [31:0] in_data_117,
    input [31:0] in_data_118,
    input [31:0] in_data_119,
    input [31:0] in_data_12,
    input [31:0] in_data_120,
    input [31:0] in_data_121,
    input [31:0] in_data_122,
    input [31:0] in_data_123,
    input [31:0] in_data_124,
    input [31:0] in_data_125,
    input [31:0] in_data_126,
    input [31:0] in_data_127,
    input [31:0] in_data_128,
    input [31:0] in_data_129,
    input [31:0] in_data_13,
    input [31:0] in_data_130,
    input [31:0] in_data_131,
    input [31:0] in_data_132,
    input [31:0] in_data_133,
    input [31:0] in_data_134,
    input [31:0] in_data_135,
    input [31:0] in_data_136,
    input [31:0] in_data_137,
    input [31:0] in_data_138,
    input [31:0] in_data_139,
    input [31:0] in_data_14,
    input [31:0] in_data_140,
    input [31:0] in_data_141,
    input [31:0] in_data_142,
    input [31:0] in_data_143,
    input [31:0] in_data_144,
    input [31:0] in_data_145,
    input [31:0] in_data_146,
    input [31:0] in_data_147,
    input [31:0] in_data_148,
    input [31:0] in_data_149,
    input [31:0] in_data_15,
    input [31:0] in_data_150,
    input [31:0] in_data_151,
    input [31:0] in_data_152,
    input [31:0] in_data_153,
    input [31:0] in_data_154,
    input [31:0] in_data_155,
    input [31:0] in_data_156,
    input [31:0] in_data_157,
    input [31:0] in_data_158,
    input [31:0] in_data_159,
    input [31:0] in_data_16,
    input [31:0] in_data_160,
    input [31:0] in_data_161,
    input [31:0] in_data_162,
    input [31:0] in_data_163,
    input [31:0] in_data_164,
    input [31:0] in_data_165,
    input [31:0] in_data_166,
    input [31:0] in_data_167,
    input [31:0] in_data_168,
    input [31:0] in_data_169,
    input [31:0] in_data_17,
    input [31:0] in_data_170,
    input [31:0] in_data_171,
    input [31:0] in_data_172,
    input [31:0] in_data_173,
    input [31:0] in_data_174,
    input [31:0] in_data_175,
    input [31:0] in_data_176,
    input [31:0] in_data_177,
    input [31:0] in_data_178,
    input [31:0] in_data_179,
    input [31:0] in_data_18,
    input [31:0] in_data_180,
    input [31:0] in_data_181,
    input [31:0] in_data_182,
    input [31:0] in_data_183,
    input [31:0] in_data_184,
    input [31:0] in_data_185,
    input [31:0] in_data_186,
    input [31:0] in_data_187,
    input [31:0] in_data_188,
    input [31:0] in_data_189,
    input [31:0] in_data_19,
    input [31:0] in_data_190,
    input [31:0] in_data_191,
    input [31:0] in_data_192,
    input [31:0] in_data_193,
    input [31:0] in_data_194,
    input [31:0] in_data_195,
    input [31:0] in_data_196,
    input [31:0] in_data_197,
    input [31:0] in_data_198,
    input [31:0] in_data_199,
    input [31:0] in_data_2,
    input [31:0] in_data_20,
    input [31:0] in_data_200,
    input [31:0] in_data_201,
    input [31:0] in_data_202,
    input [31:0] in_data_203,
    input [31:0] in_data_204,
    input [31:0] in_data_205,
    input [31:0] in_data_206,
    input [31:0] in_data_207,
    input [31:0] in_data_208,
    input [31:0] in_data_21,
    input [31:0] in_data_22,
    input [31:0] in_data_23,
    input [31:0] in_data_24,
    input [31:0] in_data_25,
    input [31:0] in_data_26,
    input [31:0] in_data_27,
    input [31:0] in_data_28,
    input [31:0] in_data_29,
    input [31:0] in_data_3,
    input [31:0] in_data_30,
    input [31:0] in_data_31,
    input [31:0] in_data_32,
    input [31:0] in_data_33,
    input [31:0] in_data_34,
    input [31:0] in_data_35,
    input [31:0] in_data_36,
    input [31:0] in_data_37,
    input [31:0] in_data_38,
    input [31:0] in_data_39,
    input [31:0] in_data_4,
    input [31:0] in_data_40,
    input [31:0] in_data_41,
    input [31:0] in_data_42,
    input [31:0] in_data_43,
    input [31:0] in_data_44,
    input [31:0] in_data_45,
    input [31:0] in_data_46,
    input [31:0] in_data_47,
    input [31:0] in_data_48,
    input [31:0] in_data_49,
    input [31:0] in_data_5,
    input [31:0] in_data_50,
    input [31:0] in_data_51,
    input [31:0] in_data_52,
    input [31:0] in_data_53,
    input [31:0] in_data_54,
    input [31:0] in_data_55,
    input [31:0] in_data_56,
    input [31:0] in_data_57,
    input [31:0] in_data_58,
    input [31:0] in_data_59,
    input [31:0] in_data_6,
    input [31:0] in_data_60,
    input [31:0] in_data_61,
    input [31:0] in_data_62,
    input [31:0] in_data_63,
    input [31:0] in_data_64,
    input [31:0] in_data_65,
    input [31:0] in_data_66,
    input [31:0] in_data_67,
    input [31:0] in_data_68,
    input [31:0] in_data_69,
    input [31:0] in_data_7,
    input [31:0] in_data_70,
    input [31:0] in_data_71,
    input [31:0] in_data_72,
    input [31:0] in_data_73,
    input [31:0] in_data_74,
    input [31:0] in_data_75,
    input [31:0] in_data_76,
    input [31:0] in_data_77,
    input [31:0] in_data_78,
    input [31:0] in_data_79,
    input [31:0] in_data_8,
    input [31:0] in_data_80,
    input [31:0] in_data_81,
    input [31:0] in_data_82,
    input [31:0] in_data_83,
    input [31:0] in_data_84,
    input [31:0] in_data_85,
    input [31:0] in_data_86,
    input [31:0] in_data_87,
    input [31:0] in_data_88,
    input [31:0] in_data_89,
    input [31:0] in_data_9,
    input [31:0] in_data_90,
    input [31:0] in_data_91,
    input [31:0] in_data_92,
    input [31:0] in_data_93,
    input [31:0] in_data_94,
    input [31:0] in_data_95,
    input [31:0] in_data_96,
    input [31:0] in_data_97,
    input [31:0] in_data_98,
    input [31:0] in_data_99,
    input [7:0] in_sel,
    output [31:0] out
);
wire [31:0] _join_out;
wire [31:0] muxN_0_out;
wire [31:0] muxN_1_out;
wire [6:0] sel_slice0_out;
wire [6:0] sel_slice1_out;
coreir_mux #(
    .width(32)
) _join (
    .in0(muxN_0_out),
    .in1(muxN_1_out),
    .sel(in_sel[7]),
    .out(_join_out)
);
commonlib_muxn__N128__width32 muxN_0 (
    .in_data_0(in_data_0),
    .in_data_1(in_data_1),
    .in_data_10(in_data_10),
    .in_data_100(in_data_100),
    .in_data_101(in_data_101),
    .in_data_102(in_data_102),
    .in_data_103(in_data_103),
    .in_data_104(in_data_104),
    .in_data_105(in_data_105),
    .in_data_106(in_data_106),
    .in_data_107(in_data_107),
    .in_data_108(in_data_108),
    .in_data_109(in_data_109),
    .in_data_11(in_data_11),
    .in_data_110(in_data_110),
    .in_data_111(in_data_111),
    .in_data_112(in_data_112),
    .in_data_113(in_data_113),
    .in_data_114(in_data_114),
    .in_data_115(in_data_115),
    .in_data_116(in_data_116),
    .in_data_117(in_data_117),
    .in_data_118(in_data_118),
    .in_data_119(in_data_119),
    .in_data_12(in_data_12),
    .in_data_120(in_data_120),
    .in_data_121(in_data_121),
    .in_data_122(in_data_122),
    .in_data_123(in_data_123),
    .in_data_124(in_data_124),
    .in_data_125(in_data_125),
    .in_data_126(in_data_126),
    .in_data_127(in_data_127),
    .in_data_13(in_data_13),
    .in_data_14(in_data_14),
    .in_data_15(in_data_15),
    .in_data_16(in_data_16),
    .in_data_17(in_data_17),
    .in_data_18(in_data_18),
    .in_data_19(in_data_19),
    .in_data_2(in_data_2),
    .in_data_20(in_data_20),
    .in_data_21(in_data_21),
    .in_data_22(in_data_22),
    .in_data_23(in_data_23),
    .in_data_24(in_data_24),
    .in_data_25(in_data_25),
    .in_data_26(in_data_26),
    .in_data_27(in_data_27),
    .in_data_28(in_data_28),
    .in_data_29(in_data_29),
    .in_data_3(in_data_3),
    .in_data_30(in_data_30),
    .in_data_31(in_data_31),
    .in_data_32(in_data_32),
    .in_data_33(in_data_33),
    .in_data_34(in_data_34),
    .in_data_35(in_data_35),
    .in_data_36(in_data_36),
    .in_data_37(in_data_37),
    .in_data_38(in_data_38),
    .in_data_39(in_data_39),
    .in_data_4(in_data_4),
    .in_data_40(in_data_40),
    .in_data_41(in_data_41),
    .in_data_42(in_data_42),
    .in_data_43(in_data_43),
    .in_data_44(in_data_44),
    .in_data_45(in_data_45),
    .in_data_46(in_data_46),
    .in_data_47(in_data_47),
    .in_data_48(in_data_48),
    .in_data_49(in_data_49),
    .in_data_5(in_data_5),
    .in_data_50(in_data_50),
    .in_data_51(in_data_51),
    .in_data_52(in_data_52),
    .in_data_53(in_data_53),
    .in_data_54(in_data_54),
    .in_data_55(in_data_55),
    .in_data_56(in_data_56),
    .in_data_57(in_data_57),
    .in_data_58(in_data_58),
    .in_data_59(in_data_59),
    .in_data_6(in_data_6),
    .in_data_60(in_data_60),
    .in_data_61(in_data_61),
    .in_data_62(in_data_62),
    .in_data_63(in_data_63),
    .in_data_64(in_data_64),
    .in_data_65(in_data_65),
    .in_data_66(in_data_66),
    .in_data_67(in_data_67),
    .in_data_68(in_data_68),
    .in_data_69(in_data_69),
    .in_data_7(in_data_7),
    .in_data_70(in_data_70),
    .in_data_71(in_data_71),
    .in_data_72(in_data_72),
    .in_data_73(in_data_73),
    .in_data_74(in_data_74),
    .in_data_75(in_data_75),
    .in_data_76(in_data_76),
    .in_data_77(in_data_77),
    .in_data_78(in_data_78),
    .in_data_79(in_data_79),
    .in_data_8(in_data_8),
    .in_data_80(in_data_80),
    .in_data_81(in_data_81),
    .in_data_82(in_data_82),
    .in_data_83(in_data_83),
    .in_data_84(in_data_84),
    .in_data_85(in_data_85),
    .in_data_86(in_data_86),
    .in_data_87(in_data_87),
    .in_data_88(in_data_88),
    .in_data_89(in_data_89),
    .in_data_9(in_data_9),
    .in_data_90(in_data_90),
    .in_data_91(in_data_91),
    .in_data_92(in_data_92),
    .in_data_93(in_data_93),
    .in_data_94(in_data_94),
    .in_data_95(in_data_95),
    .in_data_96(in_data_96),
    .in_data_97(in_data_97),
    .in_data_98(in_data_98),
    .in_data_99(in_data_99),
    .in_sel(sel_slice0_out),
    .out(muxN_0_out)
);
commonlib_muxn__N81__width32 muxN_1 (
    .in_data_0(in_data_128),
    .in_data_1(in_data_129),
    .in_data_10(in_data_138),
    .in_data_11(in_data_139),
    .in_data_12(in_data_140),
    .in_data_13(in_data_141),
    .in_data_14(in_data_142),
    .in_data_15(in_data_143),
    .in_data_16(in_data_144),
    .in_data_17(in_data_145),
    .in_data_18(in_data_146),
    .in_data_19(in_data_147),
    .in_data_2(in_data_130),
    .in_data_20(in_data_148),
    .in_data_21(in_data_149),
    .in_data_22(in_data_150),
    .in_data_23(in_data_151),
    .in_data_24(in_data_152),
    .in_data_25(in_data_153),
    .in_data_26(in_data_154),
    .in_data_27(in_data_155),
    .in_data_28(in_data_156),
    .in_data_29(in_data_157),
    .in_data_3(in_data_131),
    .in_data_30(in_data_158),
    .in_data_31(in_data_159),
    .in_data_32(in_data_160),
    .in_data_33(in_data_161),
    .in_data_34(in_data_162),
    .in_data_35(in_data_163),
    .in_data_36(in_data_164),
    .in_data_37(in_data_165),
    .in_data_38(in_data_166),
    .in_data_39(in_data_167),
    .in_data_4(in_data_132),
    .in_data_40(in_data_168),
    .in_data_41(in_data_169),
    .in_data_42(in_data_170),
    .in_data_43(in_data_171),
    .in_data_44(in_data_172),
    .in_data_45(in_data_173),
    .in_data_46(in_data_174),
    .in_data_47(in_data_175),
    .in_data_48(in_data_176),
    .in_data_49(in_data_177),
    .in_data_5(in_data_133),
    .in_data_50(in_data_178),
    .in_data_51(in_data_179),
    .in_data_52(in_data_180),
    .in_data_53(in_data_181),
    .in_data_54(in_data_182),
    .in_data_55(in_data_183),
    .in_data_56(in_data_184),
    .in_data_57(in_data_185),
    .in_data_58(in_data_186),
    .in_data_59(in_data_187),
    .in_data_6(in_data_134),
    .in_data_60(in_data_188),
    .in_data_61(in_data_189),
    .in_data_62(in_data_190),
    .in_data_63(in_data_191),
    .in_data_64(in_data_192),
    .in_data_65(in_data_193),
    .in_data_66(in_data_194),
    .in_data_67(in_data_195),
    .in_data_68(in_data_196),
    .in_data_69(in_data_197),
    .in_data_7(in_data_135),
    .in_data_70(in_data_198),
    .in_data_71(in_data_199),
    .in_data_72(in_data_200),
    .in_data_73(in_data_201),
    .in_data_74(in_data_202),
    .in_data_75(in_data_203),
    .in_data_76(in_data_204),
    .in_data_77(in_data_205),
    .in_data_78(in_data_206),
    .in_data_79(in_data_207),
    .in_data_8(in_data_136),
    .in_data_80(in_data_208),
    .in_data_9(in_data_137),
    .in_sel(sel_slice1_out),
    .out(muxN_1_out)
);
coreir_slice #(
    .hi(7),
    .lo(0),
    .width(8)
) sel_slice0 (
    .in(in_sel),
    .out(sel_slice0_out)
);
coreir_slice #(
    .hi(7),
    .lo(0),
    .width(8)
) sel_slice1 (
    .in(in_sel),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module ZextWrapper_7_32 (
    input [6:0] I,
    output [31:0] O
);
wire bit_const_0_None_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
assign O = {bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,I[6:0]};
endmodule

module ZextWrapper_6_32 (
    input [5:0] I,
    output [31:0] O
);
wire bit_const_0_None_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
assign O = {bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,I[5:0]};
endmodule

module ZextWrapper_4_32 (
    input [3:0] I,
    output [31:0] O
);
wire bit_const_0_None_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
assign O = {bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,I[3:0]};
endmodule

module ZextWrapper_30_32 (
    input [29:0] I,
    output [31:0] O
);
wire bit_const_0_None_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
assign O = {bit_const_0_None_out,bit_const_0_None_out,I[29:0]};
endmodule

module ZextWrapper_2_32 (
    input [1:0] I,
    output [31:0] O
);
wire bit_const_0_None_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
assign O = {bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,I[1:0]};
endmodule

module ZextWrapper_1_32 (
    input [0:0] I,
    output [31:0] O
);
wire bit_const_0_None_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
assign O = {bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,I[0]};
endmodule

module ZextWrapper_16_32 (
    input [15:0] I,
    output [31:0] O
);
wire bit_const_0_None_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
assign O = {bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,I[15:0]};
endmodule

module ZextWrapper_12_32 (
    input [11:0] I,
    output [31:0] O
);
wire bit_const_0_None_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
assign O = {bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,I[11:0]};
endmodule

module ZextWrapper_10_32 (
    input [9:0] I,
    output [31:0] O
);
wire bit_const_0_None_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
assign O = {bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,I[9:0]};
endmodule

module Or3x8 (
    input [7:0] I0,
    input [7:0] I1,
    input [7:0] I2,
    output [7:0] O
);
wire orr_inst0_out;
wire orr_inst1_out;
wire orr_inst2_out;
wire orr_inst3_out;
wire orr_inst4_out;
wire orr_inst5_out;
wire orr_inst6_out;
wire orr_inst7_out;
coreir_orr #(
    .width(3)
) orr_inst0 (
    .in({I2[0],I1[0],I0[0]}),
    .out(orr_inst0_out)
);
coreir_orr #(
    .width(3)
) orr_inst1 (
    .in({I2[1],I1[1],I0[1]}),
    .out(orr_inst1_out)
);
coreir_orr #(
    .width(3)
) orr_inst2 (
    .in({I2[2],I1[2],I0[2]}),
    .out(orr_inst2_out)
);
coreir_orr #(
    .width(3)
) orr_inst3 (
    .in({I2[3],I1[3],I0[3]}),
    .out(orr_inst3_out)
);
coreir_orr #(
    .width(3)
) orr_inst4 (
    .in({I2[4],I1[4],I0[4]}),
    .out(orr_inst4_out)
);
coreir_orr #(
    .width(3)
) orr_inst5 (
    .in({I2[5],I1[5],I0[5]}),
    .out(orr_inst5_out)
);
coreir_orr #(
    .width(3)
) orr_inst6 (
    .in({I2[6],I1[6],I0[6]}),
    .out(orr_inst6_out)
);
coreir_orr #(
    .width(3)
) orr_inst7 (
    .in({I2[7],I1[7],I0[7]}),
    .out(orr_inst7_out)
);
assign O = {orr_inst7_out,orr_inst6_out,orr_inst5_out,orr_inst4_out,orr_inst3_out,orr_inst2_out,orr_inst1_out,orr_inst0_out};
endmodule

module Or3x32 (
    input [31:0] I0,
    input [31:0] I1,
    input [31:0] I2,
    output [31:0] O
);
wire orr_inst0_out;
wire orr_inst1_out;
wire orr_inst10_out;
wire orr_inst11_out;
wire orr_inst12_out;
wire orr_inst13_out;
wire orr_inst14_out;
wire orr_inst15_out;
wire orr_inst16_out;
wire orr_inst17_out;
wire orr_inst18_out;
wire orr_inst19_out;
wire orr_inst2_out;
wire orr_inst20_out;
wire orr_inst21_out;
wire orr_inst22_out;
wire orr_inst23_out;
wire orr_inst24_out;
wire orr_inst25_out;
wire orr_inst26_out;
wire orr_inst27_out;
wire orr_inst28_out;
wire orr_inst29_out;
wire orr_inst3_out;
wire orr_inst30_out;
wire orr_inst31_out;
wire orr_inst4_out;
wire orr_inst5_out;
wire orr_inst6_out;
wire orr_inst7_out;
wire orr_inst8_out;
wire orr_inst9_out;
coreir_orr #(
    .width(3)
) orr_inst0 (
    .in({I2[0],I1[0],I0[0]}),
    .out(orr_inst0_out)
);
coreir_orr #(
    .width(3)
) orr_inst1 (
    .in({I2[1],I1[1],I0[1]}),
    .out(orr_inst1_out)
);
coreir_orr #(
    .width(3)
) orr_inst10 (
    .in({I2[10],I1[10],I0[10]}),
    .out(orr_inst10_out)
);
coreir_orr #(
    .width(3)
) orr_inst11 (
    .in({I2[11],I1[11],I0[11]}),
    .out(orr_inst11_out)
);
coreir_orr #(
    .width(3)
) orr_inst12 (
    .in({I2[12],I1[12],I0[12]}),
    .out(orr_inst12_out)
);
coreir_orr #(
    .width(3)
) orr_inst13 (
    .in({I2[13],I1[13],I0[13]}),
    .out(orr_inst13_out)
);
coreir_orr #(
    .width(3)
) orr_inst14 (
    .in({I2[14],I1[14],I0[14]}),
    .out(orr_inst14_out)
);
coreir_orr #(
    .width(3)
) orr_inst15 (
    .in({I2[15],I1[15],I0[15]}),
    .out(orr_inst15_out)
);
coreir_orr #(
    .width(3)
) orr_inst16 (
    .in({I2[16],I1[16],I0[16]}),
    .out(orr_inst16_out)
);
coreir_orr #(
    .width(3)
) orr_inst17 (
    .in({I2[17],I1[17],I0[17]}),
    .out(orr_inst17_out)
);
coreir_orr #(
    .width(3)
) orr_inst18 (
    .in({I2[18],I1[18],I0[18]}),
    .out(orr_inst18_out)
);
coreir_orr #(
    .width(3)
) orr_inst19 (
    .in({I2[19],I1[19],I0[19]}),
    .out(orr_inst19_out)
);
coreir_orr #(
    .width(3)
) orr_inst2 (
    .in({I2[2],I1[2],I0[2]}),
    .out(orr_inst2_out)
);
coreir_orr #(
    .width(3)
) orr_inst20 (
    .in({I2[20],I1[20],I0[20]}),
    .out(orr_inst20_out)
);
coreir_orr #(
    .width(3)
) orr_inst21 (
    .in({I2[21],I1[21],I0[21]}),
    .out(orr_inst21_out)
);
coreir_orr #(
    .width(3)
) orr_inst22 (
    .in({I2[22],I1[22],I0[22]}),
    .out(orr_inst22_out)
);
coreir_orr #(
    .width(3)
) orr_inst23 (
    .in({I2[23],I1[23],I0[23]}),
    .out(orr_inst23_out)
);
coreir_orr #(
    .width(3)
) orr_inst24 (
    .in({I2[24],I1[24],I0[24]}),
    .out(orr_inst24_out)
);
coreir_orr #(
    .width(3)
) orr_inst25 (
    .in({I2[25],I1[25],I0[25]}),
    .out(orr_inst25_out)
);
coreir_orr #(
    .width(3)
) orr_inst26 (
    .in({I2[26],I1[26],I0[26]}),
    .out(orr_inst26_out)
);
coreir_orr #(
    .width(3)
) orr_inst27 (
    .in({I2[27],I1[27],I0[27]}),
    .out(orr_inst27_out)
);
coreir_orr #(
    .width(3)
) orr_inst28 (
    .in({I2[28],I1[28],I0[28]}),
    .out(orr_inst28_out)
);
coreir_orr #(
    .width(3)
) orr_inst29 (
    .in({I2[29],I1[29],I0[29]}),
    .out(orr_inst29_out)
);
coreir_orr #(
    .width(3)
) orr_inst3 (
    .in({I2[3],I1[3],I0[3]}),
    .out(orr_inst3_out)
);
coreir_orr #(
    .width(3)
) orr_inst30 (
    .in({I2[30],I1[30],I0[30]}),
    .out(orr_inst30_out)
);
coreir_orr #(
    .width(3)
) orr_inst31 (
    .in({I2[31],I1[31],I0[31]}),
    .out(orr_inst31_out)
);
coreir_orr #(
    .width(3)
) orr_inst4 (
    .in({I2[4],I1[4],I0[4]}),
    .out(orr_inst4_out)
);
coreir_orr #(
    .width(3)
) orr_inst5 (
    .in({I2[5],I1[5],I0[5]}),
    .out(orr_inst5_out)
);
coreir_orr #(
    .width(3)
) orr_inst6 (
    .in({I2[6],I1[6],I0[6]}),
    .out(orr_inst6_out)
);
coreir_orr #(
    .width(3)
) orr_inst7 (
    .in({I2[7],I1[7],I0[7]}),
    .out(orr_inst7_out)
);
coreir_orr #(
    .width(3)
) orr_inst8 (
    .in({I2[8],I1[8],I0[8]}),
    .out(orr_inst8_out)
);
coreir_orr #(
    .width(3)
) orr_inst9 (
    .in({I2[9],I1[9],I0[9]}),
    .out(orr_inst9_out)
);
assign O = {orr_inst31_out,orr_inst30_out,orr_inst29_out,orr_inst28_out,orr_inst27_out,orr_inst26_out,orr_inst25_out,orr_inst24_out,orr_inst23_out,orr_inst22_out,orr_inst21_out,orr_inst20_out,orr_inst19_out,orr_inst18_out,orr_inst17_out,orr_inst16_out,orr_inst15_out,orr_inst14_out,orr_inst13_out,orr_inst12_out,orr_inst11_out,orr_inst10_out,orr_inst9_out,orr_inst8_out,orr_inst7_out,orr_inst6_out,orr_inst5_out,orr_inst4_out,orr_inst3_out,orr_inst2_out,orr_inst1_out,orr_inst0_out};
endmodule

module Mux2xOutBits7 (
    input [6:0] I0,
    input [6:0] I1,
    input S,
    output [6:0] O
);
wire [6:0] coreir_commonlib_mux2x7_inst0_out;
commonlib_muxn__N2__width7 coreir_commonlib_mux2x7_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_sel(S),
    .out(coreir_commonlib_mux2x7_inst0_out)
);
assign O = coreir_commonlib_mux2x7_inst0_out;
endmodule

module Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7 (
    input [6:0] I,
    output [6:0] O,
    input CLK,
    input CE,
    input ASYNCRESET
);
wire [6:0] enable_mux_O;
wire [6:0] value_out;
Mux2xOutBits7 enable_mux (
    .I0(value_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg_arst #(
    .arst_posedge(1'b1),
    .clk_posedge(1'b1),
    .init(7'h00),
    .width(7)
) value (
    .clk(CLK),
    .arst(ASYNCRESET),
    .in(enable_mux_O),
    .out(value_out)
);
assign O = value_out;
endmodule

module Mux2xOutBits6 (
    input [5:0] I0,
    input [5:0] I1,
    input S,
    output [5:0] O
);
wire [5:0] coreir_commonlib_mux2x6_inst0_out;
commonlib_muxn__N2__width6 coreir_commonlib_mux2x6_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_sel(S),
    .out(coreir_commonlib_mux2x6_inst0_out)
);
assign O = coreir_commonlib_mux2x6_inst0_out;
endmodule

module Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6 (
    input [5:0] I,
    output [5:0] O,
    input CLK,
    input CE,
    input ASYNCRESET
);
wire [5:0] enable_mux_O;
wire [5:0] value_out;
Mux2xOutBits6 enable_mux (
    .I0(value_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg_arst #(
    .arst_posedge(1'b1),
    .clk_posedge(1'b1),
    .init(6'h00),
    .width(6)
) value (
    .clk(CLK),
    .arst(ASYNCRESET),
    .in(enable_mux_O),
    .out(value_out)
);
assign O = value_out;
endmodule

module Mux2xOutBits4 (
    input [3:0] I0,
    input [3:0] I1,
    input S,
    output [3:0] O
);
wire [3:0] coreir_commonlib_mux2x4_inst0_out;
commonlib_muxn__N2__width4 coreir_commonlib_mux2x4_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_sel(S),
    .out(coreir_commonlib_mux2x4_inst0_out)
);
assign O = coreir_commonlib_mux2x4_inst0_out;
endmodule

module Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 (
    input [3:0] I,
    output [3:0] O,
    input CLK,
    input CE,
    input ASYNCRESET
);
wire [3:0] enable_mux_O;
wire [3:0] value_out;
Mux2xOutBits4 enable_mux (
    .I0(value_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg_arst #(
    .arst_posedge(1'b1),
    .clk_posedge(1'b1),
    .init(4'h0),
    .width(4)
) value (
    .clk(CLK),
    .arst(ASYNCRESET),
    .in(enable_mux_O),
    .out(value_out)
);
assign O = value_out;
endmodule

module Mux2xOutBits30 (
    input [29:0] I0,
    input [29:0] I1,
    input S,
    output [29:0] O
);
wire [29:0] coreir_commonlib_mux2x30_inst0_out;
commonlib_muxn__N2__width30 coreir_commonlib_mux2x30_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_sel(S),
    .out(coreir_commonlib_mux2x30_inst0_out)
);
assign O = coreir_commonlib_mux2x30_inst0_out;
endmodule

module Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 (
    input [29:0] I,
    output [29:0] O,
    input CLK,
    input CE,
    input ASYNCRESET
);
wire [29:0] enable_mux_O;
wire [29:0] value_out;
Mux2xOutBits30 enable_mux (
    .I0(value_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg_arst #(
    .arst_posedge(1'b1),
    .clk_posedge(1'b1),
    .init(30'h00000000),
    .width(30)
) value (
    .clk(CLK),
    .arst(ASYNCRESET),
    .in(enable_mux_O),
    .out(value_out)
);
assign O = value_out;
endmodule

module Mux2xOutBits2 (
    input [1:0] I0,
    input [1:0] I1,
    input S,
    output [1:0] O
);
wire [1:0] coreir_commonlib_mux2x2_inst0_out;
commonlib_muxn__N2__width2 coreir_commonlib_mux2x2_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_sel(S),
    .out(coreir_commonlib_mux2x2_inst0_out)
);
assign O = coreir_commonlib_mux2x2_inst0_out;
endmodule

module Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 (
    input [1:0] I,
    output [1:0] O,
    input CLK,
    input CE,
    input ASYNCRESET
);
wire [1:0] enable_mux_O;
wire [1:0] value_out;
Mux2xOutBits2 enable_mux (
    .I0(value_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg_arst #(
    .arst_posedge(1'b1),
    .clk_posedge(1'b1),
    .init(2'h0),
    .width(2)
) value (
    .clk(CLK),
    .arst(ASYNCRESET),
    .in(enable_mux_O),
    .out(value_out)
);
assign O = value_out;
endmodule

module Mux2xOutBits16 (
    input [15:0] I0,
    input [15:0] I1,
    input S,
    output [15:0] O
);
wire [15:0] coreir_commonlib_mux2x16_inst0_out;
commonlib_muxn__N2__width16 coreir_commonlib_mux2x16_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_sel(S),
    .out(coreir_commonlib_mux2x16_inst0_out)
);
assign O = coreir_commonlib_mux2x16_inst0_out;
endmodule

module Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 (
    input [15:0] I,
    output [15:0] O,
    input CLK,
    input CE,
    input ASYNCRESET
);
wire [15:0] enable_mux_O;
wire [15:0] value_out;
Mux2xOutBits16 enable_mux (
    .I0(value_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg_arst #(
    .arst_posedge(1'b1),
    .clk_posedge(1'b1),
    .init(16'h0000),
    .width(16)
) value (
    .clk(CLK),
    .arst(ASYNCRESET),
    .in(enable_mux_O),
    .out(value_out)
);
assign O = value_out;
endmodule

module Mux2xOutBits12 (
    input [11:0] I0,
    input [11:0] I1,
    input S,
    output [11:0] O
);
wire [11:0] coreir_commonlib_mux2x12_inst0_out;
commonlib_muxn__N2__width12 coreir_commonlib_mux2x12_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_sel(S),
    .out(coreir_commonlib_mux2x12_inst0_out)
);
assign O = coreir_commonlib_mux2x12_inst0_out;
endmodule

module Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12 (
    input [11:0] I,
    output [11:0] O,
    input CLK,
    input CE,
    input ASYNCRESET
);
wire [11:0] enable_mux_O;
wire [11:0] value_out;
Mux2xOutBits12 enable_mux (
    .I0(value_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg_arst #(
    .arst_posedge(1'b1),
    .clk_posedge(1'b1),
    .init(12'h000),
    .width(12)
) value (
    .clk(CLK),
    .arst(ASYNCRESET),
    .in(enable_mux_O),
    .out(value_out)
);
assign O = value_out;
endmodule

module Mux2xOutBits10 (
    input [9:0] I0,
    input [9:0] I1,
    input S,
    output [9:0] O
);
wire [9:0] coreir_commonlib_mux2x10_inst0_out;
commonlib_muxn__N2__width10 coreir_commonlib_mux2x10_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_sel(S),
    .out(coreir_commonlib_mux2x10_inst0_out)
);
assign O = coreir_commonlib_mux2x10_inst0_out;
endmodule

module Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10 (
    input [9:0] I,
    output [9:0] O,
    input CLK,
    input CE,
    input ASYNCRESET
);
wire [9:0] enable_mux_O;
wire [9:0] value_out;
Mux2xOutBits10 enable_mux (
    .I0(value_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg_arst #(
    .arst_posedge(1'b1),
    .clk_posedge(1'b1),
    .init(10'h000),
    .width(10)
) value (
    .clk(CLK),
    .arst(ASYNCRESET),
    .in(enable_mux_O),
    .out(value_out)
);
assign O = value_out;
endmodule

module Mux2xOutBits1 (
    input [0:0] I0,
    input [0:0] I1,
    input S,
    output [0:0] O
);
wire [0:0] coreir_commonlib_mux2x1_inst0_out;
commonlib_muxn__N2__width1 coreir_commonlib_mux2x1_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_sel(S),
    .out(coreir_commonlib_mux2x1_inst0_out)
);
assign O = coreir_commonlib_mux2x1_inst0_out;
endmodule

module Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 (
    input [0:0] I,
    output [0:0] O,
    input CLK,
    input CE,
    input ASYNCRESET
);
wire [0:0] enable_mux_O;
wire [0:0] value_out;
Mux2xOutBits1 enable_mux (
    .I0(value_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg_arst #(
    .arst_posedge(1'b1),
    .clk_posedge(1'b1),
    .init(1'h0),
    .width(1)
) value (
    .clk(CLK),
    .arst(ASYNCRESET),
    .in(enable_mux_O),
    .out(value_out)
);
assign O = value_out;
endmodule

module Mux2x1 (
    input [0:0] I0,
    input [0:0] I1,
    input S,
    output [0:0] O
);
wire [0:0] coreir_commonlib_mux2x1_inst0_out;
commonlib_muxn__N2__width1 coreir_commonlib_mux2x1_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_sel(S),
    .out(coreir_commonlib_mux2x1_inst0_out)
);
assign O = coreir_commonlib_mux2x1_inst0_out;
endmodule

module MuxWrapper_2_1 (
    input [0:0] I_0,
    input [0:0] I_1,
    output [0:0] O,
    input [0:0] S
);
wire [0:0] Mux2x1_inst0_O;
Mux2x1 Mux2x1_inst0 (
    .I0(I_0),
    .I1(I_1),
    .S(S[0]),
    .O(Mux2x1_inst0_O)
);
assign O = Mux2x1_inst0_O;
endmodule

module Mux209x32 (
    input [31:0] I0,
    input [31:0] I1,
    input [31:0] I2,
    input [31:0] I3,
    input [31:0] I4,
    input [31:0] I5,
    input [31:0] I6,
    input [31:0] I7,
    input [31:0] I8,
    input [31:0] I9,
    input [31:0] I10,
    input [31:0] I11,
    input [31:0] I12,
    input [31:0] I13,
    input [31:0] I14,
    input [31:0] I15,
    input [31:0] I16,
    input [31:0] I17,
    input [31:0] I18,
    input [31:0] I19,
    input [31:0] I20,
    input [31:0] I21,
    input [31:0] I22,
    input [31:0] I23,
    input [31:0] I24,
    input [31:0] I25,
    input [31:0] I26,
    input [31:0] I27,
    input [31:0] I28,
    input [31:0] I29,
    input [31:0] I30,
    input [31:0] I31,
    input [31:0] I32,
    input [31:0] I33,
    input [31:0] I34,
    input [31:0] I35,
    input [31:0] I36,
    input [31:0] I37,
    input [31:0] I38,
    input [31:0] I39,
    input [31:0] I40,
    input [31:0] I41,
    input [31:0] I42,
    input [31:0] I43,
    input [31:0] I44,
    input [31:0] I45,
    input [31:0] I46,
    input [31:0] I47,
    input [31:0] I48,
    input [31:0] I49,
    input [31:0] I50,
    input [31:0] I51,
    input [31:0] I52,
    input [31:0] I53,
    input [31:0] I54,
    input [31:0] I55,
    input [31:0] I56,
    input [31:0] I57,
    input [31:0] I58,
    input [31:0] I59,
    input [31:0] I60,
    input [31:0] I61,
    input [31:0] I62,
    input [31:0] I63,
    input [31:0] I64,
    input [31:0] I65,
    input [31:0] I66,
    input [31:0] I67,
    input [31:0] I68,
    input [31:0] I69,
    input [31:0] I70,
    input [31:0] I71,
    input [31:0] I72,
    input [31:0] I73,
    input [31:0] I74,
    input [31:0] I75,
    input [31:0] I76,
    input [31:0] I77,
    input [31:0] I78,
    input [31:0] I79,
    input [31:0] I80,
    input [31:0] I81,
    input [31:0] I82,
    input [31:0] I83,
    input [31:0] I84,
    input [31:0] I85,
    input [31:0] I86,
    input [31:0] I87,
    input [31:0] I88,
    input [31:0] I89,
    input [31:0] I90,
    input [31:0] I91,
    input [31:0] I92,
    input [31:0] I93,
    input [31:0] I94,
    input [31:0] I95,
    input [31:0] I96,
    input [31:0] I97,
    input [31:0] I98,
    input [31:0] I99,
    input [31:0] I100,
    input [31:0] I101,
    input [31:0] I102,
    input [31:0] I103,
    input [31:0] I104,
    input [31:0] I105,
    input [31:0] I106,
    input [31:0] I107,
    input [31:0] I108,
    input [31:0] I109,
    input [31:0] I110,
    input [31:0] I111,
    input [31:0] I112,
    input [31:0] I113,
    input [31:0] I114,
    input [31:0] I115,
    input [31:0] I116,
    input [31:0] I117,
    input [31:0] I118,
    input [31:0] I119,
    input [31:0] I120,
    input [31:0] I121,
    input [31:0] I122,
    input [31:0] I123,
    input [31:0] I124,
    input [31:0] I125,
    input [31:0] I126,
    input [31:0] I127,
    input [31:0] I128,
    input [31:0] I129,
    input [31:0] I130,
    input [31:0] I131,
    input [31:0] I132,
    input [31:0] I133,
    input [31:0] I134,
    input [31:0] I135,
    input [31:0] I136,
    input [31:0] I137,
    input [31:0] I138,
    input [31:0] I139,
    input [31:0] I140,
    input [31:0] I141,
    input [31:0] I142,
    input [31:0] I143,
    input [31:0] I144,
    input [31:0] I145,
    input [31:0] I146,
    input [31:0] I147,
    input [31:0] I148,
    input [31:0] I149,
    input [31:0] I150,
    input [31:0] I151,
    input [31:0] I152,
    input [31:0] I153,
    input [31:0] I154,
    input [31:0] I155,
    input [31:0] I156,
    input [31:0] I157,
    input [31:0] I158,
    input [31:0] I159,
    input [31:0] I160,
    input [31:0] I161,
    input [31:0] I162,
    input [31:0] I163,
    input [31:0] I164,
    input [31:0] I165,
    input [31:0] I166,
    input [31:0] I167,
    input [31:0] I168,
    input [31:0] I169,
    input [31:0] I170,
    input [31:0] I171,
    input [31:0] I172,
    input [31:0] I173,
    input [31:0] I174,
    input [31:0] I175,
    input [31:0] I176,
    input [31:0] I177,
    input [31:0] I178,
    input [31:0] I179,
    input [31:0] I180,
    input [31:0] I181,
    input [31:0] I182,
    input [31:0] I183,
    input [31:0] I184,
    input [31:0] I185,
    input [31:0] I186,
    input [31:0] I187,
    input [31:0] I188,
    input [31:0] I189,
    input [31:0] I190,
    input [31:0] I191,
    input [31:0] I192,
    input [31:0] I193,
    input [31:0] I194,
    input [31:0] I195,
    input [31:0] I196,
    input [31:0] I197,
    input [31:0] I198,
    input [31:0] I199,
    input [31:0] I200,
    input [31:0] I201,
    input [31:0] I202,
    input [31:0] I203,
    input [31:0] I204,
    input [31:0] I205,
    input [31:0] I206,
    input [31:0] I207,
    input [31:0] I208,
    input [7:0] S,
    output [31:0] O
);
wire [31:0] coreir_commonlib_mux209x32_inst0_out;
commonlib_muxn__N209__width32 coreir_commonlib_mux209x32_inst0 (
    .in_data_0(I0),
    .in_data_1(I1),
    .in_data_10(I10),
    .in_data_100(I100),
    .in_data_101(I101),
    .in_data_102(I102),
    .in_data_103(I103),
    .in_data_104(I104),
    .in_data_105(I105),
    .in_data_106(I106),
    .in_data_107(I107),
    .in_data_108(I108),
    .in_data_109(I109),
    .in_data_11(I11),
    .in_data_110(I110),
    .in_data_111(I111),
    .in_data_112(I112),
    .in_data_113(I113),
    .in_data_114(I114),
    .in_data_115(I115),
    .in_data_116(I116),
    .in_data_117(I117),
    .in_data_118(I118),
    .in_data_119(I119),
    .in_data_12(I12),
    .in_data_120(I120),
    .in_data_121(I121),
    .in_data_122(I122),
    .in_data_123(I123),
    .in_data_124(I124),
    .in_data_125(I125),
    .in_data_126(I126),
    .in_data_127(I127),
    .in_data_128(I128),
    .in_data_129(I129),
    .in_data_13(I13),
    .in_data_130(I130),
    .in_data_131(I131),
    .in_data_132(I132),
    .in_data_133(I133),
    .in_data_134(I134),
    .in_data_135(I135),
    .in_data_136(I136),
    .in_data_137(I137),
    .in_data_138(I138),
    .in_data_139(I139),
    .in_data_14(I14),
    .in_data_140(I140),
    .in_data_141(I141),
    .in_data_142(I142),
    .in_data_143(I143),
    .in_data_144(I144),
    .in_data_145(I145),
    .in_data_146(I146),
    .in_data_147(I147),
    .in_data_148(I148),
    .in_data_149(I149),
    .in_data_15(I15),
    .in_data_150(I150),
    .in_data_151(I151),
    .in_data_152(I152),
    .in_data_153(I153),
    .in_data_154(I154),
    .in_data_155(I155),
    .in_data_156(I156),
    .in_data_157(I157),
    .in_data_158(I158),
    .in_data_159(I159),
    .in_data_16(I16),
    .in_data_160(I160),
    .in_data_161(I161),
    .in_data_162(I162),
    .in_data_163(I163),
    .in_data_164(I164),
    .in_data_165(I165),
    .in_data_166(I166),
    .in_data_167(I167),
    .in_data_168(I168),
    .in_data_169(I169),
    .in_data_17(I17),
    .in_data_170(I170),
    .in_data_171(I171),
    .in_data_172(I172),
    .in_data_173(I173),
    .in_data_174(I174),
    .in_data_175(I175),
    .in_data_176(I176),
    .in_data_177(I177),
    .in_data_178(I178),
    .in_data_179(I179),
    .in_data_18(I18),
    .in_data_180(I180),
    .in_data_181(I181),
    .in_data_182(I182),
    .in_data_183(I183),
    .in_data_184(I184),
    .in_data_185(I185),
    .in_data_186(I186),
    .in_data_187(I187),
    .in_data_188(I188),
    .in_data_189(I189),
    .in_data_19(I19),
    .in_data_190(I190),
    .in_data_191(I191),
    .in_data_192(I192),
    .in_data_193(I193),
    .in_data_194(I194),
    .in_data_195(I195),
    .in_data_196(I196),
    .in_data_197(I197),
    .in_data_198(I198),
    .in_data_199(I199),
    .in_data_2(I2),
    .in_data_20(I20),
    .in_data_200(I200),
    .in_data_201(I201),
    .in_data_202(I202),
    .in_data_203(I203),
    .in_data_204(I204),
    .in_data_205(I205),
    .in_data_206(I206),
    .in_data_207(I207),
    .in_data_208(I208),
    .in_data_21(I21),
    .in_data_22(I22),
    .in_data_23(I23),
    .in_data_24(I24),
    .in_data_25(I25),
    .in_data_26(I26),
    .in_data_27(I27),
    .in_data_28(I28),
    .in_data_29(I29),
    .in_data_3(I3),
    .in_data_30(I30),
    .in_data_31(I31),
    .in_data_32(I32),
    .in_data_33(I33),
    .in_data_34(I34),
    .in_data_35(I35),
    .in_data_36(I36),
    .in_data_37(I37),
    .in_data_38(I38),
    .in_data_39(I39),
    .in_data_4(I4),
    .in_data_40(I40),
    .in_data_41(I41),
    .in_data_42(I42),
    .in_data_43(I43),
    .in_data_44(I44),
    .in_data_45(I45),
    .in_data_46(I46),
    .in_data_47(I47),
    .in_data_48(I48),
    .in_data_49(I49),
    .in_data_5(I5),
    .in_data_50(I50),
    .in_data_51(I51),
    .in_data_52(I52),
    .in_data_53(I53),
    .in_data_54(I54),
    .in_data_55(I55),
    .in_data_56(I56),
    .in_data_57(I57),
    .in_data_58(I58),
    .in_data_59(I59),
    .in_data_6(I6),
    .in_data_60(I60),
    .in_data_61(I61),
    .in_data_62(I62),
    .in_data_63(I63),
    .in_data_64(I64),
    .in_data_65(I65),
    .in_data_66(I66),
    .in_data_67(I67),
    .in_data_68(I68),
    .in_data_69(I69),
    .in_data_7(I7),
    .in_data_70(I70),
    .in_data_71(I71),
    .in_data_72(I72),
    .in_data_73(I73),
    .in_data_74(I74),
    .in_data_75(I75),
    .in_data_76(I76),
    .in_data_77(I77),
    .in_data_78(I78),
    .in_data_79(I79),
    .in_data_8(I8),
    .in_data_80(I80),
    .in_data_81(I81),
    .in_data_82(I82),
    .in_data_83(I83),
    .in_data_84(I84),
    .in_data_85(I85),
    .in_data_86(I86),
    .in_data_87(I87),
    .in_data_88(I88),
    .in_data_89(I89),
    .in_data_9(I9),
    .in_data_90(I90),
    .in_data_91(I91),
    .in_data_92(I92),
    .in_data_93(I93),
    .in_data_94(I94),
    .in_data_95(I95),
    .in_data_96(I96),
    .in_data_97(I97),
    .in_data_98(I98),
    .in_data_99(I99),
    .in_sel(S),
    .out(coreir_commonlib_mux209x32_inst0_out)
);
assign O = coreir_commonlib_mux209x32_inst0_out;
endmodule

module MuxWrapper_209_32 (
    input [31:0] I_0,
    input [31:0] I_1,
    input [31:0] I_10,
    input [31:0] I_100,
    input [31:0] I_101,
    input [31:0] I_102,
    input [31:0] I_103,
    input [31:0] I_104,
    input [31:0] I_105,
    input [31:0] I_106,
    input [31:0] I_107,
    input [31:0] I_108,
    input [31:0] I_109,
    input [31:0] I_11,
    input [31:0] I_110,
    input [31:0] I_111,
    input [31:0] I_112,
    input [31:0] I_113,
    input [31:0] I_114,
    input [31:0] I_115,
    input [31:0] I_116,
    input [31:0] I_117,
    input [31:0] I_118,
    input [31:0] I_119,
    input [31:0] I_12,
    input [31:0] I_120,
    input [31:0] I_121,
    input [31:0] I_122,
    input [31:0] I_123,
    input [31:0] I_124,
    input [31:0] I_125,
    input [31:0] I_126,
    input [31:0] I_127,
    input [31:0] I_128,
    input [31:0] I_129,
    input [31:0] I_13,
    input [31:0] I_130,
    input [31:0] I_131,
    input [31:0] I_132,
    input [31:0] I_133,
    input [31:0] I_134,
    input [31:0] I_135,
    input [31:0] I_136,
    input [31:0] I_137,
    input [31:0] I_138,
    input [31:0] I_139,
    input [31:0] I_14,
    input [31:0] I_140,
    input [31:0] I_141,
    input [31:0] I_142,
    input [31:0] I_143,
    input [31:0] I_144,
    input [31:0] I_145,
    input [31:0] I_146,
    input [31:0] I_147,
    input [31:0] I_148,
    input [31:0] I_149,
    input [31:0] I_15,
    input [31:0] I_150,
    input [31:0] I_151,
    input [31:0] I_152,
    input [31:0] I_153,
    input [31:0] I_154,
    input [31:0] I_155,
    input [31:0] I_156,
    input [31:0] I_157,
    input [31:0] I_158,
    input [31:0] I_159,
    input [31:0] I_16,
    input [31:0] I_160,
    input [31:0] I_161,
    input [31:0] I_162,
    input [31:0] I_163,
    input [31:0] I_164,
    input [31:0] I_165,
    input [31:0] I_166,
    input [31:0] I_167,
    input [31:0] I_168,
    input [31:0] I_169,
    input [31:0] I_17,
    input [31:0] I_170,
    input [31:0] I_171,
    input [31:0] I_172,
    input [31:0] I_173,
    input [31:0] I_174,
    input [31:0] I_175,
    input [31:0] I_176,
    input [31:0] I_177,
    input [31:0] I_178,
    input [31:0] I_179,
    input [31:0] I_18,
    input [31:0] I_180,
    input [31:0] I_181,
    input [31:0] I_182,
    input [31:0] I_183,
    input [31:0] I_184,
    input [31:0] I_185,
    input [31:0] I_186,
    input [31:0] I_187,
    input [31:0] I_188,
    input [31:0] I_189,
    input [31:0] I_19,
    input [31:0] I_190,
    input [31:0] I_191,
    input [31:0] I_192,
    input [31:0] I_193,
    input [31:0] I_194,
    input [31:0] I_195,
    input [31:0] I_196,
    input [31:0] I_197,
    input [31:0] I_198,
    input [31:0] I_199,
    input [31:0] I_2,
    input [31:0] I_20,
    input [31:0] I_200,
    input [31:0] I_201,
    input [31:0] I_202,
    input [31:0] I_203,
    input [31:0] I_204,
    input [31:0] I_205,
    input [31:0] I_206,
    input [31:0] I_207,
    input [31:0] I_208,
    input [31:0] I_21,
    input [31:0] I_22,
    input [31:0] I_23,
    input [31:0] I_24,
    input [31:0] I_25,
    input [31:0] I_26,
    input [31:0] I_27,
    input [31:0] I_28,
    input [31:0] I_29,
    input [31:0] I_3,
    input [31:0] I_30,
    input [31:0] I_31,
    input [31:0] I_32,
    input [31:0] I_33,
    input [31:0] I_34,
    input [31:0] I_35,
    input [31:0] I_36,
    input [31:0] I_37,
    input [31:0] I_38,
    input [31:0] I_39,
    input [31:0] I_4,
    input [31:0] I_40,
    input [31:0] I_41,
    input [31:0] I_42,
    input [31:0] I_43,
    input [31:0] I_44,
    input [31:0] I_45,
    input [31:0] I_46,
    input [31:0] I_47,
    input [31:0] I_48,
    input [31:0] I_49,
    input [31:0] I_5,
    input [31:0] I_50,
    input [31:0] I_51,
    input [31:0] I_52,
    input [31:0] I_53,
    input [31:0] I_54,
    input [31:0] I_55,
    input [31:0] I_56,
    input [31:0] I_57,
    input [31:0] I_58,
    input [31:0] I_59,
    input [31:0] I_6,
    input [31:0] I_60,
    input [31:0] I_61,
    input [31:0] I_62,
    input [31:0] I_63,
    input [31:0] I_64,
    input [31:0] I_65,
    input [31:0] I_66,
    input [31:0] I_67,
    input [31:0] I_68,
    input [31:0] I_69,
    input [31:0] I_7,
    input [31:0] I_70,
    input [31:0] I_71,
    input [31:0] I_72,
    input [31:0] I_73,
    input [31:0] I_74,
    input [31:0] I_75,
    input [31:0] I_76,
    input [31:0] I_77,
    input [31:0] I_78,
    input [31:0] I_79,
    input [31:0] I_8,
    input [31:0] I_80,
    input [31:0] I_81,
    input [31:0] I_82,
    input [31:0] I_83,
    input [31:0] I_84,
    input [31:0] I_85,
    input [31:0] I_86,
    input [31:0] I_87,
    input [31:0] I_88,
    input [31:0] I_89,
    input [31:0] I_9,
    input [31:0] I_90,
    input [31:0] I_91,
    input [31:0] I_92,
    input [31:0] I_93,
    input [31:0] I_94,
    input [31:0] I_95,
    input [31:0] I_96,
    input [31:0] I_97,
    input [31:0] I_98,
    input [31:0] I_99,
    output [31:0] O,
    input [7:0] S
);
wire [31:0] Mux209x32_inst0_O;
Mux209x32 Mux209x32_inst0 (
    .I0(I_0),
    .I1(I_1),
    .I2(I_2),
    .I3(I_3),
    .I4(I_4),
    .I5(I_5),
    .I6(I_6),
    .I7(I_7),
    .I8(I_8),
    .I9(I_9),
    .I10(I_10),
    .I11(I_11),
    .I12(I_12),
    .I13(I_13),
    .I14(I_14),
    .I15(I_15),
    .I16(I_16),
    .I17(I_17),
    .I18(I_18),
    .I19(I_19),
    .I20(I_20),
    .I21(I_21),
    .I22(I_22),
    .I23(I_23),
    .I24(I_24),
    .I25(I_25),
    .I26(I_26),
    .I27(I_27),
    .I28(I_28),
    .I29(I_29),
    .I30(I_30),
    .I31(I_31),
    .I32(I_32),
    .I33(I_33),
    .I34(I_34),
    .I35(I_35),
    .I36(I_36),
    .I37(I_37),
    .I38(I_38),
    .I39(I_39),
    .I40(I_40),
    .I41(I_41),
    .I42(I_42),
    .I43(I_43),
    .I44(I_44),
    .I45(I_45),
    .I46(I_46),
    .I47(I_47),
    .I48(I_48),
    .I49(I_49),
    .I50(I_50),
    .I51(I_51),
    .I52(I_52),
    .I53(I_53),
    .I54(I_54),
    .I55(I_55),
    .I56(I_56),
    .I57(I_57),
    .I58(I_58),
    .I59(I_59),
    .I60(I_60),
    .I61(I_61),
    .I62(I_62),
    .I63(I_63),
    .I64(I_64),
    .I65(I_65),
    .I66(I_66),
    .I67(I_67),
    .I68(I_68),
    .I69(I_69),
    .I70(I_70),
    .I71(I_71),
    .I72(I_72),
    .I73(I_73),
    .I74(I_74),
    .I75(I_75),
    .I76(I_76),
    .I77(I_77),
    .I78(I_78),
    .I79(I_79),
    .I80(I_80),
    .I81(I_81),
    .I82(I_82),
    .I83(I_83),
    .I84(I_84),
    .I85(I_85),
    .I86(I_86),
    .I87(I_87),
    .I88(I_88),
    .I89(I_89),
    .I90(I_90),
    .I91(I_91),
    .I92(I_92),
    .I93(I_93),
    .I94(I_94),
    .I95(I_95),
    .I96(I_96),
    .I97(I_97),
    .I98(I_98),
    .I99(I_99),
    .I100(I_100),
    .I101(I_101),
    .I102(I_102),
    .I103(I_103),
    .I104(I_104),
    .I105(I_105),
    .I106(I_106),
    .I107(I_107),
    .I108(I_108),
    .I109(I_109),
    .I110(I_110),
    .I111(I_111),
    .I112(I_112),
    .I113(I_113),
    .I114(I_114),
    .I115(I_115),
    .I116(I_116),
    .I117(I_117),
    .I118(I_118),
    .I119(I_119),
    .I120(I_120),
    .I121(I_121),
    .I122(I_122),
    .I123(I_123),
    .I124(I_124),
    .I125(I_125),
    .I126(I_126),
    .I127(I_127),
    .I128(I_128),
    .I129(I_129),
    .I130(I_130),
    .I131(I_131),
    .I132(I_132),
    .I133(I_133),
    .I134(I_134),
    .I135(I_135),
    .I136(I_136),
    .I137(I_137),
    .I138(I_138),
    .I139(I_139),
    .I140(I_140),
    .I141(I_141),
    .I142(I_142),
    .I143(I_143),
    .I144(I_144),
    .I145(I_145),
    .I146(I_146),
    .I147(I_147),
    .I148(I_148),
    .I149(I_149),
    .I150(I_150),
    .I151(I_151),
    .I152(I_152),
    .I153(I_153),
    .I154(I_154),
    .I155(I_155),
    .I156(I_156),
    .I157(I_157),
    .I158(I_158),
    .I159(I_159),
    .I160(I_160),
    .I161(I_161),
    .I162(I_162),
    .I163(I_163),
    .I164(I_164),
    .I165(I_165),
    .I166(I_166),
    .I167(I_167),
    .I168(I_168),
    .I169(I_169),
    .I170(I_170),
    .I171(I_171),
    .I172(I_172),
    .I173(I_173),
    .I174(I_174),
    .I175(I_175),
    .I176(I_176),
    .I177(I_177),
    .I178(I_178),
    .I179(I_179),
    .I180(I_180),
    .I181(I_181),
    .I182(I_182),
    .I183(I_183),
    .I184(I_184),
    .I185(I_185),
    .I186(I_186),
    .I187(I_187),
    .I188(I_188),
    .I189(I_189),
    .I190(I_190),
    .I191(I_191),
    .I192(I_192),
    .I193(I_193),
    .I194(I_194),
    .I195(I_195),
    .I196(I_196),
    .I197(I_197),
    .I198(I_198),
    .I199(I_199),
    .I200(I_200),
    .I201(I_201),
    .I202(I_202),
    .I203(I_203),
    .I204(I_204),
    .I205(I_205),
    .I206(I_206),
    .I207(I_207),
    .I208(I_208),
    .S(S),
    .O(Mux209x32_inst0_O)
);
assign O = Mux209x32_inst0_O;
endmodule

module Chain (
  input logic [1:0] [15:0] chain_data_in,
  output logic [1:0] [15:0] chain_data_out,
  input logic chain_idx_output,
  input logic [1:0] chain_valid_in,
  output logic [1:0] chain_valid_out,
  input logic clk_en,
  input logic [1:0] [15:0] curr_tile_data_out,
  input logic [1:0] curr_tile_valid_out,
  output logic [1:0] [15:0] data_out_tile,
  input logic enable_chain_output,
  input logic flush,
  output logic [1:0] valid_out_tile
);

logic [1:0][15:0] chain_data_out_inter;
logic [1:0] chain_valid_out_inter;
always_comb begin
  if (enable_chain_output) begin
    data_out_tile = chain_data_out_inter;
  end
  else data_out_tile = curr_tile_data_out;
end
always_comb begin
  if (enable_chain_output) begin
    if (~(chain_idx_output == 1'h0)) begin
      valid_out_tile[0] = 1'h0;
      valid_out_tile[1] = 1'h0;
    end
    else valid_out_tile = chain_valid_out_inter;
  end
  else valid_out_tile = curr_tile_valid_out;
end
always_comb begin
  chain_data_out = chain_data_out_inter;
end
always_comb begin
  if ((chain_idx_output == 1'h0) | (~enable_chain_output)) begin
    chain_valid_out[0] = 1'h0;
    chain_valid_out[1] = 1'h0;
  end
  else chain_valid_out = chain_valid_out_inter;
end
always_comb begin
  if (chain_valid_in[0] == 1'h0) begin
    chain_data_out_inter[0] = curr_tile_data_out[0];
    chain_valid_out_inter[0] = curr_tile_valid_out[0];
  end
  else begin
    chain_data_out_inter[0] = chain_data_in[0];
    chain_valid_out_inter[0] = chain_valid_in[0];
  end
  if (chain_valid_in[1] == 1'h0) begin
    chain_data_out_inter[1] = curr_tile_data_out[1];
    chain_valid_out_inter[1] = curr_tile_valid_out[1];
  end
  else begin
    chain_data_out_inter[1] = chain_data_in[1];
    chain_valid_out_inter[1] = chain_valid_in[1];
  end
end
endmodule   // Chain

module LakeTop (
  input logic [1:0] [15:0] addr_in,
  input logic [1:0] [15:0] chain_data_in,
  output logic [1:0] [15:0] chain_data_out,
  input logic chain_idx_input,
  input logic chain_idx_output,
  input logic [1:0] chain_valid_in,
  output logic [1:0] chain_valid_out,
  input logic clk,
  input logic clk_en,
  input logic [7:0] config_addr_in,
  input logic [31:0] config_data_in,
  output logic [1:0] [31:0] config_data_out,
  input logic [1:0] config_en,
  input logic config_read,
  input logic config_write,
  input logic [1:0] [15:0] data_in,
  output logic [1:0] [15:0] data_out,
  output logic empty,
  input logic enable_chain_input,
  input logic enable_chain_output,
  input logic [15:0] fifo_ctrl_fifo_depth,
  input logic flush,
  output logic full,
  input logic [1:0] mode,
  input logic [1:0] ren_in,
  input logic rst_n,
  output logic sram_ready_out,
  input logic [6:0] strg_ub_agg_align_0_line_length,
  input logic [6:0] strg_ub_agg_align_1_line_length,
  input logic [3:0] strg_ub_agg_in_0_in_period,
  input logic [15:0] [1:0] strg_ub_agg_in_0_in_sched,
  input logic [3:0] strg_ub_agg_in_0_out_period,
  input logic [15:0] [1:0] strg_ub_agg_in_0_out_sched,
  input logic [3:0] strg_ub_agg_in_1_in_period,
  input logic [15:0] [1:0] strg_ub_agg_in_1_in_sched,
  input logic [3:0] strg_ub_agg_in_1_out_period,
  input logic [15:0] [1:0] strg_ub_agg_in_1_out_sched,
  input logic [1:0] strg_ub_app_ctrl_coarse_input_port,
  input logic [1:0] strg_ub_app_ctrl_coarse_output_port,
  input logic [1:0] strg_ub_app_ctrl_coarse_prefill,
  input logic [1:0] [15:0] strg_ub_app_ctrl_coarse_read_depth,
  input logic [1:0] [15:0] strg_ub_app_ctrl_coarse_write_depth_ss,
  input logic [1:0] [15:0] strg_ub_app_ctrl_coarse_write_depth_wo,
  input logic [1:0] strg_ub_app_ctrl_input_port,
  input logic [1:0] strg_ub_app_ctrl_output_port,
  input logic [1:0] strg_ub_app_ctrl_prefill,
  input logic [3:0] [15:0] strg_ub_app_ctrl_ranges,
  input logic [1:0] [15:0] strg_ub_app_ctrl_read_depth,
  input logic [3:0] [15:0] strg_ub_app_ctrl_threshold,
  input logic [1:0] [15:0] strg_ub_app_ctrl_write_depth_ss,
  input logic [1:0] [15:0] strg_ub_app_ctrl_write_depth_wo,
  input logic [3:0] strg_ub_input_addr_ctrl_address_gen_0_dimensionality,
  input logic [5:0] [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_starting_addr,
  input logic [5:0] [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides,
  input logic [3:0] strg_ub_input_addr_ctrl_address_gen_1_dimensionality,
  input logic [5:0] [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_starting_addr,
  input logic [5:0] [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides,
  input logic [3:0] strg_ub_output_addr_ctrl_address_gen_0_dimensionality,
  input logic [5:0] [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_starting_addr,
  input logic [5:0] [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides,
  input logic [3:0] strg_ub_output_addr_ctrl_address_gen_1_dimensionality,
  input logic [5:0] [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_starting_addr,
  input logic [5:0] [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides,
  input logic [3:0] strg_ub_pre_fetch_0_input_latency,
  input logic [3:0] strg_ub_pre_fetch_1_input_latency,
  input logic [1:0] [1:0] strg_ub_rate_matched,
  input logic [1:0] [1:0] strg_ub_sync_grp_sync_group,
  input logic [1:0] strg_ub_tb_0_dimensionality,
  input logic [63:0] [2:0] strg_ub_tb_0_indices,
  input logic [5:0] strg_ub_tb_0_range_inner,
  input logic [9:0] strg_ub_tb_0_range_outer,
  input logic [1:0] strg_ub_tb_0_starting_addr,
  input logic [3:0] strg_ub_tb_0_stride,
  input logic strg_ub_tb_0_tb_height,
  input logic [1:0] strg_ub_tb_1_dimensionality,
  input logic [63:0] [2:0] strg_ub_tb_1_indices,
  input logic [5:0] strg_ub_tb_1_range_inner,
  input logic [9:0] strg_ub_tb_1_range_outer,
  input logic [1:0] strg_ub_tb_1_starting_addr,
  input logic [3:0] strg_ub_tb_1_stride,
  input logic strg_ub_tb_1_tb_height,
  input logic tile_en,
  output logic [1:0] valid_out,
  input logic [1:0] wen_in
);

logic [2:0][0:0][9:0] all_addr_to_mem;
logic [2:0][15:0] all_data_out;
logic [2:0][0:0][3:0][15:0] all_data_to_mem;
logic [2:0][0:0] all_ren_to_mem;
logic [2:0] all_valid_out;
logic [2:0][0:0] all_wen_to_mem;
logic cfg_seq_clk;
logic [15:0] config_data_in_shrt;
logic [1:0][15:0] config_data_out_shrt;
logic config_seq_clk;
logic config_seq_clk_en;
logic [1:0][15:0] data_out_tile;
logic [0:0][9:0] fifo_addr_to_mem;
logic fifo_ctrl_clk;
logic [15:0] fifo_ctrl_data_in;
logic fifo_ctrl_pop;
logic fifo_ctrl_push;
logic [15:0] fifo_data_out;
logic [0:0][3:0][15:0] fifo_data_to_mem;
logic fifo_empty;
logic fifo_full;
logic fifo_ren_to_mem;
logic fifo_valid_out;
logic fifo_wen_to_mem;
logic gclk;
logic mem_0_clk;
logic mem_0_clk_en;
logic [9:0] mem_0_mem_addr_in_bank;
logic mem_0_mem_cen_in_bank;
logic [3:0][15:0] mem_0_mem_data_in_bank;
logic [0:0][3:0][15:0] mem_0_mem_data_out_bank;
logic mem_0_mem_wen_in_bank;
logic mem_0_valid_data;
logic [9:0] mem_addr_cfg;
logic [0:0][0:0][9:0] mem_addr_dp;
logic [0:0][0:0][9:0] mem_addr_in;
logic [0:0] mem_cen_dp;
logic [0:0] mem_cen_in;
logic [3:0][15:0] mem_data_cfg;
logic [0:0][0:0][3:0][15:0] mem_data_dp;
logic [0:0][0:0][3:0][15:0] mem_data_in;
logic [0:0][3:0][15:0] mem_data_low_pt;
logic [0:0][0:0][3:0][15:0] mem_data_out;
logic mem_ren_cfg;
logic [0:0] mem_valid_data;
logic mem_wen_cfg;
logic [0:0] mem_wen_dp;
logic [0:0] mem_wen_in;
logic [0:0][9:0] sram_addr_to_mem;
logic sram_ctrl_clk;
logic [15:0] sram_ctrl_data_in;
logic [15:0] sram_ctrl_rd_addr_in;
logic sram_ctrl_ren;
logic sram_ctrl_wen;
logic [15:0] sram_ctrl_wr_addr_in;
logic [15:0] sram_data_out;
logic [0:0][3:0][15:0] sram_data_to_mem;
logic sram_ren_to_mem;
logic sram_valid_out;
logic sram_wen_to_mem;
logic strg_ub_clk;
logic [0:0][0:0][9:0] ub_addr_to_mem;
logic [0:0] ub_cen_to_mem;
logic [1:0][15:0] ub_data_out;
logic [0:0][0:0][3:0][15:0] ub_data_to_mem;
logic [1:0] ub_valid_out;
logic [0:0] ub_wen_to_mem;
logic [1:0] valid_out_tile;
assign config_data_in_shrt = config_data_in[15:0];
assign config_data_out[0] = 32'(config_data_out_shrt[0]);
assign config_data_out[1] = 32'(config_data_out_shrt[1]);
assign gclk = clk & tile_en;
assign mem_data_low_pt[0] = mem_data_out[0][0];
assign cfg_seq_clk = gclk;
assign config_seq_clk = cfg_seq_clk;
assign config_seq_clk_en = clk_en | (|config_en);
assign mem_wen_in = (|config_en) ? mem_wen_cfg: mem_wen_dp;
assign mem_cen_in = (|config_en) ? mem_wen_cfg | mem_ren_cfg: mem_cen_dp;
assign mem_addr_in[0][0] = (|config_en) ? mem_addr_cfg: mem_addr_dp[0][0];
assign mem_data_in[0][0] = (|config_en) ? mem_data_cfg: mem_data_dp[0][0];
assign strg_ub_clk = gclk;
assign sram_ctrl_clk = gclk;
assign sram_ctrl_wen = wen_in[0];
assign sram_ctrl_ren = ren_in[0];
assign sram_ctrl_data_in = data_in[0];
assign sram_ctrl_wr_addr_in = addr_in[0];
assign sram_ctrl_rd_addr_in = addr_in[0];
assign fifo_ctrl_clk = gclk;
assign fifo_ctrl_data_in = data_in[0];
assign fifo_ctrl_push = wen_in[0];
assign fifo_ctrl_pop = ren_in[0];
assign empty = fifo_empty;
assign full = fifo_full;
assign all_data_to_mem[0] = ub_data_to_mem;
assign all_wen_to_mem[0] = ub_wen_to_mem;
assign all_ren_to_mem[0] = ub_cen_to_mem;
assign all_addr_to_mem[0] = ub_addr_to_mem;
assign all_data_to_mem[1] = fifo_data_to_mem;
assign all_wen_to_mem[1] = fifo_wen_to_mem;
assign all_ren_to_mem[1] = fifo_ren_to_mem;
assign all_addr_to_mem[1][0] = fifo_addr_to_mem[0];
assign all_data_to_mem[2] = sram_data_to_mem;
assign all_wen_to_mem[2] = sram_wen_to_mem;
assign all_ren_to_mem[2] = sram_ren_to_mem;
assign all_addr_to_mem[2][0] = sram_addr_to_mem[0];
assign mem_data_dp = all_data_to_mem[mode];
assign mem_cen_dp = all_ren_to_mem[mode] | all_wen_to_mem[mode];
assign mem_wen_dp = all_wen_to_mem[mode];
assign mem_addr_dp = all_addr_to_mem[mode];
assign mem_0_clk = gclk;
assign mem_0_clk_en = clk_en | (|config_en);
assign mem_0_mem_data_in_bank = mem_data_in[0];
assign mem_data_out[0] = mem_0_mem_data_out_bank;
assign mem_0_mem_addr_in_bank = mem_addr_in[0];
assign mem_0_mem_cen_in_bank = mem_cen_in;
assign mem_0_mem_wen_in_bank = mem_wen_in;
assign mem_valid_data = mem_0_valid_data;
assign all_data_out[0] = ub_data_out[0];
assign all_valid_out[0] = ub_valid_out[0];
assign all_data_out[1] = fifo_data_out;
assign all_valid_out[1] = fifo_valid_out;
assign all_data_out[2] = sram_data_out;
assign all_valid_out[2] = sram_valid_out;
assign data_out_tile[0] = all_data_out[mode];
assign valid_out_tile[0] = all_valid_out[mode];
assign data_out_tile[1] = ub_data_out[1];
assign valid_out_tile[1] = ub_valid_out[1];
storage_config_seq config_seq (
  .addr_out(mem_addr_cfg),
  .clk(config_seq_clk),
  .clk_en(config_seq_clk_en),
  .config_addr_in(config_addr_in),
  .config_data_in(config_data_in_shrt),
  .config_en(config_en),
  .config_rd(config_read),
  .config_wr(config_write),
  .flush(flush),
  .rd_data_out(config_data_out_shrt),
  .rd_data_stg(mem_data_low_pt),
  .ren_out(mem_ren_cfg),
  .rst_n(rst_n),
  .wen_out(mem_wen_cfg),
  .wr_data(mem_data_cfg)
);

strg_ub strg_ub (
  .addr_out(ub_addr_to_mem),
  .agg_align_0_line_length(strg_ub_agg_align_0_line_length),
  .agg_align_1_line_length(strg_ub_agg_align_1_line_length),
  .agg_in_0_in_period(strg_ub_agg_in_0_in_period),
  .agg_in_0_in_sched(strg_ub_agg_in_0_in_sched),
  .agg_in_0_out_period(strg_ub_agg_in_0_out_period),
  .agg_in_0_out_sched(strg_ub_agg_in_0_out_sched),
  .agg_in_1_in_period(strg_ub_agg_in_1_in_period),
  .agg_in_1_in_sched(strg_ub_agg_in_1_in_sched),
  .agg_in_1_out_period(strg_ub_agg_in_1_out_period),
  .agg_in_1_out_sched(strg_ub_agg_in_1_out_sched),
  .app_ctrl_coarse_input_port(strg_ub_app_ctrl_coarse_input_port),
  .app_ctrl_coarse_output_port(strg_ub_app_ctrl_coarse_output_port),
  .app_ctrl_coarse_prefill(strg_ub_app_ctrl_coarse_prefill),
  .app_ctrl_coarse_read_depth(strg_ub_app_ctrl_coarse_read_depth),
  .app_ctrl_coarse_write_depth_ss(strg_ub_app_ctrl_coarse_write_depth_ss),
  .app_ctrl_coarse_write_depth_wo(strg_ub_app_ctrl_coarse_write_depth_wo),
  .app_ctrl_input_port(strg_ub_app_ctrl_input_port),
  .app_ctrl_output_port(strg_ub_app_ctrl_output_port),
  .app_ctrl_prefill(strg_ub_app_ctrl_prefill),
  .app_ctrl_ranges(strg_ub_app_ctrl_ranges),
  .app_ctrl_read_depth(strg_ub_app_ctrl_read_depth),
  .app_ctrl_threshold(strg_ub_app_ctrl_threshold),
  .app_ctrl_write_depth_ss(strg_ub_app_ctrl_write_depth_ss),
  .app_ctrl_write_depth_wo(strg_ub_app_ctrl_write_depth_wo),
  .cen_to_strg(ub_cen_to_mem),
  .chain_idx_output(chain_idx_output),
  .clk(strg_ub_clk),
  .clk_en(clk_en),
  .data_from_strg(mem_data_out),
  .data_in(data_in),
  .data_out(ub_data_out),
  .data_to_strg(ub_data_to_mem),
  .enable_chain_output(enable_chain_output),
  .flush(flush),
  .input_addr_ctrl_address_gen_0_dimensionality(strg_ub_input_addr_ctrl_address_gen_0_dimensionality),
  .input_addr_ctrl_address_gen_0_ranges(strg_ub_input_addr_ctrl_address_gen_0_ranges),
  .input_addr_ctrl_address_gen_0_starting_addr(strg_ub_input_addr_ctrl_address_gen_0_starting_addr),
  .input_addr_ctrl_address_gen_0_strides(strg_ub_input_addr_ctrl_address_gen_0_strides),
  .input_addr_ctrl_address_gen_1_dimensionality(strg_ub_input_addr_ctrl_address_gen_1_dimensionality),
  .input_addr_ctrl_address_gen_1_ranges(strg_ub_input_addr_ctrl_address_gen_1_ranges),
  .input_addr_ctrl_address_gen_1_starting_addr(strg_ub_input_addr_ctrl_address_gen_1_starting_addr),
  .input_addr_ctrl_address_gen_1_strides(strg_ub_input_addr_ctrl_address_gen_1_strides),
  .mem_valid_data(mem_valid_data),
  .output_addr_ctrl_address_gen_0_dimensionality(strg_ub_output_addr_ctrl_address_gen_0_dimensionality),
  .output_addr_ctrl_address_gen_0_ranges(strg_ub_output_addr_ctrl_address_gen_0_ranges),
  .output_addr_ctrl_address_gen_0_starting_addr(strg_ub_output_addr_ctrl_address_gen_0_starting_addr),
  .output_addr_ctrl_address_gen_0_strides(strg_ub_output_addr_ctrl_address_gen_0_strides),
  .output_addr_ctrl_address_gen_1_dimensionality(strg_ub_output_addr_ctrl_address_gen_1_dimensionality),
  .output_addr_ctrl_address_gen_1_ranges(strg_ub_output_addr_ctrl_address_gen_1_ranges),
  .output_addr_ctrl_address_gen_1_starting_addr(strg_ub_output_addr_ctrl_address_gen_1_starting_addr),
  .output_addr_ctrl_address_gen_1_strides(strg_ub_output_addr_ctrl_address_gen_1_strides),
  .pre_fetch_0_input_latency(strg_ub_pre_fetch_0_input_latency),
  .pre_fetch_1_input_latency(strg_ub_pre_fetch_1_input_latency),
  .rate_matched(strg_ub_rate_matched),
  .ren_in(ren_in),
  .rst_n(rst_n),
  .sync_grp_sync_group(strg_ub_sync_grp_sync_group),
  .tb_0_dimensionality(strg_ub_tb_0_dimensionality),
  .tb_0_indices(strg_ub_tb_0_indices),
  .tb_0_range_inner(strg_ub_tb_0_range_inner),
  .tb_0_range_outer(strg_ub_tb_0_range_outer),
  .tb_0_starting_addr(strg_ub_tb_0_starting_addr),
  .tb_0_stride(strg_ub_tb_0_stride),
  .tb_0_tb_height(strg_ub_tb_0_tb_height),
  .tb_1_dimensionality(strg_ub_tb_1_dimensionality),
  .tb_1_indices(strg_ub_tb_1_indices),
  .tb_1_range_inner(strg_ub_tb_1_range_inner),
  .tb_1_range_outer(strg_ub_tb_1_range_outer),
  .tb_1_starting_addr(strg_ub_tb_1_starting_addr),
  .tb_1_stride(strg_ub_tb_1_stride),
  .tb_1_tb_height(strg_ub_tb_1_tb_height),
  .valid_out(ub_valid_out),
  .wen_in(wen_in),
  .wen_to_strg(ub_wen_to_mem)
);

strg_ram sram_ctrl (
  .addr_out(sram_addr_to_mem),
  .clk(sram_ctrl_clk),
  .clk_en(clk_en),
  .data_from_strg(mem_data_out),
  .data_in(sram_ctrl_data_in),
  .data_out(sram_data_out),
  .data_to_strg(sram_data_to_mem),
  .flush(flush),
  .rd_addr_in(sram_ctrl_rd_addr_in),
  .ready(sram_ready_out),
  .ren(sram_ctrl_ren),
  .ren_to_strg(sram_ren_to_mem),
  .rst_n(rst_n),
  .valid_out(sram_valid_out),
  .wen(sram_ctrl_wen),
  .wen_to_strg(sram_wen_to_mem),
  .wr_addr_in(sram_ctrl_wr_addr_in)
);

strg_fifo fifo_ctrl (
  .addr_out(fifo_addr_to_mem),
  .clk(fifo_ctrl_clk),
  .clk_en(clk_en),
  .data_from_strg(mem_data_out),
  .data_in(fifo_ctrl_data_in),
  .data_out(fifo_data_out),
  .data_to_strg(fifo_data_to_mem),
  .empty(fifo_empty),
  .fifo_depth(fifo_ctrl_fifo_depth),
  .flush(flush),
  .full(fifo_full),
  .pop(fifo_ctrl_pop),
  .push(fifo_ctrl_push),
  .ren_to_strg(fifo_ren_to_mem),
  .rst_n(rst_n),
  .valid_out(fifo_valid_out),
  .wen_to_strg(fifo_wen_to_mem)
);

TS1N16FFCLLSBLVTC512X32M4S_generator mem_0 (
  .chain_idx_input(chain_idx_input),
  .chain_idx_output(chain_idx_output),
  .clk(mem_0_clk),
  .clk_en(mem_0_clk_en),
  .enable_chain_input(enable_chain_input),
  .enable_chain_output(enable_chain_output),
  .flush(flush),
  .mem_addr_in_bank(mem_0_mem_addr_in_bank),
  .mem_cen_in_bank(mem_0_mem_cen_in_bank),
  .mem_data_in_bank(mem_0_mem_data_in_bank),
  .mem_data_out_bank(mem_0_mem_data_out_bank),
  .mem_wen_in_bank(mem_0_mem_wen_in_bank),
  .rtsel(2'h0),
  .valid_data(mem_0_valid_data),
  .wtsel(2'h0)
);

Chain chain (
  .chain_data_in(chain_data_in),
  .chain_data_out(chain_data_out),
  .chain_idx_output(chain_idx_output),
  .chain_valid_in(chain_valid_in),
  .chain_valid_out(chain_valid_out),
  .clk_en(clk_en),
  .curr_tile_data_out(data_out_tile),
  .curr_tile_valid_out(valid_out_tile),
  .data_out_tile(data_out),
  .enable_chain_output(enable_chain_output),
  .flush(flush),
  .valid_out_tile(valid_out)
);

endmodule   // LakeTop

module LakeTop_W (
  input logic [15:0] addr_in_0,
  input logic [15:0] addr_in_1,
  input logic [15:0] chain_data_in_0,
  input logic [15:0] chain_data_in_1,
  output logic [15:0] chain_data_out_0,
  output logic [15:0] chain_data_out_1,
  input logic chain_idx_input,
  input logic chain_idx_output,
  input logic [1:0] chain_valid_in,
  output logic [1:0] chain_valid_out,
  input logic clk,
  input logic clk_en,
  input logic [7:0] config_addr_in,
  input logic [31:0] config_data_in,
  output logic [31:0] config_data_out_0,
  output logic [31:0] config_data_out_1,
  input logic [1:0] config_en,
  input logic config_read,
  input logic config_write,
  input logic [15:0] data_in_0,
  input logic [15:0] data_in_1,
  output logic [15:0] data_out_0,
  output logic [15:0] data_out_1,
  output logic empty,
  input logic enable_chain_input,
  input logic enable_chain_output,
  input logic [15:0] fifo_ctrl_fifo_depth,
  input logic flush,
  output logic full,
  input logic [1:0] mode,
  input logic [1:0] ren_in,
  input logic rst_n,
  output logic sram_ready_out,
  input logic [6:0] strg_ub_agg_align_0_line_length,
  input logic [6:0] strg_ub_agg_align_1_line_length,
  input logic [3:0] strg_ub_agg_in_0_in_period,
  input logic [1:0] strg_ub_agg_in_0_in_sched_0,
  input logic [1:0] strg_ub_agg_in_0_in_sched_1,
  input logic [1:0] strg_ub_agg_in_0_in_sched_10,
  input logic [1:0] strg_ub_agg_in_0_in_sched_11,
  input logic [1:0] strg_ub_agg_in_0_in_sched_12,
  input logic [1:0] strg_ub_agg_in_0_in_sched_13,
  input logic [1:0] strg_ub_agg_in_0_in_sched_14,
  input logic [1:0] strg_ub_agg_in_0_in_sched_15,
  input logic [1:0] strg_ub_agg_in_0_in_sched_2,
  input logic [1:0] strg_ub_agg_in_0_in_sched_3,
  input logic [1:0] strg_ub_agg_in_0_in_sched_4,
  input logic [1:0] strg_ub_agg_in_0_in_sched_5,
  input logic [1:0] strg_ub_agg_in_0_in_sched_6,
  input logic [1:0] strg_ub_agg_in_0_in_sched_7,
  input logic [1:0] strg_ub_agg_in_0_in_sched_8,
  input logic [1:0] strg_ub_agg_in_0_in_sched_9,
  input logic [3:0] strg_ub_agg_in_0_out_period,
  input logic [1:0] strg_ub_agg_in_0_out_sched_0,
  input logic [1:0] strg_ub_agg_in_0_out_sched_1,
  input logic [1:0] strg_ub_agg_in_0_out_sched_10,
  input logic [1:0] strg_ub_agg_in_0_out_sched_11,
  input logic [1:0] strg_ub_agg_in_0_out_sched_12,
  input logic [1:0] strg_ub_agg_in_0_out_sched_13,
  input logic [1:0] strg_ub_agg_in_0_out_sched_14,
  input logic [1:0] strg_ub_agg_in_0_out_sched_15,
  input logic [1:0] strg_ub_agg_in_0_out_sched_2,
  input logic [1:0] strg_ub_agg_in_0_out_sched_3,
  input logic [1:0] strg_ub_agg_in_0_out_sched_4,
  input logic [1:0] strg_ub_agg_in_0_out_sched_5,
  input logic [1:0] strg_ub_agg_in_0_out_sched_6,
  input logic [1:0] strg_ub_agg_in_0_out_sched_7,
  input logic [1:0] strg_ub_agg_in_0_out_sched_8,
  input logic [1:0] strg_ub_agg_in_0_out_sched_9,
  input logic [3:0] strg_ub_agg_in_1_in_period,
  input logic [1:0] strg_ub_agg_in_1_in_sched_0,
  input logic [1:0] strg_ub_agg_in_1_in_sched_1,
  input logic [1:0] strg_ub_agg_in_1_in_sched_10,
  input logic [1:0] strg_ub_agg_in_1_in_sched_11,
  input logic [1:0] strg_ub_agg_in_1_in_sched_12,
  input logic [1:0] strg_ub_agg_in_1_in_sched_13,
  input logic [1:0] strg_ub_agg_in_1_in_sched_14,
  input logic [1:0] strg_ub_agg_in_1_in_sched_15,
  input logic [1:0] strg_ub_agg_in_1_in_sched_2,
  input logic [1:0] strg_ub_agg_in_1_in_sched_3,
  input logic [1:0] strg_ub_agg_in_1_in_sched_4,
  input logic [1:0] strg_ub_agg_in_1_in_sched_5,
  input logic [1:0] strg_ub_agg_in_1_in_sched_6,
  input logic [1:0] strg_ub_agg_in_1_in_sched_7,
  input logic [1:0] strg_ub_agg_in_1_in_sched_8,
  input logic [1:0] strg_ub_agg_in_1_in_sched_9,
  input logic [3:0] strg_ub_agg_in_1_out_period,
  input logic [1:0] strg_ub_agg_in_1_out_sched_0,
  input logic [1:0] strg_ub_agg_in_1_out_sched_1,
  input logic [1:0] strg_ub_agg_in_1_out_sched_10,
  input logic [1:0] strg_ub_agg_in_1_out_sched_11,
  input logic [1:0] strg_ub_agg_in_1_out_sched_12,
  input logic [1:0] strg_ub_agg_in_1_out_sched_13,
  input logic [1:0] strg_ub_agg_in_1_out_sched_14,
  input logic [1:0] strg_ub_agg_in_1_out_sched_15,
  input logic [1:0] strg_ub_agg_in_1_out_sched_2,
  input logic [1:0] strg_ub_agg_in_1_out_sched_3,
  input logic [1:0] strg_ub_agg_in_1_out_sched_4,
  input logic [1:0] strg_ub_agg_in_1_out_sched_5,
  input logic [1:0] strg_ub_agg_in_1_out_sched_6,
  input logic [1:0] strg_ub_agg_in_1_out_sched_7,
  input logic [1:0] strg_ub_agg_in_1_out_sched_8,
  input logic [1:0] strg_ub_agg_in_1_out_sched_9,
  input logic strg_ub_app_ctrl_coarse_input_port_0,
  input logic strg_ub_app_ctrl_coarse_input_port_1,
  input logic strg_ub_app_ctrl_coarse_output_port_0,
  input logic strg_ub_app_ctrl_coarse_output_port_1,
  input logic [1:0] strg_ub_app_ctrl_coarse_prefill,
  input logic [15:0] strg_ub_app_ctrl_coarse_read_depth_0,
  input logic [15:0] strg_ub_app_ctrl_coarse_read_depth_1,
  input logic [15:0] strg_ub_app_ctrl_coarse_write_depth_ss_0,
  input logic [15:0] strg_ub_app_ctrl_coarse_write_depth_ss_1,
  input logic [15:0] strg_ub_app_ctrl_coarse_write_depth_wo_0,
  input logic [15:0] strg_ub_app_ctrl_coarse_write_depth_wo_1,
  input logic strg_ub_app_ctrl_input_port_0,
  input logic strg_ub_app_ctrl_input_port_1,
  input logic strg_ub_app_ctrl_output_port_0,
  input logic strg_ub_app_ctrl_output_port_1,
  input logic [1:0] strg_ub_app_ctrl_prefill,
  input logic [15:0] strg_ub_app_ctrl_ranges_0,
  input logic [15:0] strg_ub_app_ctrl_ranges_1,
  input logic [15:0] strg_ub_app_ctrl_ranges_2,
  input logic [15:0] strg_ub_app_ctrl_ranges_3,
  input logic [15:0] strg_ub_app_ctrl_read_depth_0,
  input logic [15:0] strg_ub_app_ctrl_read_depth_1,
  input logic [15:0] strg_ub_app_ctrl_threshold_0,
  input logic [15:0] strg_ub_app_ctrl_threshold_1,
  input logic [15:0] strg_ub_app_ctrl_threshold_2,
  input logic [15:0] strg_ub_app_ctrl_threshold_3,
  input logic [15:0] strg_ub_app_ctrl_write_depth_ss_0,
  input logic [15:0] strg_ub_app_ctrl_write_depth_ss_1,
  input logic [15:0] strg_ub_app_ctrl_write_depth_wo_0,
  input logic [15:0] strg_ub_app_ctrl_write_depth_wo_1,
  input logic [3:0] strg_ub_input_addr_ctrl_address_gen_0_dimensionality,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_0,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_1,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_2,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_3,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_4,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_5,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_starting_addr,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_0,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_1,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_2,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_3,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_4,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_5,
  input logic [3:0] strg_ub_input_addr_ctrl_address_gen_1_dimensionality,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_0,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_1,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_2,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_3,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_4,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_5,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_starting_addr,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_0,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_1,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_2,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_3,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_4,
  input logic [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_5,
  input logic [3:0] strg_ub_output_addr_ctrl_address_gen_0_dimensionality,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_0,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_1,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_2,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_3,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_4,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_5,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_starting_addr,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_0,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_1,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_2,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_3,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_4,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_5,
  input logic [3:0] strg_ub_output_addr_ctrl_address_gen_1_dimensionality,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_0,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_1,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_2,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_3,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_4,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_5,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_starting_addr,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_0,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_1,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_2,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_3,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_4,
  input logic [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_5,
  input logic [3:0] strg_ub_pre_fetch_0_input_latency,
  input logic [3:0] strg_ub_pre_fetch_1_input_latency,
  input logic [1:0] strg_ub_rate_matched_0,
  input logic [1:0] strg_ub_rate_matched_1,
  input logic [1:0] strg_ub_sync_grp_sync_group_0,
  input logic [1:0] strg_ub_sync_grp_sync_group_1,
  input logic [1:0] strg_ub_tb_0_dimensionality,
  input logic [2:0] strg_ub_tb_0_indices_0,
  input logic [2:0] strg_ub_tb_0_indices_1,
  input logic [2:0] strg_ub_tb_0_indices_10,
  input logic [2:0] strg_ub_tb_0_indices_11,
  input logic [2:0] strg_ub_tb_0_indices_12,
  input logic [2:0] strg_ub_tb_0_indices_13,
  input logic [2:0] strg_ub_tb_0_indices_14,
  input logic [2:0] strg_ub_tb_0_indices_15,
  input logic [2:0] strg_ub_tb_0_indices_16,
  input logic [2:0] strg_ub_tb_0_indices_17,
  input logic [2:0] strg_ub_tb_0_indices_18,
  input logic [2:0] strg_ub_tb_0_indices_19,
  input logic [2:0] strg_ub_tb_0_indices_2,
  input logic [2:0] strg_ub_tb_0_indices_20,
  input logic [2:0] strg_ub_tb_0_indices_21,
  input logic [2:0] strg_ub_tb_0_indices_22,
  input logic [2:0] strg_ub_tb_0_indices_23,
  input logic [2:0] strg_ub_tb_0_indices_24,
  input logic [2:0] strg_ub_tb_0_indices_25,
  input logic [2:0] strg_ub_tb_0_indices_26,
  input logic [2:0] strg_ub_tb_0_indices_27,
  input logic [2:0] strg_ub_tb_0_indices_28,
  input logic [2:0] strg_ub_tb_0_indices_29,
  input logic [2:0] strg_ub_tb_0_indices_3,
  input logic [2:0] strg_ub_tb_0_indices_30,
  input logic [2:0] strg_ub_tb_0_indices_31,
  input logic [2:0] strg_ub_tb_0_indices_32,
  input logic [2:0] strg_ub_tb_0_indices_33,
  input logic [2:0] strg_ub_tb_0_indices_34,
  input logic [2:0] strg_ub_tb_0_indices_35,
  input logic [2:0] strg_ub_tb_0_indices_36,
  input logic [2:0] strg_ub_tb_0_indices_37,
  input logic [2:0] strg_ub_tb_0_indices_38,
  input logic [2:0] strg_ub_tb_0_indices_39,
  input logic [2:0] strg_ub_tb_0_indices_4,
  input logic [2:0] strg_ub_tb_0_indices_40,
  input logic [2:0] strg_ub_tb_0_indices_41,
  input logic [2:0] strg_ub_tb_0_indices_42,
  input logic [2:0] strg_ub_tb_0_indices_43,
  input logic [2:0] strg_ub_tb_0_indices_44,
  input logic [2:0] strg_ub_tb_0_indices_45,
  input logic [2:0] strg_ub_tb_0_indices_46,
  input logic [2:0] strg_ub_tb_0_indices_47,
  input logic [2:0] strg_ub_tb_0_indices_48,
  input logic [2:0] strg_ub_tb_0_indices_49,
  input logic [2:0] strg_ub_tb_0_indices_5,
  input logic [2:0] strg_ub_tb_0_indices_50,
  input logic [2:0] strg_ub_tb_0_indices_51,
  input logic [2:0] strg_ub_tb_0_indices_52,
  input logic [2:0] strg_ub_tb_0_indices_53,
  input logic [2:0] strg_ub_tb_0_indices_54,
  input logic [2:0] strg_ub_tb_0_indices_55,
  input logic [2:0] strg_ub_tb_0_indices_56,
  input logic [2:0] strg_ub_tb_0_indices_57,
  input logic [2:0] strg_ub_tb_0_indices_58,
  input logic [2:0] strg_ub_tb_0_indices_59,
  input logic [2:0] strg_ub_tb_0_indices_6,
  input logic [2:0] strg_ub_tb_0_indices_60,
  input logic [2:0] strg_ub_tb_0_indices_61,
  input logic [2:0] strg_ub_tb_0_indices_62,
  input logic [2:0] strg_ub_tb_0_indices_63,
  input logic [2:0] strg_ub_tb_0_indices_7,
  input logic [2:0] strg_ub_tb_0_indices_8,
  input logic [2:0] strg_ub_tb_0_indices_9,
  input logic [5:0] strg_ub_tb_0_range_inner,
  input logic [9:0] strg_ub_tb_0_range_outer,
  input logic [1:0] strg_ub_tb_0_starting_addr,
  input logic [3:0] strg_ub_tb_0_stride,
  input logic strg_ub_tb_0_tb_height,
  input logic [1:0] strg_ub_tb_1_dimensionality,
  input logic [2:0] strg_ub_tb_1_indices_0,
  input logic [2:0] strg_ub_tb_1_indices_1,
  input logic [2:0] strg_ub_tb_1_indices_10,
  input logic [2:0] strg_ub_tb_1_indices_11,
  input logic [2:0] strg_ub_tb_1_indices_12,
  input logic [2:0] strg_ub_tb_1_indices_13,
  input logic [2:0] strg_ub_tb_1_indices_14,
  input logic [2:0] strg_ub_tb_1_indices_15,
  input logic [2:0] strg_ub_tb_1_indices_16,
  input logic [2:0] strg_ub_tb_1_indices_17,
  input logic [2:0] strg_ub_tb_1_indices_18,
  input logic [2:0] strg_ub_tb_1_indices_19,
  input logic [2:0] strg_ub_tb_1_indices_2,
  input logic [2:0] strg_ub_tb_1_indices_20,
  input logic [2:0] strg_ub_tb_1_indices_21,
  input logic [2:0] strg_ub_tb_1_indices_22,
  input logic [2:0] strg_ub_tb_1_indices_23,
  input logic [2:0] strg_ub_tb_1_indices_24,
  input logic [2:0] strg_ub_tb_1_indices_25,
  input logic [2:0] strg_ub_tb_1_indices_26,
  input logic [2:0] strg_ub_tb_1_indices_27,
  input logic [2:0] strg_ub_tb_1_indices_28,
  input logic [2:0] strg_ub_tb_1_indices_29,
  input logic [2:0] strg_ub_tb_1_indices_3,
  input logic [2:0] strg_ub_tb_1_indices_30,
  input logic [2:0] strg_ub_tb_1_indices_31,
  input logic [2:0] strg_ub_tb_1_indices_32,
  input logic [2:0] strg_ub_tb_1_indices_33,
  input logic [2:0] strg_ub_tb_1_indices_34,
  input logic [2:0] strg_ub_tb_1_indices_35,
  input logic [2:0] strg_ub_tb_1_indices_36,
  input logic [2:0] strg_ub_tb_1_indices_37,
  input logic [2:0] strg_ub_tb_1_indices_38,
  input logic [2:0] strg_ub_tb_1_indices_39,
  input logic [2:0] strg_ub_tb_1_indices_4,
  input logic [2:0] strg_ub_tb_1_indices_40,
  input logic [2:0] strg_ub_tb_1_indices_41,
  input logic [2:0] strg_ub_tb_1_indices_42,
  input logic [2:0] strg_ub_tb_1_indices_43,
  input logic [2:0] strg_ub_tb_1_indices_44,
  input logic [2:0] strg_ub_tb_1_indices_45,
  input logic [2:0] strg_ub_tb_1_indices_46,
  input logic [2:0] strg_ub_tb_1_indices_47,
  input logic [2:0] strg_ub_tb_1_indices_48,
  input logic [2:0] strg_ub_tb_1_indices_49,
  input logic [2:0] strg_ub_tb_1_indices_5,
  input logic [2:0] strg_ub_tb_1_indices_50,
  input logic [2:0] strg_ub_tb_1_indices_51,
  input logic [2:0] strg_ub_tb_1_indices_52,
  input logic [2:0] strg_ub_tb_1_indices_53,
  input logic [2:0] strg_ub_tb_1_indices_54,
  input logic [2:0] strg_ub_tb_1_indices_55,
  input logic [2:0] strg_ub_tb_1_indices_56,
  input logic [2:0] strg_ub_tb_1_indices_57,
  input logic [2:0] strg_ub_tb_1_indices_58,
  input logic [2:0] strg_ub_tb_1_indices_59,
  input logic [2:0] strg_ub_tb_1_indices_6,
  input logic [2:0] strg_ub_tb_1_indices_60,
  input logic [2:0] strg_ub_tb_1_indices_61,
  input logic [2:0] strg_ub_tb_1_indices_62,
  input logic [2:0] strg_ub_tb_1_indices_63,
  input logic [2:0] strg_ub_tb_1_indices_7,
  input logic [2:0] strg_ub_tb_1_indices_8,
  input logic [2:0] strg_ub_tb_1_indices_9,
  input logic [5:0] strg_ub_tb_1_range_inner,
  input logic [9:0] strg_ub_tb_1_range_outer,
  input logic [1:0] strg_ub_tb_1_starting_addr,
  input logic [3:0] strg_ub_tb_1_stride,
  input logic strg_ub_tb_1_tb_height,
  input logic tile_en,
  output logic [1:0] valid_out,
  input logic [1:0] wen_in
);

logic [1:0][15:0] LakeTop_addr_in;
logic [1:0][15:0] LakeTop_chain_data_in;
logic [1:0][15:0] LakeTop_chain_data_out;
logic [1:0][31:0] LakeTop_config_data_out;
logic [1:0][15:0] LakeTop_data_in;
logic [1:0][15:0] LakeTop_data_out;
logic [15:0][1:0] LakeTop_strg_ub_agg_in_0_in_sched;
logic [15:0][1:0] LakeTop_strg_ub_agg_in_0_out_sched;
logic [15:0][1:0] LakeTop_strg_ub_agg_in_1_in_sched;
logic [15:0][1:0] LakeTop_strg_ub_agg_in_1_out_sched;
logic [1:0] LakeTop_strg_ub_app_ctrl_coarse_input_port;
logic [1:0] LakeTop_strg_ub_app_ctrl_coarse_output_port;
logic [1:0][15:0] LakeTop_strg_ub_app_ctrl_coarse_read_depth;
logic [1:0][15:0] LakeTop_strg_ub_app_ctrl_coarse_write_depth_ss;
logic [1:0][15:0] LakeTop_strg_ub_app_ctrl_coarse_write_depth_wo;
logic [1:0] LakeTop_strg_ub_app_ctrl_input_port;
logic [1:0] LakeTop_strg_ub_app_ctrl_output_port;
logic [3:0][15:0] LakeTop_strg_ub_app_ctrl_ranges;
logic [1:0][15:0] LakeTop_strg_ub_app_ctrl_read_depth;
logic [3:0][15:0] LakeTop_strg_ub_app_ctrl_threshold;
logic [1:0][15:0] LakeTop_strg_ub_app_ctrl_write_depth_ss;
logic [1:0][15:0] LakeTop_strg_ub_app_ctrl_write_depth_wo;
logic [5:0][15:0] LakeTop_strg_ub_input_addr_ctrl_address_gen_0_ranges;
logic [5:0][15:0] LakeTop_strg_ub_input_addr_ctrl_address_gen_0_strides;
logic [5:0][15:0] LakeTop_strg_ub_input_addr_ctrl_address_gen_1_ranges;
logic [5:0][15:0] LakeTop_strg_ub_input_addr_ctrl_address_gen_1_strides;
logic [5:0][15:0] LakeTop_strg_ub_output_addr_ctrl_address_gen_0_ranges;
logic [5:0][15:0] LakeTop_strg_ub_output_addr_ctrl_address_gen_0_strides;
logic [5:0][15:0] LakeTop_strg_ub_output_addr_ctrl_address_gen_1_ranges;
logic [5:0][15:0] LakeTop_strg_ub_output_addr_ctrl_address_gen_1_strides;
logic [1:0][1:0] LakeTop_strg_ub_rate_matched;
logic [1:0][1:0] LakeTop_strg_ub_sync_grp_sync_group;
logic [63:0][2:0] LakeTop_strg_ub_tb_0_indices;
logic [63:0][2:0] LakeTop_strg_ub_tb_1_indices;
assign LakeTop_addr_in[0] = addr_in_0;
assign LakeTop_addr_in[1] = addr_in_1;
assign LakeTop_chain_data_in[0] = chain_data_in_0;
assign LakeTop_chain_data_in[1] = chain_data_in_1;
assign chain_data_out_0 = LakeTop_chain_data_out[0];
assign chain_data_out_1 = LakeTop_chain_data_out[1];
assign config_data_out_0 = LakeTop_config_data_out[0];
assign config_data_out_1 = LakeTop_config_data_out[1];
assign LakeTop_data_in[0] = data_in_0;
assign LakeTop_data_in[1] = data_in_1;
assign data_out_0 = LakeTop_data_out[0];
assign data_out_1 = LakeTop_data_out[1];
assign LakeTop_strg_ub_agg_in_0_in_sched[0] = strg_ub_agg_in_0_in_sched_0;
assign LakeTop_strg_ub_agg_in_0_in_sched[1] = strg_ub_agg_in_0_in_sched_1;
assign LakeTop_strg_ub_agg_in_0_in_sched[2] = strg_ub_agg_in_0_in_sched_2;
assign LakeTop_strg_ub_agg_in_0_in_sched[3] = strg_ub_agg_in_0_in_sched_3;
assign LakeTop_strg_ub_agg_in_0_in_sched[4] = strg_ub_agg_in_0_in_sched_4;
assign LakeTop_strg_ub_agg_in_0_in_sched[5] = strg_ub_agg_in_0_in_sched_5;
assign LakeTop_strg_ub_agg_in_0_in_sched[6] = strg_ub_agg_in_0_in_sched_6;
assign LakeTop_strg_ub_agg_in_0_in_sched[7] = strg_ub_agg_in_0_in_sched_7;
assign LakeTop_strg_ub_agg_in_0_in_sched[8] = strg_ub_agg_in_0_in_sched_8;
assign LakeTop_strg_ub_agg_in_0_in_sched[9] = strg_ub_agg_in_0_in_sched_9;
assign LakeTop_strg_ub_agg_in_0_in_sched[10] = strg_ub_agg_in_0_in_sched_10;
assign LakeTop_strg_ub_agg_in_0_in_sched[11] = strg_ub_agg_in_0_in_sched_11;
assign LakeTop_strg_ub_agg_in_0_in_sched[12] = strg_ub_agg_in_0_in_sched_12;
assign LakeTop_strg_ub_agg_in_0_in_sched[13] = strg_ub_agg_in_0_in_sched_13;
assign LakeTop_strg_ub_agg_in_0_in_sched[14] = strg_ub_agg_in_0_in_sched_14;
assign LakeTop_strg_ub_agg_in_0_in_sched[15] = strg_ub_agg_in_0_in_sched_15;
assign LakeTop_strg_ub_agg_in_0_out_sched[0] = strg_ub_agg_in_0_out_sched_0;
assign LakeTop_strg_ub_agg_in_0_out_sched[1] = strg_ub_agg_in_0_out_sched_1;
assign LakeTop_strg_ub_agg_in_0_out_sched[2] = strg_ub_agg_in_0_out_sched_2;
assign LakeTop_strg_ub_agg_in_0_out_sched[3] = strg_ub_agg_in_0_out_sched_3;
assign LakeTop_strg_ub_agg_in_0_out_sched[4] = strg_ub_agg_in_0_out_sched_4;
assign LakeTop_strg_ub_agg_in_0_out_sched[5] = strg_ub_agg_in_0_out_sched_5;
assign LakeTop_strg_ub_agg_in_0_out_sched[6] = strg_ub_agg_in_0_out_sched_6;
assign LakeTop_strg_ub_agg_in_0_out_sched[7] = strg_ub_agg_in_0_out_sched_7;
assign LakeTop_strg_ub_agg_in_0_out_sched[8] = strg_ub_agg_in_0_out_sched_8;
assign LakeTop_strg_ub_agg_in_0_out_sched[9] = strg_ub_agg_in_0_out_sched_9;
assign LakeTop_strg_ub_agg_in_0_out_sched[10] = strg_ub_agg_in_0_out_sched_10;
assign LakeTop_strg_ub_agg_in_0_out_sched[11] = strg_ub_agg_in_0_out_sched_11;
assign LakeTop_strg_ub_agg_in_0_out_sched[12] = strg_ub_agg_in_0_out_sched_12;
assign LakeTop_strg_ub_agg_in_0_out_sched[13] = strg_ub_agg_in_0_out_sched_13;
assign LakeTop_strg_ub_agg_in_0_out_sched[14] = strg_ub_agg_in_0_out_sched_14;
assign LakeTop_strg_ub_agg_in_0_out_sched[15] = strg_ub_agg_in_0_out_sched_15;
assign LakeTop_strg_ub_agg_in_1_in_sched[0] = strg_ub_agg_in_1_in_sched_0;
assign LakeTop_strg_ub_agg_in_1_in_sched[1] = strg_ub_agg_in_1_in_sched_1;
assign LakeTop_strg_ub_agg_in_1_in_sched[2] = strg_ub_agg_in_1_in_sched_2;
assign LakeTop_strg_ub_agg_in_1_in_sched[3] = strg_ub_agg_in_1_in_sched_3;
assign LakeTop_strg_ub_agg_in_1_in_sched[4] = strg_ub_agg_in_1_in_sched_4;
assign LakeTop_strg_ub_agg_in_1_in_sched[5] = strg_ub_agg_in_1_in_sched_5;
assign LakeTop_strg_ub_agg_in_1_in_sched[6] = strg_ub_agg_in_1_in_sched_6;
assign LakeTop_strg_ub_agg_in_1_in_sched[7] = strg_ub_agg_in_1_in_sched_7;
assign LakeTop_strg_ub_agg_in_1_in_sched[8] = strg_ub_agg_in_1_in_sched_8;
assign LakeTop_strg_ub_agg_in_1_in_sched[9] = strg_ub_agg_in_1_in_sched_9;
assign LakeTop_strg_ub_agg_in_1_in_sched[10] = strg_ub_agg_in_1_in_sched_10;
assign LakeTop_strg_ub_agg_in_1_in_sched[11] = strg_ub_agg_in_1_in_sched_11;
assign LakeTop_strg_ub_agg_in_1_in_sched[12] = strg_ub_agg_in_1_in_sched_12;
assign LakeTop_strg_ub_agg_in_1_in_sched[13] = strg_ub_agg_in_1_in_sched_13;
assign LakeTop_strg_ub_agg_in_1_in_sched[14] = strg_ub_agg_in_1_in_sched_14;
assign LakeTop_strg_ub_agg_in_1_in_sched[15] = strg_ub_agg_in_1_in_sched_15;
assign LakeTop_strg_ub_agg_in_1_out_sched[0] = strg_ub_agg_in_1_out_sched_0;
assign LakeTop_strg_ub_agg_in_1_out_sched[1] = strg_ub_agg_in_1_out_sched_1;
assign LakeTop_strg_ub_agg_in_1_out_sched[2] = strg_ub_agg_in_1_out_sched_2;
assign LakeTop_strg_ub_agg_in_1_out_sched[3] = strg_ub_agg_in_1_out_sched_3;
assign LakeTop_strg_ub_agg_in_1_out_sched[4] = strg_ub_agg_in_1_out_sched_4;
assign LakeTop_strg_ub_agg_in_1_out_sched[5] = strg_ub_agg_in_1_out_sched_5;
assign LakeTop_strg_ub_agg_in_1_out_sched[6] = strg_ub_agg_in_1_out_sched_6;
assign LakeTop_strg_ub_agg_in_1_out_sched[7] = strg_ub_agg_in_1_out_sched_7;
assign LakeTop_strg_ub_agg_in_1_out_sched[8] = strg_ub_agg_in_1_out_sched_8;
assign LakeTop_strg_ub_agg_in_1_out_sched[9] = strg_ub_agg_in_1_out_sched_9;
assign LakeTop_strg_ub_agg_in_1_out_sched[10] = strg_ub_agg_in_1_out_sched_10;
assign LakeTop_strg_ub_agg_in_1_out_sched[11] = strg_ub_agg_in_1_out_sched_11;
assign LakeTop_strg_ub_agg_in_1_out_sched[12] = strg_ub_agg_in_1_out_sched_12;
assign LakeTop_strg_ub_agg_in_1_out_sched[13] = strg_ub_agg_in_1_out_sched_13;
assign LakeTop_strg_ub_agg_in_1_out_sched[14] = strg_ub_agg_in_1_out_sched_14;
assign LakeTop_strg_ub_agg_in_1_out_sched[15] = strg_ub_agg_in_1_out_sched_15;
assign LakeTop_strg_ub_app_ctrl_coarse_input_port[0] = strg_ub_app_ctrl_coarse_input_port_0;
assign LakeTop_strg_ub_app_ctrl_coarse_input_port[1] = strg_ub_app_ctrl_coarse_input_port_1;
assign LakeTop_strg_ub_app_ctrl_coarse_output_port[0] = strg_ub_app_ctrl_coarse_output_port_0;
assign LakeTop_strg_ub_app_ctrl_coarse_output_port[1] = strg_ub_app_ctrl_coarse_output_port_1;
assign LakeTop_strg_ub_app_ctrl_coarse_read_depth[0] = strg_ub_app_ctrl_coarse_read_depth_0;
assign LakeTop_strg_ub_app_ctrl_coarse_read_depth[1] = strg_ub_app_ctrl_coarse_read_depth_1;
assign LakeTop_strg_ub_app_ctrl_coarse_write_depth_ss[0] = strg_ub_app_ctrl_coarse_write_depth_ss_0;
assign LakeTop_strg_ub_app_ctrl_coarse_write_depth_ss[1] = strg_ub_app_ctrl_coarse_write_depth_ss_1;
assign LakeTop_strg_ub_app_ctrl_coarse_write_depth_wo[0] = strg_ub_app_ctrl_coarse_write_depth_wo_0;
assign LakeTop_strg_ub_app_ctrl_coarse_write_depth_wo[1] = strg_ub_app_ctrl_coarse_write_depth_wo_1;
assign LakeTop_strg_ub_app_ctrl_input_port[0] = strg_ub_app_ctrl_input_port_0;
assign LakeTop_strg_ub_app_ctrl_input_port[1] = strg_ub_app_ctrl_input_port_1;
assign LakeTop_strg_ub_app_ctrl_output_port[0] = strg_ub_app_ctrl_output_port_0;
assign LakeTop_strg_ub_app_ctrl_output_port[1] = strg_ub_app_ctrl_output_port_1;
assign LakeTop_strg_ub_app_ctrl_ranges[0] = strg_ub_app_ctrl_ranges_0;
assign LakeTop_strg_ub_app_ctrl_ranges[1] = strg_ub_app_ctrl_ranges_1;
assign LakeTop_strg_ub_app_ctrl_ranges[2] = strg_ub_app_ctrl_ranges_2;
assign LakeTop_strg_ub_app_ctrl_ranges[3] = strg_ub_app_ctrl_ranges_3;
assign LakeTop_strg_ub_app_ctrl_read_depth[0] = strg_ub_app_ctrl_read_depth_0;
assign LakeTop_strg_ub_app_ctrl_read_depth[1] = strg_ub_app_ctrl_read_depth_1;
assign LakeTop_strg_ub_app_ctrl_threshold[0] = strg_ub_app_ctrl_threshold_0;
assign LakeTop_strg_ub_app_ctrl_threshold[1] = strg_ub_app_ctrl_threshold_1;
assign LakeTop_strg_ub_app_ctrl_threshold[2] = strg_ub_app_ctrl_threshold_2;
assign LakeTop_strg_ub_app_ctrl_threshold[3] = strg_ub_app_ctrl_threshold_3;
assign LakeTop_strg_ub_app_ctrl_write_depth_ss[0] = strg_ub_app_ctrl_write_depth_ss_0;
assign LakeTop_strg_ub_app_ctrl_write_depth_ss[1] = strg_ub_app_ctrl_write_depth_ss_1;
assign LakeTop_strg_ub_app_ctrl_write_depth_wo[0] = strg_ub_app_ctrl_write_depth_wo_0;
assign LakeTop_strg_ub_app_ctrl_write_depth_wo[1] = strg_ub_app_ctrl_write_depth_wo_1;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_ranges[0] = strg_ub_input_addr_ctrl_address_gen_0_ranges_0;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_ranges[1] = strg_ub_input_addr_ctrl_address_gen_0_ranges_1;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_ranges[2] = strg_ub_input_addr_ctrl_address_gen_0_ranges_2;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_ranges[3] = strg_ub_input_addr_ctrl_address_gen_0_ranges_3;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_ranges[4] = strg_ub_input_addr_ctrl_address_gen_0_ranges_4;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_ranges[5] = strg_ub_input_addr_ctrl_address_gen_0_ranges_5;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_strides[0] = strg_ub_input_addr_ctrl_address_gen_0_strides_0;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_strides[1] = strg_ub_input_addr_ctrl_address_gen_0_strides_1;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_strides[2] = strg_ub_input_addr_ctrl_address_gen_0_strides_2;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_strides[3] = strg_ub_input_addr_ctrl_address_gen_0_strides_3;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_strides[4] = strg_ub_input_addr_ctrl_address_gen_0_strides_4;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_0_strides[5] = strg_ub_input_addr_ctrl_address_gen_0_strides_5;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_ranges[0] = strg_ub_input_addr_ctrl_address_gen_1_ranges_0;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_ranges[1] = strg_ub_input_addr_ctrl_address_gen_1_ranges_1;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_ranges[2] = strg_ub_input_addr_ctrl_address_gen_1_ranges_2;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_ranges[3] = strg_ub_input_addr_ctrl_address_gen_1_ranges_3;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_ranges[4] = strg_ub_input_addr_ctrl_address_gen_1_ranges_4;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_ranges[5] = strg_ub_input_addr_ctrl_address_gen_1_ranges_5;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_strides[0] = strg_ub_input_addr_ctrl_address_gen_1_strides_0;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_strides[1] = strg_ub_input_addr_ctrl_address_gen_1_strides_1;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_strides[2] = strg_ub_input_addr_ctrl_address_gen_1_strides_2;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_strides[3] = strg_ub_input_addr_ctrl_address_gen_1_strides_3;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_strides[4] = strg_ub_input_addr_ctrl_address_gen_1_strides_4;
assign LakeTop_strg_ub_input_addr_ctrl_address_gen_1_strides[5] = strg_ub_input_addr_ctrl_address_gen_1_strides_5;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_ranges[0] = strg_ub_output_addr_ctrl_address_gen_0_ranges_0;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_ranges[1] = strg_ub_output_addr_ctrl_address_gen_0_ranges_1;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_ranges[2] = strg_ub_output_addr_ctrl_address_gen_0_ranges_2;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_ranges[3] = strg_ub_output_addr_ctrl_address_gen_0_ranges_3;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_ranges[4] = strg_ub_output_addr_ctrl_address_gen_0_ranges_4;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_ranges[5] = strg_ub_output_addr_ctrl_address_gen_0_ranges_5;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_strides[0] = strg_ub_output_addr_ctrl_address_gen_0_strides_0;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_strides[1] = strg_ub_output_addr_ctrl_address_gen_0_strides_1;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_strides[2] = strg_ub_output_addr_ctrl_address_gen_0_strides_2;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_strides[3] = strg_ub_output_addr_ctrl_address_gen_0_strides_3;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_strides[4] = strg_ub_output_addr_ctrl_address_gen_0_strides_4;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_0_strides[5] = strg_ub_output_addr_ctrl_address_gen_0_strides_5;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_ranges[0] = strg_ub_output_addr_ctrl_address_gen_1_ranges_0;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_ranges[1] = strg_ub_output_addr_ctrl_address_gen_1_ranges_1;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_ranges[2] = strg_ub_output_addr_ctrl_address_gen_1_ranges_2;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_ranges[3] = strg_ub_output_addr_ctrl_address_gen_1_ranges_3;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_ranges[4] = strg_ub_output_addr_ctrl_address_gen_1_ranges_4;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_ranges[5] = strg_ub_output_addr_ctrl_address_gen_1_ranges_5;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_strides[0] = strg_ub_output_addr_ctrl_address_gen_1_strides_0;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_strides[1] = strg_ub_output_addr_ctrl_address_gen_1_strides_1;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_strides[2] = strg_ub_output_addr_ctrl_address_gen_1_strides_2;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_strides[3] = strg_ub_output_addr_ctrl_address_gen_1_strides_3;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_strides[4] = strg_ub_output_addr_ctrl_address_gen_1_strides_4;
assign LakeTop_strg_ub_output_addr_ctrl_address_gen_1_strides[5] = strg_ub_output_addr_ctrl_address_gen_1_strides_5;
assign LakeTop_strg_ub_rate_matched[0] = strg_ub_rate_matched_0;
assign LakeTop_strg_ub_rate_matched[1] = strg_ub_rate_matched_1;
assign LakeTop_strg_ub_sync_grp_sync_group[0] = strg_ub_sync_grp_sync_group_0;
assign LakeTop_strg_ub_sync_grp_sync_group[1] = strg_ub_sync_grp_sync_group_1;
assign LakeTop_strg_ub_tb_0_indices[0] = strg_ub_tb_0_indices_0;
assign LakeTop_strg_ub_tb_0_indices[1] = strg_ub_tb_0_indices_1;
assign LakeTop_strg_ub_tb_0_indices[2] = strg_ub_tb_0_indices_2;
assign LakeTop_strg_ub_tb_0_indices[3] = strg_ub_tb_0_indices_3;
assign LakeTop_strg_ub_tb_0_indices[4] = strg_ub_tb_0_indices_4;
assign LakeTop_strg_ub_tb_0_indices[5] = strg_ub_tb_0_indices_5;
assign LakeTop_strg_ub_tb_0_indices[6] = strg_ub_tb_0_indices_6;
assign LakeTop_strg_ub_tb_0_indices[7] = strg_ub_tb_0_indices_7;
assign LakeTop_strg_ub_tb_0_indices[8] = strg_ub_tb_0_indices_8;
assign LakeTop_strg_ub_tb_0_indices[9] = strg_ub_tb_0_indices_9;
assign LakeTop_strg_ub_tb_0_indices[10] = strg_ub_tb_0_indices_10;
assign LakeTop_strg_ub_tb_0_indices[11] = strg_ub_tb_0_indices_11;
assign LakeTop_strg_ub_tb_0_indices[12] = strg_ub_tb_0_indices_12;
assign LakeTop_strg_ub_tb_0_indices[13] = strg_ub_tb_0_indices_13;
assign LakeTop_strg_ub_tb_0_indices[14] = strg_ub_tb_0_indices_14;
assign LakeTop_strg_ub_tb_0_indices[15] = strg_ub_tb_0_indices_15;
assign LakeTop_strg_ub_tb_0_indices[16] = strg_ub_tb_0_indices_16;
assign LakeTop_strg_ub_tb_0_indices[17] = strg_ub_tb_0_indices_17;
assign LakeTop_strg_ub_tb_0_indices[18] = strg_ub_tb_0_indices_18;
assign LakeTop_strg_ub_tb_0_indices[19] = strg_ub_tb_0_indices_19;
assign LakeTop_strg_ub_tb_0_indices[20] = strg_ub_tb_0_indices_20;
assign LakeTop_strg_ub_tb_0_indices[21] = strg_ub_tb_0_indices_21;
assign LakeTop_strg_ub_tb_0_indices[22] = strg_ub_tb_0_indices_22;
assign LakeTop_strg_ub_tb_0_indices[23] = strg_ub_tb_0_indices_23;
assign LakeTop_strg_ub_tb_0_indices[24] = strg_ub_tb_0_indices_24;
assign LakeTop_strg_ub_tb_0_indices[25] = strg_ub_tb_0_indices_25;
assign LakeTop_strg_ub_tb_0_indices[26] = strg_ub_tb_0_indices_26;
assign LakeTop_strg_ub_tb_0_indices[27] = strg_ub_tb_0_indices_27;
assign LakeTop_strg_ub_tb_0_indices[28] = strg_ub_tb_0_indices_28;
assign LakeTop_strg_ub_tb_0_indices[29] = strg_ub_tb_0_indices_29;
assign LakeTop_strg_ub_tb_0_indices[30] = strg_ub_tb_0_indices_30;
assign LakeTop_strg_ub_tb_0_indices[31] = strg_ub_tb_0_indices_31;
assign LakeTop_strg_ub_tb_0_indices[32] = strg_ub_tb_0_indices_32;
assign LakeTop_strg_ub_tb_0_indices[33] = strg_ub_tb_0_indices_33;
assign LakeTop_strg_ub_tb_0_indices[34] = strg_ub_tb_0_indices_34;
assign LakeTop_strg_ub_tb_0_indices[35] = strg_ub_tb_0_indices_35;
assign LakeTop_strg_ub_tb_0_indices[36] = strg_ub_tb_0_indices_36;
assign LakeTop_strg_ub_tb_0_indices[37] = strg_ub_tb_0_indices_37;
assign LakeTop_strg_ub_tb_0_indices[38] = strg_ub_tb_0_indices_38;
assign LakeTop_strg_ub_tb_0_indices[39] = strg_ub_tb_0_indices_39;
assign LakeTop_strg_ub_tb_0_indices[40] = strg_ub_tb_0_indices_40;
assign LakeTop_strg_ub_tb_0_indices[41] = strg_ub_tb_0_indices_41;
assign LakeTop_strg_ub_tb_0_indices[42] = strg_ub_tb_0_indices_42;
assign LakeTop_strg_ub_tb_0_indices[43] = strg_ub_tb_0_indices_43;
assign LakeTop_strg_ub_tb_0_indices[44] = strg_ub_tb_0_indices_44;
assign LakeTop_strg_ub_tb_0_indices[45] = strg_ub_tb_0_indices_45;
assign LakeTop_strg_ub_tb_0_indices[46] = strg_ub_tb_0_indices_46;
assign LakeTop_strg_ub_tb_0_indices[47] = strg_ub_tb_0_indices_47;
assign LakeTop_strg_ub_tb_0_indices[48] = strg_ub_tb_0_indices_48;
assign LakeTop_strg_ub_tb_0_indices[49] = strg_ub_tb_0_indices_49;
assign LakeTop_strg_ub_tb_0_indices[50] = strg_ub_tb_0_indices_50;
assign LakeTop_strg_ub_tb_0_indices[51] = strg_ub_tb_0_indices_51;
assign LakeTop_strg_ub_tb_0_indices[52] = strg_ub_tb_0_indices_52;
assign LakeTop_strg_ub_tb_0_indices[53] = strg_ub_tb_0_indices_53;
assign LakeTop_strg_ub_tb_0_indices[54] = strg_ub_tb_0_indices_54;
assign LakeTop_strg_ub_tb_0_indices[55] = strg_ub_tb_0_indices_55;
assign LakeTop_strg_ub_tb_0_indices[56] = strg_ub_tb_0_indices_56;
assign LakeTop_strg_ub_tb_0_indices[57] = strg_ub_tb_0_indices_57;
assign LakeTop_strg_ub_tb_0_indices[58] = strg_ub_tb_0_indices_58;
assign LakeTop_strg_ub_tb_0_indices[59] = strg_ub_tb_0_indices_59;
assign LakeTop_strg_ub_tb_0_indices[60] = strg_ub_tb_0_indices_60;
assign LakeTop_strg_ub_tb_0_indices[61] = strg_ub_tb_0_indices_61;
assign LakeTop_strg_ub_tb_0_indices[62] = strg_ub_tb_0_indices_62;
assign LakeTop_strg_ub_tb_0_indices[63] = strg_ub_tb_0_indices_63;
assign LakeTop_strg_ub_tb_1_indices[0] = strg_ub_tb_1_indices_0;
assign LakeTop_strg_ub_tb_1_indices[1] = strg_ub_tb_1_indices_1;
assign LakeTop_strg_ub_tb_1_indices[2] = strg_ub_tb_1_indices_2;
assign LakeTop_strg_ub_tb_1_indices[3] = strg_ub_tb_1_indices_3;
assign LakeTop_strg_ub_tb_1_indices[4] = strg_ub_tb_1_indices_4;
assign LakeTop_strg_ub_tb_1_indices[5] = strg_ub_tb_1_indices_5;
assign LakeTop_strg_ub_tb_1_indices[6] = strg_ub_tb_1_indices_6;
assign LakeTop_strg_ub_tb_1_indices[7] = strg_ub_tb_1_indices_7;
assign LakeTop_strg_ub_tb_1_indices[8] = strg_ub_tb_1_indices_8;
assign LakeTop_strg_ub_tb_1_indices[9] = strg_ub_tb_1_indices_9;
assign LakeTop_strg_ub_tb_1_indices[10] = strg_ub_tb_1_indices_10;
assign LakeTop_strg_ub_tb_1_indices[11] = strg_ub_tb_1_indices_11;
assign LakeTop_strg_ub_tb_1_indices[12] = strg_ub_tb_1_indices_12;
assign LakeTop_strg_ub_tb_1_indices[13] = strg_ub_tb_1_indices_13;
assign LakeTop_strg_ub_tb_1_indices[14] = strg_ub_tb_1_indices_14;
assign LakeTop_strg_ub_tb_1_indices[15] = strg_ub_tb_1_indices_15;
assign LakeTop_strg_ub_tb_1_indices[16] = strg_ub_tb_1_indices_16;
assign LakeTop_strg_ub_tb_1_indices[17] = strg_ub_tb_1_indices_17;
assign LakeTop_strg_ub_tb_1_indices[18] = strg_ub_tb_1_indices_18;
assign LakeTop_strg_ub_tb_1_indices[19] = strg_ub_tb_1_indices_19;
assign LakeTop_strg_ub_tb_1_indices[20] = strg_ub_tb_1_indices_20;
assign LakeTop_strg_ub_tb_1_indices[21] = strg_ub_tb_1_indices_21;
assign LakeTop_strg_ub_tb_1_indices[22] = strg_ub_tb_1_indices_22;
assign LakeTop_strg_ub_tb_1_indices[23] = strg_ub_tb_1_indices_23;
assign LakeTop_strg_ub_tb_1_indices[24] = strg_ub_tb_1_indices_24;
assign LakeTop_strg_ub_tb_1_indices[25] = strg_ub_tb_1_indices_25;
assign LakeTop_strg_ub_tb_1_indices[26] = strg_ub_tb_1_indices_26;
assign LakeTop_strg_ub_tb_1_indices[27] = strg_ub_tb_1_indices_27;
assign LakeTop_strg_ub_tb_1_indices[28] = strg_ub_tb_1_indices_28;
assign LakeTop_strg_ub_tb_1_indices[29] = strg_ub_tb_1_indices_29;
assign LakeTop_strg_ub_tb_1_indices[30] = strg_ub_tb_1_indices_30;
assign LakeTop_strg_ub_tb_1_indices[31] = strg_ub_tb_1_indices_31;
assign LakeTop_strg_ub_tb_1_indices[32] = strg_ub_tb_1_indices_32;
assign LakeTop_strg_ub_tb_1_indices[33] = strg_ub_tb_1_indices_33;
assign LakeTop_strg_ub_tb_1_indices[34] = strg_ub_tb_1_indices_34;
assign LakeTop_strg_ub_tb_1_indices[35] = strg_ub_tb_1_indices_35;
assign LakeTop_strg_ub_tb_1_indices[36] = strg_ub_tb_1_indices_36;
assign LakeTop_strg_ub_tb_1_indices[37] = strg_ub_tb_1_indices_37;
assign LakeTop_strg_ub_tb_1_indices[38] = strg_ub_tb_1_indices_38;
assign LakeTop_strg_ub_tb_1_indices[39] = strg_ub_tb_1_indices_39;
assign LakeTop_strg_ub_tb_1_indices[40] = strg_ub_tb_1_indices_40;
assign LakeTop_strg_ub_tb_1_indices[41] = strg_ub_tb_1_indices_41;
assign LakeTop_strg_ub_tb_1_indices[42] = strg_ub_tb_1_indices_42;
assign LakeTop_strg_ub_tb_1_indices[43] = strg_ub_tb_1_indices_43;
assign LakeTop_strg_ub_tb_1_indices[44] = strg_ub_tb_1_indices_44;
assign LakeTop_strg_ub_tb_1_indices[45] = strg_ub_tb_1_indices_45;
assign LakeTop_strg_ub_tb_1_indices[46] = strg_ub_tb_1_indices_46;
assign LakeTop_strg_ub_tb_1_indices[47] = strg_ub_tb_1_indices_47;
assign LakeTop_strg_ub_tb_1_indices[48] = strg_ub_tb_1_indices_48;
assign LakeTop_strg_ub_tb_1_indices[49] = strg_ub_tb_1_indices_49;
assign LakeTop_strg_ub_tb_1_indices[50] = strg_ub_tb_1_indices_50;
assign LakeTop_strg_ub_tb_1_indices[51] = strg_ub_tb_1_indices_51;
assign LakeTop_strg_ub_tb_1_indices[52] = strg_ub_tb_1_indices_52;
assign LakeTop_strg_ub_tb_1_indices[53] = strg_ub_tb_1_indices_53;
assign LakeTop_strg_ub_tb_1_indices[54] = strg_ub_tb_1_indices_54;
assign LakeTop_strg_ub_tb_1_indices[55] = strg_ub_tb_1_indices_55;
assign LakeTop_strg_ub_tb_1_indices[56] = strg_ub_tb_1_indices_56;
assign LakeTop_strg_ub_tb_1_indices[57] = strg_ub_tb_1_indices_57;
assign LakeTop_strg_ub_tb_1_indices[58] = strg_ub_tb_1_indices_58;
assign LakeTop_strg_ub_tb_1_indices[59] = strg_ub_tb_1_indices_59;
assign LakeTop_strg_ub_tb_1_indices[60] = strg_ub_tb_1_indices_60;
assign LakeTop_strg_ub_tb_1_indices[61] = strg_ub_tb_1_indices_61;
assign LakeTop_strg_ub_tb_1_indices[62] = strg_ub_tb_1_indices_62;
assign LakeTop_strg_ub_tb_1_indices[63] = strg_ub_tb_1_indices_63;
LakeTop LakeTop (
  .addr_in(LakeTop_addr_in),
  .chain_data_in(LakeTop_chain_data_in),
  .chain_data_out(LakeTop_chain_data_out),
  .chain_idx_input(chain_idx_input),
  .chain_idx_output(chain_idx_output),
  .chain_valid_in(chain_valid_in),
  .chain_valid_out(chain_valid_out),
  .clk(clk),
  .clk_en(clk_en),
  .config_addr_in(config_addr_in),
  .config_data_in(config_data_in),
  .config_data_out(LakeTop_config_data_out),
  .config_en(config_en),
  .config_read(config_read),
  .config_write(config_write),
  .data_in(LakeTop_data_in),
  .data_out(LakeTop_data_out),
  .empty(empty),
  .enable_chain_input(enable_chain_input),
  .enable_chain_output(enable_chain_output),
  .fifo_ctrl_fifo_depth(fifo_ctrl_fifo_depth),
  .flush(flush),
  .full(full),
  .mode(mode),
  .ren_in(ren_in),
  .rst_n(rst_n),
  .sram_ready_out(sram_ready_out),
  .strg_ub_agg_align_0_line_length(strg_ub_agg_align_0_line_length),
  .strg_ub_agg_align_1_line_length(strg_ub_agg_align_1_line_length),
  .strg_ub_agg_in_0_in_period(strg_ub_agg_in_0_in_period),
  .strg_ub_agg_in_0_in_sched(LakeTop_strg_ub_agg_in_0_in_sched),
  .strg_ub_agg_in_0_out_period(strg_ub_agg_in_0_out_period),
  .strg_ub_agg_in_0_out_sched(LakeTop_strg_ub_agg_in_0_out_sched),
  .strg_ub_agg_in_1_in_period(strg_ub_agg_in_1_in_period),
  .strg_ub_agg_in_1_in_sched(LakeTop_strg_ub_agg_in_1_in_sched),
  .strg_ub_agg_in_1_out_period(strg_ub_agg_in_1_out_period),
  .strg_ub_agg_in_1_out_sched(LakeTop_strg_ub_agg_in_1_out_sched),
  .strg_ub_app_ctrl_coarse_input_port(LakeTop_strg_ub_app_ctrl_coarse_input_port),
  .strg_ub_app_ctrl_coarse_output_port(LakeTop_strg_ub_app_ctrl_coarse_output_port),
  .strg_ub_app_ctrl_coarse_prefill(strg_ub_app_ctrl_coarse_prefill),
  .strg_ub_app_ctrl_coarse_read_depth(LakeTop_strg_ub_app_ctrl_coarse_read_depth),
  .strg_ub_app_ctrl_coarse_write_depth_ss(LakeTop_strg_ub_app_ctrl_coarse_write_depth_ss),
  .strg_ub_app_ctrl_coarse_write_depth_wo(LakeTop_strg_ub_app_ctrl_coarse_write_depth_wo),
  .strg_ub_app_ctrl_input_port(LakeTop_strg_ub_app_ctrl_input_port),
  .strg_ub_app_ctrl_output_port(LakeTop_strg_ub_app_ctrl_output_port),
  .strg_ub_app_ctrl_prefill(strg_ub_app_ctrl_prefill),
  .strg_ub_app_ctrl_ranges(LakeTop_strg_ub_app_ctrl_ranges),
  .strg_ub_app_ctrl_read_depth(LakeTop_strg_ub_app_ctrl_read_depth),
  .strg_ub_app_ctrl_threshold(LakeTop_strg_ub_app_ctrl_threshold),
  .strg_ub_app_ctrl_write_depth_ss(LakeTop_strg_ub_app_ctrl_write_depth_ss),
  .strg_ub_app_ctrl_write_depth_wo(LakeTop_strg_ub_app_ctrl_write_depth_wo),
  .strg_ub_input_addr_ctrl_address_gen_0_dimensionality(strg_ub_input_addr_ctrl_address_gen_0_dimensionality),
  .strg_ub_input_addr_ctrl_address_gen_0_ranges(LakeTop_strg_ub_input_addr_ctrl_address_gen_0_ranges),
  .strg_ub_input_addr_ctrl_address_gen_0_starting_addr(strg_ub_input_addr_ctrl_address_gen_0_starting_addr),
  .strg_ub_input_addr_ctrl_address_gen_0_strides(LakeTop_strg_ub_input_addr_ctrl_address_gen_0_strides),
  .strg_ub_input_addr_ctrl_address_gen_1_dimensionality(strg_ub_input_addr_ctrl_address_gen_1_dimensionality),
  .strg_ub_input_addr_ctrl_address_gen_1_ranges(LakeTop_strg_ub_input_addr_ctrl_address_gen_1_ranges),
  .strg_ub_input_addr_ctrl_address_gen_1_starting_addr(strg_ub_input_addr_ctrl_address_gen_1_starting_addr),
  .strg_ub_input_addr_ctrl_address_gen_1_strides(LakeTop_strg_ub_input_addr_ctrl_address_gen_1_strides),
  .strg_ub_output_addr_ctrl_address_gen_0_dimensionality(strg_ub_output_addr_ctrl_address_gen_0_dimensionality),
  .strg_ub_output_addr_ctrl_address_gen_0_ranges(LakeTop_strg_ub_output_addr_ctrl_address_gen_0_ranges),
  .strg_ub_output_addr_ctrl_address_gen_0_starting_addr(strg_ub_output_addr_ctrl_address_gen_0_starting_addr),
  .strg_ub_output_addr_ctrl_address_gen_0_strides(LakeTop_strg_ub_output_addr_ctrl_address_gen_0_strides),
  .strg_ub_output_addr_ctrl_address_gen_1_dimensionality(strg_ub_output_addr_ctrl_address_gen_1_dimensionality),
  .strg_ub_output_addr_ctrl_address_gen_1_ranges(LakeTop_strg_ub_output_addr_ctrl_address_gen_1_ranges),
  .strg_ub_output_addr_ctrl_address_gen_1_starting_addr(strg_ub_output_addr_ctrl_address_gen_1_starting_addr),
  .strg_ub_output_addr_ctrl_address_gen_1_strides(LakeTop_strg_ub_output_addr_ctrl_address_gen_1_strides),
  .strg_ub_pre_fetch_0_input_latency(strg_ub_pre_fetch_0_input_latency),
  .strg_ub_pre_fetch_1_input_latency(strg_ub_pre_fetch_1_input_latency),
  .strg_ub_rate_matched(LakeTop_strg_ub_rate_matched),
  .strg_ub_sync_grp_sync_group(LakeTop_strg_ub_sync_grp_sync_group),
  .strg_ub_tb_0_dimensionality(strg_ub_tb_0_dimensionality),
  .strg_ub_tb_0_indices(LakeTop_strg_ub_tb_0_indices),
  .strg_ub_tb_0_range_inner(strg_ub_tb_0_range_inner),
  .strg_ub_tb_0_range_outer(strg_ub_tb_0_range_outer),
  .strg_ub_tb_0_starting_addr(strg_ub_tb_0_starting_addr),
  .strg_ub_tb_0_stride(strg_ub_tb_0_stride),
  .strg_ub_tb_0_tb_height(strg_ub_tb_0_tb_height),
  .strg_ub_tb_1_dimensionality(strg_ub_tb_1_dimensionality),
  .strg_ub_tb_1_indices(LakeTop_strg_ub_tb_1_indices),
  .strg_ub_tb_1_range_inner(strg_ub_tb_1_range_inner),
  .strg_ub_tb_1_range_outer(strg_ub_tb_1_range_outer),
  .strg_ub_tb_1_starting_addr(strg_ub_tb_1_starting_addr),
  .strg_ub_tb_1_stride(strg_ub_tb_1_stride),
  .strg_ub_tb_1_tb_height(strg_ub_tb_1_tb_height),
  .tile_en(tile_en),
  .valid_out(valid_out),
  .wen_in(wen_in)
);

endmodule   // LakeTop_W

module TS1N16FFCLLSBLVTC512X32M4S_generator (
  input logic chain_idx_input,
  input logic chain_idx_output,
  input logic clk,
  input logic clk_en,
  input logic enable_chain_input,
  input logic enable_chain_output,
  input logic flush,
  input logic [9:0] mem_addr_in_bank,
  input logic mem_cen_in_bank,
  input logic [3:0] [15:0] mem_data_in_bank,
  output logic [0:0][3:0] [15:0] mem_data_out_bank,
  input logic mem_wen_in_bank,
  input logic [1:0] rtsel,
  output logic valid_data,
  input logic [1:0] wtsel
);

logic chain_idx_tile;
logic [8:0] mem_addr_to_sram;
logic mem_cen_in_bank_chain;
logic mem_wen_in_bank_chain;
always_comb begin
  chain_idx_tile = mem_addr_in_bank[9];
end
always_comb begin
  mem_addr_to_sram = mem_addr_in_bank[8:0];
end
always_comb begin
  if (~enable_chain_input) begin
    mem_wen_in_bank_chain = mem_wen_in_bank;
  end
  else if (mem_wen_in_bank) begin
    if (chain_idx_input == chain_idx_tile) begin
      mem_wen_in_bank_chain = mem_wen_in_bank;
    end
    else mem_wen_in_bank_chain = 1'h0;
  end
  else mem_wen_in_bank_chain = 1'h0;
end
always_comb begin
  if (mem_wen_in_bank) begin
    if (enable_chain_input) begin
      if (chain_idx_input == chain_idx_tile) begin
        mem_cen_in_bank_chain = mem_cen_in_bank;
      end
      else mem_cen_in_bank_chain = 1'h0;
    end
    else mem_cen_in_bank_chain = mem_cen_in_bank;
  end
  else if (enable_chain_output) begin
    if (chain_idx_output == chain_idx_tile) begin
      mem_cen_in_bank_chain = mem_cen_in_bank;
    end
    else mem_cen_in_bank_chain = 1'h0;
  end
  else mem_cen_in_bank_chain = mem_cen_in_bank;
end

always_ff @(posedge clk) begin
  if (clk_en) begin
    if (~mem_wen_in_bank) begin
      if (enable_chain_output) begin
        if (chain_idx_output == chain_idx_tile) begin
          valid_data <= mem_cen_in_bank;
        end
        else valid_data <= 1'h0;
      end
      else valid_data <= mem_cen_in_bank;
    end
    else valid_data <= 1'h0;
  end
end
sram_stub mem_0 (
  .addr(mem_addr_to_sram),
  .cen(mem_cen_in_bank_chain),
  .clk(clk),
  .clk_en(clk_en),
  .data_in(mem_data_in_bank),
  .data_out(mem_data_out_bank),
  .flush(flush),
  .wen(mem_wen_in_bank_chain)
);

endmodule   // TS1N16FFCLLSBLVTC512X32M4S_generator

module addr_gen_6 (
  output logic [15:0] addr_out,
  input logic clk,
  input logic clk_en,
  input logic [3:0] dimensionality,
  input logic flush,
  input logic [5:0] [15:0] ranges,
  input logic rst_n,
  input logic [15:0] starting_addr,
  input logic step,
  input logic [5:0] [15:0] strides
);

logic [15:0] calc_addr;
logic [5:0][15:0] current_loc;
logic [5:0][15:0] dim_counter;
logic [15:0] strt_addr;
logic [5:0] update;
assign strt_addr = starting_addr;
assign addr_out = calc_addr;
assign update[0] = 1'h1;
assign update[1] = (dim_counter[0] == (ranges[0] - 16'h1)) & update[0];
assign update[2] = (dim_counter[1] == (ranges[1] - 16'h1)) & update[1];
assign update[3] = (dim_counter[2] == (ranges[2] - 16'h1)) & update[2];
assign update[4] = (dim_counter[3] == (ranges[3] - 16'h1)) & update[3];
assign update[5] = (dim_counter[4] == (ranges[4] - 16'h1)) & update[4];
always_comb begin
  calc_addr = ((4'h0 < dimensionality) ? current_loc[0]: 16'h0) + ((4'h1 < dimensionality) ?
      current_loc[1]: 16'h0) + ((4'h2 < dimensionality) ? current_loc[2]: 16'h0) +
      ((4'h3 < dimensionality) ? current_loc[3]: 16'h0) + ((4'h4 < dimensionality) ?
      current_loc[4]: 16'h0) + ((4'h5 < dimensionality) ? current_loc[5]: 16'h0) +
      strt_addr;
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    dim_counter <= 96'h0;
  end
  else if (clk_en) begin
    if (clk_en) begin
      if (flush) begin
        for (int unsigned i = 0; i < 6; i += 1) begin
            dim_counter[3'(i)] <= 16'h0;
          end
      end
      else if (step) begin
        for (int unsigned i = 0; i < 6; i += 1) begin
            if (update[3'(i)] & (4'(i) < dimensionality)) begin
              if (dim_counter[3'(i)] == (ranges[3'(i)] - 16'h1)) begin
                dim_counter[3'(i)] <= 16'h0;
              end
              else dim_counter[3'(i)] <= dim_counter[3'(i)] + 16'h1;
            end
          end
      end
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    current_loc <= 96'h0;
  end
  else if (clk_en) begin
    if (clk_en) begin
      if (flush) begin
        for (int unsigned i = 0; i < 6; i += 1) begin
            current_loc[3'(i)] <= 16'h0;
          end
      end
      else if (step) begin
        for (int unsigned i = 0; i < 6; i += 1) begin
            if (update[3'(i)] & (4'(i) < dimensionality)) begin
              if (dim_counter[3'(i)] == (ranges[3'(i)] - 16'h1)) begin
                current_loc[3'(i)] <= 16'h0;
              end
              else current_loc[3'(i)] <= current_loc[3'(i)] + strides[3'(i)];
            end
          end
      end
    end
  end
end
endmodule   // addr_gen_6

module agg_aligner (
  output logic align,
  input logic clk,
  input logic clk_en,
  input logic flush,
  input logic [15:0] in_dat,
  input logic in_valid,
  input logic [6:0] line_length,
  output logic [15:0] out_dat,
  output logic out_valid,
  input logic rst_n
);

logic [6:0] cnt;

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    cnt <= 7'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      cnt <= 7'h0;
    end
    else if (in_valid) begin
      if ((line_length - 7'h1) == cnt) begin
        cnt <= 7'h0;
      end
      else cnt <= cnt + 7'h1;
    end
  end
end
always_comb begin
  align = in_valid & ((line_length - 7'h1) == cnt);
end
assign out_dat = in_dat;
assign out_valid = in_valid;
endmodule   // agg_aligner

module aggregation_buffer (
  input logic align,
  input logic clk,
  input logic clk_en,
  input logic [15:0] data_in,
  output logic [63:0] data_out,
  output logic [15:0] data_out_chop_0,
  output logic [15:0] data_out_chop_1,
  output logic [15:0] data_out_chop_2,
  output logic [15:0] data_out_chop_3,
  input logic flush,
  input logic [3:0] in_period,
  input logic [15:0] [1:0] in_sched,
  input logic [3:0] out_period,
  input logic [15:0] [1:0] out_sched,
  input logic rst_n,
  input logic valid_in,
  output logic valid_out
);

logic agg_0_align;
logic agg_0_next_full;
logic agg_0_valid_in;
logic agg_0_valid_out;
logic agg_1_align;
logic agg_1_next_full;
logic agg_1_valid_in;
logic agg_1_valid_out;
logic agg_2_align;
logic agg_2_next_full;
logic agg_2_valid_in;
logic agg_2_valid_out;
logic agg_3_align;
logic agg_3_next_full;
logic agg_3_valid_in;
logic agg_3_valid_out;
logic [3:0][63:0] aggs_out;
logic [3:0][15:0] aggs_sep_0;
logic [3:0][15:0] aggs_sep_1;
logic [3:0][15:0] aggs_sep_2;
logic [3:0][15:0] aggs_sep_3;
logic [3:0] align_demux;
logic [3:0] in_sched_ptr;
logic [3:0] next_full;
logic [3:0] out_sched_ptr;
logic [3:0] valid_demux;
logic [3:0] valid_out_mux;
assign data_out_chop_0 = data_out[15:0];
assign data_out_chop_1 = data_out[31:16];
assign data_out_chop_2 = data_out[47:32];
assign data_out_chop_3 = data_out[63:48];
assign agg_0_valid_in = valid_demux[0];
assign valid_out_mux[0] = agg_0_valid_out;
assign next_full[0] = agg_0_next_full;
assign agg_0_align = align_demux[0];
assign aggs_out[0] = {aggs_sep_0[3], aggs_sep_0[2], aggs_sep_0[1], aggs_sep_0[0]};
assign agg_1_valid_in = valid_demux[1];
assign valid_out_mux[1] = agg_1_valid_out;
assign next_full[1] = agg_1_next_full;
assign agg_1_align = align_demux[1];
assign aggs_out[1] = {aggs_sep_1[3], aggs_sep_1[2], aggs_sep_1[1], aggs_sep_1[0]};
assign agg_2_valid_in = valid_demux[2];
assign valid_out_mux[2] = agg_2_valid_out;
assign next_full[2] = agg_2_next_full;
assign agg_2_align = align_demux[2];
assign aggs_out[2] = {aggs_sep_2[3], aggs_sep_2[2], aggs_sep_2[1], aggs_sep_2[0]};
assign agg_3_valid_in = valid_demux[3];
assign valid_out_mux[3] = agg_3_valid_out;
assign next_full[3] = agg_3_next_full;
assign agg_3_align = align_demux[3];
assign aggs_out[3] = {aggs_sep_3[3], aggs_sep_3[2], aggs_sep_3[1], aggs_sep_3[0]};

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    in_sched_ptr <= 4'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      in_sched_ptr <= 4'h0;
    end
    else if (next_full[in_sched[in_sched_ptr]]) begin
      in_sched_ptr <= ((in_period - 4'h1) == in_sched_ptr) ? 4'h0: in_sched_ptr + 4'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    out_sched_ptr <= 4'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      out_sched_ptr <= 4'h0;
    end
    else if (valid_out) begin
      out_sched_ptr <= ((out_period - 4'h1) == out_sched_ptr) ? 4'h0: out_sched_ptr + 4'h1;
    end
  end
end
always_comb begin
  valid_demux = 4'h0;
  valid_demux[in_sched[in_sched_ptr]] = valid_in;
end
always_comb begin
  align_demux = 4'h0;
  align_demux[in_sched[in_sched_ptr]] = align;
end
always_comb begin
  valid_out = valid_out_mux[out_sched[out_sched_ptr]];
end
always_comb begin
  data_out = aggs_out[out_sched[out_sched_ptr]];
end
aggregator agg_0 (
  .agg_out(aggs_sep_0),
  .align(agg_0_align),
  .clk(clk),
  .clk_en(clk_en),
  .flush(flush),
  .in_pixels(data_in),
  .next_full(agg_0_next_full),
  .rst_n(rst_n),
  .valid_in(agg_0_valid_in),
  .valid_out(agg_0_valid_out)
);

aggregator agg_1 (
  .agg_out(aggs_sep_1),
  .align(agg_1_align),
  .clk(clk),
  .clk_en(clk_en),
  .flush(flush),
  .in_pixels(data_in),
  .next_full(agg_1_next_full),
  .rst_n(rst_n),
  .valid_in(agg_1_valid_in),
  .valid_out(agg_1_valid_out)
);

aggregator agg_2 (
  .agg_out(aggs_sep_2),
  .align(agg_2_align),
  .clk(clk),
  .clk_en(clk_en),
  .flush(flush),
  .in_pixels(data_in),
  .next_full(agg_2_next_full),
  .rst_n(rst_n),
  .valid_in(agg_2_valid_in),
  .valid_out(agg_2_valid_out)
);

aggregator agg_3 (
  .agg_out(aggs_sep_3),
  .align(agg_3_align),
  .clk(clk),
  .clk_en(clk_en),
  .flush(flush),
  .in_pixels(data_in),
  .next_full(agg_3_next_full),
  .rst_n(rst_n),
  .valid_in(agg_3_valid_in),
  .valid_out(agg_3_valid_out)
);

endmodule   // aggregation_buffer

module aggregator (
  output logic [3:0] [15:0] agg_out,
  input logic align,
  input logic clk,
  input logic clk_en,
  input logic flush,
  input logic [15:0] in_pixels,
  output logic next_full,
  input logic rst_n,
  input logic valid_in,
  output logic valid_out
);

logic [3:0][15:0] shift_reg;
logic [1:0] word_count;

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    valid_out <= 1'h0;
    word_count <= 2'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      valid_out <= 1'h0;
      word_count <= 2'h0;
    end
    else if (valid_in) begin
      if ((2'h3 == word_count) | align) begin
        valid_out <= 1'h1;
        word_count <= 2'h0;
      end
      else begin
        valid_out <= 1'h0;
        word_count <= word_count + 2'h1;
      end
    end
    else valid_out <= 1'h0;
  end
end
always_comb begin
  next_full = (valid_in & (2'h3 == word_count)) | align;
end

always_ff @(posedge clk) begin
  if (clk_en) begin
    if (valid_in) begin
      shift_reg[word_count] <= in_pixels;
    end
  end
end
always_comb begin
  agg_out = shift_reg;
end
endmodule   // aggregator

module app_ctrl (
  input logic clk,
  input logic clk_en,
  input logic flush,
  input logic [1:0] input_port,
  input logic [1:0] output_port,
  input logic [1:0] prefill,
  input logic [3:0] [15:0] ranges,
  input logic [1:0] [15:0] read_depth,
  input logic [1:0] ren_in,
  output logic [1:0] ren_out,
  input logic [1:0] ren_update,
  input logic rst_n,
  input logic [1:0] tb_valid,
  input logic [3:0] [15:0] threshold,
  output logic [1:0] valid_out_data,
  output logic [1:0] valid_out_stencil,
  input logic [1:0] wen_in,
  output logic [1:0] wen_out,
  input logic [1:0] [15:0] write_depth_ss,
  input logic [1:0] [15:0] write_depth_wo
);

logic [3:0][15:0] dim_counter;
logic [1:0][15:0] read_count;
logic [1:0] read_done;
logic [1:0] read_done_ff;
logic [1:0] read_on;
logic [3:0] update;
logic [1:0] wr_delay_state_n;
logic [1:0][15:0] write_count;
logic [1:0][15:0] write_depth;
logic [1:0] write_done;
logic [1:0] write_done_ff;
assign update[0] = 1'h1;
assign update[1] = (dim_counter[0] == (ranges[0] - 16'h1)) & update[0];
assign update[2] = (dim_counter[1] == (ranges[1] - 16'h1)) & update[1];
assign update[3] = (dim_counter[2] == (ranges[2] - 16'h1)) & update[2];

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    dim_counter[0] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      dim_counter[0] <= 16'h0;
    end
    else if (ren_in[0] & ren_update[0]) begin
      if (update[0]) begin
        if (dim_counter[0] == (ranges[0] - 16'h1)) begin
          dim_counter[0] <= 16'h0;
        end
        else dim_counter[0] <= dim_counter[0] + 16'h1;
      end
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    dim_counter[1] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      dim_counter[1] <= 16'h0;
    end
    else if (ren_in[0] & ren_update[0]) begin
      if (update[1]) begin
        if (dim_counter[1] == (ranges[1] - 16'h1)) begin
          dim_counter[1] <= 16'h0;
        end
        else dim_counter[1] <= dim_counter[1] + 16'h1;
      end
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    dim_counter[2] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      dim_counter[2] <= 16'h0;
    end
    else if (ren_in[0] & ren_update[0]) begin
      if (update[2]) begin
        if (dim_counter[2] == (ranges[2] - 16'h1)) begin
          dim_counter[2] <= 16'h0;
        end
        else dim_counter[2] <= dim_counter[2] + 16'h1;
      end
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    dim_counter[3] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      dim_counter[3] <= 16'h0;
    end
    else if (ren_in[0] & ren_update[0]) begin
      if (update[3]) begin
        if (dim_counter[3] == (ranges[3] - 16'h1)) begin
          dim_counter[3] <= 16'h0;
        end
        else dim_counter[3] <= dim_counter[3] + 16'h1;
      end
    end
  end
end
assign valid_out_stencil[0] = &{dim_counter[0] >= threshold[0], dim_counter[1] >= threshold[1], dim_counter[2]
    >= threshold[2], dim_counter[3] >= threshold[3]};
assign valid_out_stencil[1] = &{dim_counter[0] >= threshold[0], dim_counter[1] >= threshold[1], dim_counter[2]
    >= threshold[2], dim_counter[3] >= threshold[3]};
assign valid_out_data = tb_valid & valid_out_stencil;
assign write_depth[0] = wr_delay_state_n[0] ? write_depth_ss[0]: write_depth_wo[0];
assign write_depth[1] = wr_delay_state_n[1] ? write_depth_ss[1]: write_depth_wo[1];
always_comb begin
  read_done[0] = (ren_update[0] & ren_in[0] & (read_count[0] == (read_depth[0] - 16'h1))) |
      read_done_ff[0] | ((~prefill[0]) & (~wr_delay_state_n[0]));
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    read_done_ff[0] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      read_done_ff[0] <= 1'h0;
    end
    else if (write_done[input_port[0]] & read_done[0]) begin
      read_done_ff[0] <= 1'h0;
    end
    else if (read_done[0]) begin
      read_done_ff[0] <= 1'h1;
    end
  end
end
always_comb begin
  read_done[1] = (ren_update[1] & ren_in[1] & (read_count[1] == (read_depth[1] - 16'h1))) |
      read_done_ff[1] | ((~prefill[1]) & (~wr_delay_state_n[1]));
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    read_done_ff[1] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      read_done_ff[1] <= 1'h0;
    end
    else if (write_done[input_port[1]] & read_done[1]) begin
      read_done_ff[1] <= 1'h0;
    end
    else if (read_done[1]) begin
      read_done_ff[1] <= 1'h1;
    end
  end
end
always_comb begin
  write_done[0] = (wen_in[0] & (write_count[0] == (write_depth[0] - 16'h1))) | write_done_ff[0];
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    write_done_ff[0] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      write_done_ff[0] <= 1'h0;
    end
    else if (write_done[0] & read_done[output_port[0]]) begin
      write_done_ff[0] <= 1'h0;
    end
    else if (write_done[0]) begin
      write_done_ff[0] <= 1'h1;
    end
  end
end
always_comb begin
  write_done[1] = (wen_in[1] & (write_count[1] == (write_depth[1] - 16'h1))) | write_done_ff[1];
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    write_done_ff[1] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      write_done_ff[1] <= 1'h0;
    end
    else if (write_done[1] & read_done[output_port[1]]) begin
      write_done_ff[1] <= 1'h0;
    end
    else if (write_done[1]) begin
      write_done_ff[1] <= 1'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    write_count[0] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      write_count[0] <= 16'h0;
    end
    else if (write_done[0] & read_done[output_port[0]]) begin
      write_count[0] <= 16'h0;
    end
    else if (wen_in[0] & (~write_done_ff[0])) begin
      write_count[0] <= write_count[0] + 16'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    write_count[1] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      write_count[1] <= 16'h0;
    end
    else if (write_done[1] & read_done[output_port[1]]) begin
      write_count[1] <= 16'h0;
    end
    else if (wen_in[1] & (~write_done_ff[1])) begin
      write_count[1] <= write_count[1] + 16'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    read_count[0] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      read_count[0] <= 16'h0;
    end
    else if (write_done[input_port[0]] & read_done[0]) begin
      read_count[0] <= 16'h0;
    end
    else if (ren_in[0] & ren_update[0]) begin
      read_count[0] <= read_count[0] + 16'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    read_count[1] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      read_count[1] <= 16'h0;
    end
    else if (write_done[input_port[1]] & read_done[1]) begin
      read_count[1] <= 16'h0;
    end
    else if (ren_in[1] & ren_update[1]) begin
      read_count[1] <= read_count[1] + 16'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    wr_delay_state_n[0] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      wr_delay_state_n[0] <= 1'h0;
    end
    else if (write_done[input_port[0]]) begin
      wr_delay_state_n[0] <= 1'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    wr_delay_state_n[1] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      wr_delay_state_n[1] <= 1'h0;
    end
    else if (write_done[input_port[1]]) begin
      wr_delay_state_n[1] <= 1'h1;
    end
  end
end
assign read_on[0] = |read_depth[0];
assign read_on[1] = |read_depth[1];
assign ren_out = (wr_delay_state_n | prefill) & (~read_done_ff) & ren_in & read_on;
assign wen_out = (~write_done_ff) & wen_in;
endmodule   // app_ctrl

module app_ctrl_unq0 (
  input logic clk,
  input logic clk_en,
  input logic flush,
  input logic [1:0] input_port,
  input logic [1:0] output_port,
  input logic [1:0] prefill,
  input logic [1:0] [15:0] read_depth,
  input logic [1:0] ren_in,
  output logic [1:0] ren_out,
  input logic [1:0] ren_update,
  input logic rst_n,
  input logic [1:0] tb_valid,
  output logic [1:0] valid_out_data,
  output logic [1:0] valid_out_stencil,
  input logic [1:0] wen_in,
  output logic [1:0] wen_out,
  input logic [1:0] [15:0] write_depth_ss,
  input logic [1:0] [15:0] write_depth_wo
);

logic [1:0][15:0] read_count;
logic [1:0] read_done;
logic [1:0] read_done_ff;
logic [1:0] read_on;
logic [1:0] wr_delay_state_n;
logic [1:0][15:0] write_count;
logic [1:0][15:0] write_depth;
logic [1:0] write_done;
logic [1:0] write_done_ff;
assign valid_out_stencil = tb_valid;
assign valid_out_data = tb_valid & valid_out_stencil;
assign write_depth[0] = wr_delay_state_n[0] ? write_depth_ss[0]: write_depth_wo[0];
assign write_depth[1] = wr_delay_state_n[1] ? write_depth_ss[1]: write_depth_wo[1];
always_comb begin
  read_done[0] = (ren_update[0] & ren_in[0] & (read_count[0] == (read_depth[0] - 16'h1))) |
      read_done_ff[0] | ((~prefill[0]) & (~wr_delay_state_n[0]));
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    read_done_ff[0] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      read_done_ff[0] <= 1'h0;
    end
    else if (write_done[input_port[0]] & read_done[0]) begin
      read_done_ff[0] <= 1'h0;
    end
    else if (read_done[0]) begin
      read_done_ff[0] <= 1'h1;
    end
  end
end
always_comb begin
  read_done[1] = (ren_update[1] & ren_in[1] & (read_count[1] == (read_depth[1] - 16'h1))) |
      read_done_ff[1] | ((~prefill[1]) & (~wr_delay_state_n[1]));
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    read_done_ff[1] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      read_done_ff[1] <= 1'h0;
    end
    else if (write_done[input_port[1]] & read_done[1]) begin
      read_done_ff[1] <= 1'h0;
    end
    else if (read_done[1]) begin
      read_done_ff[1] <= 1'h1;
    end
  end
end
always_comb begin
  write_done[0] = (wen_in[0] & (write_count[0] == (write_depth[0] - 16'h1))) | write_done_ff[0];
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    write_done_ff[0] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      write_done_ff[0] <= 1'h0;
    end
    else if (write_done[0] & read_done[output_port[0]]) begin
      write_done_ff[0] <= 1'h0;
    end
    else if (write_done[0]) begin
      write_done_ff[0] <= 1'h1;
    end
  end
end
always_comb begin
  write_done[1] = (wen_in[1] & (write_count[1] == (write_depth[1] - 16'h1))) | write_done_ff[1];
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    write_done_ff[1] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      write_done_ff[1] <= 1'h0;
    end
    else if (write_done[1] & read_done[output_port[1]]) begin
      write_done_ff[1] <= 1'h0;
    end
    else if (write_done[1]) begin
      write_done_ff[1] <= 1'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    write_count[0] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      write_count[0] <= 16'h0;
    end
    else if (write_done[0] & read_done[output_port[0]]) begin
      write_count[0] <= 16'h0;
    end
    else if (wen_in[0] & (~write_done_ff[0])) begin
      write_count[0] <= write_count[0] + 16'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    write_count[1] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      write_count[1] <= 16'h0;
    end
    else if (write_done[1] & read_done[output_port[1]]) begin
      write_count[1] <= 16'h0;
    end
    else if (wen_in[1] & (~write_done_ff[1])) begin
      write_count[1] <= write_count[1] + 16'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    read_count[0] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      read_count[0] <= 16'h0;
    end
    else if (write_done[input_port[0]] & read_done[0]) begin
      read_count[0] <= 16'h0;
    end
    else if (ren_in[0] & ren_update[0]) begin
      read_count[0] <= read_count[0] + 16'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    read_count[1] <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      read_count[1] <= 16'h0;
    end
    else if (write_done[input_port[1]] & read_done[1]) begin
      read_count[1] <= 16'h0;
    end
    else if (ren_in[1] & ren_update[1]) begin
      read_count[1] <= read_count[1] + 16'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    wr_delay_state_n[0] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      wr_delay_state_n[0] <= 1'h0;
    end
    else if (write_done[input_port[0]]) begin
      wr_delay_state_n[0] <= 1'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    wr_delay_state_n[1] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      wr_delay_state_n[1] <= 1'h0;
    end
    else if (write_done[input_port[1]]) begin
      wr_delay_state_n[1] <= 1'h1;
    end
  end
end
assign read_on[0] = |read_depth[0];
assign read_on[1] = |read_depth[1];
assign ren_out = (wr_delay_state_n | prefill) & (~read_done_ff) & ren_in & read_on;
assign wen_out = (~write_done_ff) & wen_in;
endmodule   // app_ctrl_unq0

module demux_reads (
  input logic clk,
  input logic clk_en,
  input logic [0:0][3:0] [15:0] data_in,
  output logic [1:0][3:0] [15:0] data_out,
  input logic flush,
  input logic mem_valid_data,
  output logic [1:0] mem_valid_data_out,
  input logic [0:0] [1:0] port_in,
  input logic rst_n,
  input logic valid_in,
  output logic [1:0] valid_out
);

logic [1:0] done;
always_comb begin
  for (int unsigned i = 0; i < 2; i += 1) begin
      valid_out[1'(i)] = 1'h0;
      data_out[1'(i)] = 64'h0;
      done[1'(i)] = 1'h0;
      mem_valid_data_out[1'(i)] = 1'h0;
      if (~done[1'(i)]) begin
        if (valid_in & port_in[0][1'(i)]) begin
          valid_out[1'(i)] = 1'h1;
          data_out[1'(i)] = data_in[0];
          mem_valid_data_out[1'(i)] = mem_valid_data;
          done[1'(i)] = 1'h1;
        end
      end
    end
end
endmodule   // demux_reads

module input_addr_ctrl (
  output logic [0:0][0:0] [9:0] addr_out,
  input logic [3:0] address_gen_0_dimensionality,
  input logic [5:0] [15:0] address_gen_0_ranges,
  input logic [15:0] address_gen_0_starting_addr,
  input logic [5:0] [15:0] address_gen_0_strides,
  input logic [3:0] address_gen_1_dimensionality,
  input logic [5:0] [15:0] address_gen_1_ranges,
  input logic [15:0] address_gen_1_starting_addr,
  input logic [5:0] [15:0] address_gen_1_strides,
  input logic clk,
  input logic clk_en,
  input logic [1:0][3:0] [15:0] data_in,
  output logic [0:0][0:0][3:0] [15:0] data_out,
  input logic flush,
  output logic [1:0] port_out,
  input logic rst_n,
  input logic [1:0] valid_in,
  input logic [1:0] wen_en,
  output logic [0:0] wen_to_sram
);

logic [15:0] address_gen_0_addr_out;
logic address_gen_0_step;
logic [15:0] address_gen_1_addr_out;
logic address_gen_1_step;
logic counter;
logic [1:0][3:0][15:0] data_in_saved;
logic [0:0] done;
logic [1:0][0:0][9:0] local_addrs;
logic [1:0][0:0][9:0] local_addrs_saved;
logic [0:0][1:0] port_out_exp;
logic [1:0] wen_en_saved;
logic [1:0][0:0] wen_full;
logic [1:0] wen_reduced;
logic [1:0] wen_reduced_saved;
assign port_out[0] = |port_out_exp[0][0];
assign port_out[1] = |port_out_exp[0][1];
assign wen_reduced[0] = |wen_full[0];
assign wen_reduced[1] = |wen_full[1];
always_comb begin
  wen_full[0] = 1'h0;
  if (valid_in[0]) begin
    wen_full[0] = 1'h1;
  end
  wen_full[1] = 1'h0;
  if (valid_in[1]) begin
    wen_full[1] = 1'h1;
  end
end
always_comb begin
  wen_to_sram = 1'h0;
  done = 1'h0;
  port_out_exp[0] = 2'h0;
  data_out[0][0] = 64'h0;
  addr_out[0][0] = 10'h0;
  if (~done) begin
    if (wen_reduced[0]) begin
      done = 1'h1;
      wen_to_sram = wen_en[0];
      port_out_exp[0][0] = 1'h1;
      data_out[0][0] = data_in[0];
      addr_out[0][0] = local_addrs[0][0][9:0];
    end
    else if (wen_reduced_saved[counter + 1'h1]) begin
      done = 1'h1;
      wen_to_sram = wen_en_saved[counter + 1'h1];
      port_out_exp[0][counter + 1'h1] = 1'h1;
      data_out[0][0] = data_in_saved[counter + 1'h1];
      addr_out[0][0] = local_addrs_saved[counter + 1'h1][0][9:0];
    end
  end
end
assign address_gen_0_step = valid_in[0];
assign address_gen_1_step = valid_in[1];
always_comb begin
  local_addrs[0][0] = address_gen_0_addr_out[9:0];
  local_addrs[1][0] = address_gen_1_addr_out[9:0];
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    counter <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      counter <= 1'h0;
    end
    else if (counter == 1'h0) begin
      counter <= 1'h0;
    end
    else if (|wen_en_saved) begin
      counter <= counter + 1'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    wen_en_saved <= 2'h0;
    wen_reduced_saved <= 2'h0;
    data_in_saved <= 128'h0;
    local_addrs_saved <= 20'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      wen_en_saved <= 2'h0;
      wen_reduced_saved <= 2'h0;
      data_in_saved <= 128'h0;
      local_addrs_saved <= 20'h0;
    end
    else if (|wen_en) begin
      wen_en_saved <= wen_en;
      wen_reduced_saved <= wen_reduced;
      data_in_saved <= data_in;
      local_addrs_saved <= local_addrs;
    end
    else if (counter == 1'h0) begin
      wen_en_saved <= 2'h0;
      wen_reduced_saved <= 2'h0;
      data_in_saved <= 128'h0;
      local_addrs_saved <= 20'h0;
    end
  end
end
addr_gen_6 address_gen_0 (
  .addr_out(address_gen_0_addr_out),
  .clk(clk),
  .clk_en(clk_en),
  .dimensionality(address_gen_0_dimensionality),
  .flush(flush),
  .ranges(address_gen_0_ranges),
  .rst_n(rst_n),
  .starting_addr(address_gen_0_starting_addr),
  .step(address_gen_0_step),
  .strides(address_gen_0_strides)
);

addr_gen_6 address_gen_1 (
  .addr_out(address_gen_1_addr_out),
  .clk(clk),
  .clk_en(clk_en),
  .dimensionality(address_gen_1_dimensionality),
  .flush(flush),
  .ranges(address_gen_1_ranges),
  .rst_n(rst_n),
  .starting_addr(address_gen_1_starting_addr),
  .step(address_gen_1_step),
  .strides(address_gen_1_strides)
);

endmodule   // input_addr_ctrl

module output_addr_ctrl (
  output logic [1:0] [9:0] addr_out,
  input logic [3:0] address_gen_0_dimensionality,
  input logic [5:0] [15:0] address_gen_0_ranges,
  input logic [15:0] address_gen_0_starting_addr,
  input logic [5:0] [15:0] address_gen_0_strides,
  input logic [3:0] address_gen_1_dimensionality,
  input logic [5:0] [15:0] address_gen_1_ranges,
  input logic [15:0] address_gen_1_starting_addr,
  input logic [5:0] [15:0] address_gen_1_strides,
  input logic clk,
  input logic clk_en,
  input logic flush,
  output logic [0:0] [1:0] ren,
  input logic rst_n,
  input logic [1:0] step_in,
  input logic [1:0] valid_in
);

logic [15:0] address_gen_0_addr_out;
logic address_gen_0_step;
logic [15:0] address_gen_1_addr_out;
logic address_gen_1_step;
logic [1:0][9:0] local_addrs;
always_comb begin
  ren = 2'h0;
  for (int unsigned i = 0; i < 2; i += 1) begin
      if (valid_in[1'(i)]) begin
        ren[0][1'(i)] = 1'h1;
      end
    end
end
always_comb begin
  addr_out = 20'h0;
  for (int unsigned i = 0; i < 2; i += 1) begin
      addr_out[1'(i)] = local_addrs[1'(i)][9:0];
    end
end
assign address_gen_0_step = step_in[0] & valid_in[0];
assign local_addrs[0] = address_gen_0_addr_out[9:0];
assign address_gen_1_step = step_in[1] & valid_in[1];
assign local_addrs[1] = address_gen_1_addr_out[9:0];
addr_gen_6 address_gen_0 (
  .addr_out(address_gen_0_addr_out),
  .clk(clk),
  .clk_en(clk_en),
  .dimensionality(address_gen_0_dimensionality),
  .flush(flush),
  .ranges(address_gen_0_ranges),
  .rst_n(rst_n),
  .starting_addr(address_gen_0_starting_addr),
  .step(address_gen_0_step),
  .strides(address_gen_0_strides)
);

addr_gen_6 address_gen_1 (
  .addr_out(address_gen_1_addr_out),
  .clk(clk),
  .clk_en(clk_en),
  .dimensionality(address_gen_1_dimensionality),
  .flush(flush),
  .ranges(address_gen_1_ranges),
  .rst_n(rst_n),
  .starting_addr(address_gen_1_starting_addr),
  .step(address_gen_1_step),
  .strides(address_gen_1_strides)
);

endmodule   // output_addr_ctrl

module prefetcher (
  input logic clk,
  input logic clk_en,
  input logic [3:0] [15:0] data_in,
  output logic [3:0] [15:0] data_out,
  input logic flush,
  input logic [3:0] input_latency,
  input logic mem_valid_data,
  output logic mem_valid_data_out,
  output logic prefetch_step,
  input logic rst_n,
  input logic tba_rdy_in,
  output logic valid_out,
  input logic valid_read
);

logic [3:0] cnt;
logic fifo_empty;
logic fifo_full;

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    cnt <= 4'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      cnt <= 4'h0;
    end
    else if (valid_read & (~tba_rdy_in) & (~fifo_full)) begin
      cnt <= cnt + 4'h1;
    end
    else if ((~valid_read) & tba_rdy_in & (~fifo_empty)) begin
      cnt <= cnt - 4'h1;
    end
  end
end
always_comb begin
  prefetch_step = (cnt + input_latency) < 4'h8;
end
reg_fifo_d8_w4 #(
  .data_width(16'h10)) fifo (
  .clk(clk),
  .clk_en(clk_en),
  .data_in(data_in),
  .data_out(data_out),
  .empty(fifo_empty),
  .flush(flush),
  .full(fifo_full),
  .mem_valid_data(mem_valid_data),
  .mem_valid_data_out(mem_valid_data_out),
  .pop(tba_rdy_in),
  .push(valid_read),
  .rst_n(rst_n),
  .valid(valid_out)
);

endmodule   // prefetcher

module reg_fifo_d4_w1 #(parameter data_width = 16'h10)
(
  input logic clk,
  input logic clk_en,
  input logic [0:0] [data_width-1:0] data_in,
  output logic [0:0] [data_width-1:0] data_out,
  output logic empty,
  input logic flush,
  output logic full,
  input logic mem_valid_data,
  output logic mem_valid_data_out,
  input logic [2:0] num_load,
  input logic [3:0][0:0] [data_width-1:0] parallel_in,
  input logic parallel_load,
  output logic [3:0][0:0] [data_width-1:0] parallel_out,
  input logic parallel_read,
  input logic pop,
  input logic push,
  output logic [1:0] rd_ptr_out,
  input logic rst_n,
  output logic valid
);

logic [3:0] mvd_array;
logic [2:0] num_items;
logic passthru;
logic [1:0] rd_ptr;
logic read;
logic [3:0][0:0][data_width-1:0] reg_array;
logic [1:0] wr_ptr;
logic write;
assign rd_ptr_out = rd_ptr;
assign full = num_items == 3'h4;
assign empty = num_items == 3'h0;
assign read = pop & (~passthru) & (~empty);
assign passthru = pop & push & empty;

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    num_items <= 3'h0;
  end
  else if (flush) begin
    num_items <= 3'h0;
  end
  else if (clk_en) begin
    if (parallel_load) begin
      if (num_load == 3'h0) begin
        num_items <= 3'(push);
      end
      else num_items <= num_load;
    end
    else if (parallel_read) begin
      if (push) begin
        num_items <= 3'h1;
      end
      else num_items <= 3'h0;
    end
    else if (write & (~read)) begin
      num_items <= num_items + 3'h1;
    end
    else if ((~write) & read) begin
      num_items <= num_items - 3'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    reg_array <= 64'h0;
    mvd_array <= 4'h0;
  end
  else if (flush) begin
    reg_array <= 64'h0;
    mvd_array <= 4'h0;
  end
  else if (clk_en) begin
    if (parallel_load) begin
      reg_array <= parallel_in;
      mvd_array <= 4'h0;
    end
    else if (write) begin
      if (parallel_read) begin
        reg_array[0] <= data_in;
        mvd_array[0] <= mem_valid_data;
      end
      else begin
        reg_array[wr_ptr] <= data_in;
        mvd_array[wr_ptr] <= mem_valid_data;
      end
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    wr_ptr <= 2'h0;
  end
  else if (flush) begin
    wr_ptr <= 2'h0;
  end
  else if (clk_en) begin
    if (parallel_load) begin
      wr_ptr <= num_load[1:0];
    end
    else if (parallel_read) begin
      if (push) begin
        wr_ptr <= 2'h1;
      end
      else wr_ptr <= 2'h0;
    end
    else if (write) begin
      wr_ptr <= wr_ptr + 2'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    rd_ptr <= 2'h0;
  end
  else if (flush) begin
    rd_ptr <= 2'h0;
  end
  else if (clk_en) begin
    if (parallel_load | parallel_read) begin
      rd_ptr <= 2'h0;
    end
    else if (read) begin
      rd_ptr <= rd_ptr + 2'h1;
    end
  end
end
assign parallel_out = reg_array;
assign write = push & (~passthru) & ((~full) | pop | parallel_read);
always_comb begin
  if (passthru) begin
    data_out = data_in;
    mem_valid_data_out = mem_valid_data;
  end
  else begin
    data_out = reg_array[rd_ptr];
    mem_valid_data_out = mvd_array[rd_ptr];
  end
end
always_comb begin
  valid = pop & ((~empty) | passthru);
end
endmodule   // reg_fifo_d4_w1

module reg_fifo_d4_w1_unq0 #(parameter data_width = 16'h10)
(
  input logic clk,
  input logic clk_en,
  input logic [0:0] [data_width-1:0] data_in,
  output logic [0:0] [data_width-1:0] data_out,
  output logic empty,
  input logic flush,
  output logic full,
  input logic mem_valid_data,
  output logic mem_valid_data_out,
  input logic [2:0] num_load,
  input logic [3:0][0:0] [data_width-1:0] parallel_in,
  input logic parallel_load,
  output logic [3:0][0:0] [data_width-1:0] parallel_out,
  input logic parallel_read,
  input logic pop,
  input logic push,
  input logic rst_n,
  output logic valid
);

logic [3:0] mvd_array;
logic [2:0] num_items;
logic passthru;
logic [1:0] rd_ptr;
logic read;
logic [3:0][0:0][data_width-1:0] reg_array;
logic [1:0] wr_ptr;
logic write;
assign full = num_items == 3'h4;
assign empty = num_items == 3'h0;
assign read = pop & (~passthru) & (~empty);
assign passthru = pop & push & empty;

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    num_items <= 3'h0;
  end
  else if (flush) begin
    num_items <= 3'h0;
  end
  else if (clk_en) begin
    if (parallel_load) begin
      if (num_load == 3'h0) begin
        num_items <= 3'(push);
      end
      else num_items <= num_load;
    end
    else if (parallel_read) begin
      if (push) begin
        num_items <= 3'h1;
      end
      else num_items <= 3'h0;
    end
    else if (write & (~read)) begin
      num_items <= num_items + 3'h1;
    end
    else if ((~write) & read) begin
      num_items <= num_items - 3'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    reg_array <= 64'h0;
    mvd_array <= 4'h0;
  end
  else if (flush) begin
    reg_array <= 64'h0;
    mvd_array <= 4'h0;
  end
  else if (clk_en) begin
    if (parallel_load) begin
      reg_array <= parallel_in;
      mvd_array <= 4'h0;
    end
    else if (write) begin
      if (parallel_read) begin
        reg_array[0] <= data_in;
        mvd_array[0] <= mem_valid_data;
      end
      else begin
        reg_array[wr_ptr] <= data_in;
        mvd_array[wr_ptr] <= mem_valid_data;
      end
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    wr_ptr <= 2'h0;
  end
  else if (flush) begin
    wr_ptr <= 2'h0;
  end
  else if (clk_en) begin
    if (parallel_load) begin
      wr_ptr <= num_load[1:0];
    end
    else if (parallel_read) begin
      if (push) begin
        wr_ptr <= 2'h1;
      end
      else wr_ptr <= 2'h0;
    end
    else if (write) begin
      wr_ptr <= wr_ptr + 2'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    rd_ptr <= 2'h0;
  end
  else if (flush) begin
    rd_ptr <= 2'h0;
  end
  else if (clk_en) begin
    if (parallel_load | parallel_read) begin
      rd_ptr <= 2'h0;
    end
    else if (read) begin
      rd_ptr <= rd_ptr + 2'h1;
    end
  end
end
assign parallel_out = reg_array;
assign write = push & (~passthru) & ((~full) | pop | parallel_read);
always_comb begin
  if (passthru) begin
    data_out = data_in;
    mem_valid_data_out = mem_valid_data;
  end
  else begin
    data_out = reg_array[rd_ptr];
    mem_valid_data_out = mvd_array[rd_ptr];
  end
end
always_comb begin
  valid = pop & ((~empty) | passthru);
end
endmodule   // reg_fifo_d4_w1_unq0

module reg_fifo_d8_w4 #(parameter data_width = 16'h10)
(
  input logic clk,
  input logic clk_en,
  input logic [3:0] [data_width-1:0] data_in,
  output logic [3:0] [data_width-1:0] data_out,
  output logic empty,
  input logic flush,
  output logic full,
  input logic mem_valid_data,
  output logic mem_valid_data_out,
  input logic pop,
  input logic push,
  input logic rst_n,
  output logic valid
);

logic [7:0] mvd_array;
logic [3:0] num_items;
logic passthru;
logic [2:0] rd_ptr;
logic read;
logic [7:0][3:0][data_width-1:0] reg_array;
logic [2:0] wr_ptr;
logic write;
assign full = num_items == 4'h8;
assign empty = num_items == 4'h0;
assign read = pop & (~passthru) & (~empty);
assign passthru = pop & push & empty;
assign write = push & (~passthru) & ((~full) | pop);

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    num_items <= 4'h0;
  end
  else if (flush) begin
    num_items <= 4'h0;
  end
  else if (clk_en) begin
    if (write & (~read)) begin
      num_items <= num_items + 4'h1;
    end
    else if ((~write) & read) begin
      num_items <= num_items - 4'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    reg_array <= 512'h0;
    mvd_array <= 8'h0;
  end
  else if (flush) begin
    reg_array <= 512'h0;
    mvd_array <= 8'h0;
  end
  else if (clk_en) begin
    if (write) begin
      reg_array[wr_ptr] <= data_in;
      mvd_array[wr_ptr] <= mem_valid_data;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    wr_ptr <= 3'h0;
  end
  else if (flush) begin
    wr_ptr <= 3'h0;
  end
  else if (clk_en) begin
    if (write) begin
      if (wr_ptr == 3'h7) begin
        wr_ptr <= 3'h0;
      end
      else wr_ptr <= wr_ptr + 3'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    rd_ptr <= 3'h0;
  end
  else if (flush) begin
    rd_ptr <= 3'h0;
  end
  else if (clk_en) begin
    if (read) begin
      rd_ptr <= rd_ptr + 3'h1;
    end
  end
end
always_comb begin
  if (passthru) begin
    data_out = data_in;
    mem_valid_data_out = mem_valid_data;
  end
  else begin
    data_out = reg_array[rd_ptr];
    mem_valid_data_out = mvd_array[rd_ptr];
  end
end
always_comb begin
  valid = pop & ((~empty) | passthru);
end
endmodule   // reg_fifo_d8_w4

module rw_arbiter (
  output logic [0:0] [9:0] addr_to_mem,
  output logic cen_mem,
  input logic clk,
  input logic clk_en,
  input logic [0:0][3:0] [15:0] data_from_mem,
  output logic [0:0][3:0] [15:0] data_to_mem,
  input logic flush,
  output logic [1:0] out_ack,
  output logic [0:0][3:0] [15:0] out_data,
  output logic [0:0] [1:0] out_port,
  output logic out_valid,
  input logic [1:0] [9:0] rd_addr,
  input logic [1:0] ren_en,
  input logic [1:0] ren_in,
  input logic rst_n,
  input logic [0:0] [9:0] w_addr,
  input logic [0:0][3:0] [15:0] w_data,
  input logic wen_in,
  output logic wen_mem
);

logic done;
logic [0:0][1:0] next_rd_port;
logic [1:0] next_rd_port_red;
logic [0:0][9:0] rd_addr_sel;
logic [0:0][1:0] rd_port;
logic rd_valid;
logic [1:0] ren_int;
logic wen_int;
assign ren_int = ren_in & ren_en;
assign wen_int = wen_in;
always_comb begin
  next_rd_port[0] = 2'h0;
  rd_addr_sel[0] = 10'h0;
  done = 1'h0;
  for (int unsigned i = 0; i < 2; i += 1) begin
      if (~done) begin
        if (ren_int[1'(i)]) begin
          rd_addr_sel[0] = rd_addr[1'(i)];
          next_rd_port[0][1'(i)] = 1'h1;
          done = 1'h1;
        end
      end
    end
end
assign next_rd_port_red[0] = |next_rd_port[0][0];
assign next_rd_port_red[1] = |next_rd_port[0][1];
assign out_ack = next_rd_port_red & {~wen_int, ~wen_int};
always_comb begin
  cen_mem = wen_int | (|next_rd_port[0]);
  data_to_mem[0] = w_data[0];
  if (wen_int) begin
    addr_to_mem[0] = w_addr[0];
  end
  else addr_to_mem[0] = rd_addr_sel[0];
  wen_mem = wen_int;
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    rd_port[0] <= 2'h0;
    rd_valid <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      rd_port[0] <= 2'h0;
      rd_valid <= 1'h0;
    end
    else begin
      rd_valid <= ((~wen_int) | 1'h0) & (|next_rd_port[0]);
      rd_port[0] <= next_rd_port[0];
    end
  end
end
always_comb begin
  out_data = data_from_mem;
  out_port = rd_port;
  out_valid = rd_valid;
end
endmodule   // rw_arbiter

module sram_stub (
  input logic [8:0] addr,
  input logic cen,
  input logic clk,
  input logic clk_en,
  input logic [3:0] [15:0] data_in,
  output logic [3:0] [15:0] data_out,
  input logic flush,
  input logic wen
);

logic [511:0][3:0][15:0] data_array;

always_ff @(posedge clk) begin
  if (clk_en) begin
    if (cen & wen) begin
      data_array[addr] <= data_in;
    end
  end
end

always_ff @(posedge clk) begin
  if (clk_en) begin
    if (cen & (~wen)) begin
      data_out <= data_array[addr];
    end
  end
end
endmodule   // sram_stub

module storage_config_seq (
  output logic [9:0] addr_out,
  input logic clk,
  input logic clk_en,
  input logic [7:0] config_addr_in,
  input logic [15:0] config_data_in,
  input logic [1:0] config_en,
  input logic config_rd,
  input logic config_wr,
  input logic flush,
  output logic [1:0] [15:0] rd_data_out,
  input logic [0:0][3:0] [15:0] rd_data_stg,
  output logic ren_out,
  input logic rst_n,
  output logic wen_out,
  output logic [3:0] [15:0] wr_data
);

logic [1:0] cnt;
logic [2:0][15:0] data_wr_reg;
logic [1:0] rd_cnt;
logic [1:0] reduce_en;
logic set_to_addr;
assign reduce_en[0] = |config_en[0];
assign reduce_en[1] = |config_en[1];
always_comb begin
  set_to_addr = 1'h0;
  for (int unsigned i = 0; i < 2; i += 1) begin
      if (reduce_en[1'(i)]) begin
        set_to_addr = 1'(i);
      end
    end
end
assign addr_out = {1'h0, set_to_addr, config_addr_in};

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    cnt <= 2'h0;
  end
  else if (flush) begin
    cnt <= 2'h0;
  end
  else if (clk_en) begin
    if ((config_wr | config_rd) & (|config_en)) begin
      cnt <= cnt + 2'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    rd_cnt <= 2'h0;
  end
  else if (flush) begin
    rd_cnt <= 2'h0;
  end
  else if (clk_en) begin
    rd_cnt <= cnt;
  end
end
assign rd_data_out[0] = rd_data_stg[0][rd_cnt];
assign rd_data_out[1] = rd_data_stg[0][rd_cnt];

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    data_wr_reg <= 48'h0;
  end
  else if (flush) begin
    data_wr_reg <= 48'h0;
  end
  else if (clk_en) begin
    if (config_wr & (cnt < 2'h3)) begin
      data_wr_reg[cnt] <= config_data_in;
    end
  end
end
assign wr_data[0] = data_wr_reg[0];
assign wr_data[1] = data_wr_reg[1];
assign wr_data[2] = data_wr_reg[2];
assign wr_data[3] = config_data_in;
assign wen_out = config_wr & (cnt == 2'h3);
assign ren_out = config_rd;
endmodule   // storage_config_seq

module strg_fifo (
  output logic [0:0] [9:0] addr_out,
  input logic clk,
  input logic clk_en,
  input logic [0:0][3:0] [15:0] data_from_strg,
  input logic [15:0] data_in,
  output logic [15:0] data_out,
  output logic [0:0][3:0] [15:0] data_to_strg,
  output logic empty,
  input logic [15:0] fifo_depth,
  input logic flush,
  output logic full,
  input logic pop,
  input logic push,
  output logic ren_to_strg,
  input logic rst_n,
  output logic valid_out,
  output logic wen_to_strg
);

logic [15:0] back_data_in;
logic [15:0] back_data_out;
logic back_empty;
logic back_full;
logic [2:0] back_num_load;
logic [2:0] back_occ;
logic [3:0][0:0][15:0] back_par_in;
logic back_pl;
logic back_pop;
logic back_push;
logic [0:0][15:0] back_rf_data_in;
logic [0:0][15:0] back_rf_data_out;
logic back_rf_parallel_load;
logic back_valid;
logic curr_bank_rd;
logic curr_bank_wr;
logic [3:0][15:0] front_combined;
logic [15:0] front_data_out;
logic front_empty;
logic front_full;
logic [2:0] front_occ;
logic [3:0][0:0][15:0] front_par_out;
logic front_par_read;
logic front_pop;
logic front_push;
logic [1:0] front_rd_ptr;
logic [0:0][15:0] front_rf_data_in;
logic [0:0][15:0] front_rf_data_out;
logic front_valid;
logic fw_is_1;
logic [15:0] num_items;
logic [15:0] num_words_mem;
logic prev_bank_rd;
logic queued_write;
logic [0:0][9:0] ren_addr;
logic ren_delay;
logic [0:0][9:0] wen_addr;
logic [0:0][3:0][15:0] write_queue;
assign curr_bank_wr = 1'h0;
assign curr_bank_rd = 1'h0;
assign front_push = push & ((~full) | pop);
assign front_rf_data_in[0] = data_in;
assign front_data_out = front_rf_data_out[0];
assign fw_is_1 = 1'h0;
assign back_pop = pop & ((~empty) | push);
assign back_rf_parallel_load = back_pl & (|back_num_load);
assign back_rf_data_in[0] = back_data_in;
assign back_data_out = back_rf_data_out[0];
always_comb begin
  wen_to_strg = ((~ren_to_strg) | 1'h0) & (queued_write | ((front_occ == 3'h4) & push &
      (~front_pop) & (curr_bank_wr == 1'h0)));
end
always_comb begin
  ren_to_strg = ((back_occ == 3'h1) | fw_is_1) & (curr_bank_rd == 1'h0) & (pop | ((back_occ ==
      3'h0) & (back_num_load == 3'h0))) & ((num_words_mem > 16'h1) | ((num_words_mem
      == 16'h1) & (~back_pl)));
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    ren_delay <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      ren_delay <= 1'h0;
    end
    else ren_delay <= |ren_to_strg;
  end
end
assign back_pl = ren_delay;
assign front_combined[0] = front_par_out[front_rd_ptr + 2'h0];
assign front_combined[1] = front_par_out[front_rd_ptr + 2'h1];
assign front_combined[2] = front_par_out[front_rd_ptr + 2'h2];
assign front_combined[3] = front_par_out[front_rd_ptr + 2'h3];
assign data_to_strg[0] = queued_write ? write_queue[0]: front_combined;
assign back_data_in = front_data_out;
assign back_push = front_valid;
always_comb begin
  front_pop = ((num_words_mem == 16'h0) | ((num_words_mem == 16'h1) & back_pl)) & ((~back_pl)
      | (back_pl & (back_num_load == 3'h0))) & ((~(back_occ == 3'h4)) | pop) &
      ((~(front_occ == 3'h0)) | push);
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    write_queue[0] <= 64'h0;
    queued_write <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      write_queue[0] <= 64'h0;
      queued_write <= 1'h0;
    end
    else if (front_par_read & (~wen_to_strg) & (curr_bank_wr == 1'h0)) begin
      write_queue[0] <= front_combined;
      queued_write <= 1'h1;
    end
    else if (wen_to_strg) begin
      queued_write <= 1'h0;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    num_words_mem <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      num_words_mem <= 16'h0;
    end
    else if ((~back_pl) & front_par_read) begin
      num_words_mem <= num_words_mem + 16'h1;
    end
    else if (back_pl & (~front_par_read)) begin
      num_words_mem <= num_words_mem - 16'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    front_occ <= 3'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      front_occ <= 3'h0;
    end
    else if (front_par_read) begin
      if (front_push) begin
        front_occ <= 3'h1;
      end
      else front_occ <= 3'h0;
    end
    else if (front_push & (~front_pop)) begin
      front_occ <= front_occ + 3'h1;
    end
    else if ((~front_push) & front_pop) begin
      front_occ <= front_occ - 3'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    back_occ <= 3'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      back_occ <= 3'h0;
    end
    else if (back_pl) begin
      if (back_num_load == 3'h0) begin
        back_occ <= 3'(back_push);
      end
      else back_occ <= back_num_load;
    end
    else if (back_push & (~back_pop)) begin
      back_occ <= back_occ + 3'h1;
    end
    else if ((~back_push) & back_pop) begin
      back_occ <= back_occ - 3'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    prev_bank_rd <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      prev_bank_rd <= 1'h0;
    end
    else prev_bank_rd <= curr_bank_rd;
  end
end
assign back_par_in[0] = (back_num_load == 3'h4) ? data_from_strg[prev_bank_rd][0]:
    data_from_strg[prev_bank_rd][1];
assign back_par_in[1] = (back_num_load == 3'h4) ? data_from_strg[prev_bank_rd][1]:
    data_from_strg[prev_bank_rd][2];
assign back_par_in[2] = (back_num_load == 3'h4) ? data_from_strg[prev_bank_rd][2]:
    data_from_strg[prev_bank_rd][3];
assign back_par_in[3] = (back_num_load == 3'h4) ? data_from_strg[prev_bank_rd][3]: 16'h0;
always_comb begin
  front_par_read = (front_occ == 3'h4) & push & (~front_pop);
end
always_comb begin
  if (back_pl) begin
    back_num_load = pop ? 3'h3: 3'h4;
  end
  else back_num_load = 3'h0;
end
assign data_out = back_pl ? data_from_strg[prev_bank_rd][0]: back_data_out;
assign valid_out = back_pl ? pop: back_valid;

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    wen_addr[0] <= 10'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      wen_addr[0] <= 10'h0;
    end
    else if (wen_to_strg) begin
      wen_addr[0] <= wen_addr[0] + 10'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    ren_addr[0] <= 10'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      ren_addr[0] <= 10'h0;
    end
    else if (ren_to_strg) begin
      ren_addr[0] <= ren_addr[0] + 10'h1;
    end
  end
end
assign addr_out[0] = wen_to_strg ? wen_addr[0]: ren_addr[0];
always_comb begin
  num_items = 16'(num_words_mem * 16'h4) + 16'(front_occ) + 16'(back_occ);
end
assign empty = num_items == 16'h0;
assign full = fifo_depth == num_items;
reg_fifo_d4_w1 #(
  .data_width(16'h10)) front_rf (
  .clk(clk),
  .clk_en(clk_en),
  .data_in(front_rf_data_in),
  .data_out(front_rf_data_out),
  .empty(front_empty),
  .flush(flush),
  .full(front_full),
  .mem_valid_data(1'h1),
  .num_load(3'h0),
  .parallel_in(64'h0),
  .parallel_load(1'h0),
  .parallel_out(front_par_out),
  .parallel_read(front_par_read),
  .pop(front_pop),
  .push(front_push),
  .rd_ptr_out(front_rd_ptr),
  .rst_n(rst_n),
  .valid(front_valid)
);

reg_fifo_d4_w1_unq0 #(
  .data_width(16'h10)) back_rf (
  .clk(clk),
  .clk_en(clk_en),
  .data_in(back_rf_data_in),
  .data_out(back_rf_data_out),
  .empty(back_empty),
  .flush(flush),
  .full(back_full),
  .mem_valid_data(1'h1),
  .num_load(back_num_load),
  .parallel_in(back_par_in),
  .parallel_load(back_rf_parallel_load),
  .parallel_read(1'h0),
  .pop(back_pop),
  .push(back_push),
  .rst_n(rst_n),
  .valid(back_valid)
);

endmodule   // strg_fifo

module strg_ram (
  output logic [0:0] [9:0] addr_out,
  input logic clk,
  input logic clk_en,
  input logic [0:0][3:0] [15:0] data_from_strg,
  input logic [15:0] data_in,
  output logic [15:0] data_out,
  output logic [0:0][3:0] [15:0] data_to_strg,
  input logic flush,
  input logic [15:0] rd_addr_in,
  output logic ready,
  input logic ren,
  output logic ren_to_strg,
  input logic rst_n,
  output logic valid_out,
  input logic wen,
  output logic wen_to_strg,
  input logic [15:0] wr_addr_in
);

typedef enum logic[1:0] {
  IDLE = 2'h0,
  MODIFY = 2'h1,
  READ = 2'h2
} r_w_seq_state;
logic [15:0] addr_to_write;
logic [3:0][15:0] data_combined;
logic [15:0] data_to_write;
r_w_seq_state r_w_seq_current_state;
r_w_seq_state r_w_seq_next_state;
logic [15:0] rd_addr;
logic rd_bank;
logic rd_valid;
logic read_gate;
logic [15:0] wr_addr;
logic write_gate;
assign wr_addr = wr_addr_in;
assign rd_addr = wr_addr_in;
assign rd_bank = 1'h0;

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    rd_valid <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      rd_valid <= 1'h0;
    end
    else rd_valid <= ren & (~wen);
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    data_to_write <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      data_to_write <= 16'h0;
    end
    else data_to_write <= data_in;
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    addr_to_write <= 16'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      addr_to_write <= 16'h0;
    end
    else addr_to_write <= wr_addr;
  end
end
assign data_to_strg[0] = data_combined;
assign ren_to_strg = (wen | ren) & read_gate;
assign wen_to_strg = write_gate;
always_comb begin
  addr_out[0] = rd_addr[11:2];
  if (wen & (~write_gate)) begin
    addr_out[0] = wr_addr[11:2];
  end
  else if (write_gate) begin
    addr_out[0] = addr_to_write[11:2];
  end
end
always_comb begin
  if (addr_to_write[1:0] == 2'h0) begin
    data_combined[0] = data_to_write;
  end
  else data_combined[0] = data_from_strg[rd_bank][0];
end
always_comb begin
  if (addr_to_write[1:0] == 2'h1) begin
    data_combined[1] = data_to_write;
  end
  else data_combined[1] = data_from_strg[rd_bank][1];
end
always_comb begin
  if (addr_to_write[1:0] == 2'h2) begin
    data_combined[2] = data_to_write;
  end
  else data_combined[2] = data_from_strg[rd_bank][2];
end
always_comb begin
  if (addr_to_write[1:0] == 2'h3) begin
    data_combined[3] = data_to_write;
  end
  else data_combined[3] = data_from_strg[rd_bank][3];
end

always_ff @(posedge clk, negedge rst_n) begin
  if (!rst_n) begin
    r_w_seq_current_state <= IDLE;
  end
  else r_w_seq_current_state <= r_w_seq_next_state;
end
always_comb begin
  r_w_seq_next_state = r_w_seq_current_state;
  unique case (r_w_seq_current_state)
    IDLE: if ((~wen) & (~ren)) begin
      r_w_seq_next_state = IDLE;
    end
    else if (wen) begin
      r_w_seq_next_state = MODIFY;
    end
    else if (ren & (~wen)) begin
      r_w_seq_next_state = READ;
    end
    MODIFY: if (1'h1) begin
      r_w_seq_next_state = IDLE;
    end
    READ: if ((~wen) & (~ren)) begin
      r_w_seq_next_state = IDLE;
    end
    else if (wen) begin
      r_w_seq_next_state = MODIFY;
    end
    else if (ren & (~wen)) begin
      r_w_seq_next_state = READ;
    end
    default: r_w_seq_next_state = r_w_seq_current_state;
  endcase
end
always_comb begin
  unique case (r_w_seq_current_state)
    IDLE: begin :r_w_seq_IDLE_Output
        data_out = 16'h0;
        read_gate = 1'h1;
        ready = 1'h1;
        valid_out = 1'h0;
        write_gate = 1'h0;
      end :r_w_seq_IDLE_Output
    MODIFY: begin :r_w_seq_MODIFY_Output
        data_out = 16'h0;
        read_gate = 1'h0;
        ready = 1'h0;
        valid_out = 1'h0;
        write_gate = 1'h1;
      end :r_w_seq_MODIFY_Output
    READ: begin :r_w_seq_READ_Output
        data_out = data_from_strg[rd_bank][addr_to_write[1:0]];
        read_gate = 1'h1;
        ready = 1'h1;
        valid_out = 1'h1;
        write_gate = 1'h0;
      end :r_w_seq_READ_Output
  endcase
end
endmodule   // strg_ram

module strg_ub (
  output logic [0:0][0:0] [9:0] addr_out,
  input logic [6:0] agg_align_0_line_length,
  input logic [6:0] agg_align_1_line_length,
  input logic [3:0] agg_in_0_in_period,
  input logic [15:0] [1:0] agg_in_0_in_sched,
  input logic [3:0] agg_in_0_out_period,
  input logic [15:0] [1:0] agg_in_0_out_sched,
  input logic [3:0] agg_in_1_in_period,
  input logic [15:0] [1:0] agg_in_1_in_sched,
  input logic [3:0] agg_in_1_out_period,
  input logic [15:0] [1:0] agg_in_1_out_sched,
  input logic [1:0] app_ctrl_coarse_input_port,
  input logic [1:0] app_ctrl_coarse_output_port,
  input logic [1:0] app_ctrl_coarse_prefill,
  input logic [1:0] [15:0] app_ctrl_coarse_read_depth,
  input logic [1:0] [15:0] app_ctrl_coarse_write_depth_ss,
  input logic [1:0] [15:0] app_ctrl_coarse_write_depth_wo,
  input logic [1:0] app_ctrl_input_port,
  input logic [1:0] app_ctrl_output_port,
  input logic [1:0] app_ctrl_prefill,
  input logic [3:0] [15:0] app_ctrl_ranges,
  input logic [1:0] [15:0] app_ctrl_read_depth,
  input logic [3:0] [15:0] app_ctrl_threshold,
  input logic [1:0] [15:0] app_ctrl_write_depth_ss,
  input logic [1:0] [15:0] app_ctrl_write_depth_wo,
  output logic [0:0] cen_to_strg,
  input logic chain_idx_output,
  input logic clk,
  input logic clk_en,
  input logic [0:0][0:0][3:0] [15:0] data_from_strg,
  input logic [1:0] [15:0] data_in,
  output logic [1:0] [15:0] data_out,
  output logic [0:0][0:0][3:0] [15:0] data_to_strg,
  input logic enable_chain_output,
  input logic flush,
  input logic [3:0] input_addr_ctrl_address_gen_0_dimensionality,
  input logic [5:0] [15:0] input_addr_ctrl_address_gen_0_ranges,
  input logic [15:0] input_addr_ctrl_address_gen_0_starting_addr,
  input logic [5:0] [15:0] input_addr_ctrl_address_gen_0_strides,
  input logic [3:0] input_addr_ctrl_address_gen_1_dimensionality,
  input logic [5:0] [15:0] input_addr_ctrl_address_gen_1_ranges,
  input logic [15:0] input_addr_ctrl_address_gen_1_starting_addr,
  input logic [5:0] [15:0] input_addr_ctrl_address_gen_1_strides,
  input logic [0:0] mem_valid_data,
  input logic [3:0] output_addr_ctrl_address_gen_0_dimensionality,
  input logic [5:0] [15:0] output_addr_ctrl_address_gen_0_ranges,
  input logic [15:0] output_addr_ctrl_address_gen_0_starting_addr,
  input logic [5:0] [15:0] output_addr_ctrl_address_gen_0_strides,
  input logic [3:0] output_addr_ctrl_address_gen_1_dimensionality,
  input logic [5:0] [15:0] output_addr_ctrl_address_gen_1_ranges,
  input logic [15:0] output_addr_ctrl_address_gen_1_starting_addr,
  input logic [5:0] [15:0] output_addr_ctrl_address_gen_1_strides,
  input logic [3:0] pre_fetch_0_input_latency,
  input logic [3:0] pre_fetch_1_input_latency,
  input logic [1:0] [1:0] rate_matched,
  input logic [1:0] ren_in,
  input logic rst_n,
  input logic [1:0] [1:0] sync_grp_sync_group,
  input logic [1:0] tb_0_dimensionality,
  input logic [63:0] [2:0] tb_0_indices,
  input logic [5:0] tb_0_range_inner,
  input logic [9:0] tb_0_range_outer,
  input logic [1:0] tb_0_starting_addr,
  input logic [3:0] tb_0_stride,
  input logic tb_0_tb_height,
  input logic [1:0] tb_1_dimensionality,
  input logic [63:0] [2:0] tb_1_indices,
  input logic [5:0] tb_1_range_inner,
  input logic [9:0] tb_1_range_outer,
  input logic [1:0] tb_1_starting_addr,
  input logic [3:0] tb_1_stride,
  input logic tb_1_tb_height,
  output logic [1:0] valid_out,
  input logic [1:0] wen_in,
  output logic [0:0] wen_to_strg
);

logic [1:0][63:0] ab_to_mem_dat;
logic [1:0] ab_to_mem_valid;
logic [1:0] ack_reduced;
logic [1:0] ack_transpose;
logic [0:0][0:0][9:0] addr_to_arb;
logic agg_align_0_align;
logic [15:0] agg_align_0_in_dat;
logic agg_align_0_in_valid;
logic [15:0] agg_align_0_out_dat;
logic agg_align_0_out_valid;
logic agg_align_1_align;
logic [15:0] agg_align_1_in_dat;
logic agg_align_1_in_valid;
logic [15:0] agg_align_1_out_dat;
logic agg_align_1_out_valid;
logic agg_in_0_align;
logic [15:0] agg_in_0_data_in;
logic [63:0] agg_in_0_data_out;
logic agg_in_0_valid_in;
logic agg_in_0_valid_out;
logic agg_in_1_align;
logic [15:0] agg_in_1_data_in;
logic [63:0] agg_in_1_data_out;
logic agg_in_1_valid_in;
logic agg_in_1_valid_out;
logic [1:0] align_input;
logic [0:0][1:0] arb_acks;
logic [0:0][0:0][3:0][15:0] arb_dat_out;
logic [0:0][3:0][15:0] arb_dat_out_f;
logic arb_mem_valid_data_f;
logic [1:0] arb_mem_valid_data_out;
logic [0:0][0:0][1:0] arb_port_out;
logic [0:0][1:0] arb_port_out_f;
logic [1:0] arb_ren_en;
logic [0:0] arb_valid_out;
logic arb_valid_out_f;
logic [1:0] arb_wen_en;
logic [1:0][15:0] data_consume;
logic [0:0][0:0][3:0][15:0] data_to_arb;
logic [1:0][3:0][15:0] data_to_pref;
logic [1:0][3:0][15:0] data_to_sync;
logic [1:0][3:0][15:0] data_to_tba;
logic [1:0] mem_valid_data_pref;
logic [1:0] mem_valid_data_sync;
logic [1:0][9:0] oac_addr_out;
logic [1:0] oac_step;
logic [1:0] oac_valid;
logic [1:0] port_wens;
logic [3:0][15:0] pre_fetch_0_data_in;
logic [3:0][15:0] pre_fetch_0_data_out;
logic pre_fetch_0_mem_valid_data;
logic pre_fetch_0_mem_valid_data_out;
logic pre_fetch_0_prefetch_step;
logic pre_fetch_0_tba_rdy_in;
logic pre_fetch_0_valid_out;
logic pre_fetch_0_valid_read;
logic [3:0][15:0] pre_fetch_1_data_in;
logic [3:0][15:0] pre_fetch_1_data_out;
logic pre_fetch_1_mem_valid_data;
logic pre_fetch_1_mem_valid_data_out;
logic pre_fetch_1_prefetch_step;
logic pre_fetch_1_tba_rdy_in;
logic pre_fetch_1_valid_out;
logic pre_fetch_1_valid_read;
logic [1:0] prefetch_step;
logic [1:0] rd_sync_gate;
logic [1:0] ready_tba;
logic [1:0] ren;
logic [1:0] ren_in_muxed;
logic [0:0][1:0] ren_out;
logic [1:0] ren_out_reduced;
logic [1:0] ren_out_tpose;
logic [0:0][9:0] rw_arb_0_addr_to_mem;
logic rw_arb_0_cen_mem;
logic [0:0][3:0][15:0] rw_arb_0_data_from_mem;
logic [0:0][3:0][15:0] rw_arb_0_data_to_mem;
logic [1:0] rw_arb_0_out_ack;
logic [0:0][3:0][15:0] rw_arb_0_out_data;
logic [0:0][1:0] rw_arb_0_out_port;
logic rw_arb_0_out_valid;
logic [1:0] rw_arb_0_ren_in;
logic [0:0][9:0] rw_arb_0_w_addr;
logic [0:0][3:0][15:0] rw_arb_0_w_data;
logic rw_arb_0_wen_in;
logic rw_arb_0_wen_mem;
logic tb_0_ack_in;
logic [15:0] tb_0_col_pixels [0:0];
logic [3:0][15:0] tb_0_input_data;
logic tb_0_mem_valid_data;
logic tb_0_output_valid;
logic tb_0_rdy_to_arbiter;
logic tb_0_ren;
logic tb_0_valid_data;
logic tb_1_ack_in;
logic [15:0] tb_1_col_pixels [0:0];
logic [3:0][15:0] tb_1_input_data;
logic tb_1_mem_valid_data;
logic tb_1_output_valid;
logic tb_1_rdy_to_arbiter;
logic tb_1_ren;
logic tb_1_valid_data;
logic [1:0][15:0] tb_data_out;
logic [1:0] tb_valid_out;
logic [1:0] valid_consume;
logic [1:0] valid_to_pref;
logic [1:0] valid_to_sync;
logic [1:0] valid_to_tba;
logic [1:0] wen;
logic [0:0] wen_to_arb;
assign ren_in_muxed[0] = rate_matched[0][0] ? wen_in[rate_matched[0][1]]: ren_in[0];
assign ren_in_muxed[1] = rate_matched[1][0] ? wen_in[rate_matched[1][1]]: ren_in[1];
assign agg_align_0_in_dat = data_in[0];
assign agg_align_0_in_valid = wen[0];
assign align_input[0] = agg_align_0_align;
assign valid_consume[0] = agg_align_0_out_valid;
assign data_consume[0] = agg_align_0_out_dat;
assign agg_align_1_in_dat = data_in[1];
assign agg_align_1_in_valid = wen[1];
assign align_input[1] = agg_align_1_align;
assign valid_consume[1] = agg_align_1_out_valid;
assign data_consume[1] = agg_align_1_out_dat;
assign agg_in_0_data_in = data_consume[0];
assign agg_in_0_valid_in = valid_consume[0];
assign agg_in_0_align = align_input[0];
assign ab_to_mem_dat[0] = agg_in_0_data_out;
assign ab_to_mem_valid[0] = agg_in_0_valid_out;
assign agg_in_1_data_in = data_consume[1];
assign agg_in_1_valid_in = valid_consume[1];
assign agg_in_1_align = align_input[1];
assign ab_to_mem_dat[1] = agg_in_1_data_out;
assign ab_to_mem_valid[1] = agg_in_1_valid_out;
assign oac_valid = prefetch_step;
assign oac_step = ack_reduced;
assign ren_out_tpose[0] = ren_out[0][0];
assign ren_out_tpose[1] = ren_out[0][1];
assign rw_arb_0_wen_in = wen_to_arb;
assign rw_arb_0_w_data = data_to_arb[0];
assign rw_arb_0_w_addr = addr_to_arb[0];
assign rw_arb_0_data_from_mem = data_from_strg[0];
assign arb_dat_out[0] = rw_arb_0_out_data;
assign arb_port_out[0] = rw_arb_0_out_port;
assign arb_valid_out = rw_arb_0_out_valid;
assign cen_to_strg = rw_arb_0_cen_mem;
assign wen_to_strg = rw_arb_0_wen_mem;
assign data_to_strg[0] = rw_arb_0_data_to_mem;
assign arb_acks[0] = rw_arb_0_out_ack;
assign addr_out[0] = rw_arb_0_addr_to_mem;
assign rw_arb_0_ren_in = ren_out[0] & rd_sync_gate;
assign arb_dat_out_f[0] = arb_dat_out[0][0];
assign arb_port_out_f[0] = arb_port_out[0][0];
assign arb_valid_out_f = arb_valid_out;
assign arb_mem_valid_data_f = mem_valid_data;
assign ren_out_reduced[0] = |ren_out_tpose[0];
assign ren_out_reduced[1] = |ren_out_tpose[1];
assign pre_fetch_0_data_in = data_to_pref[0];
assign pre_fetch_0_mem_valid_data = mem_valid_data_sync[0];
assign mem_valid_data_pref[0] = pre_fetch_0_mem_valid_data_out;
assign pre_fetch_0_valid_read = valid_to_pref[0];
assign pre_fetch_0_tba_rdy_in = ready_tba[0];
assign data_to_tba[0] = pre_fetch_0_data_out;
assign valid_to_tba[0] = pre_fetch_0_valid_out;
assign prefetch_step[0] = pre_fetch_0_prefetch_step;
assign pre_fetch_1_data_in = data_to_pref[1];
assign pre_fetch_1_mem_valid_data = mem_valid_data_sync[1];
assign mem_valid_data_pref[1] = pre_fetch_1_mem_valid_data_out;
assign pre_fetch_1_valid_read = valid_to_pref[1];
assign pre_fetch_1_tba_rdy_in = ready_tba[1];
assign data_to_tba[1] = pre_fetch_1_data_out;
assign valid_to_tba[1] = pre_fetch_1_valid_out;
assign prefetch_step[1] = pre_fetch_1_prefetch_step;
assign tb_0_input_data = data_to_tba[0];
assign tb_0_valid_data = valid_to_tba[0];
assign tb_0_ack_in = valid_to_tba[0];
assign tb_0_mem_valid_data = mem_valid_data_pref[0];
assign tb_data_out[0] = tb_0_col_pixels;
assign tb_valid_out[0] = tb_0_output_valid;
assign ready_tba[0] = tb_0_rdy_to_arbiter;
assign tb_0_ren = ren[0];
assign tb_1_input_data = data_to_tba[1];
assign tb_1_valid_data = valid_to_tba[1];
assign tb_1_ack_in = valid_to_tba[1];
assign tb_1_mem_valid_data = mem_valid_data_pref[1];
assign tb_data_out[1] = tb_1_col_pixels;
assign tb_valid_out[1] = tb_1_output_valid;
assign ready_tba[1] = tb_1_rdy_to_arbiter;
assign tb_1_ren = ren[1];
assign data_out[0] = tb_data_out[0];
assign data_out[1] = tb_data_out[1];
always_comb begin
  ack_transpose[0] = arb_acks[0][0];
  ack_transpose[1] = arb_acks[0][1];
end
always_comb begin
  ack_reduced[0] = |ack_transpose[0];
  ack_reduced[1] = |ack_transpose[1];
end
app_ctrl app_ctrl (
  .clk(clk),
  .clk_en(clk_en),
  .flush(flush),
  .input_port(app_ctrl_input_port),
  .output_port(app_ctrl_output_port),
  .prefill(app_ctrl_prefill),
  .ranges(app_ctrl_ranges),
  .read_depth(app_ctrl_read_depth),
  .ren_in(ren_in_muxed),
  .ren_out(ren),
  .ren_update(tb_valid_out),
  .rst_n(rst_n),
  .tb_valid(tb_valid_out),
  .threshold(app_ctrl_threshold),
  .valid_out_data(valid_out),
  .wen_in(wen_in),
  .wen_out(wen),
  .write_depth_ss(app_ctrl_write_depth_ss),
  .write_depth_wo(app_ctrl_write_depth_wo)
);

app_ctrl_unq0 app_ctrl_coarse (
  .clk(clk),
  .clk_en(clk_en),
  .flush(flush),
  .input_port(app_ctrl_coarse_input_port),
  .output_port(app_ctrl_coarse_output_port),
  .prefill(app_ctrl_coarse_prefill),
  .read_depth(app_ctrl_coarse_read_depth),
  .ren_in(ren_out_reduced),
  .ren_out(arb_ren_en),
  .ren_update(ack_reduced),
  .rst_n(rst_n),
  .tb_valid(2'h0),
  .wen_in(ab_to_mem_valid),
  .wen_out(arb_wen_en),
  .write_depth_ss(app_ctrl_coarse_write_depth_ss),
  .write_depth_wo(app_ctrl_coarse_write_depth_wo)
);

agg_aligner agg_align_0 (
  .align(agg_align_0_align),
  .clk(clk),
  .clk_en(clk_en),
  .flush(flush),
  .in_dat(agg_align_0_in_dat),
  .in_valid(agg_align_0_in_valid),
  .line_length(agg_align_0_line_length),
  .out_dat(agg_align_0_out_dat),
  .out_valid(agg_align_0_out_valid),
  .rst_n(rst_n)
);

agg_aligner agg_align_1 (
  .align(agg_align_1_align),
  .clk(clk),
  .clk_en(clk_en),
  .flush(flush),
  .in_dat(agg_align_1_in_dat),
  .in_valid(agg_align_1_in_valid),
  .line_length(agg_align_1_line_length),
  .out_dat(agg_align_1_out_dat),
  .out_valid(agg_align_1_out_valid),
  .rst_n(rst_n)
);

aggregation_buffer agg_in_0 (
  .align(agg_in_0_align),
  .clk(clk),
  .clk_en(clk_en),
  .data_in(agg_in_0_data_in),
  .data_out(agg_in_0_data_out),
  .flush(flush),
  .in_period(agg_in_0_in_period),
  .in_sched(agg_in_0_in_sched),
  .out_period(agg_in_0_out_period),
  .out_sched(agg_in_0_out_sched),
  .rst_n(rst_n),
  .valid_in(agg_in_0_valid_in),
  .valid_out(agg_in_0_valid_out)
);

aggregation_buffer agg_in_1 (
  .align(agg_in_1_align),
  .clk(clk),
  .clk_en(clk_en),
  .data_in(agg_in_1_data_in),
  .data_out(agg_in_1_data_out),
  .flush(flush),
  .in_period(agg_in_1_in_period),
  .in_sched(agg_in_1_in_sched),
  .out_period(agg_in_1_out_period),
  .out_sched(agg_in_1_out_sched),
  .rst_n(rst_n),
  .valid_in(agg_in_1_valid_in),
  .valid_out(agg_in_1_valid_out)
);

input_addr_ctrl input_addr_ctrl (
  .addr_out(addr_to_arb),
  .address_gen_0_dimensionality(input_addr_ctrl_address_gen_0_dimensionality),
  .address_gen_0_ranges(input_addr_ctrl_address_gen_0_ranges),
  .address_gen_0_starting_addr(input_addr_ctrl_address_gen_0_starting_addr),
  .address_gen_0_strides(input_addr_ctrl_address_gen_0_strides),
  .address_gen_1_dimensionality(input_addr_ctrl_address_gen_1_dimensionality),
  .address_gen_1_ranges(input_addr_ctrl_address_gen_1_ranges),
  .address_gen_1_starting_addr(input_addr_ctrl_address_gen_1_starting_addr),
  .address_gen_1_strides(input_addr_ctrl_address_gen_1_strides),
  .clk(clk),
  .clk_en(clk_en),
  .data_in(ab_to_mem_dat),
  .data_out(data_to_arb),
  .flush(flush),
  .port_out(port_wens),
  .rst_n(rst_n),
  .valid_in(ab_to_mem_valid),
  .wen_en(arb_wen_en),
  .wen_to_sram(wen_to_arb)
);

output_addr_ctrl output_addr_ctrl (
  .addr_out(oac_addr_out),
  .address_gen_0_dimensionality(output_addr_ctrl_address_gen_0_dimensionality),
  .address_gen_0_ranges(output_addr_ctrl_address_gen_0_ranges),
  .address_gen_0_starting_addr(output_addr_ctrl_address_gen_0_starting_addr),
  .address_gen_0_strides(output_addr_ctrl_address_gen_0_strides),
  .address_gen_1_dimensionality(output_addr_ctrl_address_gen_1_dimensionality),
  .address_gen_1_ranges(output_addr_ctrl_address_gen_1_ranges),
  .address_gen_1_starting_addr(output_addr_ctrl_address_gen_1_starting_addr),
  .address_gen_1_strides(output_addr_ctrl_address_gen_1_strides),
  .clk(clk),
  .clk_en(clk_en),
  .flush(flush),
  .ren(ren_out),
  .rst_n(rst_n),
  .step_in(oac_step),
  .valid_in(oac_valid)
);

rw_arbiter rw_arb_0 (
  .addr_to_mem(rw_arb_0_addr_to_mem),
  .cen_mem(rw_arb_0_cen_mem),
  .clk(clk),
  .clk_en(clk_en),
  .data_from_mem(rw_arb_0_data_from_mem),
  .data_to_mem(rw_arb_0_data_to_mem),
  .flush(flush),
  .out_ack(rw_arb_0_out_ack),
  .out_data(rw_arb_0_out_data),
  .out_port(rw_arb_0_out_port),
  .out_valid(rw_arb_0_out_valid),
  .rd_addr(oac_addr_out),
  .ren_en(arb_ren_en),
  .ren_in(rw_arb_0_ren_in),
  .rst_n(rst_n),
  .w_addr(rw_arb_0_w_addr),
  .w_data(rw_arb_0_w_data),
  .wen_in(rw_arb_0_wen_in),
  .wen_mem(rw_arb_0_wen_mem)
);

demux_reads demux_rds (
  .clk(clk),
  .clk_en(clk_en),
  .data_in(arb_dat_out_f),
  .data_out(data_to_sync),
  .flush(flush),
  .mem_valid_data(arb_mem_valid_data_f),
  .mem_valid_data_out(arb_mem_valid_data_out),
  .port_in(arb_port_out_f),
  .rst_n(rst_n),
  .valid_in(arb_valid_out_f),
  .valid_out(valid_to_sync)
);

sync_groups sync_grp (
  .ack_in(ack_reduced),
  .clk(clk),
  .clk_en(clk_en),
  .data_in(data_to_sync),
  .data_out(data_to_pref),
  .flush(flush),
  .mem_valid_data(arb_mem_valid_data_out),
  .mem_valid_data_out(mem_valid_data_sync),
  .rd_sync_gate(rd_sync_gate),
  .ren_in(ren_out_reduced),
  .rst_n(rst_n),
  .sync_group(sync_grp_sync_group),
  .valid_in(valid_to_sync),
  .valid_out(valid_to_pref)
);

prefetcher pre_fetch_0 (
  .clk(clk),
  .clk_en(clk_en),
  .data_in(pre_fetch_0_data_in),
  .data_out(pre_fetch_0_data_out),
  .flush(flush),
  .input_latency(pre_fetch_0_input_latency),
  .mem_valid_data(pre_fetch_0_mem_valid_data),
  .mem_valid_data_out(pre_fetch_0_mem_valid_data_out),
  .prefetch_step(pre_fetch_0_prefetch_step),
  .rst_n(rst_n),
  .tba_rdy_in(pre_fetch_0_tba_rdy_in),
  .valid_out(pre_fetch_0_valid_out),
  .valid_read(pre_fetch_0_valid_read)
);

prefetcher pre_fetch_1 (
  .clk(clk),
  .clk_en(clk_en),
  .data_in(pre_fetch_1_data_in),
  .data_out(pre_fetch_1_data_out),
  .flush(flush),
  .input_latency(pre_fetch_1_input_latency),
  .mem_valid_data(pre_fetch_1_mem_valid_data),
  .mem_valid_data_out(pre_fetch_1_mem_valid_data_out),
  .prefetch_step(pre_fetch_1_prefetch_step),
  .rst_n(rst_n),
  .tba_rdy_in(pre_fetch_1_tba_rdy_in),
  .valid_out(pre_fetch_1_valid_out),
  .valid_read(pre_fetch_1_valid_read)
);

transpose_buffer tb_0 (
  .ack_in(tb_0_ack_in),
  .clk(clk),
  .clk_en(clk_en),
  .col_pixels(tb_0_col_pixels),
  .dimensionality(tb_0_dimensionality),
  .flush(flush),
  .indices(tb_0_indices),
  .input_data(tb_0_input_data),
  .mem_valid_data(tb_0_mem_valid_data),
  .output_valid(tb_0_output_valid),
  .range_inner(tb_0_range_inner),
  .range_outer(tb_0_range_outer),
  .rdy_to_arbiter(tb_0_rdy_to_arbiter),
  .ren(tb_0_ren),
  .rst_n(rst_n),
  .starting_addr(tb_0_starting_addr),
  .stride(tb_0_stride),
  .tb_height(tb_0_tb_height),
  .valid_data(tb_0_valid_data)
);

transpose_buffer tb_1 (
  .ack_in(tb_1_ack_in),
  .clk(clk),
  .clk_en(clk_en),
  .col_pixels(tb_1_col_pixels),
  .dimensionality(tb_1_dimensionality),
  .flush(flush),
  .indices(tb_1_indices),
  .input_data(tb_1_input_data),
  .mem_valid_data(tb_1_mem_valid_data),
  .output_valid(tb_1_output_valid),
  .range_inner(tb_1_range_inner),
  .range_outer(tb_1_range_outer),
  .rdy_to_arbiter(tb_1_rdy_to_arbiter),
  .ren(tb_1_ren),
  .rst_n(rst_n),
  .starting_addr(tb_1_starting_addr),
  .stride(tb_1_stride),
  .tb_height(tb_1_tb_height),
  .valid_data(tb_1_valid_data)
);

endmodule   // strg_ub

module sync_groups (
  input logic [1:0] ack_in,
  input logic clk,
  input logic clk_en,
  input logic [1:0][3:0] [15:0] data_in,
  output logic [1:0][3:0] [15:0] data_out,
  input logic flush,
  input logic [1:0] mem_valid_data,
  output logic [1:0] mem_valid_data_out,
  output logic [1:0] rd_sync_gate,
  input logic [1:0] ren_in,
  input logic rst_n,
  input logic [1:0] [1:0] sync_group,
  input logic [1:0] valid_in,
  output logic [1:0] valid_out
);

logic [1:0][3:0][15:0] data_reg;
logic [1:0] group_finished;
logic [1:0][1:0] grp_fin_large;
logic [1:0][1:0] local_gate_bus;
logic [1:0][1:0] local_gate_bus_n;
logic [1:0][1:0] local_gate_bus_tpose;
logic [1:0][1:0] local_gate_mask;
logic [1:0] local_gate_reduced;
logic [1:0] ren_int;
logic [1:0][1:0] sync_agg;
logic [1:0] sync_valid;
logic [1:0] valid_reg;
assign local_gate_bus = ~local_gate_bus_n;
assign data_out = data_reg;
assign rd_sync_gate = local_gate_reduced;
assign ren_int = ren_in & local_gate_reduced;
always_comb begin
  if (sync_group[0] == 2'h1) begin
    sync_agg[0][0] = valid_reg[0];
  end
  else sync_agg[0][0] = 1'h1;
  if (sync_group[1] == 2'h1) begin
    sync_agg[0][1] = valid_reg[1];
  end
  else sync_agg[0][1] = 1'h1;
  if (sync_group[0] == 2'h2) begin
    sync_agg[1][0] = valid_reg[0];
  end
  else sync_agg[1][0] = 1'h1;
  if (sync_group[1] == 2'h2) begin
    sync_agg[1][1] = valid_reg[1];
  end
  else sync_agg[1][1] = 1'h1;
end
always_comb begin
  for (int unsigned i = 0; i < 2; i += 1) begin
      sync_valid[1'(i)] = &sync_agg[1'(i)];
    end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    data_reg[0] <= 64'h0;
    valid_reg[0] <= 1'h0;
    mem_valid_data_out[0] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      data_reg[0] <= 64'h0;
      valid_reg[0] <= 1'h0;
      mem_valid_data_out[0] <= 1'h0;
    end
    else if (|(sync_valid & sync_group[0])) begin
      data_reg[0] <= data_in[0];
      mem_valid_data_out[0] <= mem_valid_data[0];
      valid_reg[0] <= valid_in[0];
    end
    else if (~valid_reg[0]) begin
      data_reg[0] <= data_in[0];
      mem_valid_data_out[0] <= mem_valid_data[0];
      valid_reg[0] <= valid_in[0];
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    data_reg[1] <= 64'h0;
    valid_reg[1] <= 1'h0;
    mem_valid_data_out[1] <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      data_reg[1] <= 64'h0;
      valid_reg[1] <= 1'h0;
      mem_valid_data_out[1] <= 1'h0;
    end
    else if (|(sync_valid & sync_group[1])) begin
      data_reg[1] <= data_in[1];
      mem_valid_data_out[1] <= mem_valid_data[1];
      valid_reg[1] <= valid_in[1];
    end
    else if (~valid_reg[1]) begin
      data_reg[1] <= data_in[1];
      mem_valid_data_out[1] <= mem_valid_data[1];
      valid_reg[1] <= valid_in[1];
    end
  end
end
always_comb begin
  for (int unsigned i = 0; i < 2; i += 1) begin
      valid_out[1'(i)] = |(sync_valid & sync_group[1'(i)]);
    end
end
always_comb begin
  for (int unsigned i = 0; i < 2; i += 1) begin
      local_gate_reduced[1'(i)] = &local_gate_bus_tpose[1'(i)];
    end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    local_gate_bus_n[0] <= 2'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      local_gate_bus_n[0] <= 2'h0;
    end
    else if (group_finished[0]) begin
      local_gate_bus_n[0] <= 2'h0;
    end
    else local_gate_bus_n[0] <= ~(local_gate_bus[0] & local_gate_mask[0]);
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    local_gate_bus_n[1] <= 2'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      local_gate_bus_n[1] <= 2'h0;
    end
    else if (group_finished[1]) begin
      local_gate_bus_n[1] <= 2'h0;
    end
    else local_gate_bus_n[1] <= ~(local_gate_bus[1] & local_gate_mask[1]);
  end
end
always_comb begin
  for (int unsigned i = 0; i < 2; i += 1) begin
      for (int unsigned j = 0; j < 2; j += 1) begin
          local_gate_bus_tpose[1'(i)][1'(j)] = local_gate_bus[1'(j)][1'(i)];
        end
    end
end
always_comb begin
  for (int unsigned i = 0; i < 2; i += 1) begin
      group_finished[1'(i)] = &grp_fin_large[1'(i)];
    end
end
always_comb begin
  local_gate_mask[0][0] = 1'h1;
  if (sync_group[0] == 2'h1) begin
    local_gate_mask[0][0] = ~(ren_int[0] & ack_in[0]);
  end
  local_gate_mask[0][1] = 1'h1;
  if (sync_group[1] == 2'h1) begin
    local_gate_mask[0][1] = ~(ren_int[1] & ack_in[1]);
  end
  local_gate_mask[1][0] = 1'h1;
  if (sync_group[0] == 2'h2) begin
    local_gate_mask[1][0] = ~(ren_int[0] & ack_in[0]);
  end
  local_gate_mask[1][1] = 1'h1;
  if (sync_group[1] == 2'h2) begin
    local_gate_mask[1][1] = ~(ren_int[1] & ack_in[1]);
  end
end
always_comb begin
  grp_fin_large[0][0] = 1'h1;
  if (sync_group[0] == 2'h1) begin
    grp_fin_large[0][0] = (~local_gate_bus[0][0]) | (~local_gate_mask[0][0]);
  end
  grp_fin_large[0][1] = 1'h1;
  if (sync_group[1] == 2'h1) begin
    grp_fin_large[0][1] = (~local_gate_bus[0][1]) | (~local_gate_mask[0][1]);
  end
  grp_fin_large[1][0] = 1'h1;
  if (sync_group[0] == 2'h2) begin
    grp_fin_large[1][0] = (~local_gate_bus[1][0]) | (~local_gate_mask[1][0]);
  end
  grp_fin_large[1][1] = 1'h1;
  if (sync_group[1] == 2'h2) begin
    grp_fin_large[1][1] = (~local_gate_bus[1][1]) | (~local_gate_mask[1][1]);
  end
end
endmodule   // sync_groups

module transpose_buffer (
  input logic ack_in,
  input logic clk,
  input logic clk_en,
  output logic [15:0] col_pixels [0:0],
  input logic [1:0] dimensionality,
  input logic flush,
  input logic [63:0] [2:0] indices,
  input logic [3:0] [15:0] input_data,
  input logic mem_valid_data,
  output logic output_valid,
  input logic [5:0] range_inner,
  input logic [9:0] range_outer,
  output logic rdy_to_arbiter,
  input logic ren,
  input logic rst_n,
  input logic [1:0] starting_addr,
  input logic [3:0] stride,
  input logic tb_height,
  input logic valid_data
);

logic [19:0] curr_out_start;
logic [5:0] index_inner;
logic [9:0] index_outer;
logic [2:0] indices_index_inner;
logic input_buf_index;
logic old_start_data;
logic on_next_line;
logic out_buf_index;
logic out_buf_indexinv;
logic [1:0] output_index;
logic [19:0] output_index_abs;
logic [19:0] output_index_long;
logic pause_output;
logic pause_tb;
logic pause_tbinv;
logic rdy_to_arbiterinv;
logic start_data;
logic switch_next_line;
logic switch_out_buf;
logic [1:0][3:0][15:0] tb;
logic [1:0] tb_valid;

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    index_outer <= 10'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      index_outer <= 10'h0;
    end
    else if ((dimensionality == 2'h1) | ((dimensionality == 2'h2) & ((range_inner - 6'h1) == index_inner))) begin
      if (~pause_output) begin
        if ((range_outer - 10'h1) == index_outer) begin
          index_outer <= 10'h0;
        end
        else index_outer <= index_outer + 10'h1;
      end
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    index_inner <= 6'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      index_inner <= 6'h0;
    end
    else if (dimensionality <= 2'h1) begin
      index_inner <= 6'h0;
    end
    else if (~pause_output) begin
      if ((range_inner - 6'h1) == index_inner) begin
        index_inner <= 6'h0;
      end
      else index_inner <= index_inner + 6'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    pause_tbinv <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      pause_tbinv <= 1'h0;
    end
    else if (dimensionality == 2'h0) begin
      pause_tbinv <= 1'h0;
    end
    else if (((range_outer - 10'h1) == index_outer) & ((dimensionality == 2'h1) | ((dimensionality == 2'h2) & ((range_inner - 6'h1) == index_inner)))) begin
      if (~pause_output) begin
        if ((~rdy_to_arbiter) | valid_data) begin
          pause_tbinv <= 1'h1;
        end
        else pause_tbinv <= 1'h0;
      end
    end
    else if (pause_tb) begin
      pause_tbinv <= valid_data;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    input_buf_index <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      input_buf_index <= 1'h0;
    end
    else if (valid_data) begin
      input_buf_index <= ~input_buf_index;
    end
  end
end

always_ff @(posedge clk) begin
  if (clk_en) begin
    if (valid_data) begin
      tb[input_buf_index] <= input_data;
      tb_valid[input_buf_index] <= mem_valid_data;
    end
  end
end
always_comb begin
  if (out_buf_index ^ switch_out_buf) begin
    col_pixels[0] = tb[0][output_index];
  end
  else col_pixels[0] = tb[1][output_index];
end
always_comb begin
  if (pause_output) begin
    output_valid = 1'h0;
  end
  else if (out_buf_index ^ switch_out_buf) begin
    output_valid = tb_valid[0];
  end
  else output_valid = tb_valid[1];
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    out_buf_indexinv <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      out_buf_indexinv <= 1'h0;
    end
    else if (~start_data) begin
      out_buf_indexinv <= 1'h0;
    end
    else if (switch_out_buf) begin
      out_buf_indexinv <= ~out_buf_indexinv;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    rdy_to_arbiterinv <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      rdy_to_arbiterinv <= 1'h0;
    end
    else if (start_data & (~old_start_data)) begin
      rdy_to_arbiterinv <= 1'h0;
    end
    else if (switch_out_buf) begin
      rdy_to_arbiterinv <= 1'h0;
    end
    else if (ack_in) begin
      rdy_to_arbiterinv <= 1'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    start_data <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      start_data <= 1'h0;
    end
    else if (valid_data & (~start_data)) begin
      start_data <= 1'h1;
    end
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    curr_out_start <= 20'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      curr_out_start <= 20'h0;
    end
    else if (switch_next_line) begin
      curr_out_start <= 20'h0;
    end
    else if ((curr_out_start + 20'h4) <= output_index_abs) begin
      curr_out_start <= curr_out_start + 20'h4;
    end
  end
end
always_comb begin
  output_index = output_index_long[1:0];
end

always_ff @(posedge clk) begin
  if (clk_en) begin
    old_start_data <= start_data;
  end
end

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    on_next_line <= 1'h0;
  end
  else if (clk_en) begin
    if (flush) begin
      on_next_line <= 1'h0;
    end
    else if (switch_next_line) begin
      on_next_line <= 1'h1;
    end
    else if ((range_outer - 10'h1) == index_outer) begin
      if ((dimensionality == 2'h1) | ((dimensionality == 2'h2) & ((range_inner - 6'h1) == index_inner))) begin
        on_next_line <= 1'h0;
      end
    end
  end
end
always_comb begin
  if (pause_tb) begin
    pause_output = 1'h1;
  end
  else pause_output = ~ren;
end
always_comb begin
  if (dimensionality == 2'h0) begin
    indices_index_inner = 3'h0;
    output_index_abs = 20'h0;
  end
  else if (dimensionality == 2'h1) begin
    indices_index_inner = 3'h0;
    output_index_abs = (20'(index_outer) * 20'(stride)) + 20'(starting_addr);
  end
  else begin
    indices_index_inner = indices[index_inner];
    output_index_abs = (20'(index_outer) * 20'(stride)) + 20'(indices_index_inner) + 20'(starting_addr);
  end
end
always_comb begin
  if (switch_next_line | ((curr_out_start + 20'h4) <= output_index_abs)) begin
    switch_out_buf = 1'h1;
  end
  else switch_out_buf = 1'h0;
end
always_comb begin
  if ((index_outer == 10'h0) & (~on_next_line) & ((dimensionality == 2'h1) | ((dimensionality == 2'h2) & (index_inner == 6'h0)))) begin
    switch_next_line = 1'h1;
  end
  else switch_next_line = 1'h0;
end
always_comb begin
  output_index_long = output_index_abs % 20'h4;
end
always_comb begin
  pause_tb = ~pause_tbinv;
  out_buf_index = ~out_buf_indexinv;
  rdy_to_arbiter = ~rdy_to_arbiterinv;
end
endmodule   // transpose_buffer


module ConfigRegister_7_8_32_17 (
    input clk,
    input reset,
    output [6:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [6:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7_inst0_O;
wire [7:0] const_17_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7_inst0 (
    .I(config_data[6:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h11),
    .width(8)
) const_17_8 (
    .out(const_17_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_17_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7_inst0_O;
endmodule

module ConfigRegister_7_8_32_16 (
    input clk,
    input reset,
    output [6:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [6:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7_inst0_O;
wire [7:0] const_16_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7_inst0 (
    .I(config_data[6:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h10),
    .width(8)
) const_16_8 (
    .out(const_16_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_16_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_7_inst0_O;
endmodule

module ConfigRegister_6_8_32_199 (
    input clk,
    input reset,
    output [5:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [5:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6_inst0_O;
wire [7:0] const_199_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6_inst0 (
    .I(config_data[5:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hc7),
    .width(8)
) const_199_8 (
    .out(const_199_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_199_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6_inst0_O;
endmodule

module ConfigRegister_6_8_32_186 (
    input clk,
    input reset,
    output [5:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [5:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6_inst0_O;
wire [7:0] const_186_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6_inst0 (
    .I(config_data[5:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hba),
    .width(8)
) const_186_8 (
    .out(const_186_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_186_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_6_inst0_O;
endmodule

module ConfigRegister_4_8_32_69 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_69_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h45),
    .width(8)
) const_69_8 (
    .out(const_69_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_69_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_52 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_52_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h34),
    .width(8)
) const_52_8 (
    .out(const_52_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_52_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_35 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_35_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h23),
    .width(8)
) const_35_8 (
    .out(const_35_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_35_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_202 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_202_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hca),
    .width(8)
) const_202_8 (
    .out(const_202_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_202_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_189 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_189_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hbd),
    .width(8)
) const_189_8 (
    .out(const_189_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_189_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_18 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_18_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h12),
    .width(8)
) const_18_8 (
    .out(const_18_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_18_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_173 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_173_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'had),
    .width(8)
) const_173_8 (
    .out(const_173_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_173_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_172 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_172_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hac),
    .width(8)
) const_172_8 (
    .out(const_172_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_172_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_158 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_158_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h9e),
    .width(8)
) const_158_8 (
    .out(const_158_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_158_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_144 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_144_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h90),
    .width(8)
) const_144_8 (
    .out(const_144_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_144_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_130 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_130_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h82),
    .width(8)
) const_130_8 (
    .out(const_130_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_130_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_4_8_32_116 (
    input clk,
    input reset,
    output [3:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [3:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
wire [7:0] const_116_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0 (
    .I(config_data[3:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h74),
    .width(8)
) const_116_8 (
    .out(const_116_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_116_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_4_inst0_O;
endmodule

module ConfigRegister_30_8_32_197 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_197_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hc5),
    .width(8)
) const_197_8 (
    .out(const_197_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_197_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_196 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_196_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hc4),
    .width(8)
) const_196_8 (
    .out(const_196_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_196_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_195 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_195_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hc3),
    .width(8)
) const_195_8 (
    .out(const_195_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_195_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_194 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_194_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hc2),
    .width(8)
) const_194_8 (
    .out(const_194_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_194_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_193 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_193_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hc1),
    .width(8)
) const_193_8 (
    .out(const_193_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_193_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_192 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_192_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hc0),
    .width(8)
) const_192_8 (
    .out(const_192_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_192_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_184 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_184_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hb8),
    .width(8)
) const_184_8 (
    .out(const_184_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_184_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_183 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_183_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hb7),
    .width(8)
) const_183_8 (
    .out(const_183_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_183_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_182 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_182_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hb6),
    .width(8)
) const_182_8 (
    .out(const_182_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_182_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_181 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_181_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hb5),
    .width(8)
) const_181_8 (
    .out(const_181_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_181_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_180 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_180_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hb4),
    .width(8)
) const_180_8 (
    .out(const_180_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_180_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_30_8_32_179 (
    input clk,
    input reset,
    output [29:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [29:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
wire [7:0] const_179_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0 (
    .I(config_data[29:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hb3),
    .width(8)
) const_179_8 (
    .out(const_179_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_179_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_30_inst0_O;
endmodule

module ConfigRegister_2_8_32_90 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_90_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h5a),
    .width(8)
) const_90_8 (
    .out(const_90_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_90_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_85 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_85_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h55),
    .width(8)
) const_85_8 (
    .out(const_85_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_85_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_84 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_84_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h54),
    .width(8)
) const_84_8 (
    .out(const_84_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_84_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_83 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_83_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h53),
    .width(8)
) const_83_8 (
    .out(const_83_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_83_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_82 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_82_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h52),
    .width(8)
) const_82_8 (
    .out(const_82_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_82_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_81 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_81_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h51),
    .width(8)
) const_81_8 (
    .out(const_81_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_81_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_80 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_80_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h50),
    .width(8)
) const_80_8 (
    .out(const_80_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_80_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_79 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_79_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h4f),
    .width(8)
) const_79_8 (
    .out(const_79_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_79_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_78 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_78_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h4e),
    .width(8)
) const_78_8 (
    .out(const_78_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_78_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_77 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_77_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h4d),
    .width(8)
) const_77_8 (
    .out(const_77_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_77_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_76 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_76_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h4c),
    .width(8)
) const_76_8 (
    .out(const_76_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_76_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_75 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_75_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h4b),
    .width(8)
) const_75_8 (
    .out(const_75_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_75_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_74 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_74_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h4a),
    .width(8)
) const_74_8 (
    .out(const_74_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_74_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_73 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_73_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h49),
    .width(8)
) const_73_8 (
    .out(const_73_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_73_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_72 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_72_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h48),
    .width(8)
) const_72_8 (
    .out(const_72_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_72_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_71 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_71_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h47),
    .width(8)
) const_71_8 (
    .out(const_71_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_71_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_70 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_70_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h46),
    .width(8)
) const_70_8 (
    .out(const_70_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_70_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_68 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_68_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h44),
    .width(8)
) const_68_8 (
    .out(const_68_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_68_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_67 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_67_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h43),
    .width(8)
) const_67_8 (
    .out(const_67_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_67_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_66 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_66_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h42),
    .width(8)
) const_66_8 (
    .out(const_66_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_66_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_65 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_65_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h41),
    .width(8)
) const_65_8 (
    .out(const_65_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_65_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_64 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_64_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h40),
    .width(8)
) const_64_8 (
    .out(const_64_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_64_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_63 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_63_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h3f),
    .width(8)
) const_63_8 (
    .out(const_63_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_63_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_62 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_62_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h3e),
    .width(8)
) const_62_8 (
    .out(const_62_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_62_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_61 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_61_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h3d),
    .width(8)
) const_61_8 (
    .out(const_61_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_61_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_60 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_60_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h3c),
    .width(8)
) const_60_8 (
    .out(const_60_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_60_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_59 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_59_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h3b),
    .width(8)
) const_59_8 (
    .out(const_59_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_59_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_58 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_58_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h3a),
    .width(8)
) const_58_8 (
    .out(const_58_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_58_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_57 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_57_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h39),
    .width(8)
) const_57_8 (
    .out(const_57_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_57_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_56 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_56_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h38),
    .width(8)
) const_56_8 (
    .out(const_56_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_56_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_55 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_55_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h37),
    .width(8)
) const_55_8 (
    .out(const_55_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_55_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_54 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_54_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h36),
    .width(8)
) const_54_8 (
    .out(const_54_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_54_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_53 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_53_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h35),
    .width(8)
) const_53_8 (
    .out(const_53_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_53_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_51 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_51_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h33),
    .width(8)
) const_51_8 (
    .out(const_51_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_51_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_50 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_50_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h32),
    .width(8)
) const_50_8 (
    .out(const_50_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_50_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_49 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_49_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h31),
    .width(8)
) const_49_8 (
    .out(const_49_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_49_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_48 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_48_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h30),
    .width(8)
) const_48_8 (
    .out(const_48_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_48_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_47 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_47_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h2f),
    .width(8)
) const_47_8 (
    .out(const_47_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_47_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_46 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_46_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h2e),
    .width(8)
) const_46_8 (
    .out(const_46_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_46_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_45 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_45_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h2d),
    .width(8)
) const_45_8 (
    .out(const_45_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_45_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_44 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_44_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h2c),
    .width(8)
) const_44_8 (
    .out(const_44_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_44_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_43 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_43_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h2b),
    .width(8)
) const_43_8 (
    .out(const_43_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_43_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_42 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_42_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h2a),
    .width(8)
) const_42_8 (
    .out(const_42_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_42_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_41 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_41_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h29),
    .width(8)
) const_41_8 (
    .out(const_41_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_41_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_40 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_40_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h28),
    .width(8)
) const_40_8 (
    .out(const_40_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_40_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_39 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_39_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h27),
    .width(8)
) const_39_8 (
    .out(const_39_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_39_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_38 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_38_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h26),
    .width(8)
) const_38_8 (
    .out(const_38_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_38_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_37 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_37_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h25),
    .width(8)
) const_37_8 (
    .out(const_37_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_37_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_36 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_36_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h24),
    .width(8)
) const_36_8 (
    .out(const_36_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_36_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_34 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_34_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h22),
    .width(8)
) const_34_8 (
    .out(const_34_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_34_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_33 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_33_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h21),
    .width(8)
) const_33_8 (
    .out(const_33_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_33_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_32 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_32_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h20),
    .width(8)
) const_32_8 (
    .out(const_32_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_32_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_31 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_31_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h1f),
    .width(8)
) const_31_8 (
    .out(const_31_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_31_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_30 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_30_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h1e),
    .width(8)
) const_30_8 (
    .out(const_30_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_30_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_29 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_29_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h1d),
    .width(8)
) const_29_8 (
    .out(const_29_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_29_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_28 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_28_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h1c),
    .width(8)
) const_28_8 (
    .out(const_28_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_28_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_27 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_27_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h1b),
    .width(8)
) const_27_8 (
    .out(const_27_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_27_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_26 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_26_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h1a),
    .width(8)
) const_26_8 (
    .out(const_26_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_26_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_25 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_25_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h19),
    .width(8)
) const_25_8 (
    .out(const_25_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_25_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_24 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_24_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h18),
    .width(8)
) const_24_8 (
    .out(const_24_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_24_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_23 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_23_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h17),
    .width(8)
) const_23_8 (
    .out(const_23_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_23_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_22 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_22_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h16),
    .width(8)
) const_22_8 (
    .out(const_22_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_22_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_21 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_21_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h15),
    .width(8)
) const_21_8 (
    .out(const_21_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_21_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_201 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_201_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hc9),
    .width(8)
) const_201_8 (
    .out(const_201_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_201_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_20 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_20_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h14),
    .width(8)
) const_20_8 (
    .out(const_20_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_20_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_191 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_191_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hbf),
    .width(8)
) const_191_8 (
    .out(const_191_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_191_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_19 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_19_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h13),
    .width(8)
) const_19_8 (
    .out(const_19_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_19_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_188 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_188_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hbc),
    .width(8)
) const_188_8 (
    .out(const_188_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_188_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_178 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_178_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hb2),
    .width(8)
) const_178_8 (
    .out(const_178_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_178_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_177 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_177_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hb1),
    .width(8)
) const_177_8 (
    .out(const_177_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_177_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_176 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_176_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hb0),
    .width(8)
) const_176_8 (
    .out(const_176_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_176_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_175 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_175_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'haf),
    .width(8)
) const_175_8 (
    .out(const_175_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_175_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_174 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_174_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hae),
    .width(8)
) const_174_8 (
    .out(const_174_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_174_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_11 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_11_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h0b),
    .width(8)
) const_11_8 (
    .out(const_11_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_11_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_2_8_32_101 (
    input clk,
    input reset,
    output [1:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [1:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
wire [7:0] const_101_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0 (
    .I(config_data[1:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h65),
    .width(8)
) const_101_8 (
    .out(const_101_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_101_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_2_inst0_O;
endmodule

module ConfigRegister_1_8_32_99 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_99_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h63),
    .width(8)
) const_99_8 (
    .out(const_99_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_99_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_98 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_98_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h62),
    .width(8)
) const_98_8 (
    .out(const_98_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_98_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_97 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_97_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h61),
    .width(8)
) const_97_8 (
    .out(const_97_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_97_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_9 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_9_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h09),
    .width(8)
) const_9_8 (
    .out(const_9_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_9_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_89 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_89_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h59),
    .width(8)
) const_89_8 (
    .out(const_89_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_89_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_88 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_88_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h58),
    .width(8)
) const_88_8 (
    .out(const_88_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_88_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_87 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_87_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h57),
    .width(8)
) const_87_8 (
    .out(const_87_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_87_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_86 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_86_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h56),
    .width(8)
) const_86_8 (
    .out(const_86_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_86_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_7 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_7_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h07),
    .width(8)
) const_7_8 (
    .out(const_7_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_7_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_6 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_6_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h06),
    .width(8)
) const_6_8 (
    .out(const_6_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_6_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_5 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_5_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h05),
    .width(8)
) const_5_8 (
    .out(const_5_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_5_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_4 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_4_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h04),
    .width(8)
) const_4_8 (
    .out(const_4_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_4_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_3 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_3_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h03),
    .width(8)
) const_3_8 (
    .out(const_3_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_3_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_208 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_208_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hd0),
    .width(8)
) const_208_8 (
    .out(const_208_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_208_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_207 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_207_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hcf),
    .width(8)
) const_207_8 (
    .out(const_207_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_207_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_206 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_206_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hce),
    .width(8)
) const_206_8 (
    .out(const_206_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_206_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_205 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_205_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hcd),
    .width(8)
) const_205_8 (
    .out(const_205_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_205_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_204 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_204_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hcc),
    .width(8)
) const_204_8 (
    .out(const_204_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_204_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_203 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_203_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hcb),
    .width(8)
) const_203_8 (
    .out(const_203_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_203_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_2 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_2_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h02),
    .width(8)
) const_2_8 (
    .out(const_2_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_2_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_190 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_190_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hbe),
    .width(8)
) const_190_8 (
    .out(const_190_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_190_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_15 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_15_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h0f),
    .width(8)
) const_15_8 (
    .out(const_15_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_15_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_14 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_14_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h0e),
    .width(8)
) const_14_8 (
    .out(const_14_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_14_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_13 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_13_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h0d),
    .width(8)
) const_13_8 (
    .out(const_13_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_13_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_12 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_12_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h0c),
    .width(8)
) const_12_8 (
    .out(const_12_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_12_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_100 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_100_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h64),
    .width(8)
) const_100_8 (
    .out(const_100_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_100_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_10 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_10_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h0a),
    .width(8)
) const_10_8 (
    .out(const_10_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_10_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_1 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_1_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h01),
    .width(8)
) const_1_8 (
    .out(const_1_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_1_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_1_8_32_0 (
    input clk,
    input reset,
    output [0:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
wire [7:0] const_0_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(config_data[0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h00),
    .width(8)
) const_0_8 (
    .out(const_0_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_0_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

module ConfigRegister_16_8_32_96 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_96_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h60),
    .width(8)
) const_96_8 (
    .out(const_96_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_96_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_95 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_95_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h5f),
    .width(8)
) const_95_8 (
    .out(const_95_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_95_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_94 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_94_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h5e),
    .width(8)
) const_94_8 (
    .out(const_94_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_94_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_93 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_93_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h5d),
    .width(8)
) const_93_8 (
    .out(const_93_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_93_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_92 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_92_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h5c),
    .width(8)
) const_92_8 (
    .out(const_92_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_92_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_91 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_91_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h5b),
    .width(8)
) const_91_8 (
    .out(const_91_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_91_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_8 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_8_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h08),
    .width(8)
) const_8_8 (
    .out(const_8_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_8_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_171 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_171_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hab),
    .width(8)
) const_171_8 (
    .out(const_171_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_171_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_170 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_170_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'haa),
    .width(8)
) const_170_8 (
    .out(const_170_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_170_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_169 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_169_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'ha9),
    .width(8)
) const_169_8 (
    .out(const_169_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_169_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_168 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_168_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'ha8),
    .width(8)
) const_168_8 (
    .out(const_168_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_168_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_167 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_167_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'ha7),
    .width(8)
) const_167_8 (
    .out(const_167_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_167_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_166 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_166_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'ha6),
    .width(8)
) const_166_8 (
    .out(const_166_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_166_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_165 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_165_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'ha5),
    .width(8)
) const_165_8 (
    .out(const_165_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_165_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_164 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_164_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'ha4),
    .width(8)
) const_164_8 (
    .out(const_164_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_164_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_163 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_163_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'ha3),
    .width(8)
) const_163_8 (
    .out(const_163_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_163_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_162 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_162_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'ha2),
    .width(8)
) const_162_8 (
    .out(const_162_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_162_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_161 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_161_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'ha1),
    .width(8)
) const_161_8 (
    .out(const_161_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_161_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_160 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_160_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'ha0),
    .width(8)
) const_160_8 (
    .out(const_160_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_160_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_159 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_159_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h9f),
    .width(8)
) const_159_8 (
    .out(const_159_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_159_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_157 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_157_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h9d),
    .width(8)
) const_157_8 (
    .out(const_157_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_157_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_156 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_156_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h9c),
    .width(8)
) const_156_8 (
    .out(const_156_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_156_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_155 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_155_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h9b),
    .width(8)
) const_155_8 (
    .out(const_155_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_155_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_154 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_154_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h9a),
    .width(8)
) const_154_8 (
    .out(const_154_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_154_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_153 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_153_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h99),
    .width(8)
) const_153_8 (
    .out(const_153_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_153_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_152 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_152_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h98),
    .width(8)
) const_152_8 (
    .out(const_152_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_152_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_151 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_151_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h97),
    .width(8)
) const_151_8 (
    .out(const_151_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_151_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_150 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_150_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h96),
    .width(8)
) const_150_8 (
    .out(const_150_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_150_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_149 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_149_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h95),
    .width(8)
) const_149_8 (
    .out(const_149_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_149_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_148 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_148_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h94),
    .width(8)
) const_148_8 (
    .out(const_148_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_148_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_147 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_147_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h93),
    .width(8)
) const_147_8 (
    .out(const_147_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_147_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_146 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_146_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h92),
    .width(8)
) const_146_8 (
    .out(const_146_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_146_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_145 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_145_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h91),
    .width(8)
) const_145_8 (
    .out(const_145_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_145_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_143 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_143_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h8f),
    .width(8)
) const_143_8 (
    .out(const_143_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_143_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_142 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_142_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h8e),
    .width(8)
) const_142_8 (
    .out(const_142_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_142_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_141 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_141_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h8d),
    .width(8)
) const_141_8 (
    .out(const_141_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_141_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_140 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_140_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h8c),
    .width(8)
) const_140_8 (
    .out(const_140_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_140_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_139 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_139_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h8b),
    .width(8)
) const_139_8 (
    .out(const_139_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_139_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_138 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_138_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h8a),
    .width(8)
) const_138_8 (
    .out(const_138_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_138_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_137 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_137_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h89),
    .width(8)
) const_137_8 (
    .out(const_137_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_137_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_136 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_136_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h88),
    .width(8)
) const_136_8 (
    .out(const_136_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_136_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_135 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_135_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h87),
    .width(8)
) const_135_8 (
    .out(const_135_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_135_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_134 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_134_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h86),
    .width(8)
) const_134_8 (
    .out(const_134_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_134_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_133 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_133_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h85),
    .width(8)
) const_133_8 (
    .out(const_133_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_133_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_132 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_132_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h84),
    .width(8)
) const_132_8 (
    .out(const_132_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_132_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_131 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_131_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h83),
    .width(8)
) const_131_8 (
    .out(const_131_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_131_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_129 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_129_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h81),
    .width(8)
) const_129_8 (
    .out(const_129_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_129_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_128 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_128_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h80),
    .width(8)
) const_128_8 (
    .out(const_128_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_128_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_127 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_127_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h7f),
    .width(8)
) const_127_8 (
    .out(const_127_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_127_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_126 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_126_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h7e),
    .width(8)
) const_126_8 (
    .out(const_126_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_126_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_125 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_125_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h7d),
    .width(8)
) const_125_8 (
    .out(const_125_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_125_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_124 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_124_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h7c),
    .width(8)
) const_124_8 (
    .out(const_124_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_124_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_123 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_123_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h7b),
    .width(8)
) const_123_8 (
    .out(const_123_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_123_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_122 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_122_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h7a),
    .width(8)
) const_122_8 (
    .out(const_122_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_122_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_121 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_121_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h79),
    .width(8)
) const_121_8 (
    .out(const_121_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_121_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_120 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_120_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h78),
    .width(8)
) const_120_8 (
    .out(const_120_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_120_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_119 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_119_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h77),
    .width(8)
) const_119_8 (
    .out(const_119_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_119_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_118 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_118_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h76),
    .width(8)
) const_118_8 (
    .out(const_118_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_118_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_117 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_117_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h75),
    .width(8)
) const_117_8 (
    .out(const_117_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_117_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_115 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_115_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h73),
    .width(8)
) const_115_8 (
    .out(const_115_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_115_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_114 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_114_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h72),
    .width(8)
) const_114_8 (
    .out(const_114_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_114_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_113 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_113_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h71),
    .width(8)
) const_113_8 (
    .out(const_113_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_113_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_112 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_112_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h70),
    .width(8)
) const_112_8 (
    .out(const_112_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_112_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_111 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_111_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h6f),
    .width(8)
) const_111_8 (
    .out(const_111_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_111_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_110 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_110_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h6e),
    .width(8)
) const_110_8 (
    .out(const_110_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_110_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_109 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_109_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h6d),
    .width(8)
) const_109_8 (
    .out(const_109_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_109_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_108 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_108_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h6c),
    .width(8)
) const_108_8 (
    .out(const_108_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_108_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_107 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_107_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h6b),
    .width(8)
) const_107_8 (
    .out(const_107_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_107_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_106 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_106_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h6a),
    .width(8)
) const_106_8 (
    .out(const_106_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_106_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_105 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_105_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h69),
    .width(8)
) const_105_8 (
    .out(const_105_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_105_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_104 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_104_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h68),
    .width(8)
) const_104_8 (
    .out(const_104_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_104_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_103 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_103_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h67),
    .width(8)
) const_103_8 (
    .out(const_103_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_103_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_16_8_32_102 (
    input clk,
    input reset,
    output [15:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [15:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
wire [7:0] const_102_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0 (
    .I(config_data[15:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'h66),
    .width(8)
) const_102_8 (
    .out(const_102_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_102_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_16_inst0_O;
endmodule

module ConfigRegister_12_8_32_198 (
    input clk,
    input reset,
    output [11:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [11:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12_inst0_O;
wire [7:0] const_198_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12_inst0 (
    .I(config_data[11:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hc6),
    .width(8)
) const_198_8 (
    .out(const_198_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_198_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12_inst0_O;
endmodule

module ConfigRegister_12_8_32_185 (
    input clk,
    input reset,
    output [11:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [11:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12_inst0_O;
wire [7:0] const_185_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12_inst0 (
    .I(config_data[11:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hb9),
    .width(8)
) const_185_8 (
    .out(const_185_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_185_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_12_inst0_O;
endmodule

module ConfigRegister_10_8_32_200 (
    input clk,
    input reset,
    output [9:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [9:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10_inst0_O;
wire [7:0] const_200_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10_inst0 (
    .I(config_data[9:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hc8),
    .width(8)
) const_200_8 (
    .out(const_200_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_200_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10_inst0_O;
endmodule

module ConfigRegister_10_8_32_187 (
    input clk,
    input reset,
    output [9:0] O,
    input [7:0] config_addr,
    input [31:0] config_data,
    input config_en
);
wire [9:0] Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10_inst0_O;
wire [7:0] const_187_8_out;
wire magma_Bit_and_inst0_out;
wire magma_Bits_8_eq_inst0_out;
Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10 Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10_inst0 (
    .I(config_data[9:0]),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10_inst0_O),
    .CLK(clk),
    .CE(magma_Bit_and_inst0_out),
    .ASYNCRESET(reset)
);
coreir_const #(
    .value(8'hbb),
    .width(8)
) const_187_8 (
    .out(const_187_8_out)
);
corebit_and magma_Bit_and_inst0 (
    .in0(magma_Bits_8_eq_inst0_out),
    .in1(config_en),
    .out(magma_Bit_and_inst0_out)
);
coreir_eq #(
    .width(8)
) magma_Bits_8_eq_inst0 (
    .in0(config_addr),
    .in1(const_187_8_out),
    .out(magma_Bits_8_eq_inst0_out)
);
assign O = Register_has_ce_True_has_reset_False_has_async_reset_True_has_async_resetn_False_type_Bits_n_10_inst0_O;
endmodule

module MemCore (
    input [15:0] addr_in_0,
    input [15:0] addr_in_1,
    input [15:0] chain_data_in_0,
    input [15:0] chain_data_in_1,
    output [15:0] chain_data_out_0,
    output [15:0] chain_data_out_1,
    input [0:0] chain_valid_in_0,
    input [0:0] chain_valid_in_1,
    output [0:0] chain_valid_out_0,
    output [0:0] chain_valid_out_1,
    input clk,
    input [7:0] config_1_config_addr,
    input [31:0] config_1_config_data,
    input [0:0] config_1_read,
    input [0:0] config_1_write,
    input [7:0] config_2_config_addr,
    input [31:0] config_2_config_data,
    input [0:0] config_2_read,
    input [0:0] config_2_write,
    input [7:0] config_config_addr,
    input [31:0] config_config_data,
    input config_en_0,
    input config_en_1,
    input [0:0] config_read,
    input [0:0] config_write,
    input [15:0] data_in_0,
    input [15:0] data_in_1,
    output [15:0] data_out_0,
    output [15:0] data_out_1,
    output [0:0] empty,
    input [0:0] flush,
    output [0:0] full,
    output [31:0] read_config_data,
    output [31:0] read_config_data_1,
    output [31:0] read_config_data_2,
    input [0:0] ren_in_0,
    input [0:0] ren_in_1,
    input reset,
    output [0:0] sram_ready_out,
    input [0:0] stall,
    output [0:0] valid_out_0,
    output [0:0] valid_out_1,
    input [0:0] wen_in_0,
    input [0:0] wen_in_1
);
wire [0:0] Invert1_inst0_out;
wire [0:0] Invert1_inst1_out;
wire [0:0] LakeTop_W_inst0_empty;
wire [1:0] LakeTop_W_inst0_valid_out;
wire [15:0] LakeTop_W_inst0_data_out_0;
wire [31:0] LakeTop_W_inst0_config_data_out_1;
wire [31:0] LakeTop_W_inst0_config_data_out_0;
wire [15:0] LakeTop_W_inst0_data_out_1;
wire [1:0] LakeTop_W_inst0_chain_valid_out;
wire [0:0] LakeTop_W_inst0_full;
wire [0:0] LakeTop_W_inst0_sram_ready_out;
wire [15:0] LakeTop_W_inst0_chain_data_out_0;
wire [15:0] LakeTop_W_inst0_chain_data_out_1;
wire [31:0] MuxWrapper_209_32_inst0_O;
wire [0:0] OR_CONFIG_EN_SRAM_0_out;
wire [0:0] OR_CONFIG_EN_SRAM_1_out;
wire [0:0] OR_CONFIG_RD_SRAM_out;
wire [0:0] OR_CONFIG_WR_SRAM_out;
wire [7:0] OR_config_addr_FEATURE_O;
wire [31:0] OR_config_data_FEATURE_O;
wire [31:0] ZextWrapper_10_32_inst0_O;
wire [31:0] ZextWrapper_10_32_inst1_O;
wire [31:0] ZextWrapper_12_32_inst0_O;
wire [31:0] ZextWrapper_12_32_inst1_O;
wire [31:0] ZextWrapper_16_32_inst0_O;
wire [31:0] ZextWrapper_16_32_inst1_O;
wire [31:0] ZextWrapper_16_32_inst10_O;
wire [31:0] ZextWrapper_16_32_inst11_O;
wire [31:0] ZextWrapper_16_32_inst12_O;
wire [31:0] ZextWrapper_16_32_inst13_O;
wire [31:0] ZextWrapper_16_32_inst14_O;
wire [31:0] ZextWrapper_16_32_inst15_O;
wire [31:0] ZextWrapper_16_32_inst16_O;
wire [31:0] ZextWrapper_16_32_inst17_O;
wire [31:0] ZextWrapper_16_32_inst18_O;
wire [31:0] ZextWrapper_16_32_inst19_O;
wire [31:0] ZextWrapper_16_32_inst2_O;
wire [31:0] ZextWrapper_16_32_inst20_O;
wire [31:0] ZextWrapper_16_32_inst21_O;
wire [31:0] ZextWrapper_16_32_inst22_O;
wire [31:0] ZextWrapper_16_32_inst23_O;
wire [31:0] ZextWrapper_16_32_inst24_O;
wire [31:0] ZextWrapper_16_32_inst25_O;
wire [31:0] ZextWrapper_16_32_inst26_O;
wire [31:0] ZextWrapper_16_32_inst27_O;
wire [31:0] ZextWrapper_16_32_inst28_O;
wire [31:0] ZextWrapper_16_32_inst29_O;
wire [31:0] ZextWrapper_16_32_inst3_O;
wire [31:0] ZextWrapper_16_32_inst30_O;
wire [31:0] ZextWrapper_16_32_inst31_O;
wire [31:0] ZextWrapper_16_32_inst32_O;
wire [31:0] ZextWrapper_16_32_inst33_O;
wire [31:0] ZextWrapper_16_32_inst34_O;
wire [31:0] ZextWrapper_16_32_inst35_O;
wire [31:0] ZextWrapper_16_32_inst36_O;
wire [31:0] ZextWrapper_16_32_inst37_O;
wire [31:0] ZextWrapper_16_32_inst38_O;
wire [31:0] ZextWrapper_16_32_inst39_O;
wire [31:0] ZextWrapper_16_32_inst4_O;
wire [31:0] ZextWrapper_16_32_inst40_O;
wire [31:0] ZextWrapper_16_32_inst41_O;
wire [31:0] ZextWrapper_16_32_inst42_O;
wire [31:0] ZextWrapper_16_32_inst43_O;
wire [31:0] ZextWrapper_16_32_inst44_O;
wire [31:0] ZextWrapper_16_32_inst45_O;
wire [31:0] ZextWrapper_16_32_inst46_O;
wire [31:0] ZextWrapper_16_32_inst47_O;
wire [31:0] ZextWrapper_16_32_inst48_O;
wire [31:0] ZextWrapper_16_32_inst49_O;
wire [31:0] ZextWrapper_16_32_inst5_O;
wire [31:0] ZextWrapper_16_32_inst50_O;
wire [31:0] ZextWrapper_16_32_inst51_O;
wire [31:0] ZextWrapper_16_32_inst52_O;
wire [31:0] ZextWrapper_16_32_inst53_O;
wire [31:0] ZextWrapper_16_32_inst54_O;
wire [31:0] ZextWrapper_16_32_inst55_O;
wire [31:0] ZextWrapper_16_32_inst56_O;
wire [31:0] ZextWrapper_16_32_inst57_O;
wire [31:0] ZextWrapper_16_32_inst58_O;
wire [31:0] ZextWrapper_16_32_inst59_O;
wire [31:0] ZextWrapper_16_32_inst6_O;
wire [31:0] ZextWrapper_16_32_inst60_O;
wire [31:0] ZextWrapper_16_32_inst61_O;
wire [31:0] ZextWrapper_16_32_inst62_O;
wire [31:0] ZextWrapper_16_32_inst63_O;
wire [31:0] ZextWrapper_16_32_inst64_O;
wire [31:0] ZextWrapper_16_32_inst65_O;
wire [31:0] ZextWrapper_16_32_inst66_O;
wire [31:0] ZextWrapper_16_32_inst67_O;
wire [31:0] ZextWrapper_16_32_inst68_O;
wire [31:0] ZextWrapper_16_32_inst69_O;
wire [31:0] ZextWrapper_16_32_inst7_O;
wire [31:0] ZextWrapper_16_32_inst70_O;
wire [31:0] ZextWrapper_16_32_inst71_O;
wire [31:0] ZextWrapper_16_32_inst72_O;
wire [31:0] ZextWrapper_16_32_inst8_O;
wire [31:0] ZextWrapper_16_32_inst9_O;
wire [31:0] ZextWrapper_1_32_inst0_O;
wire [31:0] ZextWrapper_1_32_inst1_O;
wire [31:0] ZextWrapper_1_32_inst10_O;
wire [31:0] ZextWrapper_1_32_inst11_O;
wire [31:0] ZextWrapper_1_32_inst12_O;
wire [31:0] ZextWrapper_1_32_inst13_O;
wire [31:0] ZextWrapper_1_32_inst14_O;
wire [31:0] ZextWrapper_1_32_inst15_O;
wire [31:0] ZextWrapper_1_32_inst16_O;
wire [31:0] ZextWrapper_1_32_inst17_O;
wire [31:0] ZextWrapper_1_32_inst18_O;
wire [31:0] ZextWrapper_1_32_inst19_O;
wire [31:0] ZextWrapper_1_32_inst2_O;
wire [31:0] ZextWrapper_1_32_inst20_O;
wire [31:0] ZextWrapper_1_32_inst21_O;
wire [31:0] ZextWrapper_1_32_inst22_O;
wire [31:0] ZextWrapper_1_32_inst23_O;
wire [31:0] ZextWrapper_1_32_inst24_O;
wire [31:0] ZextWrapper_1_32_inst25_O;
wire [31:0] ZextWrapper_1_32_inst26_O;
wire [31:0] ZextWrapper_1_32_inst27_O;
wire [31:0] ZextWrapper_1_32_inst28_O;
wire [31:0] ZextWrapper_1_32_inst3_O;
wire [31:0] ZextWrapper_1_32_inst4_O;
wire [31:0] ZextWrapper_1_32_inst5_O;
wire [31:0] ZextWrapper_1_32_inst6_O;
wire [31:0] ZextWrapper_1_32_inst7_O;
wire [31:0] ZextWrapper_1_32_inst8_O;
wire [31:0] ZextWrapper_1_32_inst9_O;
wire [31:0] ZextWrapper_2_32_inst0_O;
wire [31:0] ZextWrapper_2_32_inst1_O;
wire [31:0] ZextWrapper_2_32_inst10_O;
wire [31:0] ZextWrapper_2_32_inst11_O;
wire [31:0] ZextWrapper_2_32_inst12_O;
wire [31:0] ZextWrapper_2_32_inst13_O;
wire [31:0] ZextWrapper_2_32_inst14_O;
wire [31:0] ZextWrapper_2_32_inst15_O;
wire [31:0] ZextWrapper_2_32_inst16_O;
wire [31:0] ZextWrapper_2_32_inst17_O;
wire [31:0] ZextWrapper_2_32_inst18_O;
wire [31:0] ZextWrapper_2_32_inst19_O;
wire [31:0] ZextWrapper_2_32_inst2_O;
wire [31:0] ZextWrapper_2_32_inst20_O;
wire [31:0] ZextWrapper_2_32_inst21_O;
wire [31:0] ZextWrapper_2_32_inst22_O;
wire [31:0] ZextWrapper_2_32_inst23_O;
wire [31:0] ZextWrapper_2_32_inst24_O;
wire [31:0] ZextWrapper_2_32_inst25_O;
wire [31:0] ZextWrapper_2_32_inst26_O;
wire [31:0] ZextWrapper_2_32_inst27_O;
wire [31:0] ZextWrapper_2_32_inst28_O;
wire [31:0] ZextWrapper_2_32_inst29_O;
wire [31:0] ZextWrapper_2_32_inst3_O;
wire [31:0] ZextWrapper_2_32_inst30_O;
wire [31:0] ZextWrapper_2_32_inst31_O;
wire [31:0] ZextWrapper_2_32_inst32_O;
wire [31:0] ZextWrapper_2_32_inst33_O;
wire [31:0] ZextWrapper_2_32_inst34_O;
wire [31:0] ZextWrapper_2_32_inst35_O;
wire [31:0] ZextWrapper_2_32_inst36_O;
wire [31:0] ZextWrapper_2_32_inst37_O;
wire [31:0] ZextWrapper_2_32_inst38_O;
wire [31:0] ZextWrapper_2_32_inst39_O;
wire [31:0] ZextWrapper_2_32_inst4_O;
wire [31:0] ZextWrapper_2_32_inst40_O;
wire [31:0] ZextWrapper_2_32_inst41_O;
wire [31:0] ZextWrapper_2_32_inst42_O;
wire [31:0] ZextWrapper_2_32_inst43_O;
wire [31:0] ZextWrapper_2_32_inst44_O;
wire [31:0] ZextWrapper_2_32_inst45_O;
wire [31:0] ZextWrapper_2_32_inst46_O;
wire [31:0] ZextWrapper_2_32_inst47_O;
wire [31:0] ZextWrapper_2_32_inst48_O;
wire [31:0] ZextWrapper_2_32_inst49_O;
wire [31:0] ZextWrapper_2_32_inst5_O;
wire [31:0] ZextWrapper_2_32_inst50_O;
wire [31:0] ZextWrapper_2_32_inst51_O;
wire [31:0] ZextWrapper_2_32_inst52_O;
wire [31:0] ZextWrapper_2_32_inst53_O;
wire [31:0] ZextWrapper_2_32_inst54_O;
wire [31:0] ZextWrapper_2_32_inst55_O;
wire [31:0] ZextWrapper_2_32_inst56_O;
wire [31:0] ZextWrapper_2_32_inst57_O;
wire [31:0] ZextWrapper_2_32_inst58_O;
wire [31:0] ZextWrapper_2_32_inst59_O;
wire [31:0] ZextWrapper_2_32_inst6_O;
wire [31:0] ZextWrapper_2_32_inst60_O;
wire [31:0] ZextWrapper_2_32_inst61_O;
wire [31:0] ZextWrapper_2_32_inst62_O;
wire [31:0] ZextWrapper_2_32_inst63_O;
wire [31:0] ZextWrapper_2_32_inst64_O;
wire [31:0] ZextWrapper_2_32_inst65_O;
wire [31:0] ZextWrapper_2_32_inst66_O;
wire [31:0] ZextWrapper_2_32_inst67_O;
wire [31:0] ZextWrapper_2_32_inst68_O;
wire [31:0] ZextWrapper_2_32_inst69_O;
wire [31:0] ZextWrapper_2_32_inst7_O;
wire [31:0] ZextWrapper_2_32_inst70_O;
wire [31:0] ZextWrapper_2_32_inst71_O;
wire [31:0] ZextWrapper_2_32_inst72_O;
wire [31:0] ZextWrapper_2_32_inst73_O;
wire [31:0] ZextWrapper_2_32_inst74_O;
wire [31:0] ZextWrapper_2_32_inst8_O;
wire [31:0] ZextWrapper_2_32_inst9_O;
wire [31:0] ZextWrapper_30_32_inst0_O;
wire [31:0] ZextWrapper_30_32_inst1_O;
wire [31:0] ZextWrapper_30_32_inst10_O;
wire [31:0] ZextWrapper_30_32_inst11_O;
wire [31:0] ZextWrapper_30_32_inst2_O;
wire [31:0] ZextWrapper_30_32_inst3_O;
wire [31:0] ZextWrapper_30_32_inst4_O;
wire [31:0] ZextWrapper_30_32_inst5_O;
wire [31:0] ZextWrapper_30_32_inst6_O;
wire [31:0] ZextWrapper_30_32_inst7_O;
wire [31:0] ZextWrapper_30_32_inst8_O;
wire [31:0] ZextWrapper_30_32_inst9_O;
wire [31:0] ZextWrapper_4_32_inst0_O;
wire [31:0] ZextWrapper_4_32_inst1_O;
wire [31:0] ZextWrapper_4_32_inst10_O;
wire [31:0] ZextWrapper_4_32_inst11_O;
wire [31:0] ZextWrapper_4_32_inst2_O;
wire [31:0] ZextWrapper_4_32_inst3_O;
wire [31:0] ZextWrapper_4_32_inst4_O;
wire [31:0] ZextWrapper_4_32_inst5_O;
wire [31:0] ZextWrapper_4_32_inst6_O;
wire [31:0] ZextWrapper_4_32_inst7_O;
wire [31:0] ZextWrapper_4_32_inst8_O;
wire [31:0] ZextWrapper_4_32_inst9_O;
wire [31:0] ZextWrapper_6_32_inst0_O;
wire [31:0] ZextWrapper_6_32_inst1_O;
wire [31:0] ZextWrapper_7_32_inst0_O;
wire [31:0] ZextWrapper_7_32_inst1_O;
wire [0:0] chain_idx_input_O;
wire [0:0] chain_idx_output_O;
wire [0:0] chain_valid_in_0_reg_sel_O;
wire [0:0] chain_valid_in_0_reg_value_O;
wire [0:0] chain_valid_in_0_sel_O;
wire [0:0] chain_valid_in_1_reg_sel_O;
wire [0:0] chain_valid_in_1_reg_value_O;
wire [0:0] chain_valid_in_1_sel_O;
wire coreir_wrapInAsyncReset_inst0_out;
wire coreir_wrapOutAsyncReset_inst0_out;
wire [0:0] enable_chain_input_O;
wire [0:0] enable_chain_output_O;
wire [15:0] fifo_ctrl_fifo_depth_O;
wire [0:0] flush_reg_sel_O;
wire [0:0] flush_reg_value_O;
wire [0:0] flush_sel_O;
wire [1:0] mode_O;
wire [0:0] ren_in_0_reg_sel_O;
wire [0:0] ren_in_0_reg_value_O;
wire [0:0] ren_in_0_sel_O;
wire [0:0] ren_in_1_reg_sel_O;
wire [0:0] ren_in_1_reg_value_O;
wire [0:0] ren_in_1_sel_O;
wire [6:0] strg_ub_agg_align_0_line_length_O;
wire [6:0] strg_ub_agg_align_1_line_length_O;
wire [3:0] strg_ub_agg_in_0_in_period_O;
wire [1:0] strg_ub_agg_in_0_in_sched_0_O;
wire [1:0] strg_ub_agg_in_0_in_sched_1_O;
wire [1:0] strg_ub_agg_in_0_in_sched_10_O;
wire [1:0] strg_ub_agg_in_0_in_sched_11_O;
wire [1:0] strg_ub_agg_in_0_in_sched_12_O;
wire [1:0] strg_ub_agg_in_0_in_sched_13_O;
wire [1:0] strg_ub_agg_in_0_in_sched_14_O;
wire [1:0] strg_ub_agg_in_0_in_sched_15_O;
wire [1:0] strg_ub_agg_in_0_in_sched_2_O;
wire [1:0] strg_ub_agg_in_0_in_sched_3_O;
wire [1:0] strg_ub_agg_in_0_in_sched_4_O;
wire [1:0] strg_ub_agg_in_0_in_sched_5_O;
wire [1:0] strg_ub_agg_in_0_in_sched_6_O;
wire [1:0] strg_ub_agg_in_0_in_sched_7_O;
wire [1:0] strg_ub_agg_in_0_in_sched_8_O;
wire [1:0] strg_ub_agg_in_0_in_sched_9_O;
wire [3:0] strg_ub_agg_in_0_out_period_O;
wire [1:0] strg_ub_agg_in_0_out_sched_0_O;
wire [1:0] strg_ub_agg_in_0_out_sched_1_O;
wire [1:0] strg_ub_agg_in_0_out_sched_10_O;
wire [1:0] strg_ub_agg_in_0_out_sched_11_O;
wire [1:0] strg_ub_agg_in_0_out_sched_12_O;
wire [1:0] strg_ub_agg_in_0_out_sched_13_O;
wire [1:0] strg_ub_agg_in_0_out_sched_14_O;
wire [1:0] strg_ub_agg_in_0_out_sched_15_O;
wire [1:0] strg_ub_agg_in_0_out_sched_2_O;
wire [1:0] strg_ub_agg_in_0_out_sched_3_O;
wire [1:0] strg_ub_agg_in_0_out_sched_4_O;
wire [1:0] strg_ub_agg_in_0_out_sched_5_O;
wire [1:0] strg_ub_agg_in_0_out_sched_6_O;
wire [1:0] strg_ub_agg_in_0_out_sched_7_O;
wire [1:0] strg_ub_agg_in_0_out_sched_8_O;
wire [1:0] strg_ub_agg_in_0_out_sched_9_O;
wire [3:0] strg_ub_agg_in_1_in_period_O;
wire [1:0] strg_ub_agg_in_1_in_sched_0_O;
wire [1:0] strg_ub_agg_in_1_in_sched_1_O;
wire [1:0] strg_ub_agg_in_1_in_sched_10_O;
wire [1:0] strg_ub_agg_in_1_in_sched_11_O;
wire [1:0] strg_ub_agg_in_1_in_sched_12_O;
wire [1:0] strg_ub_agg_in_1_in_sched_13_O;
wire [1:0] strg_ub_agg_in_1_in_sched_14_O;
wire [1:0] strg_ub_agg_in_1_in_sched_15_O;
wire [1:0] strg_ub_agg_in_1_in_sched_2_O;
wire [1:0] strg_ub_agg_in_1_in_sched_3_O;
wire [1:0] strg_ub_agg_in_1_in_sched_4_O;
wire [1:0] strg_ub_agg_in_1_in_sched_5_O;
wire [1:0] strg_ub_agg_in_1_in_sched_6_O;
wire [1:0] strg_ub_agg_in_1_in_sched_7_O;
wire [1:0] strg_ub_agg_in_1_in_sched_8_O;
wire [1:0] strg_ub_agg_in_1_in_sched_9_O;
wire [3:0] strg_ub_agg_in_1_out_period_O;
wire [1:0] strg_ub_agg_in_1_out_sched_0_O;
wire [1:0] strg_ub_agg_in_1_out_sched_1_O;
wire [1:0] strg_ub_agg_in_1_out_sched_10_O;
wire [1:0] strg_ub_agg_in_1_out_sched_11_O;
wire [1:0] strg_ub_agg_in_1_out_sched_12_O;
wire [1:0] strg_ub_agg_in_1_out_sched_13_O;
wire [1:0] strg_ub_agg_in_1_out_sched_14_O;
wire [1:0] strg_ub_agg_in_1_out_sched_15_O;
wire [1:0] strg_ub_agg_in_1_out_sched_2_O;
wire [1:0] strg_ub_agg_in_1_out_sched_3_O;
wire [1:0] strg_ub_agg_in_1_out_sched_4_O;
wire [1:0] strg_ub_agg_in_1_out_sched_5_O;
wire [1:0] strg_ub_agg_in_1_out_sched_6_O;
wire [1:0] strg_ub_agg_in_1_out_sched_7_O;
wire [1:0] strg_ub_agg_in_1_out_sched_8_O;
wire [1:0] strg_ub_agg_in_1_out_sched_9_O;
wire [0:0] strg_ub_app_ctrl_coarse_input_port_0_O;
wire [0:0] strg_ub_app_ctrl_coarse_input_port_1_O;
wire [0:0] strg_ub_app_ctrl_coarse_output_port_0_O;
wire [0:0] strg_ub_app_ctrl_coarse_output_port_1_O;
wire [1:0] strg_ub_app_ctrl_coarse_prefill_O;
wire [15:0] strg_ub_app_ctrl_coarse_read_depth_0_O;
wire [15:0] strg_ub_app_ctrl_coarse_read_depth_1_O;
wire [15:0] strg_ub_app_ctrl_coarse_write_depth_ss_0_O;
wire [15:0] strg_ub_app_ctrl_coarse_write_depth_ss_1_O;
wire [15:0] strg_ub_app_ctrl_coarse_write_depth_wo_0_O;
wire [15:0] strg_ub_app_ctrl_coarse_write_depth_wo_1_O;
wire [0:0] strg_ub_app_ctrl_input_port_0_O;
wire [0:0] strg_ub_app_ctrl_input_port_1_O;
wire [0:0] strg_ub_app_ctrl_output_port_0_O;
wire [0:0] strg_ub_app_ctrl_output_port_1_O;
wire [1:0] strg_ub_app_ctrl_prefill_O;
wire [15:0] strg_ub_app_ctrl_ranges_0_O;
wire [15:0] strg_ub_app_ctrl_ranges_1_O;
wire [15:0] strg_ub_app_ctrl_ranges_2_O;
wire [15:0] strg_ub_app_ctrl_ranges_3_O;
wire [15:0] strg_ub_app_ctrl_read_depth_0_O;
wire [15:0] strg_ub_app_ctrl_read_depth_1_O;
wire [15:0] strg_ub_app_ctrl_threshold_0_O;
wire [15:0] strg_ub_app_ctrl_threshold_1_O;
wire [15:0] strg_ub_app_ctrl_threshold_2_O;
wire [15:0] strg_ub_app_ctrl_threshold_3_O;
wire [15:0] strg_ub_app_ctrl_write_depth_ss_0_O;
wire [15:0] strg_ub_app_ctrl_write_depth_ss_1_O;
wire [15:0] strg_ub_app_ctrl_write_depth_wo_0_O;
wire [15:0] strg_ub_app_ctrl_write_depth_wo_1_O;
wire [3:0] strg_ub_input_addr_ctrl_address_gen_0_dimensionality_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_0_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_1_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_2_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_3_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_4_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_ranges_5_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_starting_addr_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_0_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_1_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_2_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_3_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_4_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_0_strides_5_O;
wire [3:0] strg_ub_input_addr_ctrl_address_gen_1_dimensionality_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_0_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_1_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_2_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_3_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_4_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_ranges_5_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_starting_addr_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_0_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_1_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_2_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_3_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_4_O;
wire [15:0] strg_ub_input_addr_ctrl_address_gen_1_strides_5_O;
wire [3:0] strg_ub_output_addr_ctrl_address_gen_0_dimensionality_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_0_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_1_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_2_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_3_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_4_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_ranges_5_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_starting_addr_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_0_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_1_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_2_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_3_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_4_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_0_strides_5_O;
wire [3:0] strg_ub_output_addr_ctrl_address_gen_1_dimensionality_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_0_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_1_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_2_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_3_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_4_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_ranges_5_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_starting_addr_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_0_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_1_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_2_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_3_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_4_O;
wire [15:0] strg_ub_output_addr_ctrl_address_gen_1_strides_5_O;
wire [3:0] strg_ub_pre_fetch_0_input_latency_O;
wire [3:0] strg_ub_pre_fetch_1_input_latency_O;
wire [1:0] strg_ub_rate_matched_0_O;
wire [1:0] strg_ub_rate_matched_1_O;
wire [1:0] strg_ub_sync_grp_sync_group_0_O;
wire [1:0] strg_ub_sync_grp_sync_group_1_O;
wire [1:0] strg_ub_tb_0_dimensionality_O;
wire [29:0] strg_ub_tb_0_indices_merged_0_O;
wire [29:0] strg_ub_tb_0_indices_merged_10_O;
wire [29:0] strg_ub_tb_0_indices_merged_20_O;
wire [29:0] strg_ub_tb_0_indices_merged_30_O;
wire [29:0] strg_ub_tb_0_indices_merged_40_O;
wire [29:0] strg_ub_tb_0_indices_merged_50_O;
wire [11:0] strg_ub_tb_0_indices_merged_60_O;
wire [5:0] strg_ub_tb_0_range_inner_O;
wire [9:0] strg_ub_tb_0_range_outer_O;
wire [1:0] strg_ub_tb_0_starting_addr_O;
wire [3:0] strg_ub_tb_0_stride_O;
wire [0:0] strg_ub_tb_0_tb_height_O;
wire [1:0] strg_ub_tb_1_dimensionality_O;
wire [29:0] strg_ub_tb_1_indices_merged_0_O;
wire [29:0] strg_ub_tb_1_indices_merged_10_O;
wire [29:0] strg_ub_tb_1_indices_merged_20_O;
wire [29:0] strg_ub_tb_1_indices_merged_30_O;
wire [29:0] strg_ub_tb_1_indices_merged_40_O;
wire [29:0] strg_ub_tb_1_indices_merged_50_O;
wire [11:0] strg_ub_tb_1_indices_merged_60_O;
wire [5:0] strg_ub_tb_1_range_inner_O;
wire [9:0] strg_ub_tb_1_range_outer_O;
wire [1:0] strg_ub_tb_1_starting_addr_O;
wire [3:0] strg_ub_tb_1_stride_O;
wire [0:0] strg_ub_tb_1_tb_height_O;
wire [0:0] tile_en_O;
wire [0:0] wen_in_0_reg_sel_O;
wire [0:0] wen_in_0_reg_value_O;
wire [0:0] wen_in_0_sel_O;
wire [0:0] wen_in_1_reg_sel_O;
wire [0:0] wen_in_1_reg_value_O;
wire [0:0] wen_in_1_sel_O;
coreir_not #(
    .width(1)
) Invert1_inst0 (
    .in(coreir_wrapInAsyncReset_inst0_out),
    .out(Invert1_inst0_out)
);
coreir_not #(
    .width(1)
) Invert1_inst1 (
    .in(stall),
    .out(Invert1_inst1_out)
);
LakeTop_W LakeTop_W_inst0 (
    .strg_ub_input_addr_ctrl_address_gen_1_strides_2(strg_ub_input_addr_ctrl_address_gen_1_strides_2_O),
    .strg_ub_tb_1_indices_54(strg_ub_tb_1_indices_merged_50_O[14:12]),
    .strg_ub_output_addr_ctrl_address_gen_1_strides_2(strg_ub_output_addr_ctrl_address_gen_1_strides_2_O),
    .empty(LakeTop_W_inst0_empty),
    .strg_ub_agg_in_1_out_sched_10(strg_ub_agg_in_1_out_sched_10_O),
    .strg_ub_agg_in_0_in_sched_9(strg_ub_agg_in_0_in_sched_9_O),
    .strg_ub_tb_0_starting_addr(strg_ub_tb_0_starting_addr_O),
    .strg_ub_output_addr_ctrl_address_gen_0_ranges_1(strg_ub_output_addr_ctrl_address_gen_0_ranges_1_O),
    .strg_ub_input_addr_ctrl_address_gen_1_strides_4(strg_ub_input_addr_ctrl_address_gen_1_strides_4_O),
    .strg_ub_output_addr_ctrl_address_gen_0_strides_2(strg_ub_output_addr_ctrl_address_gen_0_strides_2_O),
    .strg_ub_tb_1_indices_61(strg_ub_tb_1_indices_merged_60_O[5:3]),
    .chain_data_in_1(chain_data_in_1),
    .strg_ub_agg_in_1_in_sched_15(strg_ub_agg_in_1_in_sched_15_O),
    .strg_ub_sync_grp_sync_group_0(strg_ub_sync_grp_sync_group_0_O),
    .strg_ub_tb_1_indices_20(strg_ub_tb_1_indices_merged_20_O[2:0]),
    .strg_ub_input_addr_ctrl_address_gen_1_strides_0(strg_ub_input_addr_ctrl_address_gen_1_strides_0_O),
    .strg_ub_tb_1_indices_25(strg_ub_tb_1_indices_merged_20_O[17:15]),
    .strg_ub_agg_in_0_out_sched_12(strg_ub_agg_in_0_out_sched_12_O),
    .strg_ub_output_addr_ctrl_address_gen_1_ranges_5(strg_ub_output_addr_ctrl_address_gen_1_ranges_5_O),
    .strg_ub_app_ctrl_input_port_1(strg_ub_app_ctrl_input_port_1_O),
    .strg_ub_agg_in_0_in_sched_1(strg_ub_agg_in_0_in_sched_1_O),
    .strg_ub_tb_0_indices_10(strg_ub_tb_0_indices_merged_10_O[2:0]),
    .strg_ub_tb_0_indices_33(strg_ub_tb_0_indices_merged_30_O[11:9]),
    .strg_ub_output_addr_ctrl_address_gen_0_ranges_4(strg_ub_output_addr_ctrl_address_gen_0_ranges_4_O),
    .strg_ub_app_ctrl_write_depth_ss_1(strg_ub_app_ctrl_write_depth_ss_1_O),
    .strg_ub_agg_in_1_out_sched_3(strg_ub_agg_in_1_out_sched_3_O),
    .strg_ub_tb_0_range_inner(strg_ub_tb_0_range_inner_O),
    .strg_ub_agg_in_0_out_sched_7(strg_ub_agg_in_0_out_sched_7_O),
    .strg_ub_tb_0_indices_56(strg_ub_tb_0_indices_merged_50_O[20:18]),
    .strg_ub_tb_0_indices_35(strg_ub_tb_0_indices_merged_30_O[17:15]),
    .valid_out(LakeTop_W_inst0_valid_out),
    .strg_ub_app_ctrl_coarse_prefill(strg_ub_app_ctrl_coarse_prefill_O),
    .strg_ub_agg_in_1_out_sched_6(strg_ub_agg_in_1_out_sched_6_O),
    .strg_ub_input_addr_ctrl_address_gen_0_ranges_1(strg_ub_input_addr_ctrl_address_gen_0_ranges_1_O),
    .strg_ub_tb_1_indices_12(strg_ub_tb_1_indices_merged_10_O[8:6]),
    .strg_ub_app_ctrl_read_depth_0(strg_ub_app_ctrl_read_depth_0_O),
    .strg_ub_tb_1_indices_63(strg_ub_tb_1_indices_merged_60_O[11:9]),
    .config_en({config_en_1,config_en_0}),
    .data_out_0(LakeTop_W_inst0_data_out_0),
    .strg_ub_input_addr_ctrl_address_gen_1_strides_3(strg_ub_input_addr_ctrl_address_gen_1_strides_3_O),
    .strg_ub_agg_in_1_in_sched_11(strg_ub_agg_in_1_in_sched_11_O),
    .strg_ub_tb_0_stride(strg_ub_tb_0_stride_O),
    .strg_ub_tb_1_indices_29(strg_ub_tb_1_indices_merged_20_O[29:27]),
    .strg_ub_app_ctrl_coarse_write_depth_ss_1(strg_ub_app_ctrl_coarse_write_depth_ss_1_O),
    .strg_ub_agg_in_1_in_sched_8(strg_ub_agg_in_1_in_sched_8_O),
    .strg_ub_tb_1_indices_15(strg_ub_tb_1_indices_merged_10_O[17:15]),
    .strg_ub_input_addr_ctrl_address_gen_1_ranges_4(strg_ub_input_addr_ctrl_address_gen_1_ranges_4_O),
    .strg_ub_agg_in_1_in_period(strg_ub_agg_in_1_in_period_O),
    .strg_ub_app_ctrl_write_depth_wo_0(strg_ub_app_ctrl_write_depth_wo_0_O),
    .strg_ub_output_addr_ctrl_address_gen_0_strides_3(strg_ub_output_addr_ctrl_address_gen_0_strides_3_O),
    .config_data_out_1(LakeTop_W_inst0_config_data_out_1),
    .strg_ub_input_addr_ctrl_address_gen_0_strides_3(strg_ub_input_addr_ctrl_address_gen_0_strides_3_O),
    .strg_ub_input_addr_ctrl_address_gen_0_ranges_2(strg_ub_input_addr_ctrl_address_gen_0_ranges_2_O),
    .strg_ub_tb_0_indices_5(strg_ub_tb_0_indices_merged_0_O[17:15]),
    .strg_ub_agg_in_0_in_sched_2(strg_ub_agg_in_0_in_sched_2_O),
    .enable_chain_output(enable_chain_output_O),
    .strg_ub_tb_0_indices_42(strg_ub_tb_0_indices_merged_40_O[8:6]),
    .wen_in({wen_in_1_sel_O[0],wen_in_0_sel_O[0]}),
    .strg_ub_tb_0_range_outer(strg_ub_tb_0_range_outer_O),
    .strg_ub_tb_1_indices_37(strg_ub_tb_1_indices_merged_30_O[23:21]),
    .strg_ub_app_ctrl_ranges_3(strg_ub_app_ctrl_ranges_3_O),
    .strg_ub_app_ctrl_write_depth_wo_1(strg_ub_app_ctrl_write_depth_wo_1_O),
    .strg_ub_tb_1_indices_34(strg_ub_tb_1_indices_merged_30_O[14:12]),
    .strg_ub_agg_in_0_in_sched_10(strg_ub_agg_in_0_in_sched_10_O),
    .strg_ub_tb_1_indices_9(strg_ub_tb_1_indices_merged_0_O[29:27]),
    .flush(flush_sel_O),
    .enable_chain_input(enable_chain_input_O),
    .strg_ub_tb_0_indices_13(strg_ub_tb_0_indices_merged_10_O[11:9]),
    .strg_ub_tb_1_indices_33(strg_ub_tb_1_indices_merged_30_O[11:9]),
    .strg_ub_tb_0_indices_0(strg_ub_tb_0_indices_merged_0_O[2:0]),
    .strg_ub_agg_in_0_in_sched_6(strg_ub_agg_in_0_in_sched_6_O),
    .strg_ub_input_addr_ctrl_address_gen_1_starting_addr(strg_ub_input_addr_ctrl_address_gen_1_starting_addr_O),
    .strg_ub_rate_matched_0(strg_ub_rate_matched_0_O),
    .chain_idx_output(chain_idx_output_O),
    .strg_ub_tb_1_stride(strg_ub_tb_1_stride_O),
    .strg_ub_tb_0_indices_1(strg_ub_tb_0_indices_merged_0_O[5:3]),
    .strg_ub_tb_1_indices_38(strg_ub_tb_1_indices_merged_30_O[26:24]),
    .strg_ub_agg_in_1_in_sched_2(strg_ub_agg_in_1_in_sched_2_O),
    .strg_ub_input_addr_ctrl_address_gen_0_strides_1(strg_ub_input_addr_ctrl_address_gen_0_strides_1_O),
    .strg_ub_tb_0_indices_63(strg_ub_tb_0_indices_merged_60_O[11:9]),
    .strg_ub_app_ctrl_coarse_output_port_1(strg_ub_app_ctrl_coarse_output_port_1_O),
    .strg_ub_tb_0_indices_18(strg_ub_tb_0_indices_merged_10_O[26:24]),
    .strg_ub_output_addr_ctrl_address_gen_1_ranges_0(strg_ub_output_addr_ctrl_address_gen_1_ranges_0_O),
    .strg_ub_tb_0_indices_22(strg_ub_tb_0_indices_merged_20_O[8:6]),
    .strg_ub_agg_in_1_out_sched_8(strg_ub_agg_in_1_out_sched_8_O),
    .strg_ub_tb_1_indices_11(strg_ub_tb_1_indices_merged_10_O[5:3]),
    .strg_ub_agg_in_1_in_sched_4(strg_ub_agg_in_1_in_sched_4_O),
    .strg_ub_tb_1_starting_addr(strg_ub_tb_1_starting_addr_O),
    .strg_ub_output_addr_ctrl_address_gen_0_ranges_5(strg_ub_output_addr_ctrl_address_gen_0_ranges_5_O),
    .strg_ub_tb_0_indices_4(strg_ub_tb_0_indices_merged_0_O[14:12]),
    .strg_ub_output_addr_ctrl_address_gen_1_strides_1(strg_ub_output_addr_ctrl_address_gen_1_strides_1_O),
    .strg_ub_input_addr_ctrl_address_gen_1_ranges_2(strg_ub_input_addr_ctrl_address_gen_1_ranges_2_O),
    .strg_ub_input_addr_ctrl_address_gen_1_dimensionality(strg_ub_input_addr_ctrl_address_gen_1_dimensionality_O),
    .clk_en(Invert1_inst1_out),
    .strg_ub_input_addr_ctrl_address_gen_1_ranges_3(strg_ub_input_addr_ctrl_address_gen_1_ranges_3_O),
    .strg_ub_agg_align_1_line_length(strg_ub_agg_align_1_line_length_O),
    .strg_ub_agg_in_1_in_sched_6(strg_ub_agg_in_1_in_sched_6_O),
    .strg_ub_input_addr_ctrl_address_gen_1_ranges_1(strg_ub_input_addr_ctrl_address_gen_1_ranges_1_O),
    .clk(clk),
    .strg_ub_tb_0_indices_37(strg_ub_tb_0_indices_merged_30_O[23:21]),
    .strg_ub_agg_in_1_out_sched_9(strg_ub_agg_in_1_out_sched_9_O),
    .strg_ub_app_ctrl_coarse_write_depth_wo_0(strg_ub_app_ctrl_coarse_write_depth_wo_0_O),
    .strg_ub_app_ctrl_output_port_0(strg_ub_app_ctrl_output_port_0_O),
    .strg_ub_tb_1_indices_4(strg_ub_tb_1_indices_merged_0_O[14:12]),
    .strg_ub_tb_1_indices_44(strg_ub_tb_1_indices_merged_40_O[14:12]),
    .strg_ub_agg_in_1_out_sched_5(strg_ub_agg_in_1_out_sched_5_O),
    .strg_ub_app_ctrl_coarse_output_port_0(strg_ub_app_ctrl_coarse_output_port_0_O),
    .strg_ub_output_addr_ctrl_address_gen_1_starting_addr(strg_ub_output_addr_ctrl_address_gen_1_starting_addr_O),
    .strg_ub_tb_0_indices_7(strg_ub_tb_0_indices_merged_0_O[23:21]),
    .strg_ub_tb_0_indices_48(strg_ub_tb_0_indices_merged_40_O[26:24]),
    .strg_ub_tb_1_indices_8(strg_ub_tb_1_indices_merged_0_O[26:24]),
    .strg_ub_output_addr_ctrl_address_gen_0_ranges_3(strg_ub_output_addr_ctrl_address_gen_0_ranges_3_O),
    .strg_ub_tb_0_tb_height(strg_ub_tb_0_tb_height_O),
    .strg_ub_tb_1_indices_19(strg_ub_tb_1_indices_merged_10_O[29:27]),
    .strg_ub_agg_in_0_in_sched_13(strg_ub_agg_in_0_in_sched_13_O),
    .strg_ub_tb_0_indices_51(strg_ub_tb_0_indices_merged_50_O[5:3]),
    .mode(mode_O),
    .ren_in({ren_in_1_sel_O[0],ren_in_0_sel_O[0]}),
    .strg_ub_app_ctrl_ranges_2(strg_ub_app_ctrl_ranges_2_O),
    .strg_ub_tb_0_indices_43(strg_ub_tb_0_indices_merged_40_O[11:9]),
    .strg_ub_agg_in_0_out_sched_5(strg_ub_agg_in_0_out_sched_5_O),
    .strg_ub_agg_in_0_out_period(strg_ub_agg_in_0_out_period_O),
    .strg_ub_tb_1_indices_52(strg_ub_tb_1_indices_merged_50_O[8:6]),
    .strg_ub_tb_1_indices_28(strg_ub_tb_1_indices_merged_20_O[26:24]),
    .strg_ub_agg_in_1_out_sched_1(strg_ub_agg_in_1_out_sched_1_O),
    .strg_ub_tb_1_indices_27(strg_ub_tb_1_indices_merged_20_O[23:21]),
    .config_write(OR_CONFIG_RD_SRAM_out),
    .strg_ub_input_addr_ctrl_address_gen_0_strides_5(strg_ub_input_addr_ctrl_address_gen_0_strides_5_O),
    .strg_ub_agg_in_0_out_sched_10(strg_ub_agg_in_0_out_sched_10_O),
    .strg_ub_agg_align_0_line_length(strg_ub_agg_align_0_line_length_O),
    .strg_ub_tb_0_indices_46(strg_ub_tb_0_indices_merged_40_O[20:18]),
    .strg_ub_output_addr_ctrl_address_gen_0_starting_addr(strg_ub_output_addr_ctrl_address_gen_0_starting_addr_O),
    .strg_ub_pre_fetch_0_input_latency(strg_ub_pre_fetch_0_input_latency_O),
    .strg_ub_tb_0_indices_21(strg_ub_tb_0_indices_merged_20_O[5:3]),
    .strg_ub_tb_0_indices_54(strg_ub_tb_0_indices_merged_50_O[14:12]),
    .strg_ub_tb_0_indices_57(strg_ub_tb_0_indices_merged_50_O[23:21]),
    .strg_ub_input_addr_ctrl_address_gen_0_ranges_0(strg_ub_input_addr_ctrl_address_gen_0_ranges_0_O),
    .strg_ub_output_addr_ctrl_address_gen_1_ranges_3(strg_ub_output_addr_ctrl_address_gen_1_ranges_3_O),
    .strg_ub_tb_1_indices_26(strg_ub_tb_1_indices_merged_20_O[20:18]),
    .config_data_in(OR_config_data_FEATURE_O),
    .strg_ub_agg_in_0_out_sched_1(strg_ub_agg_in_0_out_sched_1_O),
    .strg_ub_agg_in_0_out_sched_15(strg_ub_agg_in_0_out_sched_15_O),
    .strg_ub_agg_in_1_in_sched_0(strg_ub_agg_in_1_in_sched_0_O),
    .strg_ub_app_ctrl_ranges_1(strg_ub_app_ctrl_ranges_1_O),
    .strg_ub_agg_in_1_in_sched_1(strg_ub_agg_in_1_in_sched_1_O),
    .strg_ub_tb_0_indices_38(strg_ub_tb_0_indices_merged_30_O[26:24]),
    .strg_ub_tb_0_indices_23(strg_ub_tb_0_indices_merged_20_O[11:9]),
    .strg_ub_tb_0_indices_31(strg_ub_tb_0_indices_merged_30_O[5:3]),
    .strg_ub_tb_1_indices_40(strg_ub_tb_1_indices_merged_40_O[2:0]),
    .strg_ub_output_addr_ctrl_address_gen_0_ranges_0(strg_ub_output_addr_ctrl_address_gen_0_ranges_0_O),
    .strg_ub_output_addr_ctrl_address_gen_1_strides_3(strg_ub_output_addr_ctrl_address_gen_1_strides_3_O),
    .strg_ub_app_ctrl_threshold_2(strg_ub_app_ctrl_threshold_2_O),
    .strg_ub_agg_in_1_in_sched_14(strg_ub_agg_in_1_in_sched_14_O),
    .strg_ub_tb_1_indices_24(strg_ub_tb_1_indices_merged_20_O[14:12]),
    .strg_ub_tb_1_indices_43(strg_ub_tb_1_indices_merged_40_O[11:9]),
    .strg_ub_tb_0_indices_59(strg_ub_tb_0_indices_merged_50_O[29:27]),
    .strg_ub_tb_1_indices_50(strg_ub_tb_1_indices_merged_50_O[2:0]),
    .strg_ub_tb_1_indices_31(strg_ub_tb_1_indices_merged_30_O[5:3]),
    .strg_ub_tb_1_range_inner(strg_ub_tb_1_range_inner_O),
    .strg_ub_agg_in_0_in_sched_3(strg_ub_agg_in_0_in_sched_3_O),
    .strg_ub_output_addr_ctrl_address_gen_1_ranges_4(strg_ub_output_addr_ctrl_address_gen_1_ranges_4_O),
    .strg_ub_output_addr_ctrl_address_gen_0_strides_4(strg_ub_output_addr_ctrl_address_gen_0_strides_4_O),
    .strg_ub_input_addr_ctrl_address_gen_0_dimensionality(strg_ub_input_addr_ctrl_address_gen_0_dimensionality_O),
    .strg_ub_tb_0_indices_16(strg_ub_tb_0_indices_merged_10_O[20:18]),
    .strg_ub_tb_0_indices_27(strg_ub_tb_0_indices_merged_20_O[23:21]),
    .strg_ub_agg_in_1_in_sched_9(strg_ub_agg_in_1_in_sched_9_O),
    .config_data_out_0(LakeTop_W_inst0_config_data_out_0),
    .strg_ub_tb_0_indices_26(strg_ub_tb_0_indices_merged_20_O[20:18]),
    .strg_ub_agg_in_1_in_sched_10(strg_ub_agg_in_1_in_sched_10_O),
    .strg_ub_agg_in_0_out_sched_8(strg_ub_agg_in_0_out_sched_8_O),
    .strg_ub_agg_in_1_out_period(strg_ub_agg_in_1_out_period_O),
    .strg_ub_input_addr_ctrl_address_gen_0_strides_2(strg_ub_input_addr_ctrl_address_gen_0_strides_2_O),
    .strg_ub_tb_1_indices_41(strg_ub_tb_1_indices_merged_40_O[5:3]),
    .strg_ub_input_addr_ctrl_address_gen_1_ranges_0(strg_ub_input_addr_ctrl_address_gen_1_ranges_0_O),
    .config_addr_in(OR_config_addr_FEATURE_O),
    .strg_ub_tb_0_indices_50(strg_ub_tb_0_indices_merged_50_O[2:0]),
    .strg_ub_agg_in_0_in_sched_0(strg_ub_agg_in_0_in_sched_0_O),
    .strg_ub_tb_0_indices_28(strg_ub_tb_0_indices_merged_20_O[26:24]),
    .strg_ub_tb_1_indices_6(strg_ub_tb_1_indices_merged_0_O[20:18]),
    .strg_ub_tb_1_indices_14(strg_ub_tb_1_indices_merged_10_O[14:12]),
    .strg_ub_tb_1_indices_48(strg_ub_tb_1_indices_merged_40_O[26:24]),
    .fifo_ctrl_fifo_depth(fifo_ctrl_fifo_depth_O),
    .strg_ub_tb_1_indices_53(strg_ub_tb_1_indices_merged_50_O[11:9]),
    .strg_ub_tb_0_indices_40(strg_ub_tb_0_indices_merged_40_O[2:0]),
    .strg_ub_rate_matched_1(strg_ub_rate_matched_1_O),
    .strg_ub_agg_in_0_in_sched_14(strg_ub_agg_in_0_in_sched_14_O),
    .strg_ub_app_ctrl_ranges_0(strg_ub_app_ctrl_ranges_0_O),
    .strg_ub_agg_in_1_out_sched_0(strg_ub_agg_in_1_out_sched_0_O),
    .strg_ub_input_addr_ctrl_address_gen_0_ranges_5(strg_ub_input_addr_ctrl_address_gen_0_ranges_5_O),
    .strg_ub_agg_in_1_out_sched_2(strg_ub_agg_in_1_out_sched_2_O),
    .strg_ub_app_ctrl_coarse_input_port_1(strg_ub_app_ctrl_coarse_input_port_1_O),
    .strg_ub_agg_in_1_out_sched_4(strg_ub_agg_in_1_out_sched_4_O),
    .strg_ub_tb_0_indices_34(strg_ub_tb_0_indices_merged_30_O[14:12]),
    .strg_ub_tb_0_indices_36(strg_ub_tb_0_indices_merged_30_O[20:18]),
    .strg_ub_input_addr_ctrl_address_gen_1_strides_1(strg_ub_input_addr_ctrl_address_gen_1_strides_1_O),
    .strg_ub_tb_1_indices_36(strg_ub_tb_1_indices_merged_30_O[20:18]),
    .strg_ub_tb_0_indices_30(strg_ub_tb_0_indices_merged_30_O[2:0]),
    .strg_ub_agg_in_1_out_sched_11(strg_ub_agg_in_1_out_sched_11_O),
    .strg_ub_app_ctrl_coarse_read_depth_1(strg_ub_app_ctrl_coarse_read_depth_1_O),
    .strg_ub_tb_0_indices_14(strg_ub_tb_0_indices_merged_10_O[14:12]),
    .strg_ub_tb_0_dimensionality(strg_ub_tb_0_dimensionality_O),
    .chain_data_in_0(chain_data_in_0),
    .strg_ub_output_addr_ctrl_address_gen_1_strides_0(strg_ub_output_addr_ctrl_address_gen_1_strides_0_O),
    .strg_ub_sync_grp_sync_group_1(strg_ub_sync_grp_sync_group_1_O),
    .strg_ub_tb_1_indices_49(strg_ub_tb_1_indices_merged_40_O[29:27]),
    .strg_ub_tb_1_indices_45(strg_ub_tb_1_indices_merged_40_O[17:15]),
    .strg_ub_tb_1_indices_5(strg_ub_tb_1_indices_merged_0_O[17:15]),
    .data_in_1(data_in_1),
    .strg_ub_tb_1_indices_60(strg_ub_tb_1_indices_merged_60_O[2:0]),
    .strg_ub_app_ctrl_coarse_write_depth_ss_0(strg_ub_app_ctrl_coarse_write_depth_ss_0_O),
    .strg_ub_pre_fetch_1_input_latency(strg_ub_pre_fetch_1_input_latency_O),
    .strg_ub_input_addr_ctrl_address_gen_0_starting_addr(strg_ub_input_addr_ctrl_address_gen_0_starting_addr_O),
    .strg_ub_tb_0_indices_8(strg_ub_tb_0_indices_merged_0_O[26:24]),
    .chain_idx_input(chain_idx_input_O),
    .strg_ub_tb_0_indices_19(strg_ub_tb_0_indices_merged_10_O[29:27]),
    .strg_ub_output_addr_ctrl_address_gen_1_strides_5(strg_ub_output_addr_ctrl_address_gen_1_strides_5_O),
    .strg_ub_tb_0_indices_62(strg_ub_tb_0_indices_merged_60_O[8:6]),
    .strg_ub_output_addr_ctrl_address_gen_1_strides_4(strg_ub_output_addr_ctrl_address_gen_1_strides_4_O),
    .strg_ub_agg_in_1_out_sched_14(strg_ub_agg_in_1_out_sched_14_O),
    .strg_ub_tb_0_indices_20(strg_ub_tb_0_indices_merged_20_O[2:0]),
    .data_out_1(LakeTop_W_inst0_data_out_1),
    .strg_ub_agg_in_0_in_sched_15(strg_ub_agg_in_0_in_sched_15_O),
    .strg_ub_tb_1_indices_42(strg_ub_tb_1_indices_merged_40_O[8:6]),
    .strg_ub_tb_1_indices_62(strg_ub_tb_1_indices_merged_60_O[8:6]),
    .strg_ub_app_ctrl_threshold_3(strg_ub_app_ctrl_threshold_3_O),
    .strg_ub_tb_0_indices_29(strg_ub_tb_0_indices_merged_20_O[29:27]),
    .strg_ub_tb_1_indices_59(strg_ub_tb_1_indices_merged_50_O[29:27]),
    .strg_ub_output_addr_ctrl_address_gen_0_dimensionality(strg_ub_output_addr_ctrl_address_gen_0_dimensionality_O),
    .chain_valid_out(LakeTop_W_inst0_chain_valid_out),
    .full(LakeTop_W_inst0_full),
    .strg_ub_tb_1_indices_57(strg_ub_tb_1_indices_merged_50_O[23:21]),
    .strg_ub_tb_1_indices_13(strg_ub_tb_1_indices_merged_10_O[11:9]),
    .strg_ub_agg_in_0_out_sched_13(strg_ub_agg_in_0_out_sched_13_O),
    .strg_ub_tb_1_dimensionality(strg_ub_tb_1_dimensionality_O),
    .strg_ub_tb_1_indices_23(strg_ub_tb_1_indices_merged_20_O[11:9]),
    .strg_ub_input_addr_ctrl_address_gen_0_strides_4(strg_ub_input_addr_ctrl_address_gen_0_strides_4_O),
    .strg_ub_agg_in_0_out_sched_4(strg_ub_agg_in_0_out_sched_4_O),
    .strg_ub_tb_1_indices_17(strg_ub_tb_1_indices_merged_10_O[23:21]),
    .strg_ub_agg_in_1_out_sched_12(strg_ub_agg_in_1_out_sched_12_O),
    .strg_ub_agg_in_0_in_sched_8(strg_ub_agg_in_0_in_sched_8_O),
    .sram_ready_out(LakeTop_W_inst0_sram_ready_out),
    .strg_ub_tb_0_indices_60(strg_ub_tb_0_indices_merged_60_O[2:0]),
    .strg_ub_tb_0_indices_49(strg_ub_tb_0_indices_merged_40_O[29:27]),
    .strg_ub_tb_0_indices_9(strg_ub_tb_0_indices_merged_0_O[29:27]),
    .strg_ub_tb_0_indices_55(strg_ub_tb_0_indices_merged_50_O[17:15]),
    .strg_ub_tb_1_indices_22(strg_ub_tb_1_indices_merged_20_O[8:6]),
    .strg_ub_app_ctrl_coarse_write_depth_wo_1(strg_ub_app_ctrl_coarse_write_depth_wo_1_O),
    .chain_valid_in({chain_valid_in_1_sel_O[0],chain_valid_in_0_sel_O[0]}),
    .strg_ub_app_ctrl_output_port_1(strg_ub_app_ctrl_output_port_1_O),
    .strg_ub_tb_1_indices_32(strg_ub_tb_1_indices_merged_30_O[8:6]),
    .strg_ub_tb_1_indices_18(strg_ub_tb_1_indices_merged_10_O[26:24]),
    .strg_ub_output_addr_ctrl_address_gen_1_ranges_1(strg_ub_output_addr_ctrl_address_gen_1_ranges_1_O),
    .chain_data_out_0(LakeTop_W_inst0_chain_data_out_0),
    .strg_ub_input_addr_ctrl_address_gen_1_ranges_5(strg_ub_input_addr_ctrl_address_gen_1_ranges_5_O),
    .strg_ub_tb_0_indices_24(strg_ub_tb_0_indices_merged_20_O[14:12]),
    .strg_ub_tb_1_indices_10(strg_ub_tb_1_indices_merged_10_O[2:0]),
    .strg_ub_tb_0_indices_12(strg_ub_tb_0_indices_merged_10_O[8:6]),
    .strg_ub_app_ctrl_read_depth_1(strg_ub_app_ctrl_read_depth_1_O),
    .strg_ub_tb_1_indices_58(strg_ub_tb_1_indices_merged_50_O[26:24]),
    .strg_ub_agg_in_1_in_sched_3(strg_ub_agg_in_1_in_sched_3_O),
    .data_in_0(data_in_0),
    .strg_ub_agg_in_1_in_sched_13(strg_ub_agg_in_1_in_sched_13_O),
    .addr_in_1(addr_in_1),
    .strg_ub_agg_in_0_in_sched_12(strg_ub_agg_in_0_in_sched_12_O),
    .strg_ub_app_ctrl_write_depth_ss_0(strg_ub_app_ctrl_write_depth_ss_0_O),
    .strg_ub_output_addr_ctrl_address_gen_1_ranges_2(strg_ub_output_addr_ctrl_address_gen_1_ranges_2_O),
    .strg_ub_agg_in_0_out_sched_6(strg_ub_agg_in_0_out_sched_6_O),
    .strg_ub_agg_in_0_out_sched_2(strg_ub_agg_in_0_out_sched_2_O),
    .strg_ub_tb_1_indices_46(strg_ub_tb_1_indices_merged_40_O[20:18]),
    .strg_ub_tb_1_indices_55(strg_ub_tb_1_indices_merged_50_O[17:15]),
    .strg_ub_agg_in_1_out_sched_13(strg_ub_agg_in_1_out_sched_13_O),
    .strg_ub_tb_1_indices_51(strg_ub_tb_1_indices_merged_50_O[5:3]),
    .strg_ub_app_ctrl_input_port_0(strg_ub_app_ctrl_input_port_0_O),
    .strg_ub_tb_1_indices_30(strg_ub_tb_1_indices_merged_30_O[2:0]),
    .strg_ub_agg_in_1_out_sched_15(strg_ub_agg_in_1_out_sched_15_O),
    .strg_ub_agg_in_0_in_sched_7(strg_ub_agg_in_0_in_sched_7_O),
    .strg_ub_tb_0_indices_3(strg_ub_tb_0_indices_merged_0_O[11:9]),
    .strg_ub_app_ctrl_coarse_input_port_0(strg_ub_app_ctrl_coarse_input_port_0_O),
    .strg_ub_tb_1_indices_39(strg_ub_tb_1_indices_merged_30_O[29:27]),
    .strg_ub_tb_1_indices_1(strg_ub_tb_1_indices_merged_0_O[5:3]),
    .strg_ub_agg_in_0_out_sched_3(strg_ub_agg_in_0_out_sched_3_O),
    .strg_ub_tb_0_indices_44(strg_ub_tb_0_indices_merged_40_O[14:12]),
    .strg_ub_agg_in_1_in_sched_12(strg_ub_agg_in_1_in_sched_12_O),
    .tile_en(tile_en_O),
    .strg_ub_tb_1_indices_35(strg_ub_tb_1_indices_merged_30_O[17:15]),
    .strg_ub_agg_in_0_out_sched_9(strg_ub_agg_in_0_out_sched_9_O),
    .strg_ub_tb_1_range_outer(strg_ub_tb_1_range_outer_O),
    .strg_ub_tb_1_indices_0(strg_ub_tb_1_indices_merged_0_O[2:0]),
    .chain_data_out_1(LakeTop_W_inst0_chain_data_out_1),
    .strg_ub_tb_0_indices_15(strg_ub_tb_0_indices_merged_10_O[17:15]),
    .strg_ub_tb_1_indices_7(strg_ub_tb_1_indices_merged_0_O[23:21]),
    .strg_ub_agg_in_1_in_sched_7(strg_ub_agg_in_1_in_sched_7_O),
    .strg_ub_tb_1_tb_height(strg_ub_tb_1_tb_height_O),
    .strg_ub_app_ctrl_threshold_0(strg_ub_app_ctrl_threshold_0_O),
    .strg_ub_tb_1_indices_16(strg_ub_tb_1_indices_merged_10_O[20:18]),
    .strg_ub_tb_0_indices_11(strg_ub_tb_0_indices_merged_10_O[5:3]),
    .strg_ub_app_ctrl_coarse_read_depth_0(strg_ub_app_ctrl_coarse_read_depth_0_O),
    .strg_ub_agg_in_0_in_period(strg_ub_agg_in_0_in_period_O),
    .strg_ub_input_addr_ctrl_address_gen_0_ranges_4(strg_ub_input_addr_ctrl_address_gen_0_ranges_4_O),
    .strg_ub_tb_1_indices_56(strg_ub_tb_1_indices_merged_50_O[20:18]),
    .strg_ub_tb_0_indices_39(strg_ub_tb_0_indices_merged_30_O[29:27]),
    .strg_ub_output_addr_ctrl_address_gen_1_dimensionality(strg_ub_output_addr_ctrl_address_gen_1_dimensionality_O),
    .strg_ub_tb_0_indices_17(strg_ub_tb_0_indices_merged_10_O[23:21]),
    .strg_ub_tb_0_indices_61(strg_ub_tb_0_indices_merged_60_O[5:3]),
    .strg_ub_tb_0_indices_53(strg_ub_tb_0_indices_merged_50_O[11:9]),
    .strg_ub_agg_in_0_in_sched_5(strg_ub_agg_in_0_in_sched_5_O),
    .strg_ub_input_addr_ctrl_address_gen_0_strides_0(strg_ub_input_addr_ctrl_address_gen_0_strides_0_O),
    .strg_ub_tb_1_indices_47(strg_ub_tb_1_indices_merged_40_O[23:21]),
    .addr_in_0(addr_in_0),
    .strg_ub_tb_0_indices_52(strg_ub_tb_0_indices_merged_50_O[8:6]),
    .strg_ub_tb_1_indices_2(strg_ub_tb_1_indices_merged_0_O[8:6]),
    .rst_n(coreir_wrapOutAsyncReset_inst0_out),
    .strg_ub_tb_0_indices_41(strg_ub_tb_0_indices_merged_40_O[5:3]),
    .strg_ub_tb_0_indices_47(strg_ub_tb_0_indices_merged_40_O[23:21]),
    .strg_ub_tb_0_indices_25(strg_ub_tb_0_indices_merged_20_O[17:15]),
    .strg_ub_input_addr_ctrl_address_gen_1_strides_5(strg_ub_input_addr_ctrl_address_gen_1_strides_5_O),
    .strg_ub_output_addr_ctrl_address_gen_0_strides_0(strg_ub_output_addr_ctrl_address_gen_0_strides_0_O),
    .strg_ub_tb_0_indices_58(strg_ub_tb_0_indices_merged_50_O[26:24]),
    .strg_ub_agg_in_0_out_sched_14(strg_ub_agg_in_0_out_sched_14_O),
    .strg_ub_tb_0_indices_6(strg_ub_tb_0_indices_merged_0_O[20:18]),
    .strg_ub_output_addr_ctrl_address_gen_0_strides_5(strg_ub_output_addr_ctrl_address_gen_0_strides_5_O),
    .strg_ub_tb_0_indices_45(strg_ub_tb_0_indices_merged_40_O[17:15]),
    .strg_ub_agg_in_0_out_sched_11(strg_ub_agg_in_0_out_sched_11_O),
    .strg_ub_tb_0_indices_2(strg_ub_tb_0_indices_merged_0_O[8:6]),
    .strg_ub_agg_in_0_in_sched_11(strg_ub_agg_in_0_in_sched_11_O),
    .strg_ub_output_addr_ctrl_address_gen_0_strides_1(strg_ub_output_addr_ctrl_address_gen_0_strides_1_O),
    .strg_ub_tb_1_indices_3(strg_ub_tb_1_indices_merged_0_O[11:9]),
    .strg_ub_tb_1_indices_21(strg_ub_tb_1_indices_merged_20_O[5:3]),
    .config_read(OR_CONFIG_WR_SRAM_out),
    .strg_ub_output_addr_ctrl_address_gen_0_ranges_2(strg_ub_output_addr_ctrl_address_gen_0_ranges_2_O),
    .strg_ub_agg_in_0_in_sched_4(strg_ub_agg_in_0_in_sched_4_O),
    .strg_ub_app_ctrl_threshold_1(strg_ub_app_ctrl_threshold_1_O),
    .strg_ub_agg_in_0_out_sched_0(strg_ub_agg_in_0_out_sched_0_O),
    .strg_ub_agg_in_1_in_sched_5(strg_ub_agg_in_1_in_sched_5_O),
    .strg_ub_agg_in_1_out_sched_7(strg_ub_agg_in_1_out_sched_7_O),
    .strg_ub_input_addr_ctrl_address_gen_0_ranges_3(strg_ub_input_addr_ctrl_address_gen_0_ranges_3_O),
    .strg_ub_app_ctrl_prefill(strg_ub_app_ctrl_prefill_O),
    .strg_ub_tb_0_indices_32(strg_ub_tb_0_indices_merged_30_O[8:6])
);
MuxWrapper_209_32 MuxWrapper_209_32_inst0 (
    .I_0(ZextWrapper_1_32_inst0_O),
    .I_1(ZextWrapper_1_32_inst1_O),
    .I_10(ZextWrapper_1_32_inst9_O),
    .I_100(ZextWrapper_1_32_inst21_O),
    .I_101(ZextWrapper_2_32_inst66_O),
    .I_102(ZextWrapper_16_32_inst7_O),
    .I_103(ZextWrapper_16_32_inst8_O),
    .I_104(ZextWrapper_16_32_inst9_O),
    .I_105(ZextWrapper_16_32_inst10_O),
    .I_106(ZextWrapper_16_32_inst11_O),
    .I_107(ZextWrapper_16_32_inst12_O),
    .I_108(ZextWrapper_16_32_inst13_O),
    .I_109(ZextWrapper_16_32_inst14_O),
    .I_11(ZextWrapper_2_32_inst0_O),
    .I_110(ZextWrapper_16_32_inst15_O),
    .I_111(ZextWrapper_16_32_inst16_O),
    .I_112(ZextWrapper_16_32_inst17_O),
    .I_113(ZextWrapper_16_32_inst18_O),
    .I_114(ZextWrapper_16_32_inst19_O),
    .I_115(ZextWrapper_16_32_inst20_O),
    .I_116(ZextWrapper_4_32_inst4_O),
    .I_117(ZextWrapper_16_32_inst21_O),
    .I_118(ZextWrapper_16_32_inst22_O),
    .I_119(ZextWrapper_16_32_inst23_O),
    .I_12(ZextWrapper_1_32_inst10_O),
    .I_120(ZextWrapper_16_32_inst24_O),
    .I_121(ZextWrapper_16_32_inst25_O),
    .I_122(ZextWrapper_16_32_inst26_O),
    .I_123(ZextWrapper_16_32_inst27_O),
    .I_124(ZextWrapper_16_32_inst28_O),
    .I_125(ZextWrapper_16_32_inst29_O),
    .I_126(ZextWrapper_16_32_inst30_O),
    .I_127(ZextWrapper_16_32_inst31_O),
    .I_128(ZextWrapper_16_32_inst32_O),
    .I_129(ZextWrapper_16_32_inst33_O),
    .I_13(ZextWrapper_1_32_inst11_O),
    .I_130(ZextWrapper_4_32_inst5_O),
    .I_131(ZextWrapper_16_32_inst34_O),
    .I_132(ZextWrapper_16_32_inst35_O),
    .I_133(ZextWrapper_16_32_inst36_O),
    .I_134(ZextWrapper_16_32_inst37_O),
    .I_135(ZextWrapper_16_32_inst38_O),
    .I_136(ZextWrapper_16_32_inst39_O),
    .I_137(ZextWrapper_16_32_inst40_O),
    .I_138(ZextWrapper_16_32_inst41_O),
    .I_139(ZextWrapper_16_32_inst42_O),
    .I_14(ZextWrapper_1_32_inst12_O),
    .I_140(ZextWrapper_16_32_inst43_O),
    .I_141(ZextWrapper_16_32_inst44_O),
    .I_142(ZextWrapper_16_32_inst45_O),
    .I_143(ZextWrapper_16_32_inst46_O),
    .I_144(ZextWrapper_4_32_inst6_O),
    .I_145(ZextWrapper_16_32_inst47_O),
    .I_146(ZextWrapper_16_32_inst48_O),
    .I_147(ZextWrapper_16_32_inst49_O),
    .I_148(ZextWrapper_16_32_inst50_O),
    .I_149(ZextWrapper_16_32_inst51_O),
    .I_15(ZextWrapper_1_32_inst13_O),
    .I_150(ZextWrapper_16_32_inst52_O),
    .I_151(ZextWrapper_16_32_inst53_O),
    .I_152(ZextWrapper_16_32_inst54_O),
    .I_153(ZextWrapper_16_32_inst55_O),
    .I_154(ZextWrapper_16_32_inst56_O),
    .I_155(ZextWrapper_16_32_inst57_O),
    .I_156(ZextWrapper_16_32_inst58_O),
    .I_157(ZextWrapper_16_32_inst59_O),
    .I_158(ZextWrapper_4_32_inst7_O),
    .I_159(ZextWrapper_16_32_inst60_O),
    .I_16(ZextWrapper_7_32_inst0_O),
    .I_160(ZextWrapper_16_32_inst61_O),
    .I_161(ZextWrapper_16_32_inst62_O),
    .I_162(ZextWrapper_16_32_inst63_O),
    .I_163(ZextWrapper_16_32_inst64_O),
    .I_164(ZextWrapper_16_32_inst65_O),
    .I_165(ZextWrapper_16_32_inst66_O),
    .I_166(ZextWrapper_16_32_inst67_O),
    .I_167(ZextWrapper_16_32_inst68_O),
    .I_168(ZextWrapper_16_32_inst69_O),
    .I_169(ZextWrapper_16_32_inst70_O),
    .I_17(ZextWrapper_7_32_inst1_O),
    .I_170(ZextWrapper_16_32_inst71_O),
    .I_171(ZextWrapper_16_32_inst72_O),
    .I_172(ZextWrapper_4_32_inst8_O),
    .I_173(ZextWrapper_4_32_inst9_O),
    .I_174(ZextWrapper_2_32_inst67_O),
    .I_175(ZextWrapper_2_32_inst68_O),
    .I_176(ZextWrapper_2_32_inst69_O),
    .I_177(ZextWrapper_2_32_inst70_O),
    .I_178(ZextWrapper_2_32_inst71_O),
    .I_179(ZextWrapper_30_32_inst0_O),
    .I_18(ZextWrapper_4_32_inst0_O),
    .I_180(ZextWrapper_30_32_inst1_O),
    .I_181(ZextWrapper_30_32_inst2_O),
    .I_182(ZextWrapper_30_32_inst3_O),
    .I_183(ZextWrapper_30_32_inst4_O),
    .I_184(ZextWrapper_30_32_inst5_O),
    .I_185(ZextWrapper_12_32_inst0_O),
    .I_186(ZextWrapper_6_32_inst0_O),
    .I_187(ZextWrapper_10_32_inst0_O),
    .I_188(ZextWrapper_2_32_inst72_O),
    .I_189(ZextWrapper_4_32_inst10_O),
    .I_19(ZextWrapper_2_32_inst1_O),
    .I_190(ZextWrapper_1_32_inst22_O),
    .I_191(ZextWrapper_2_32_inst73_O),
    .I_192(ZextWrapper_30_32_inst6_O),
    .I_193(ZextWrapper_30_32_inst7_O),
    .I_194(ZextWrapper_30_32_inst8_O),
    .I_195(ZextWrapper_30_32_inst9_O),
    .I_196(ZextWrapper_30_32_inst10_O),
    .I_197(ZextWrapper_30_32_inst11_O),
    .I_198(ZextWrapper_12_32_inst1_O),
    .I_199(ZextWrapper_6_32_inst1_O),
    .I_2(ZextWrapper_1_32_inst2_O),
    .I_20(ZextWrapper_2_32_inst2_O),
    .I_200(ZextWrapper_10_32_inst1_O),
    .I_201(ZextWrapper_2_32_inst74_O),
    .I_202(ZextWrapper_4_32_inst11_O),
    .I_203(ZextWrapper_1_32_inst23_O),
    .I_204(ZextWrapper_1_32_inst24_O),
    .I_205(ZextWrapper_1_32_inst25_O),
    .I_206(ZextWrapper_1_32_inst26_O),
    .I_207(ZextWrapper_1_32_inst27_O),
    .I_208(ZextWrapper_1_32_inst28_O),
    .I_21(ZextWrapper_2_32_inst3_O),
    .I_22(ZextWrapper_2_32_inst4_O),
    .I_23(ZextWrapper_2_32_inst5_O),
    .I_24(ZextWrapper_2_32_inst6_O),
    .I_25(ZextWrapper_2_32_inst7_O),
    .I_26(ZextWrapper_2_32_inst8_O),
    .I_27(ZextWrapper_2_32_inst9_O),
    .I_28(ZextWrapper_2_32_inst10_O),
    .I_29(ZextWrapper_2_32_inst11_O),
    .I_3(ZextWrapper_1_32_inst3_O),
    .I_30(ZextWrapper_2_32_inst12_O),
    .I_31(ZextWrapper_2_32_inst13_O),
    .I_32(ZextWrapper_2_32_inst14_O),
    .I_33(ZextWrapper_2_32_inst15_O),
    .I_34(ZextWrapper_2_32_inst16_O),
    .I_35(ZextWrapper_4_32_inst1_O),
    .I_36(ZextWrapper_2_32_inst17_O),
    .I_37(ZextWrapper_2_32_inst18_O),
    .I_38(ZextWrapper_2_32_inst19_O),
    .I_39(ZextWrapper_2_32_inst20_O),
    .I_4(ZextWrapper_1_32_inst4_O),
    .I_40(ZextWrapper_2_32_inst21_O),
    .I_41(ZextWrapper_2_32_inst22_O),
    .I_42(ZextWrapper_2_32_inst23_O),
    .I_43(ZextWrapper_2_32_inst24_O),
    .I_44(ZextWrapper_2_32_inst25_O),
    .I_45(ZextWrapper_2_32_inst26_O),
    .I_46(ZextWrapper_2_32_inst27_O),
    .I_47(ZextWrapper_2_32_inst28_O),
    .I_48(ZextWrapper_2_32_inst29_O),
    .I_49(ZextWrapper_2_32_inst30_O),
    .I_5(ZextWrapper_1_32_inst5_O),
    .I_50(ZextWrapper_2_32_inst31_O),
    .I_51(ZextWrapper_2_32_inst32_O),
    .I_52(ZextWrapper_4_32_inst2_O),
    .I_53(ZextWrapper_2_32_inst33_O),
    .I_54(ZextWrapper_2_32_inst34_O),
    .I_55(ZextWrapper_2_32_inst35_O),
    .I_56(ZextWrapper_2_32_inst36_O),
    .I_57(ZextWrapper_2_32_inst37_O),
    .I_58(ZextWrapper_2_32_inst38_O),
    .I_59(ZextWrapper_2_32_inst39_O),
    .I_6(ZextWrapper_1_32_inst6_O),
    .I_60(ZextWrapper_2_32_inst40_O),
    .I_61(ZextWrapper_2_32_inst41_O),
    .I_62(ZextWrapper_2_32_inst42_O),
    .I_63(ZextWrapper_2_32_inst43_O),
    .I_64(ZextWrapper_2_32_inst44_O),
    .I_65(ZextWrapper_2_32_inst45_O),
    .I_66(ZextWrapper_2_32_inst46_O),
    .I_67(ZextWrapper_2_32_inst47_O),
    .I_68(ZextWrapper_2_32_inst48_O),
    .I_69(ZextWrapper_4_32_inst3_O),
    .I_7(ZextWrapper_1_32_inst7_O),
    .I_70(ZextWrapper_2_32_inst49_O),
    .I_71(ZextWrapper_2_32_inst50_O),
    .I_72(ZextWrapper_2_32_inst51_O),
    .I_73(ZextWrapper_2_32_inst52_O),
    .I_74(ZextWrapper_2_32_inst53_O),
    .I_75(ZextWrapper_2_32_inst54_O),
    .I_76(ZextWrapper_2_32_inst55_O),
    .I_77(ZextWrapper_2_32_inst56_O),
    .I_78(ZextWrapper_2_32_inst57_O),
    .I_79(ZextWrapper_2_32_inst58_O),
    .I_8(ZextWrapper_16_32_inst0_O),
    .I_80(ZextWrapper_2_32_inst59_O),
    .I_81(ZextWrapper_2_32_inst60_O),
    .I_82(ZextWrapper_2_32_inst61_O),
    .I_83(ZextWrapper_2_32_inst62_O),
    .I_84(ZextWrapper_2_32_inst63_O),
    .I_85(ZextWrapper_2_32_inst64_O),
    .I_86(ZextWrapper_1_32_inst14_O),
    .I_87(ZextWrapper_1_32_inst15_O),
    .I_88(ZextWrapper_1_32_inst16_O),
    .I_89(ZextWrapper_1_32_inst17_O),
    .I_9(ZextWrapper_1_32_inst8_O),
    .I_90(ZextWrapper_2_32_inst65_O),
    .I_91(ZextWrapper_16_32_inst1_O),
    .I_92(ZextWrapper_16_32_inst2_O),
    .I_93(ZextWrapper_16_32_inst3_O),
    .I_94(ZextWrapper_16_32_inst4_O),
    .I_95(ZextWrapper_16_32_inst5_O),
    .I_96(ZextWrapper_16_32_inst6_O),
    .I_97(ZextWrapper_1_32_inst18_O),
    .I_98(ZextWrapper_1_32_inst19_O),
    .I_99(ZextWrapper_1_32_inst20_O),
    .O(MuxWrapper_209_32_inst0_O),
    .S(config_config_addr)
);
coreir_or #(
    .width(1)
) OR_CONFIG_EN_SRAM_0 (
    .in0(config_1_write),
    .in1(config_1_read),
    .out(OR_CONFIG_EN_SRAM_0_out)
);
coreir_or #(
    .width(1)
) OR_CONFIG_EN_SRAM_1 (
    .in0(config_2_write),
    .in1(config_2_read),
    .out(OR_CONFIG_EN_SRAM_1_out)
);
coreir_or #(
    .width(1)
) OR_CONFIG_RD_SRAM (
    .in0(config_1_write),
    .in1(config_2_write),
    .out(OR_CONFIG_RD_SRAM_out)
);
coreir_or #(
    .width(1)
) OR_CONFIG_WR_SRAM (
    .in0(config_1_read),
    .in1(config_2_read),
    .out(OR_CONFIG_WR_SRAM_out)
);
Or3x8 OR_config_addr_FEATURE (
    .I0(config_config_addr),
    .I1(config_1_config_addr),
    .I2(config_2_config_addr),
    .O(OR_config_addr_FEATURE_O)
);
Or3x32 OR_config_data_FEATURE (
    .I0(config_config_data),
    .I1(config_1_config_data),
    .I2(config_2_config_data),
    .O(OR_config_data_FEATURE_O)
);
ZextWrapper_10_32 ZextWrapper_10_32_inst0 (
    .I(strg_ub_tb_0_range_outer_O),
    .O(ZextWrapper_10_32_inst0_O)
);
ZextWrapper_10_32 ZextWrapper_10_32_inst1 (
    .I(strg_ub_tb_1_range_outer_O),
    .O(ZextWrapper_10_32_inst1_O)
);
ZextWrapper_12_32 ZextWrapper_12_32_inst0 (
    .I(strg_ub_tb_0_indices_merged_60_O),
    .O(ZextWrapper_12_32_inst0_O)
);
ZextWrapper_12_32 ZextWrapper_12_32_inst1 (
    .I(strg_ub_tb_1_indices_merged_60_O),
    .O(ZextWrapper_12_32_inst1_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst0 (
    .I(fifo_ctrl_fifo_depth_O),
    .O(ZextWrapper_16_32_inst0_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst1 (
    .I(strg_ub_app_ctrl_coarse_read_depth_0_O),
    .O(ZextWrapper_16_32_inst1_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst10 (
    .I(strg_ub_app_ctrl_ranges_3_O),
    .O(ZextWrapper_16_32_inst10_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst11 (
    .I(strg_ub_app_ctrl_read_depth_0_O),
    .O(ZextWrapper_16_32_inst11_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst12 (
    .I(strg_ub_app_ctrl_read_depth_1_O),
    .O(ZextWrapper_16_32_inst12_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst13 (
    .I(strg_ub_app_ctrl_threshold_0_O),
    .O(ZextWrapper_16_32_inst13_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst14 (
    .I(strg_ub_app_ctrl_threshold_1_O),
    .O(ZextWrapper_16_32_inst14_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst15 (
    .I(strg_ub_app_ctrl_threshold_2_O),
    .O(ZextWrapper_16_32_inst15_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst16 (
    .I(strg_ub_app_ctrl_threshold_3_O),
    .O(ZextWrapper_16_32_inst16_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst17 (
    .I(strg_ub_app_ctrl_write_depth_ss_0_O),
    .O(ZextWrapper_16_32_inst17_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst18 (
    .I(strg_ub_app_ctrl_write_depth_ss_1_O),
    .O(ZextWrapper_16_32_inst18_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst19 (
    .I(strg_ub_app_ctrl_write_depth_wo_0_O),
    .O(ZextWrapper_16_32_inst19_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst2 (
    .I(strg_ub_app_ctrl_coarse_read_depth_1_O),
    .O(ZextWrapper_16_32_inst2_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst20 (
    .I(strg_ub_app_ctrl_write_depth_wo_1_O),
    .O(ZextWrapper_16_32_inst20_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst21 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_ranges_0_O),
    .O(ZextWrapper_16_32_inst21_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst22 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_ranges_1_O),
    .O(ZextWrapper_16_32_inst22_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst23 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_ranges_2_O),
    .O(ZextWrapper_16_32_inst23_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst24 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_ranges_3_O),
    .O(ZextWrapper_16_32_inst24_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst25 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_ranges_4_O),
    .O(ZextWrapper_16_32_inst25_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst26 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_ranges_5_O),
    .O(ZextWrapper_16_32_inst26_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst27 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_starting_addr_O),
    .O(ZextWrapper_16_32_inst27_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst28 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_strides_0_O),
    .O(ZextWrapper_16_32_inst28_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst29 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_strides_1_O),
    .O(ZextWrapper_16_32_inst29_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst3 (
    .I(strg_ub_app_ctrl_coarse_write_depth_ss_0_O),
    .O(ZextWrapper_16_32_inst3_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst30 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_strides_2_O),
    .O(ZextWrapper_16_32_inst30_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst31 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_strides_3_O),
    .O(ZextWrapper_16_32_inst31_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst32 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_strides_4_O),
    .O(ZextWrapper_16_32_inst32_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst33 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_strides_5_O),
    .O(ZextWrapper_16_32_inst33_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst34 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_ranges_0_O),
    .O(ZextWrapper_16_32_inst34_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst35 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_ranges_1_O),
    .O(ZextWrapper_16_32_inst35_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst36 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_ranges_2_O),
    .O(ZextWrapper_16_32_inst36_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst37 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_ranges_3_O),
    .O(ZextWrapper_16_32_inst37_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst38 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_ranges_4_O),
    .O(ZextWrapper_16_32_inst38_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst39 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_ranges_5_O),
    .O(ZextWrapper_16_32_inst39_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst4 (
    .I(strg_ub_app_ctrl_coarse_write_depth_ss_1_O),
    .O(ZextWrapper_16_32_inst4_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst40 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_starting_addr_O),
    .O(ZextWrapper_16_32_inst40_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst41 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_strides_0_O),
    .O(ZextWrapper_16_32_inst41_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst42 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_strides_1_O),
    .O(ZextWrapper_16_32_inst42_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst43 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_strides_2_O),
    .O(ZextWrapper_16_32_inst43_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst44 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_strides_3_O),
    .O(ZextWrapper_16_32_inst44_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst45 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_strides_4_O),
    .O(ZextWrapper_16_32_inst45_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst46 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_strides_5_O),
    .O(ZextWrapper_16_32_inst46_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst47 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_ranges_0_O),
    .O(ZextWrapper_16_32_inst47_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst48 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_ranges_1_O),
    .O(ZextWrapper_16_32_inst48_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst49 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_ranges_2_O),
    .O(ZextWrapper_16_32_inst49_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst5 (
    .I(strg_ub_app_ctrl_coarse_write_depth_wo_0_O),
    .O(ZextWrapper_16_32_inst5_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst50 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_ranges_3_O),
    .O(ZextWrapper_16_32_inst50_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst51 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_ranges_4_O),
    .O(ZextWrapper_16_32_inst51_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst52 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_ranges_5_O),
    .O(ZextWrapper_16_32_inst52_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst53 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_starting_addr_O),
    .O(ZextWrapper_16_32_inst53_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst54 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_strides_0_O),
    .O(ZextWrapper_16_32_inst54_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst55 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_strides_1_O),
    .O(ZextWrapper_16_32_inst55_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst56 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_strides_2_O),
    .O(ZextWrapper_16_32_inst56_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst57 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_strides_3_O),
    .O(ZextWrapper_16_32_inst57_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst58 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_strides_4_O),
    .O(ZextWrapper_16_32_inst58_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst59 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_strides_5_O),
    .O(ZextWrapper_16_32_inst59_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst6 (
    .I(strg_ub_app_ctrl_coarse_write_depth_wo_1_O),
    .O(ZextWrapper_16_32_inst6_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst60 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_ranges_0_O),
    .O(ZextWrapper_16_32_inst60_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst61 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_ranges_1_O),
    .O(ZextWrapper_16_32_inst61_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst62 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_ranges_2_O),
    .O(ZextWrapper_16_32_inst62_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst63 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_ranges_3_O),
    .O(ZextWrapper_16_32_inst63_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst64 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_ranges_4_O),
    .O(ZextWrapper_16_32_inst64_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst65 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_ranges_5_O),
    .O(ZextWrapper_16_32_inst65_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst66 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_starting_addr_O),
    .O(ZextWrapper_16_32_inst66_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst67 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_strides_0_O),
    .O(ZextWrapper_16_32_inst67_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst68 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_strides_1_O),
    .O(ZextWrapper_16_32_inst68_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst69 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_strides_2_O),
    .O(ZextWrapper_16_32_inst69_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst7 (
    .I(strg_ub_app_ctrl_ranges_0_O),
    .O(ZextWrapper_16_32_inst7_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst70 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_strides_3_O),
    .O(ZextWrapper_16_32_inst70_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst71 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_strides_4_O),
    .O(ZextWrapper_16_32_inst71_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst72 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_strides_5_O),
    .O(ZextWrapper_16_32_inst72_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst8 (
    .I(strg_ub_app_ctrl_ranges_1_O),
    .O(ZextWrapper_16_32_inst8_O)
);
ZextWrapper_16_32 ZextWrapper_16_32_inst9 (
    .I(strg_ub_app_ctrl_ranges_2_O),
    .O(ZextWrapper_16_32_inst9_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst0 (
    .I(chain_idx_input_O),
    .O(ZextWrapper_1_32_inst0_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst1 (
    .I(chain_idx_output_O),
    .O(ZextWrapper_1_32_inst1_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst10 (
    .I(ren_in_0_reg_sel_O),
    .O(ZextWrapper_1_32_inst10_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst11 (
    .I(ren_in_0_reg_value_O),
    .O(ZextWrapper_1_32_inst11_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst12 (
    .I(ren_in_1_reg_sel_O),
    .O(ZextWrapper_1_32_inst12_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst13 (
    .I(ren_in_1_reg_value_O),
    .O(ZextWrapper_1_32_inst13_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst14 (
    .I(strg_ub_app_ctrl_coarse_input_port_0_O),
    .O(ZextWrapper_1_32_inst14_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst15 (
    .I(strg_ub_app_ctrl_coarse_input_port_1_O),
    .O(ZextWrapper_1_32_inst15_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst16 (
    .I(strg_ub_app_ctrl_coarse_output_port_0_O),
    .O(ZextWrapper_1_32_inst16_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst17 (
    .I(strg_ub_app_ctrl_coarse_output_port_1_O),
    .O(ZextWrapper_1_32_inst17_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst18 (
    .I(strg_ub_app_ctrl_input_port_0_O),
    .O(ZextWrapper_1_32_inst18_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst19 (
    .I(strg_ub_app_ctrl_input_port_1_O),
    .O(ZextWrapper_1_32_inst19_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst2 (
    .I(chain_valid_in_0_reg_sel_O),
    .O(ZextWrapper_1_32_inst2_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst20 (
    .I(strg_ub_app_ctrl_output_port_0_O),
    .O(ZextWrapper_1_32_inst20_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst21 (
    .I(strg_ub_app_ctrl_output_port_1_O),
    .O(ZextWrapper_1_32_inst21_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst22 (
    .I(strg_ub_tb_0_tb_height_O),
    .O(ZextWrapper_1_32_inst22_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst23 (
    .I(strg_ub_tb_1_tb_height_O),
    .O(ZextWrapper_1_32_inst23_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst24 (
    .I(tile_en_O),
    .O(ZextWrapper_1_32_inst24_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst25 (
    .I(wen_in_0_reg_sel_O),
    .O(ZextWrapper_1_32_inst25_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst26 (
    .I(wen_in_0_reg_value_O),
    .O(ZextWrapper_1_32_inst26_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst27 (
    .I(wen_in_1_reg_sel_O),
    .O(ZextWrapper_1_32_inst27_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst28 (
    .I(wen_in_1_reg_value_O),
    .O(ZextWrapper_1_32_inst28_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst3 (
    .I(chain_valid_in_0_reg_value_O),
    .O(ZextWrapper_1_32_inst3_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst4 (
    .I(chain_valid_in_1_reg_sel_O),
    .O(ZextWrapper_1_32_inst4_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst5 (
    .I(chain_valid_in_1_reg_value_O),
    .O(ZextWrapper_1_32_inst5_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst6 (
    .I(enable_chain_input_O),
    .O(ZextWrapper_1_32_inst6_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst7 (
    .I(enable_chain_output_O),
    .O(ZextWrapper_1_32_inst7_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst8 (
    .I(flush_reg_sel_O),
    .O(ZextWrapper_1_32_inst8_O)
);
ZextWrapper_1_32 ZextWrapper_1_32_inst9 (
    .I(flush_reg_value_O),
    .O(ZextWrapper_1_32_inst9_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst0 (
    .I(mode_O),
    .O(ZextWrapper_2_32_inst0_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst1 (
    .I(strg_ub_agg_in_0_in_sched_0_O),
    .O(ZextWrapper_2_32_inst1_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst10 (
    .I(strg_ub_agg_in_0_in_sched_3_O),
    .O(ZextWrapper_2_32_inst10_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst11 (
    .I(strg_ub_agg_in_0_in_sched_4_O),
    .O(ZextWrapper_2_32_inst11_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst12 (
    .I(strg_ub_agg_in_0_in_sched_5_O),
    .O(ZextWrapper_2_32_inst12_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst13 (
    .I(strg_ub_agg_in_0_in_sched_6_O),
    .O(ZextWrapper_2_32_inst13_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst14 (
    .I(strg_ub_agg_in_0_in_sched_7_O),
    .O(ZextWrapper_2_32_inst14_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst15 (
    .I(strg_ub_agg_in_0_in_sched_8_O),
    .O(ZextWrapper_2_32_inst15_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst16 (
    .I(strg_ub_agg_in_0_in_sched_9_O),
    .O(ZextWrapper_2_32_inst16_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst17 (
    .I(strg_ub_agg_in_0_out_sched_0_O),
    .O(ZextWrapper_2_32_inst17_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst18 (
    .I(strg_ub_agg_in_0_out_sched_1_O),
    .O(ZextWrapper_2_32_inst18_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst19 (
    .I(strg_ub_agg_in_0_out_sched_10_O),
    .O(ZextWrapper_2_32_inst19_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst2 (
    .I(strg_ub_agg_in_0_in_sched_1_O),
    .O(ZextWrapper_2_32_inst2_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst20 (
    .I(strg_ub_agg_in_0_out_sched_11_O),
    .O(ZextWrapper_2_32_inst20_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst21 (
    .I(strg_ub_agg_in_0_out_sched_12_O),
    .O(ZextWrapper_2_32_inst21_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst22 (
    .I(strg_ub_agg_in_0_out_sched_13_O),
    .O(ZextWrapper_2_32_inst22_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst23 (
    .I(strg_ub_agg_in_0_out_sched_14_O),
    .O(ZextWrapper_2_32_inst23_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst24 (
    .I(strg_ub_agg_in_0_out_sched_15_O),
    .O(ZextWrapper_2_32_inst24_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst25 (
    .I(strg_ub_agg_in_0_out_sched_2_O),
    .O(ZextWrapper_2_32_inst25_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst26 (
    .I(strg_ub_agg_in_0_out_sched_3_O),
    .O(ZextWrapper_2_32_inst26_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst27 (
    .I(strg_ub_agg_in_0_out_sched_4_O),
    .O(ZextWrapper_2_32_inst27_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst28 (
    .I(strg_ub_agg_in_0_out_sched_5_O),
    .O(ZextWrapper_2_32_inst28_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst29 (
    .I(strg_ub_agg_in_0_out_sched_6_O),
    .O(ZextWrapper_2_32_inst29_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst3 (
    .I(strg_ub_agg_in_0_in_sched_10_O),
    .O(ZextWrapper_2_32_inst3_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst30 (
    .I(strg_ub_agg_in_0_out_sched_7_O),
    .O(ZextWrapper_2_32_inst30_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst31 (
    .I(strg_ub_agg_in_0_out_sched_8_O),
    .O(ZextWrapper_2_32_inst31_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst32 (
    .I(strg_ub_agg_in_0_out_sched_9_O),
    .O(ZextWrapper_2_32_inst32_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst33 (
    .I(strg_ub_agg_in_1_in_sched_0_O),
    .O(ZextWrapper_2_32_inst33_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst34 (
    .I(strg_ub_agg_in_1_in_sched_1_O),
    .O(ZextWrapper_2_32_inst34_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst35 (
    .I(strg_ub_agg_in_1_in_sched_10_O),
    .O(ZextWrapper_2_32_inst35_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst36 (
    .I(strg_ub_agg_in_1_in_sched_11_O),
    .O(ZextWrapper_2_32_inst36_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst37 (
    .I(strg_ub_agg_in_1_in_sched_12_O),
    .O(ZextWrapper_2_32_inst37_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst38 (
    .I(strg_ub_agg_in_1_in_sched_13_O),
    .O(ZextWrapper_2_32_inst38_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst39 (
    .I(strg_ub_agg_in_1_in_sched_14_O),
    .O(ZextWrapper_2_32_inst39_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst4 (
    .I(strg_ub_agg_in_0_in_sched_11_O),
    .O(ZextWrapper_2_32_inst4_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst40 (
    .I(strg_ub_agg_in_1_in_sched_15_O),
    .O(ZextWrapper_2_32_inst40_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst41 (
    .I(strg_ub_agg_in_1_in_sched_2_O),
    .O(ZextWrapper_2_32_inst41_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst42 (
    .I(strg_ub_agg_in_1_in_sched_3_O),
    .O(ZextWrapper_2_32_inst42_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst43 (
    .I(strg_ub_agg_in_1_in_sched_4_O),
    .O(ZextWrapper_2_32_inst43_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst44 (
    .I(strg_ub_agg_in_1_in_sched_5_O),
    .O(ZextWrapper_2_32_inst44_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst45 (
    .I(strg_ub_agg_in_1_in_sched_6_O),
    .O(ZextWrapper_2_32_inst45_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst46 (
    .I(strg_ub_agg_in_1_in_sched_7_O),
    .O(ZextWrapper_2_32_inst46_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst47 (
    .I(strg_ub_agg_in_1_in_sched_8_O),
    .O(ZextWrapper_2_32_inst47_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst48 (
    .I(strg_ub_agg_in_1_in_sched_9_O),
    .O(ZextWrapper_2_32_inst48_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst49 (
    .I(strg_ub_agg_in_1_out_sched_0_O),
    .O(ZextWrapper_2_32_inst49_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst5 (
    .I(strg_ub_agg_in_0_in_sched_12_O),
    .O(ZextWrapper_2_32_inst5_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst50 (
    .I(strg_ub_agg_in_1_out_sched_1_O),
    .O(ZextWrapper_2_32_inst50_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst51 (
    .I(strg_ub_agg_in_1_out_sched_10_O),
    .O(ZextWrapper_2_32_inst51_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst52 (
    .I(strg_ub_agg_in_1_out_sched_11_O),
    .O(ZextWrapper_2_32_inst52_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst53 (
    .I(strg_ub_agg_in_1_out_sched_12_O),
    .O(ZextWrapper_2_32_inst53_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst54 (
    .I(strg_ub_agg_in_1_out_sched_13_O),
    .O(ZextWrapper_2_32_inst54_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst55 (
    .I(strg_ub_agg_in_1_out_sched_14_O),
    .O(ZextWrapper_2_32_inst55_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst56 (
    .I(strg_ub_agg_in_1_out_sched_15_O),
    .O(ZextWrapper_2_32_inst56_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst57 (
    .I(strg_ub_agg_in_1_out_sched_2_O),
    .O(ZextWrapper_2_32_inst57_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst58 (
    .I(strg_ub_agg_in_1_out_sched_3_O),
    .O(ZextWrapper_2_32_inst58_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst59 (
    .I(strg_ub_agg_in_1_out_sched_4_O),
    .O(ZextWrapper_2_32_inst59_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst6 (
    .I(strg_ub_agg_in_0_in_sched_13_O),
    .O(ZextWrapper_2_32_inst6_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst60 (
    .I(strg_ub_agg_in_1_out_sched_5_O),
    .O(ZextWrapper_2_32_inst60_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst61 (
    .I(strg_ub_agg_in_1_out_sched_6_O),
    .O(ZextWrapper_2_32_inst61_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst62 (
    .I(strg_ub_agg_in_1_out_sched_7_O),
    .O(ZextWrapper_2_32_inst62_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst63 (
    .I(strg_ub_agg_in_1_out_sched_8_O),
    .O(ZextWrapper_2_32_inst63_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst64 (
    .I(strg_ub_agg_in_1_out_sched_9_O),
    .O(ZextWrapper_2_32_inst64_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst65 (
    .I(strg_ub_app_ctrl_coarse_prefill_O),
    .O(ZextWrapper_2_32_inst65_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst66 (
    .I(strg_ub_app_ctrl_prefill_O),
    .O(ZextWrapper_2_32_inst66_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst67 (
    .I(strg_ub_rate_matched_0_O),
    .O(ZextWrapper_2_32_inst67_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst68 (
    .I(strg_ub_rate_matched_1_O),
    .O(ZextWrapper_2_32_inst68_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst69 (
    .I(strg_ub_sync_grp_sync_group_0_O),
    .O(ZextWrapper_2_32_inst69_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst7 (
    .I(strg_ub_agg_in_0_in_sched_14_O),
    .O(ZextWrapper_2_32_inst7_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst70 (
    .I(strg_ub_sync_grp_sync_group_1_O),
    .O(ZextWrapper_2_32_inst70_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst71 (
    .I(strg_ub_tb_0_dimensionality_O),
    .O(ZextWrapper_2_32_inst71_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst72 (
    .I(strg_ub_tb_0_starting_addr_O),
    .O(ZextWrapper_2_32_inst72_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst73 (
    .I(strg_ub_tb_1_dimensionality_O),
    .O(ZextWrapper_2_32_inst73_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst74 (
    .I(strg_ub_tb_1_starting_addr_O),
    .O(ZextWrapper_2_32_inst74_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst8 (
    .I(strg_ub_agg_in_0_in_sched_15_O),
    .O(ZextWrapper_2_32_inst8_O)
);
ZextWrapper_2_32 ZextWrapper_2_32_inst9 (
    .I(strg_ub_agg_in_0_in_sched_2_O),
    .O(ZextWrapper_2_32_inst9_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst0 (
    .I(strg_ub_tb_0_indices_merged_0_O),
    .O(ZextWrapper_30_32_inst0_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst1 (
    .I(strg_ub_tb_0_indices_merged_10_O),
    .O(ZextWrapper_30_32_inst1_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst10 (
    .I(strg_ub_tb_1_indices_merged_40_O),
    .O(ZextWrapper_30_32_inst10_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst11 (
    .I(strg_ub_tb_1_indices_merged_50_O),
    .O(ZextWrapper_30_32_inst11_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst2 (
    .I(strg_ub_tb_0_indices_merged_20_O),
    .O(ZextWrapper_30_32_inst2_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst3 (
    .I(strg_ub_tb_0_indices_merged_30_O),
    .O(ZextWrapper_30_32_inst3_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst4 (
    .I(strg_ub_tb_0_indices_merged_40_O),
    .O(ZextWrapper_30_32_inst4_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst5 (
    .I(strg_ub_tb_0_indices_merged_50_O),
    .O(ZextWrapper_30_32_inst5_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst6 (
    .I(strg_ub_tb_1_indices_merged_0_O),
    .O(ZextWrapper_30_32_inst6_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst7 (
    .I(strg_ub_tb_1_indices_merged_10_O),
    .O(ZextWrapper_30_32_inst7_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst8 (
    .I(strg_ub_tb_1_indices_merged_20_O),
    .O(ZextWrapper_30_32_inst8_O)
);
ZextWrapper_30_32 ZextWrapper_30_32_inst9 (
    .I(strg_ub_tb_1_indices_merged_30_O),
    .O(ZextWrapper_30_32_inst9_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst0 (
    .I(strg_ub_agg_in_0_in_period_O),
    .O(ZextWrapper_4_32_inst0_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst1 (
    .I(strg_ub_agg_in_0_out_period_O),
    .O(ZextWrapper_4_32_inst1_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst10 (
    .I(strg_ub_tb_0_stride_O),
    .O(ZextWrapper_4_32_inst10_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst11 (
    .I(strg_ub_tb_1_stride_O),
    .O(ZextWrapper_4_32_inst11_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst2 (
    .I(strg_ub_agg_in_1_in_period_O),
    .O(ZextWrapper_4_32_inst2_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst3 (
    .I(strg_ub_agg_in_1_out_period_O),
    .O(ZextWrapper_4_32_inst3_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst4 (
    .I(strg_ub_input_addr_ctrl_address_gen_0_dimensionality_O),
    .O(ZextWrapper_4_32_inst4_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst5 (
    .I(strg_ub_input_addr_ctrl_address_gen_1_dimensionality_O),
    .O(ZextWrapper_4_32_inst5_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst6 (
    .I(strg_ub_output_addr_ctrl_address_gen_0_dimensionality_O),
    .O(ZextWrapper_4_32_inst6_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst7 (
    .I(strg_ub_output_addr_ctrl_address_gen_1_dimensionality_O),
    .O(ZextWrapper_4_32_inst7_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst8 (
    .I(strg_ub_pre_fetch_0_input_latency_O),
    .O(ZextWrapper_4_32_inst8_O)
);
ZextWrapper_4_32 ZextWrapper_4_32_inst9 (
    .I(strg_ub_pre_fetch_1_input_latency_O),
    .O(ZextWrapper_4_32_inst9_O)
);
ZextWrapper_6_32 ZextWrapper_6_32_inst0 (
    .I(strg_ub_tb_0_range_inner_O),
    .O(ZextWrapper_6_32_inst0_O)
);
ZextWrapper_6_32 ZextWrapper_6_32_inst1 (
    .I(strg_ub_tb_1_range_inner_O),
    .O(ZextWrapper_6_32_inst1_O)
);
ZextWrapper_7_32 ZextWrapper_7_32_inst0 (
    .I(strg_ub_agg_align_0_line_length_O),
    .O(ZextWrapper_7_32_inst0_O)
);
ZextWrapper_7_32 ZextWrapper_7_32_inst1 (
    .I(strg_ub_agg_align_1_line_length_O),
    .O(ZextWrapper_7_32_inst1_O)
);
ConfigRegister_1_8_32_0 chain_idx_input (
    .clk(clk),
    .reset(reset),
    .O(chain_idx_input_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_1 chain_idx_output (
    .clk(clk),
    .reset(reset),
    .O(chain_idx_output_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_2 chain_valid_in_0_reg_sel (
    .clk(clk),
    .reset(reset),
    .O(chain_valid_in_0_reg_sel_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_3 chain_valid_in_0_reg_value (
    .clk(clk),
    .reset(reset),
    .O(chain_valid_in_0_reg_value_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
MuxWrapper_2_1 chain_valid_in_0_sel (
    .I_0(chain_valid_in_0),
    .I_1(chain_valid_in_0_reg_value_O),
    .O(chain_valid_in_0_sel_O),
    .S(chain_valid_in_0_reg_sel_O)
);
ConfigRegister_1_8_32_4 chain_valid_in_1_reg_sel (
    .clk(clk),
    .reset(reset),
    .O(chain_valid_in_1_reg_sel_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_5 chain_valid_in_1_reg_value (
    .clk(clk),
    .reset(reset),
    .O(chain_valid_in_1_reg_value_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
MuxWrapper_2_1 chain_valid_in_1_sel (
    .I_0(chain_valid_in_1),
    .I_1(chain_valid_in_1_reg_value_O),
    .O(chain_valid_in_1_sel_O),
    .S(chain_valid_in_1_reg_sel_O)
);
coreir_wrap coreir_wrapInAsyncReset_inst0 (
    .in(reset),
    .out(coreir_wrapInAsyncReset_inst0_out)
);
coreir_wrap coreir_wrapOutAsyncReset_inst0 (
    .in(Invert1_inst0_out[0]),
    .out(coreir_wrapOutAsyncReset_inst0_out)
);
ConfigRegister_1_8_32_6 enable_chain_input (
    .clk(clk),
    .reset(reset),
    .O(enable_chain_input_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_7 enable_chain_output (
    .clk(clk),
    .reset(reset),
    .O(enable_chain_output_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_8 fifo_ctrl_fifo_depth (
    .clk(clk),
    .reset(reset),
    .O(fifo_ctrl_fifo_depth_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_9 flush_reg_sel (
    .clk(clk),
    .reset(reset),
    .O(flush_reg_sel_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_10 flush_reg_value (
    .clk(clk),
    .reset(reset),
    .O(flush_reg_value_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
MuxWrapper_2_1 flush_sel (
    .I_0(flush),
    .I_1(flush_reg_value_O),
    .O(flush_sel_O),
    .S(flush_reg_sel_O)
);
ConfigRegister_2_8_32_11 mode (
    .clk(clk),
    .reset(reset),
    .O(mode_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_12 ren_in_0_reg_sel (
    .clk(clk),
    .reset(reset),
    .O(ren_in_0_reg_sel_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_13 ren_in_0_reg_value (
    .clk(clk),
    .reset(reset),
    .O(ren_in_0_reg_value_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
MuxWrapper_2_1 ren_in_0_sel (
    .I_0(ren_in_0),
    .I_1(ren_in_0_reg_value_O),
    .O(ren_in_0_sel_O),
    .S(ren_in_0_reg_sel_O)
);
ConfigRegister_1_8_32_14 ren_in_1_reg_sel (
    .clk(clk),
    .reset(reset),
    .O(ren_in_1_reg_sel_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_15 ren_in_1_reg_value (
    .clk(clk),
    .reset(reset),
    .O(ren_in_1_reg_value_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
MuxWrapper_2_1 ren_in_1_sel (
    .I_0(ren_in_1),
    .I_1(ren_in_1_reg_value_O),
    .O(ren_in_1_sel_O),
    .S(ren_in_1_reg_sel_O)
);
ConfigRegister_7_8_32_16 strg_ub_agg_align_0_line_length (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_align_0_line_length_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_7_8_32_17 strg_ub_agg_align_1_line_length (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_align_1_line_length_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_18 strg_ub_agg_in_0_in_period (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_period_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_19 strg_ub_agg_in_0_in_sched_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_20 strg_ub_agg_in_0_in_sched_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_21 strg_ub_agg_in_0_in_sched_10 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_10_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_22 strg_ub_agg_in_0_in_sched_11 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_11_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_23 strg_ub_agg_in_0_in_sched_12 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_12_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_24 strg_ub_agg_in_0_in_sched_13 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_13_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_25 strg_ub_agg_in_0_in_sched_14 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_14_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_26 strg_ub_agg_in_0_in_sched_15 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_15_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_27 strg_ub_agg_in_0_in_sched_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_28 strg_ub_agg_in_0_in_sched_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_29 strg_ub_agg_in_0_in_sched_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_30 strg_ub_agg_in_0_in_sched_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_31 strg_ub_agg_in_0_in_sched_6 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_6_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_32 strg_ub_agg_in_0_in_sched_7 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_7_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_33 strg_ub_agg_in_0_in_sched_8 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_8_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_34 strg_ub_agg_in_0_in_sched_9 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_in_sched_9_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_35 strg_ub_agg_in_0_out_period (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_period_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_36 strg_ub_agg_in_0_out_sched_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_37 strg_ub_agg_in_0_out_sched_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_38 strg_ub_agg_in_0_out_sched_10 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_10_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_39 strg_ub_agg_in_0_out_sched_11 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_11_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_40 strg_ub_agg_in_0_out_sched_12 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_12_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_41 strg_ub_agg_in_0_out_sched_13 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_13_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_42 strg_ub_agg_in_0_out_sched_14 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_14_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_43 strg_ub_agg_in_0_out_sched_15 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_15_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_44 strg_ub_agg_in_0_out_sched_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_45 strg_ub_agg_in_0_out_sched_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_46 strg_ub_agg_in_0_out_sched_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_47 strg_ub_agg_in_0_out_sched_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_48 strg_ub_agg_in_0_out_sched_6 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_6_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_49 strg_ub_agg_in_0_out_sched_7 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_7_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_50 strg_ub_agg_in_0_out_sched_8 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_8_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_51 strg_ub_agg_in_0_out_sched_9 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_0_out_sched_9_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_52 strg_ub_agg_in_1_in_period (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_period_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_53 strg_ub_agg_in_1_in_sched_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_54 strg_ub_agg_in_1_in_sched_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_55 strg_ub_agg_in_1_in_sched_10 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_10_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_56 strg_ub_agg_in_1_in_sched_11 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_11_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_57 strg_ub_agg_in_1_in_sched_12 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_12_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_58 strg_ub_agg_in_1_in_sched_13 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_13_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_59 strg_ub_agg_in_1_in_sched_14 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_14_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_60 strg_ub_agg_in_1_in_sched_15 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_15_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_61 strg_ub_agg_in_1_in_sched_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_62 strg_ub_agg_in_1_in_sched_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_63 strg_ub_agg_in_1_in_sched_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_64 strg_ub_agg_in_1_in_sched_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_65 strg_ub_agg_in_1_in_sched_6 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_6_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_66 strg_ub_agg_in_1_in_sched_7 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_7_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_67 strg_ub_agg_in_1_in_sched_8 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_8_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_68 strg_ub_agg_in_1_in_sched_9 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_in_sched_9_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_69 strg_ub_agg_in_1_out_period (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_period_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_70 strg_ub_agg_in_1_out_sched_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_71 strg_ub_agg_in_1_out_sched_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_72 strg_ub_agg_in_1_out_sched_10 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_10_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_73 strg_ub_agg_in_1_out_sched_11 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_11_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_74 strg_ub_agg_in_1_out_sched_12 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_12_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_75 strg_ub_agg_in_1_out_sched_13 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_13_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_76 strg_ub_agg_in_1_out_sched_14 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_14_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_77 strg_ub_agg_in_1_out_sched_15 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_15_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_78 strg_ub_agg_in_1_out_sched_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_79 strg_ub_agg_in_1_out_sched_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_80 strg_ub_agg_in_1_out_sched_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_81 strg_ub_agg_in_1_out_sched_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_82 strg_ub_agg_in_1_out_sched_6 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_6_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_83 strg_ub_agg_in_1_out_sched_7 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_7_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_84 strg_ub_agg_in_1_out_sched_8 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_8_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_85 strg_ub_agg_in_1_out_sched_9 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_agg_in_1_out_sched_9_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_86 strg_ub_app_ctrl_coarse_input_port_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_input_port_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_87 strg_ub_app_ctrl_coarse_input_port_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_input_port_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_88 strg_ub_app_ctrl_coarse_output_port_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_output_port_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_89 strg_ub_app_ctrl_coarse_output_port_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_output_port_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_90 strg_ub_app_ctrl_coarse_prefill (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_prefill_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_91 strg_ub_app_ctrl_coarse_read_depth_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_read_depth_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_92 strg_ub_app_ctrl_coarse_read_depth_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_read_depth_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_93 strg_ub_app_ctrl_coarse_write_depth_ss_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_write_depth_ss_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_94 strg_ub_app_ctrl_coarse_write_depth_ss_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_write_depth_ss_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_95 strg_ub_app_ctrl_coarse_write_depth_wo_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_write_depth_wo_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_96 strg_ub_app_ctrl_coarse_write_depth_wo_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_coarse_write_depth_wo_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_97 strg_ub_app_ctrl_input_port_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_input_port_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_98 strg_ub_app_ctrl_input_port_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_input_port_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_99 strg_ub_app_ctrl_output_port_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_output_port_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_100 strg_ub_app_ctrl_output_port_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_output_port_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_101 strg_ub_app_ctrl_prefill (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_prefill_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_102 strg_ub_app_ctrl_ranges_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_ranges_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_103 strg_ub_app_ctrl_ranges_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_ranges_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_104 strg_ub_app_ctrl_ranges_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_ranges_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_105 strg_ub_app_ctrl_ranges_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_ranges_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_106 strg_ub_app_ctrl_read_depth_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_read_depth_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_107 strg_ub_app_ctrl_read_depth_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_read_depth_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_108 strg_ub_app_ctrl_threshold_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_threshold_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_109 strg_ub_app_ctrl_threshold_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_threshold_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_110 strg_ub_app_ctrl_threshold_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_threshold_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_111 strg_ub_app_ctrl_threshold_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_threshold_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_112 strg_ub_app_ctrl_write_depth_ss_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_write_depth_ss_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_113 strg_ub_app_ctrl_write_depth_ss_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_write_depth_ss_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_114 strg_ub_app_ctrl_write_depth_wo_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_write_depth_wo_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_115 strg_ub_app_ctrl_write_depth_wo_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_app_ctrl_write_depth_wo_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_116 strg_ub_input_addr_ctrl_address_gen_0_dimensionality (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_dimensionality_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_117 strg_ub_input_addr_ctrl_address_gen_0_ranges_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_ranges_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_118 strg_ub_input_addr_ctrl_address_gen_0_ranges_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_ranges_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_119 strg_ub_input_addr_ctrl_address_gen_0_ranges_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_ranges_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_120 strg_ub_input_addr_ctrl_address_gen_0_ranges_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_ranges_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_121 strg_ub_input_addr_ctrl_address_gen_0_ranges_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_ranges_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_122 strg_ub_input_addr_ctrl_address_gen_0_ranges_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_ranges_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_123 strg_ub_input_addr_ctrl_address_gen_0_starting_addr (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_starting_addr_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_124 strg_ub_input_addr_ctrl_address_gen_0_strides_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_strides_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_125 strg_ub_input_addr_ctrl_address_gen_0_strides_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_strides_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_126 strg_ub_input_addr_ctrl_address_gen_0_strides_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_strides_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_127 strg_ub_input_addr_ctrl_address_gen_0_strides_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_strides_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_128 strg_ub_input_addr_ctrl_address_gen_0_strides_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_strides_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_129 strg_ub_input_addr_ctrl_address_gen_0_strides_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_0_strides_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_130 strg_ub_input_addr_ctrl_address_gen_1_dimensionality (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_dimensionality_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_131 strg_ub_input_addr_ctrl_address_gen_1_ranges_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_ranges_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_132 strg_ub_input_addr_ctrl_address_gen_1_ranges_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_ranges_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_133 strg_ub_input_addr_ctrl_address_gen_1_ranges_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_ranges_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_134 strg_ub_input_addr_ctrl_address_gen_1_ranges_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_ranges_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_135 strg_ub_input_addr_ctrl_address_gen_1_ranges_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_ranges_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_136 strg_ub_input_addr_ctrl_address_gen_1_ranges_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_ranges_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_137 strg_ub_input_addr_ctrl_address_gen_1_starting_addr (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_starting_addr_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_138 strg_ub_input_addr_ctrl_address_gen_1_strides_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_strides_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_139 strg_ub_input_addr_ctrl_address_gen_1_strides_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_strides_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_140 strg_ub_input_addr_ctrl_address_gen_1_strides_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_strides_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_141 strg_ub_input_addr_ctrl_address_gen_1_strides_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_strides_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_142 strg_ub_input_addr_ctrl_address_gen_1_strides_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_strides_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_143 strg_ub_input_addr_ctrl_address_gen_1_strides_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_input_addr_ctrl_address_gen_1_strides_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_144 strg_ub_output_addr_ctrl_address_gen_0_dimensionality (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_dimensionality_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_145 strg_ub_output_addr_ctrl_address_gen_0_ranges_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_ranges_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_146 strg_ub_output_addr_ctrl_address_gen_0_ranges_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_ranges_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_147 strg_ub_output_addr_ctrl_address_gen_0_ranges_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_ranges_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_148 strg_ub_output_addr_ctrl_address_gen_0_ranges_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_ranges_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_149 strg_ub_output_addr_ctrl_address_gen_0_ranges_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_ranges_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_150 strg_ub_output_addr_ctrl_address_gen_0_ranges_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_ranges_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_151 strg_ub_output_addr_ctrl_address_gen_0_starting_addr (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_starting_addr_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_152 strg_ub_output_addr_ctrl_address_gen_0_strides_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_strides_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_153 strg_ub_output_addr_ctrl_address_gen_0_strides_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_strides_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_154 strg_ub_output_addr_ctrl_address_gen_0_strides_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_strides_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_155 strg_ub_output_addr_ctrl_address_gen_0_strides_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_strides_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_156 strg_ub_output_addr_ctrl_address_gen_0_strides_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_strides_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_157 strg_ub_output_addr_ctrl_address_gen_0_strides_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_0_strides_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_158 strg_ub_output_addr_ctrl_address_gen_1_dimensionality (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_dimensionality_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_159 strg_ub_output_addr_ctrl_address_gen_1_ranges_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_ranges_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_160 strg_ub_output_addr_ctrl_address_gen_1_ranges_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_ranges_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_161 strg_ub_output_addr_ctrl_address_gen_1_ranges_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_ranges_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_162 strg_ub_output_addr_ctrl_address_gen_1_ranges_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_ranges_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_163 strg_ub_output_addr_ctrl_address_gen_1_ranges_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_ranges_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_164 strg_ub_output_addr_ctrl_address_gen_1_ranges_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_ranges_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_165 strg_ub_output_addr_ctrl_address_gen_1_starting_addr (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_starting_addr_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_166 strg_ub_output_addr_ctrl_address_gen_1_strides_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_strides_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_167 strg_ub_output_addr_ctrl_address_gen_1_strides_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_strides_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_168 strg_ub_output_addr_ctrl_address_gen_1_strides_2 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_strides_2_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_169 strg_ub_output_addr_ctrl_address_gen_1_strides_3 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_strides_3_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_170 strg_ub_output_addr_ctrl_address_gen_1_strides_4 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_strides_4_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_16_8_32_171 strg_ub_output_addr_ctrl_address_gen_1_strides_5 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_output_addr_ctrl_address_gen_1_strides_5_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_172 strg_ub_pre_fetch_0_input_latency (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_pre_fetch_0_input_latency_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_173 strg_ub_pre_fetch_1_input_latency (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_pre_fetch_1_input_latency_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_174 strg_ub_rate_matched_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_rate_matched_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_175 strg_ub_rate_matched_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_rate_matched_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_176 strg_ub_sync_grp_sync_group_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_sync_grp_sync_group_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_177 strg_ub_sync_grp_sync_group_1 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_sync_grp_sync_group_1_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_178 strg_ub_tb_0_dimensionality (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_dimensionality_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_179 strg_ub_tb_0_indices_merged_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_indices_merged_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_180 strg_ub_tb_0_indices_merged_10 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_indices_merged_10_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_181 strg_ub_tb_0_indices_merged_20 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_indices_merged_20_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_182 strg_ub_tb_0_indices_merged_30 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_indices_merged_30_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_183 strg_ub_tb_0_indices_merged_40 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_indices_merged_40_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_184 strg_ub_tb_0_indices_merged_50 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_indices_merged_50_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_12_8_32_185 strg_ub_tb_0_indices_merged_60 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_indices_merged_60_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_6_8_32_186 strg_ub_tb_0_range_inner (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_range_inner_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_10_8_32_187 strg_ub_tb_0_range_outer (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_range_outer_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_188 strg_ub_tb_0_starting_addr (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_starting_addr_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_189 strg_ub_tb_0_stride (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_stride_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_190 strg_ub_tb_0_tb_height (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_0_tb_height_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_191 strg_ub_tb_1_dimensionality (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_dimensionality_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_192 strg_ub_tb_1_indices_merged_0 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_indices_merged_0_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_193 strg_ub_tb_1_indices_merged_10 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_indices_merged_10_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_194 strg_ub_tb_1_indices_merged_20 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_indices_merged_20_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_195 strg_ub_tb_1_indices_merged_30 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_indices_merged_30_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_196 strg_ub_tb_1_indices_merged_40 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_indices_merged_40_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_30_8_32_197 strg_ub_tb_1_indices_merged_50 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_indices_merged_50_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_12_8_32_198 strg_ub_tb_1_indices_merged_60 (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_indices_merged_60_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_6_8_32_199 strg_ub_tb_1_range_inner (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_range_inner_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_10_8_32_200 strg_ub_tb_1_range_outer (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_range_outer_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_2_8_32_201 strg_ub_tb_1_starting_addr (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_starting_addr_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_4_8_32_202 strg_ub_tb_1_stride (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_stride_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_203 strg_ub_tb_1_tb_height (
    .clk(clk),
    .reset(reset),
    .O(strg_ub_tb_1_tb_height_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_204 tile_en (
    .clk(clk),
    .reset(reset),
    .O(tile_en_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_205 wen_in_0_reg_sel (
    .clk(clk),
    .reset(reset),
    .O(wen_in_0_reg_sel_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_206 wen_in_0_reg_value (
    .clk(clk),
    .reset(reset),
    .O(wen_in_0_reg_value_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
MuxWrapper_2_1 wen_in_0_sel (
    .I_0(wen_in_0),
    .I_1(wen_in_0_reg_value_O),
    .O(wen_in_0_sel_O),
    .S(wen_in_0_reg_sel_O)
);
ConfigRegister_1_8_32_207 wen_in_1_reg_sel (
    .clk(clk),
    .reset(reset),
    .O(wen_in_1_reg_sel_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
ConfigRegister_1_8_32_208 wen_in_1_reg_value (
    .clk(clk),
    .reset(reset),
    .O(wen_in_1_reg_value_O),
    .config_addr(config_config_addr),
    .config_data(config_config_data),
    .config_en(config_write[0])
);
MuxWrapper_2_1 wen_in_1_sel (
    .I_0(wen_in_1),
    .I_1(wen_in_1_reg_value_O),
    .O(wen_in_1_sel_O),
    .S(wen_in_1_reg_sel_O)
);
assign chain_data_out_0 = LakeTop_W_inst0_chain_data_out_0;
assign chain_data_out_1 = LakeTop_W_inst0_chain_data_out_1;
assign chain_valid_out_0 = LakeTop_W_inst0_chain_valid_out[0];
assign chain_valid_out_1 = LakeTop_W_inst0_chain_valid_out[1];
assign data_out_0 = LakeTop_W_inst0_data_out_0;
assign data_out_1 = LakeTop_W_inst0_data_out_1;
assign empty = LakeTop_W_inst0_empty;
assign full = LakeTop_W_inst0_full;
assign read_config_data = MuxWrapper_209_32_inst0_O;
assign read_config_data_1 = LakeTop_W_inst0_config_data_out_0;
assign read_config_data_2 = LakeTop_W_inst0_config_data_out_1;
assign sram_ready_out = LakeTop_W_inst0_sram_ready_out;
assign valid_out_0 = LakeTop_W_inst0_valid_out[0];
assign valid_out_1 = LakeTop_W_inst0_valid_out[1];
endmodule

