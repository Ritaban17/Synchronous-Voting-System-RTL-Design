# Synchronous Voting System RTL Design

A robust, synthesizable RTL implementation of a **Synchronous Electronic Voting System** developed in Verilog. This project handles secure vote casting, state machine-based control logic, real-time tallying, and is compatible with open-source ASIC design flows.

---

## 🚀 Features

* **Synchronous FSM Architecture:** Designed using a strict Finite State Machine (FSM) to handle ballot activation, voting states, and result declarations synchronously with the clock edge.
* **Multi-Candidate Support:** Scalable architecture to accommodate multiple candidates with concurrent vote registration.
* **Anti-Bounce & Debounce Logic:** Input synchronization to prevent multiple counts from a single button press.
* **Open-Source EDA Ready:** Fully tested with Icarus Verilog (`iverilog`), simulated using GTKWave, and ready for synthesis using Yosys and OpenLane.

---

## 📂 Repository Structure

```text
├── rtl/
│   ├── voting_system.v        # Top-level module
│   ├── control_fsm.v          # FSM controller for voting states
│   └── vote_counter.v         # Arithmetic tally and register blocks
├── tb/
│   └── voting_system_tb.v     # Testbench for functional verification
├── sim/
│   └── wave.vcd               # Simulation waveform output
├── constraints/
│   └── constraints.sdc        # Synopsys Design Constraints for synthesis
└── README.md
```

---

## ⚙️ How It Works

1. **Idle State:** The system awaits the presiding officer's signal to enable voting.
2. **Voting State:** Once enabled, voters can cast their ballot for their chosen candidate. The system registers inputs synchronously.
3. **Lock & Count:** Each valid vote increments the corresponding candidate's internal register securely, avoiding race conditions or multiple triggers per session.
4. **Result State:** Displays the final tallied outcomes when the voting window closes.

---

## 🛠️ Simulation & Verification

To run simulations locally using open-source tools (`iverilog` and `gtkwave`), follow these commands in your terminal:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Ritaban17/Synchronous-Voting-System-RTL-Design.git
   cd Synchronous-Voting-System-RTL-Design
   ```

2. **Compile the RTL and Testbench:**
   ```bash
   iverilog -o sim_out rtl/*.v tb/voting_system_tb.v
   ```

3. **Run the simulation:**
   ```bash
   vvp sim_out
   ```

4. **View waveforms in GTKWave:**
   ```bash
   gtkwave sim/wave.vcd
   ```

---

## 📐 Synthesis Flow (OpenLane / Yosys)

This design can be synthesized into a gate-level netlist using Yosys or taken through a full RTL-to-GDSII flow using OpenLane:

```bash
# Run synthesis check in Yosys
yosys -p "read_verilog rtl/*.v; synth -top voting_system; stat"
```

---

## 👤 Author

* **Ritaban Pal**  
* B.Tech Electrical Engineering | VLSI & RTL Design Enthusiast

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
