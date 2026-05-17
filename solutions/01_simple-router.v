module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  input  din_en,
  input  [1:0] addr,
  output logic [DATA_WIDTH-1:0] dout0,
  output logic [DATA_WIDTH-1:0] dout1,
  output logic [DATA_WIDTH-1:0] dout2,
  output logic [DATA_WIDTH-1:0] dout3
);

  always_comb begin

    if ( din_en && ( addr == 0 ) ) begin
      dout0 = din;
    end else begin
      dout0 = 0;
    end

    if ( din_en && ( addr == 1 ) ) begin
      dout1 = din;
    end else begin
      dout1 = 0;
    end

    if ( din_en && ( addr == 2 ) ) begin
      dout2 = din;
    end else begin
      dout2 = 0;
    end

    if ( din_en && ( addr == 3 ) ) begin
      dout3 = din;
    end else begin
      dout3 = 0;
    end

  end  // always_comb

endmodule