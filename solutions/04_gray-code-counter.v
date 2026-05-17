module model #(parameter
  DATA_WIDTH = 4
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);

  logic [DATA_WIDTH-1:0] binary;

  always_ff @ ( posedge clk ) begin

    if ( !resetn ) begin
      binary <= 0;
    end else begin
      binary <= (binary + 1);
    end

  end  // always_ff

  assign out = binary ^ (binary >> 1);

endmodule