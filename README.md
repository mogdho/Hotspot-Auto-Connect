#  Hotspot Auto-Connect

![Windows Support](https://img.shields.io/badge/OS-Windows-blue?style=for-the-badge&logo=windows)
![Scripting](https://img.shields.io/badge/Language-Batch-green?style=for-the-badge&logo=gnubash)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

A smart automation script designed to eliminate the frustration of connecting to your mobile hotspot manually. Whether you wake your PC from sleep or restart, this script ensures your specific hotspot is connected instantly.

---

### 🔍 The Problem
Windows' built-in "Connect Automatically" feature often fails if your PC powers on **before** your phone's hotspot is active. In most cases, users are forced to:
*   Open the Wi-Fi menu manually.
*   Wait for the OS to "discover" the network (often taking 10–20 seconds).
*   Manually click "Connect" and hope for the best.

My Batch script solves this by actively polling and forcing a connection the moment the hotspot becomes available.

---

### ✨ Features
*   **Auto-Swap:** Disconnects existing weak or unwanted Wi-Fi networks to prioritize your hotspot.
*   **Smart Retry Loop:** Continuously searches for your hotspot until the connection is established.
*   **Information Hub:** Once connected, it displays real-time signal strength, channel, and IP address.
*   **Hacker Aesthetic:** A clean, centered ASCII interface with a success-green theme.
*   **UTF-8 Optimized:** Uses safe block characters for a modern terminal look without crashing.

---

### 🚀 Getting Started

#### 1. Setup the Script
1.  Download the `Hotspot_Auto_Connect.bat` file.
2.  Right-click and select **Edit**.
3.  Replace `Nothing Phone (2a)_7232` with your specific **Hotspot Name (SSID)**.
4.  Save the file in a safe folder (e.g., `C:\Scripts\`).

#### 2. Windows Task Scheduler Guide (Auto-Run)
To make the script run every time you unlock your laptop or wake it from sleep:

1.  **Open Task Scheduler:** Press `Win + S` and type "Task Scheduler".
2.  **Create Task:** Click **Create Task** (on the right panel).
3.  **General Tab:**
    *   Name: `AutoConnectHotspot`.
    *   Check: **Run with highest privileges**.
4.  **Triggers Tab:**
    *   Click **New**.
    *   Begin the task: Select **On workstation unlock**.
5.  **Actions Tab:**
    *   Click **New**.
    *   Action: **Start a program**.
    *   Program/script: Click **Browse** and select your `.bat` file.
6.  **Conditions Tab:**
    *   Uncheck: "Start the task only if the computer is on AC power" (Crucial for laptops).
    *   Check: **Wake the computer to run this task**.
7.  **Click OK.**

---

### 🛠️ Technical Breakdown
The script utilizes a 4-step logic:
1.  **Check:** Verifies if already connected to avoid redundant loops.
2.  **Force:** Disconnects existing Wi-Fi profiles to clear the path.
3.  **Connect:** Triggers `netsh wlan connect` in a retry loop.
4.  **Audit:** Extracts network data using `ipconfig` and `netsh` interfaces for verification.

---

### 📜 License
This project is licensed under the MIT License - feel free to modify and share!

### 👨‍💻 Author

**Mogdho Paul**

🔗 GitHub: [github.com/mogdho](https://github.com/mogdho)
📂 Source: [CleanUp-your-system](https://github.com/mogdho/Hotspot-Auto-Connect)
