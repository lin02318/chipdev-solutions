module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input din,
  output logic [DATA_WIDTH-1:0] dout
);

  logic [DATA_WIDTH:0] data, data_next;  // width = DATA_WIDTH + 1

  assign data_next = { data[DATA_WIDTH-1:0], din };

  always_ff @ ( posedge clk ) begin

    if ( !resetn ) begin
      data <= 0;
    end else begin
      data <= data_next;
    end

  end  // always_ff

  assign dout = data[DATA_WIDTH-1:0];

endmodule