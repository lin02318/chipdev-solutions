module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);

  logic [$clog2(DATA_WIDTH):0] num_ones;

  always_comb begin

    num_ones = 0;

    for ( int i = 0; i < DATA_WIDTH; i++ ) begin

      if ( din[i] == 1'b1 ) begin
        num_ones = (num_ones + 1);
      end else begin
      end

    end

  end  // always_comb

  assign dout = num_ones;

endmodule