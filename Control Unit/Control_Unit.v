module Control_Unit(
    input clock,
    input ClearEntry,
    input ClearAll,
    input trig,
    input [3:0] keyPressed,
    output reg LoadA,
    output reg LoadB,
    output reg AddSub,
    output reg LoadR,
    output reg LoadOU,
    output reg iuau,
    output reg reset,
    output reg [2:0] state, next_state,
    output clock_div
);

    wire trig_edge;

    parameter S0 = 3'd0,
              S1 = 3'd1,
              S2 = 3'd2,
              S3 = 3'd3,
              S4 = 3'd4;

    clock_div #(32,2500000) clock_div_inst (
        .clk(clock), // input clk_sig
        .reset(ClearAll), // input reset_sig
        .clk_out(clock_div) // output clk_out_sig
    );

    EdgeDetect edge_detect_inst (
        .in(trig),
        .clock(clock_div),
        .out(trig_edge)
    );

	 always @(*/*posedge clock*/) begin
        if (keyPressed == 4'd10) begin  // Key A for addition
            AddSub <= 0;
        end 
		  else if (keyPressed == 4'd11) begin  // Key B for subtraction
            AddSub <= 1;
        end
    end
	 
    always @(posedge clock, negedge ClearAll) begin
        if (ClearAll == 0) begin
            state <= S0;
        /*end else if (~ClearEntry) begin
            state <= S0; */
        end 
		  else begin
            state <= next_state;
        end
    end

    /*
	 always @(negedge ClearAll) begin
        if (ClearAll) begin
          
        end
    end
	 */

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = trig_edge ? S1 : S0;
            S1: next_state = trig_edge ? S2 : S1;
            S2: next_state = trig_edge ? S3 : S2;
            S3: next_state = trig_edge ? S4 : S3;
            S4: next_state = trig_edge ? S0 : S4;
            default: next_state = S0;
        endcase
    end

    // Output logic based on state
    always @(state) begin
        case (state)
            S0: {reset, LoadA, LoadB, LoadR, LoadOU, iuau} <= 6'b011110;
            S1: {reset, LoadA, LoadB, LoadR, LoadOU, iuau} <= 6'b110100;
            S2: {reset, LoadA, LoadB, LoadR, LoadOU, iuau} <= 6'b111100;
            S3: {reset, LoadA, LoadB, LoadR, LoadOU, iuau} <= 6'b111010;
            S4: {reset, LoadA, LoadB, LoadR, LoadOU, iuau} <= 6'b011001;
            default: begin
                {reset, LoadA, LoadB, LoadR, LoadOU, iuau} <= 6'b10000; // Reset the input unit for the next input
            end
        endcase
    end
endmodule
