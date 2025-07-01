# 🧠 ATAS: Adaptive Traffic-Aware SDN Simulation in OMNeT++

A professional SDN simulation project built on OMNeT++ and INET framework to demonstrate **ATAS (Adaptive Traffic-Aware User-AP Association Strategy)**. It dynamically manages user associations across Access Points (APs) using traffic, mobility, and density parameters to ensure balanced network utilization and efficient connectivity.

---

## 📌 Project Purpose

Traditional static user-to-AP association models lead to network congestion, poor user experience, and unfair load distribution. This project proposes and simulates a solution to this:

- **ATAS (Adaptive Traffic-Aware Strategy):**
  - Balances user load across multiple APs.
  - Dynamically associates users based on signal strength, traffic, and AP congestion.
  - Improves throughput and reduces latency in dense wireless networks.

---

## ⚙️ How It Works

### 🔁 Topology
- Comprises **20 mobile users** (grouped, multicast, hybrid, and solo types).
- Includes **multiple APs**: `Conference_Room`, `Admin`, `Finance`, `Library`, and `Home`.
- Traffic is routed through `Edge_Controller`, `Multicast_Switch`, and `Unicast_Switch`.
- Controlled via centralized SDN component: `Global_ATAS_Manager`.

### 🧠 Key Modules
- `ATASManager.ned`: Implements the core logic of ATAS.
- `EdgeAPController`: Acts as an intermediate controller for APs.
- Users are defined in types (`GroupUser`, `mcUser`, `HybridUser`, `soloUser`) and follow defined mobility models.
- Communication handled over IPv6 using MIPv6 extensions and standard INET modules.

---

## 🛠️ Installation & Setup Guide

### 🔧 Requirements
- **OMNeT++ 4.6.x** (or 5.x, if compatible)
- **INET Framework** (Tested on INET 2)
- Git (optional, for cloning)

### 📥 Clone or Download the Project

```bash
git clone https://github.com/faizan-ee/Adaptive-AP-Association-in-Dense-WLANS.git
cd ATAS

### 📦 Import into OMNeT++ IDE

1. Open OMNeT++ IDE (version 4.6+ is recommended).
2. Go to **File > Import > General > Existing Projects into Workspace**.
3. Choose the root directory of the cloned project.
4. Ensure the project appears under "Projects" and is checked.
5. Click **Finish**. The project will be imported and compiled automatically if all dependencies are met.

> 💡 Make sure `inet` or any other required external libraries are also imported and built before running this project.

---

### ▶️ Run the Simulation

1. In the **Project Explorer**, locate the file named `omnetpp.ini`.
2. Right-click on `omnetpp.ini` and select **Run As > OMNeT++ Simulation**.
3. The simulation will launch in the Qtenv GUI.
4. You can step through events or run the simulation continuously to observe:
   - Node mobility behavior
   - Access Point associations
   - Performance metrics collected via `MonitorPlot`

> ✅ Make sure the `ATAS_Topology.ned`, `ATASManager.ned`, and mobility settings are correctly configured before running.

---

### 📊 Metrics & Analysis

This simulation captures and visualizes key SDN-WLAN metrics, including:

- User-to-AP association decisions
- Real-time traffic load balancing
- AP and controller communication
- Mobility patterns of different user types
- Network state visualization via `MonitorPlot`

📍 **Use case**: Validate ATAS (Adaptive Traffic-Aware AP Selection) algorithm efficiency in dynamic wireless environments.

---

### ✍️ Author

**Project Author:**  
**Muhammad Faizan**  
Final Year Project (FYP) — BS Electrical Engineering  
Department of Electrical Engineering  
Mirpur University of Science and Technology,
Mirpur AJK, Pakistan  
📧 [mfaizan.azad@gmail.com](mailto:mfaizan.azad@gmail.com)

> Feel free to contribute, fork, or reach out for collaboration or academic discussion.

---

### 📄 License

This project is released under the **MIT License**.  
You are free to use, modify, and distribute it with proper attribution. See the `LICENSE` file for full terms.

