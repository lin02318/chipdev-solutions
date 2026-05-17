module model (
  input clk,
  input resetn,
  input din,
  output dout
);

  localparam [1:0] SEQ_N  = 0;
  localparam [1:0] SEQ_0  = 1;
  localparam [1:0] SEQ_01 = 2;

  logic [1:0] state, state_next;

  always_comb begin

    case ( state )
      SEQ_N: begin
        if ( din == 1 ) state_next = SEQ_N;
        else            state_next = SEQ_0;
      end
      SEQ_0: begin
        if ( din == 1 ) state_next = SEQ_01;
        else            state_next = SEQ_0;
      end
      SEQ_01: begin
        if ( din == 1 ) state_next = SEQ_N;
        else            state_next = SEQ_0;
      end
      default:          state_next = state;
    endcase

  end  // always_comb

  always_ff @ ( posedge clk ) begin

    if ( !resetn ) begin
      state <= SEQ_0;
    end else begin
      state <= state_next;
    end

  end  // always_ff

  assign dout = ( state == SEQ_01 ) ? 1'b1 : 1'b0;

endmodule