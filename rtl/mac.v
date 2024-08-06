module mac(
	input			clk,
	input			rst_n,
	input		[7:0]	i_a,
	input		[7:0]	i_b,
	input			sclr,
	output		[19:0]	o_mac
);
	reg		[15:0]	mul;
	reg		[19:0]	psum;


	always @ (posedge clk or negedge rst_n) begin
		if(!rst_n)	mul	<= 16'd0;
		else begin
			if(sclr)mul	<= 16'd0;
			else	mul	<= in_a * in_b;
		end
	end


	always @ (posedge clk or negedge rst_n) begin
		if(!rst_n)	psum	<= 20'd0;
		else begin
			if(sclr)psum	<= 20'd0;
			else	psum	<= psum + mul;
		end
	end


	assign			o_mac	= psum;


endmodule
