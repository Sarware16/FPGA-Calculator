module Mux(
    input [7:0] keypad_input,
    input IUAU,
    input [7:0] result,
    output reg [7:0] OUnum
);

    always @* begin
        if (IUAU == 1'b1)
            OUnum = result;
        else
            OUnum = keypad_input;
    end

endmodule
