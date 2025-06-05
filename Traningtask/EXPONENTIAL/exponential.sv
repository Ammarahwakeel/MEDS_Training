module exponential (
    output logic [31:0] result
);
    // Fixed-point scale: 1.0 = 1000
    parameter int X = 3000;     // 3.0 in fixed-point
    parameter int SCALE = 1000;
    parameter int TERMS = 20;

    int term;
    int z;
    int i;

    always_comb begin
        term = SCALE;  // term = 1.0
        z = SCALE;     // z = 1.0

        for (i = 1; i < TERMS; i++) begin
            term = (term * X) / (i * SCALE); // term *= x / i
            z = z + term;
        end

        result = z;  // result is fixed-point (e.g. 20085 means 20.085)
    end
endmodule
