module squareroot (
    input  logic [31:0] x,
    output logic [15:0] result
);

    function automatic [15:0] int_sqrt(input [31:0] num);
        integer low, high, mid;
        begin
            low = 0;
            high = num;
            while (low <= high) begin
                mid = (low + high) >> 1;
                if (mid * mid <= num)
                    low = mid + 1;
                else
                    high = mid - 1;
            end
            int_sqrt = high[15:0];  // Fix truncation warning
        end
    endfunction

    always_comb begin
        if (x == 0)
            result = 0;
        else
            result = int_sqrt(x);
    end

endmodule
