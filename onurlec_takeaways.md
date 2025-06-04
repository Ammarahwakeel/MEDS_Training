# Lecture#1: 
## ***Introduction: Fundamental,Gates,Transistor***
- **Importance of computer architecture and recent trending research fields:**
In the modern era of technology, real world applications like smart phones, super computers, quantum computer and self driving cars need revolutions in terms of robustness, latencey, energy efficiency and many other things which is only possible by doing reserach in the computer architecture field.
- **Transformation Hierarchy**:  
To achieve the highest efficiency , performance , robustness we must take the expanded view of computer architecture, as shown below:
![Alt text](https://github.com/Ammarahwakeel/MEDS_Training/blob/master/png/image2.png)


- **Building blocks of modren computers: Transistors**:
computers are mainly built of billions of MOS (metal oxide semiconductor) transistors, having two types as n=type and p-type MOS transistor which originally work as switches.

        NOTE: PMOS are good at pulling up the the  voltage/network while NMOS are good at pulling down the voltage
- **Logic Gates**:
Modern computers use CMOS(NMOS+PMOS) to implement logic of any gate i.e: NOT ,NAND, AND, OR  gateds etc.
- **MOORE'S LAW**: cramming /layering more transistors onto the same integrated circuits/area.
(i.e in the begining there were less transistors in a given area but this no of transistors is increasing day by day improving the functionality of chips without increasing the area of chips)

# LECTURE#2:
## ***COMBINATIONAL LOGIC***
- **LATENCY & POWER CONUMPTION**:
Latency originally means the delay in the output signal when input is changed,by connecting transistors in paraleel we have more latency and vice versa.While the power consumption depends on voltage, current and other factors like frequency depending on whether the power consumed is dynamic or static.

- combinational circuits are memoryless and output only depends on the input.
- **BOOLEAN EQUATIONS:**
we can use different Boolean Algebra techniques to form Boolean equations which represents different logic gates. And these Boolean functions are represented in either **SOP OR POS** form using K-maps or simplification of functions.
- **Basic Circuit Compoents**:
1. **DECODER**: It maps n inputs to 2^n outputs. At one time, certain combinations of inputs maps to only one output.
2. **MULTIPLEXERS(MUX)**: selects one of the N inputs to connect it to the output. Mux can also be used as look up table to impelment funactions.
3. **LOOKUP TABLES(LUTS):**
LUT is similar to truth table but an N bit LUT  can implement anu function  using N bit inputs.
3. **PROGRAMMABLE ARRAY(PLAS)**:
PLAS are configurable hardware structures used to implement custom logic functions by programing their internal connections.
5. **COMPARATOR**:
It checks if two N input values are exactly the same.
6. **ARITHMETIC LOGIC UNIT(ALU):** It combines arithmetic operations(+,-,*) and logical operations(AND,NAND,OR etc) into single unit.
7. **TRI-STATE BUFFER**:
It gates different signals onto wire, acts like a switch and have an enable signal as well.

# LECTURE#3:
## ***SEQUENTIAL CIRCUITS***
- Circuit which has memory i.e can remember its previous state. These are the Circuits in which output depends on the input as well as present/current state as shown in figures:

- **RS- LATCH**:
It is a cross coupled NAND gates in which we reset or set the values of output or Q. But in RS latch there is an input combination of(0,0) which is forbidden in which Latch can go into metastable state, so to solve this problem we add two NAND gates at the start to make sure that both input can never become zero at the same time, hence making a **GATED D LATCH**.
- **MEMORY**: it is compromised of locations that can be written to or read from. So to read or write data of multiple bits on different locations we use muxes, decoder and gated D latches.
- **ASYNCHRONOUS VS SYNCHRONOUS CIRCUITS**:

| ASYNCHRONOUS                   | SYNCHRONOUS                |
|--------------------------------|----------------------------|
| States occur when they occur   | States occur on clock edge |
|nothing is synchronized hence can face metastability issues    | controlled by a clock 

- **FINITE STATE MACHINES**:
A pictorial way of representing transitions of one state to another with respect to change in inputs.
 There are two types of FSMS:


| MOORE                    | MEELEY                |
|--------------------------------|----------------------------|
| output depends only on present state  | Next States depends on present state as well as input |

- **D FLIP FLOPS**:
 The problem with the D latch is that it is not clock edge trigered rather when the clock is high and input changes the output changes. But we want to make the output stable which is trigerred by only the edge of the clock. Thats why we have D Flip flops which is clk edge sensitive.
 ```
 module flop(input clk,
 input [3:0] d,
 output reg [3:0] q);
 always @ (posedge clk)
 q <= d; // pronounced “q gets d”
endmodule
```

# LECTURE#4:
## ***SEQUENTIAL LOGIC 2, VERILOG***
- **HARDWARE DESCRIPTION LANGUAGES**:
 we need hardware design to describe complex designs, to synthesize them and to simulate them. thats why we use HDLS such as verilog /SystemVerilog..
 - **Hierarchial design**:
 we can either start from leaf(bottom level) like designing components of circuits(muxes,decoders etc) to design the sub modules and then build top module or we can go from upside down.
- **STYLES OF HDL IMPLEMENTATIONS**: We can implement designs using structural or behavriol coding depending on the design or coding complexity or readability.

| Structural Verilog | Behavioral Verilog |
|--------------------|--------------------|
| ```module and_gate_struct(output y, input a, b); and g1(y, a, b); endmodule``` | ```module and_gate_behav(output reg y, input a, b); always @(*) y = a & b; endmodule``` |

# LECTURE#5:
## ***HARDWARE DESCRIPTION LANGUAGES, VERILOG***
- **CONDITIONAL STATEMENTS**:
There are different ways to write conditional statements as if-else statements, behavriol coding and can also be used to implementent muxes.

 ``` 
 module mux2(input [3:0] d0, d1,
 input s,
 output [3:0] y);
 assign y = s ? d1 : d0;
 // if (s) then y=d1 else y=d0;
endmodule
```
- **PRIORITY CIRCUIT**:
Inputs/requestors have priority regarding MSB or LSB bits, and depending on that priority we have corresponding inputs as shown:

- **HARDWARE SYNTHESIS**:
Modern tools are able to map synthesible HDL code into low-level cell libraries and they can perform many optimization.
- **PARAMITERIZED MODULES**:
if there are some variables which can be changed from time to time so instead of again changing thw whole code we declare that signal as parameter.
```
module mux2
 #(parameter width = 8) // name and default value
 (input [width-1:0] d0, d1,
 input s,
 output [width-1:0] y);
 assign y = s ? d1 : d0;
endmodule
```
- **THE ALWAYS BLOCK**:In the always block we have initial begin block in which statements are executed whenever the event in the sensitivity list occurs.
```
always @ (sensitivity list)
statement;
```
- **NON-BLOCKING & BLOCKING ASSIGNMENTS**:
# Blocking vs Non-Blocking Assignments in Verilog

| Feature             | Non-Blocking (`<=`)                            | Blocking (`=`)                             |
|---------------------|------------------------------------------------|--------------------------------------------|
| Execution Timing    | Assignments happen at the end of the block.    | Assignments execute immediately.           |
| Flow Behavior       | Executes in parallel, does not block flow.     | Executes sequentially, blocks further code.|
| Typical Usage       | Used for sequential logic (flip-flops).        | Used for combinational logic.              |
 # LECTURE#6:
 ## ***TIMING & VERIFICATION***:
 - We assume that output changes immediately when input changes but it is not true in reality, and outputs are delayed from inputs because of capacitances, resistances and many other reasons
 - **contamination & propagation delays**:
 contaminatio delay is the delay untill output starts changing(i.e the minimum time in which output is stable with its previous value)  while propagation delay is the maximum time after which output is stable with its new value.
- **CRITICAL PATHS**:
It is the longest path with the larger delay due to more number of gates, similarly we have shortest path with lesser no of gates. But the number of gate is not the soleley parameter to identify longest /shortest path there are many more factors included.
- **GLITCHES**:
One input transition causes multiple undesired output transitions and we can remove glitches by adding some extr gates using K-map logic
- **SETUP & HOLD TIME**:
The time before the clock edge at which input data
must be stable (i.e. not changing) is setup time.
while Hold time (thold) is the  time after the clock edge that data must be stable.
 And setup or hold time violations can cause metastablitiy issues in the circuit.

 - **CIRCUIT VERIFICATION**:
 To verify our design, we write test bench to test every possible input combinations. There are three types of testing ie: manual tetsing, self testing and automatic testing and each testing have its own pros and cons.
 
