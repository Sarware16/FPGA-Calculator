module DeMux(
	input [3:0] keypressed,
	output reg InA, InB, InR
);
	 always @ (*) 
	 begin
        case (keypressed)
            4'd10: {InA, InB, InR} = 3'b100;  // Key A for Add
            4'd11: {InA, InB, InR} = 3'b010;  // Key B for Subtract
            4'd15: {InA, InB, InR} = 3'b001;  // Key # for Start
            default: {InA, InB, InR} = 3'b000;  // Default case to reset the signals
        endcase
    end
endmodule