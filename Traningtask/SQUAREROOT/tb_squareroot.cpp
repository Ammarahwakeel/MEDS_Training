#include "Vsquareroot.h"
#include "verilated.h"
#include <iostream>
#include <cmath>

void test_sqrt(Vsquareroot* top, int input) {
    top->x = input;
    top->eval();

    int result = top->result;
    std::cout << "sqrt(" << input << ") = " << result
              << " (Expected: " << static_cast<int>(std::sqrt(input)) << ")" << std::endl;
}

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    Vsquareroot* top = new Vsquareroot;

    test_sqrt(top, 28000); // sqrt(28000) ≈ 167
    test_sqrt(top, 1000);  // sqrt(1000) ≈ 31
    test_sqrt(top, 0);     // sqrt(0) = 0
    test_sqrt(top, 5000);  // sqrt(5000) ≈ 70

    delete top;
    return 0;
}
