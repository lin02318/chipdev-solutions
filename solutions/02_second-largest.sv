module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

  logic [DATA_WIDTH-1:0] largest;
  logic [DATA_WIDTH-1:0] second_largest;

  always_ff @ ( posedge clk ) begin

    if ( !resetn ) begin
      largest        <= 0;
      second_largest <= 0;
    end else if ( din > largest ) begin
      largest        <= din;
      second_largest <= largest;
    end else if ( din > second_largest ) begin
      second_largest <= din;
    end

  end  // always_ff

  assign dout = second_largest;

endmodule