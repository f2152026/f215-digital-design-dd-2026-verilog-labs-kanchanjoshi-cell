module tb;

reg [3:0] t_a;
reg [3:0] t_b;
reg       t_op;

wire [3:0] t_result;

alu dut (
  .a(t_a),
  .b(t_b),
  .op(t_op),
  .result(t_result)
);

initial begin

  // Test 1: Addition
  t_a = 4'd3;
  t_b = 4'd2;
  t_op = 1'b0;
  #1;

  if (t_result !== 4'd5)
    $display("FAIL: 3 + 2 = %d", t_result);
  else
    $display("PASS: 3 + 2 = %d", t_result);


  // Test 2: Another addition
  t_a = 4'd7;
  t_b = 4'd4;
  t_op = 1'b0;
  #1;

  if (t_result !== 4'd11)
    $display("FAIL: 7 + 4 = %d", t_result);
  else
    $display("PASS: 7 + 4 = %d", t_result);


  // Test 3: Subtraction
  t_a = 4'd5;
  t_b = 4'd2;
  t_op = 1'b1;
  #1;

  if (t_result !== 4'd3)
    $display("FAIL: 5 - 2 = %d", t_result);
  else
    $display("PASS: 5 - 2 = %d", t_result);


  // Test 4: Change ONLY op
  // This helps find the sensitivity-list bug.
  t_a = 4'd5;
  t_b = 4'd2;
  t_op = 1'b0;
  #1;

  t_op = 1'b1;
  #1;

  if (t_result !== 4'd3)
    $display("FAIL: Changing op from ADD to SUB, result = %d", t_result);
  else
    $display("PASS: Changing op from ADD to SUB, result = %d", t_result);


  // Test 5: Another subtraction
  t_a = 4'd8;
  t_b = 4'd3;
  t_op = 1'b1;
  #1;

  if (t_result !== 4'd5)
    $display("FAIL: 8 - 3 = %d", t_result);
  else
    $display("PASS: 8 - 3 = %d", t_result);


  $finish;

end

endmodule