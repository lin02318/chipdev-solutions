module model #(parameter
  DIV_LOG2=3,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);

  logic [IN_WIDTH-1:IN_WIDTH-OUT_WIDTH] out_temp;
  assign out_temp = din[IN_WIDTH-1:IN_WIDTH-OUT_WIDTH];

  always_comb begin

    if ( (din[DIV_LOG2-1] == 1) && (out_temp != { (OUT_WIDTH){1'b1} }) ) begin
      dout = out_temp + 1;
    end else begin
      dout = out_temp;
    end

  end  // always_comb

endmodule