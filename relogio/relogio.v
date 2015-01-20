module my_clock(clk_50,clk_1);
input clk_50;
output reg clk_1 = 0;
reg [25:0] count = 0;
always @(posedge clk_50)
 begin 
 if (count == 26'd24_999_999)
begin
 count <= 0;
 clk_1 <= ~clk_1;
end
 else
begin
 count <= count + 1;
end
 end
endmodule


module Flip_flop_T(Q,CLK,Clear,T);
input T,CLK, Clear;
output reg Q;


always @ (negedge CLK or negedge Clear)
	if (~Clear) begin
		Q<=1'b0;
	end else if(T) begin
		Q<= Q+1;
	end
	

endmodule

module contador_6(q, En, Clk,Clear1);
input En, Clk,Clear1;
output [3:0]q;

wire [3:1]out_and;
wire  Clear2,Clear;

//assign C = ~(q[3] && q[1]);
nand(Clear2,q[2],q[1]);
and(Clear, Clear1, Clear2);
//assign Clear = C && Clr; 

//module flip_flop_T(Q,CLK,Clear,T);
Flip_flop_T A(q[0],Clk,Clear,En);
	and(out_and[3],En,q[0]);
	
Flip_flop_T B(q[1],Clk,Clear,out_and[3]);
	and(out_and[2],out_and[3],q[1]);
	
Flip_flop_T C(q[2],Clk,Clear,out_and[2]);
	and(out_and[1],out_and[2],q[2]);
	
Flip_flop_T D(q[3],Clk,Clear,out_and[1]);
	
endmodule


module contador_10(q, En, Clk,Clear1);
input En, Clk,Clear1;
output [3:0]q;

wire [3:1]out_and;
wire  Clear2,Clear;

//assign C = ~(q[3] && q[1]);
nand(Clear2,q[3],q[1]);
and(Clear, Clear1, Clear2);
//assign Clear = C && Clr; 

//module flip_flop_T(Q,CLK,Clear,T);
Flip_flop_T A(q[0],Clk,Clear,En);
	and(out_and[3],En,q[0]);
	
Flip_flop_T B(q[1],Clk,Clear,out_and[3]);
	and(out_and[2],out_and[3],q[1]);
	
Flip_flop_T C(q[2],Clk,Clear,out_and[2]);
	and(out_and[1],out_and[2],q[2]);
	
Flip_flop_T D(q[3],Clk,Clear,out_and[1]);
	
endmodule


module contador_2(q, En, Clk,Clear1);
input En, Clk,Clear1;
output [3:0]q;

wire [3:1]out_and;
wire  Clear2,Clear;

//assign C = ~(q[3] && q[1]);
nand(Clear2,q[1],q[0]);
and(Clear, Clear1, Clear2);
//assign Clear = C && Clr; 

//module flip_flop_T(Q,CLK,Clear,T);
Flip_flop_T A(q[0],Clk,Clear,En);
	and(out_and[3],En,q[0]);
	
Flip_flop_T B(q[1],Clk,Clear,out_and[3]);
	and(out_and[2],out_and[3],q[1]);
	
Flip_flop_T C(q[2],Clk,Clear,out_and[2]);
	and(out_and[1],out_and[2],q[2]);
	
Flip_flop_T D(q[3],Clk,Clear,out_and[1]);
	
endmodule




//Q,eN, CLK, CleAR, 
module relogio(Q0, Q1, Q2, Q3, Q4, Q5, En, Clk, Clear);
input En, Clk, Clear;
output [3:0]Q0, Q1, Q2, Q3, Q4, Q5;

contador_10 S10(Q0,En,Clk,Clear);
contador_6 S6(Q1,En,Q0[3],Clear);

contador_10 M10(Q2,En,Q1[2],Clear);
contador_6 M6(Q3,En,Q2[3],Clear);


wire Clear_10, out_Clear_10, s,Clear1;

nand(out_Clear_10,Q5[1],Q4[2]);
and(Clear_10,Clear,out_Clear_10);


contador_10 H10(Q4,En,Q3[2],Clear_10);
contador_2 H6(Q5,En,Q4[3],Clear1);


nand(s,Q5[1],Q4[2]);
and(Clear1, Clear,s);

endmodule









