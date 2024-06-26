module TwoFuncCalculator(
    input [3:0] Row,
    input clk,
    input clearentry,
    input clearall,
    output [3:0] Col,
    output [6:0] HEX0, HEX1, HEX2, HEX3,
	 output wire [2:0] state, next_state
);

    wire [7:0] Input2AU;
    wire [7:0] AU2Output;
    wire [3:0] value;
	 wire [7:0] OUnum;
    wire trig;
    wire slow_clock;
    wire internal_reset; // Internal reset controlled by Control_Unit
    wire ldA, ldB, ldR, ldOU, AddSub, iuau;
    // Control signals for operations
    

    InputUnit InputUnit_inst(
        .Row(Row),
        .clk(clk),
        .reset(clearall),
        .LEDR(Input2AU),
        .Col(Col),
        .value(value),
        .trig(trig)
    );
	
/*	DeMux DeMux_inst
	(
		.keypressed(value) ,	// input [3:0] keypressed_sig
		.InA(InA) ,	// output  InA_sig
		.InB(InB) ,	// output  InB_sig
		.InR(InR) 	// output  InR_sig
	);
*/

	wire [2:0] internal_state; 
	wire [2:0] internal_next_state;
	
	
    Control_Unit Control_Unit_inst(
        .clock(clk),
        .ClearEntry(clearentry),
        .ClearAll(clearall),
        .trig(trig),
        .keyPressed(value),
        .LoadA(ldA),
        .LoadB(ldB),
        .AddSub(AddSub),
        .LoadR(ldR),
        .LoadOU(ldOU),
        .iuau(iuau),
        .reset(internal_reset),
		  .state(internal_state),
		  .next_state(internal_next_state)
    );
	 
	 assign state = internal_state;
	 assign next_state = internal_next_state;
		

    TwoFunctionAU TwoFunctionAU_inst(
        .X(Input2AU),
        .InA(ldA),
        .InB(ldB),
        .Add_Sub(AddSub),
        .Out(ldR),
        .clear(internal_reset),
        .Rout(AU2Output)
    );
	 
	 Mux Mux_inst
	(
		.keypad_input(Input2AU) ,	// input [7:0] keypad_input_sig
		.IUAU(iuau) ,	// input  IUAU_sig
		.result(AU2Output) ,	// input [7:0] result_sig
		.OUnum(OUnum) 	// output [7:0] OUnum_sig
	);



    OutputUnit OutputUnit_inst(
        .SW(OUnum),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3)
    );
endmodule
