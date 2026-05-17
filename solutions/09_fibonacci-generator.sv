module model #(parameter
  DATA_WIDTH=32
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);

  logic [DATA_WIDTH-1:0] F_plus_1, F_plus_1_next;
  logic [DATA_WIDTH-1:0] F, F_next;

  assign F_plus_1_next = F_plus_1 + F;
  assign F_next = F_plus_1;

  always_ff @ ( posedge clk ) begin

    if ( !resetn ) begin
      F_plus_1 <= 1;
      F        <= 1;
    end else begin
      F_plus_1 <= F_plus_1_next;
      F        <= F_next;
    end

  end  // always_ff

  assign out = F;

endmodule