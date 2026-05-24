module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] gray,
  output logic [DATA_WIDTH-1:0] bin
);

  logic [DATA_WIDTH-1:0] shifted [0:DATA_WIDTH-1];

  always_comb begin

    bin = gray;

    for ( int i = 1; i < DATA_WIDTH; i++ ) begin
      shifted[i] = gray >> i;
      bin = bin ^ shifted[i];
    end

  end  // always_comb

endmodule