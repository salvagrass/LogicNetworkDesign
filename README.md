# Logic Network Design - Politecnico di Milano
**Course:** Reti Logiche (Logic Design) | **Academic Year:** 2023/2024 | **Grade:** 30/30

This repository contains the VHDL implementation of a sequential logic circuit developed as the final project for the Logic Design course at Politecnico di Milano. 

## Project Overview
The system processes a sequence of 8-bit words (representing sequential sensor readings) stored in memory. Since the sensor may return invalid readings (represented by the value `0`), the hardware module is responsible for:
1. **Value Propagation:** Replacing any `0` value with the last valid (non-zero) reading.
2. **Credibility Index Generation:** Assigning a 5-bit credibility score (from 0 to 31) to each word. The score is maximized to 31 for valid readings and decremented by 1 for each consecutive missing reading.

## Architecture Highlights
The core of the architecture is designed around an optimized Datapath and a highly minimized **5-state Finite State Machine (FSM)**. The system reads the sequence, computes the reliability metrics, and correctly writes the output back to the memory addressing space while strictly meeting the timing constraints (20ns clock period).

## Automated Testing & Validation
To ensure the reliability of the logic design, a custom Python script (`TestbenchGenerator.py`) was developed. This tool procedurally generates VHDL testbenches to validate the system against:
* **Massive Random Sequences:** Automatically testing hundreds of randomized scenarios.
* **Edge Cases:** Dynamically targeting critical conditions such as 0-length sequences, maximum length limits, all-zeros, and credibility bounds.

## Repository Structure
* `hdl/`: Contains all the VHDL source files (FSM, Counters, Registers, Adders).
* `testbench/`:
  * `generated_edge_cases/`: Automated testbenches targeting boundary conditions.
  * `generated_random_tests/`: Automated testbenches with 100+ random sequences.
  * `downloaded_public_tests/`: Additional provided testbenches.
* `constraints/`: Contains the FPGA timing constraints (`clock.xdc`).

## Documentation
*Note: The comprehensive project documentation, including detailed architectural schematics, synthesis reports, and FSM state diagrams, is provided in Italian within `Report_reti_logiche.pdf`.*
