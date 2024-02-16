`timescale 1ns / 1ps

// !!! Nu includeti acest fisier in arhiva !!!

module image(
	input clk,			// clock 
	input[5:0] row,		// selecteaza un rand din imagine
	input[5:0] col,		// selecteaza o coloana din imagine
	input we,			// write enable (activeaza scrierea in imagine la randul si coloana date)
	input[23:0] in,		// valoarea pixelului care va fi scris pe pozitia data
	output[23:0] out);	// valoarea pixelului care va fi citit de pe pozitia data

reg[23:0]  data[63:0][63:0];

integer i, j;
initial begin
    for(i = 0; i < 64; i = i + 1)
        for(j = 0; j < 64; j = j + 1)
            data[i][j] = i + j;
end

assign out = data[row][col];
	
always @(posedge clk) begin
	if(we)
		data[row][col] <= in;
end

endmodule
