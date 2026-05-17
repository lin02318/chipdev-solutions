module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);

  logic [DATA_WIDTH-1:0] data, data_next;

  always_comb begin

    if ( din_en ) begin
      data_next = din;
    end else begin
      data_next = (data >> 1);
    end

  end  // always_comb

  always_ff @ ( posedge clk ) begin

    if ( !resetn ) begin
      data <= 0;
    end else begin
      data <= data_next;
    end

  end  // always_ff

  assign dout = data[0];

endmodule