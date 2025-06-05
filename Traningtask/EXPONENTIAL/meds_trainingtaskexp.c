#include <stdio.h>

// Function prototype
double exp_approx(double x, int n);

int main(void) {
    double x = 3;
    int n = 20;
    double result = exp_approx(x, n);
    
    printf("exp(%.2f) ≈ %.6f\n", x, result);
    return 0;
}

// Function to compute exponential using Taylor series
double exp_approx(double x, int n) {
    double term = 1.0;
    double sum = 1.0;
    
    for (int i = 1; i <= n; i++) {
        term *= x / i;
        sum += term;
    }
    
    return sum;
}
