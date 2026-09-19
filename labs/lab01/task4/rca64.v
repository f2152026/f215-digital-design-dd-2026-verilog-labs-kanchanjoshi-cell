// rca64.v
// A plain 64-bit ripple-carry adder, chaining 64 FA_Gate instances (the
// delay-annotated version carried forward from Task 2).
//
// TODO: instantiate 64 FA_Gate modules, chained exactly like Task 2/3's
// 4-bit ripple adder, just 64 bits wide. This is very repetitive -- a
// generate-for loop is a reasonable way to write this one, since every
// stage is structurally identical, e.g.:
//
//   wire [64:0] c;
//   assign c[0] = cin;
//   genvar i;
//   generate
//     for (i = 0; i < 64; i = i + 1) begin : gen_fa
//       FA_Gate FA (.a(a[i]), .b(b[i]), .cin(c[i]), .sum(sum[i]), .cout(c[i+1]));
//     end
//   endgenerate
//   assign cout = c[64];
// rca64.v

// A plain 64-bit ripple-carry adder, chaining 64 FA_Gate instances.

module rca64(

  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout

);

  // Carry signals between the 64 full adders
  wire [64:0] c;

  // Initial carry comes from external cin
  assign c[0] = cin;

  // Generate 64 identical full-adder stages
  genvar i;

  generate
    for (i = 0; i < 64; i = i + 1) begin : gen_fa

      FA_Gate FA (
        .a(a[i]),
        .b(b[i]),
        .cin(c[i]),
        .sum(sum[i]),
        .cout(c[i+1])
      );

    end
  endgenerate

  // Final carry
  assign cout = c[64];

endmodule