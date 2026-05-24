module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);

  logic [$clog2(DATA_WIDTH):0] count;
  logic [DATA_WIDTH-1:0] stop_count;

  always_comb begin

    count = 0;
    stop_count = 0;

    for ( int i = 0; i < DATA_WIDTH; i++ ) begin

      if ( stop_count[i] == 1 ) begin
        stop_count[i+1] = 1;
      end

      if ( din[i] == 1 ) begin
        stop_count[i+1] = 1;
      end else begin
        if ( stop_count[i] == 0 ) begin
          count = count + 1;
        end
      end

    end

    dout = count;

  end  // always_comb

endmodule