// mux_df.v
// 2-to-1 multiplexer, DATAFLOW style.
//
// This file does not compile as-is. Find the bug and fix it before moving on.
// Hint: think carefully about which port should be a net and which should be
// a variable in dataflow modeling.

module mux_df (
  input      I0,
  input      I1,
  input      S,
  output wire Y
);

  assign Y = S ? I1 : I0;

endmodule

//if we do assign Y = something then we use wire but if we do Y = something we use reg Y
// the ternary operation is same as assign Y = (~S & I0) | (S & I1);