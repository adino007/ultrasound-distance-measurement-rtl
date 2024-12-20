# Ultrasound-Based Distance Measurement using RTL Design

This repository contains the Verilog code, testbench, and documentation for an ultrasound-based distance measurement system. The design is implemented using RTL (Register Transfer Level) principles and deployed on a Basys3 FPGA board using Xilinx Vivado.

## Project Overview
The goal of this project was to develop a synchronous sequential system to measure distances using ultrasound. The system uses Verilog for FSM-based logic design and simulates state transitions to control the input and output components effectively.

## Features
- **State Machine Design:** Utilizes FSM for control logic and state transitions.
- **Multiple Inputs:** Buttons and switches for system control.
- **Dynamic Outputs:** 7-segment displays and LEDs for real-time visualization.
- **RTL Simulation:** Functional verification through testbenches and waveform analysis.
- **FPGA Deployment:** Synthesized and tested on the Basys3 FPGA board.

## System Design
The design incorporates:
- **Inputs:** Buttons and switches for user interaction.
- **Outputs:** 
  - A 7-segment display to show measured distances.
  - LEDs to visualize state changes dynamically.
- **FSM Logic:** Handles input signals, controls state transitions, and ensures proper timing.

## Setup and Usage
To set up and run this project on your local system:
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ultrasound-distance-measurement-rtl.git
