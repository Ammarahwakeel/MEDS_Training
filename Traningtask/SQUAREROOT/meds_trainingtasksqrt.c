#include <stdio.h>


// Function to compute square root with precision
double sqrt_custom(double x, double precision) {
    if (x < 0) {
        return -1; // Indicate invalid input
    }

    double low = 0.0, high = x, mid, ans = 0.0;

    if (x < 1.0) {
        high = 1.0;  // To handle numbers between 0 and 1 correctly
    }

    while ((high - low) > precision) {
        mid = (low + high) / 2;
        if (mid * mid <= x) {
            ans = mid;
            low = mid;
        } else {
            high = mid;
        }
    }

    return ans;
}

int main() {
    printf("sqrt(28) = %.6f\n", sqrt_custom(28, 1e-6));
    printf("sqrt(1)  = %.6f\n", sqrt_custom(1, 1e-6));
    printf("sqrt(0)  = %.6f\n", sqrt_custom(0, 1e-6));
    printf("sqrt(5)  = %.6f\n", sqrt_custom(5, 1e-6));

    return 0;
}
