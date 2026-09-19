module tb;

// -------------------- Inputs --------------------
reg [1:0] t_A;
reg [1:0] t_B;

// -------------------- Outputs --------------------
wire t_GT;
wire t_LT;
wire t_EQ;

// -------------------- DUT instantiation --------------------
comp2 dut (
  .A(t_A),
  .B(t_B),
  .GT(t_GT),
  .LT(t_LT),
  .EQ(t_EQ)
);

// -------------------- Testing all 16 combinations --------------------
integer a, b;

initial begin

  for (a = 0; a < 4; a = a + 1) begin
    for (b = 0; b < 4; b = b + 1) begin

      // Apply inputs
      t_A = a;
      t_B = b;

      // Give the combinational DUT time to update
      #1;

      // -------------------- Check expected result --------------------

      if (a > b) begin
        // Expected: GT=1, LT=0, EQ=0
        if (t_GT !== 1 || t_LT !== 0 || t_EQ !== 0)
          $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
                   t_A, t_B, t_GT, t_LT, t_EQ);
        else
          $display("PASS: A=%b B=%b | GT=%b LT=%b EQ=%b",
                   t_A, t_B, t_GT, t_LT, t_EQ);
      end

      else if (a < b) begin
        // Expected: GT=0, LT=1, EQ=0
        if (t_GT !== 0 || t_LT !== 1 || t_EQ !== 0)
          $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
                   t_A, t_B, t_GT, t_LT, t_EQ);
        else
          $display("PASS: A=%b B=%b | GT=%b LT=%b EQ=%b",
                   t_A, t_B, t_GT, t_LT, t_EQ);
      end

      else begin
        // Expected: GT=0, LT=0, EQ=1
        if (t_GT !== 0 || t_LT !== 0 || t_EQ !== 1)
          $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
                   t_A, t_B, t_GT, t_LT, t_EQ);
        else
          $display("PASS: A=%b B=%b | GT=%b LT=%b EQ=%b",
                   t_A, t_B, t_GT, t_LT, t_EQ);
      end

    end
  end

  // End simulation
  $finish;

end

endmodule