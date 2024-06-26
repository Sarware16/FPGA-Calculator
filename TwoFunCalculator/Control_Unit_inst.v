// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.


// Generated by Quartus Prime Version 22.1 (Build Build 922 07/20/2023)
// Created on Tue Dec  5 02:50:38 2023

Control_Unit Control_Unit_inst
(
	.clock(clock_sig) ,	// input  clock_sig
	.ClearEntry(ClearEntry_sig) ,	// input  ClearEntry_sig
	.ClearAll(ClearAll_sig) ,	// input  ClearAll_sig
	.trig(trig_sig) ,	// input  trig_sig
	.InA(InA_sig) ,	// input  InA_sig
	.InB(InB_sig) ,	// input  InB_sig
	.InR(InR_sig) ,	// input  InR_sig
	.LoadA(LoadA_sig) ,	// output  LoadA_sig
	.LoadB(LoadB_sig) ,	// output  LoadB_sig
	.AddSub(AddSub_sig) ,	// output  AddSub_sig
	.LoadR(LoadR_sig) ,	// output  LoadR_sig
	.LoadOU(LoadOU_sig) ,	// output  LoadOU_sig
	.IUAU(IUAU_sig) ,	// output  IUAU_sig
	.slow_clock(slow_clock_sig) ,	// output  slow_clock_sig
	.reset(reset_sig) 	// output  reset_sig
);

defparam Control_Unit_inst.S0 = 'b000;
defparam Control_Unit_inst.S1 = 'b001;
defparam Control_Unit_inst.S2 = 'b010;
defparam Control_Unit_inst.S3 = 'b011;
defparam Control_Unit_inst.S4 = 'b100;
