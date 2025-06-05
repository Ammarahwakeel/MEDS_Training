#include "Vexponential.h"
#include "verilated.h"
#include <iostream>

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vexponential* top = new Vexponential;

    top->eval();  // Evaluate combinational logic

    // Convert back to float
    std::cout << "exp(3.0) approx (fixed-point): " << top->result << std::endl;
    std::cout << "exp(3.0) approx (float)      : " << top->result / 1000.0 << std::endl;

    delete top;
    return 0;
}
