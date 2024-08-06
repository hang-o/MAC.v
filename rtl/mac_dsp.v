module mac(
	input			clk,
	input			rst_n,
	input		[7:0]	i_a,
	input		[7:0]	i_b,
	input			sclr,
	output		[19:0]	o_mac
);
	wire		[20:0]	o_dsp;
	reg		[19:0]	psum;
	
	
	always @ (posedge clk or negedge rst_n) begin
		if(!rst_n)	psum	<= 20'd0;
		else begin
			if(sclr)psum	<= 20'd0;
			else	psum	<= {o_dsp[20],o_dsp[18:0];
		end
	end


	assign			o_mac	= psum;


	dsp DSP (
		.CLK(clk),    // input wire CLK
		.SCLR(sclr),  // input wire SCLR
		.A(i_a),        // input wire [7 : 0] A
		.B(i_b),        // input wire [7 : 0] B
		.C(psum),        // input wire [19 : 0] C
		.P(o_dsp)        // output wire [20 : 0] P
	);


endmodule
