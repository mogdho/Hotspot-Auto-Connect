# 📡 Hotspot Auto-Connect
![Batch](https://img.shields.io/badge/Script-Batch_(.bat)-orange?style=for-the-badge&logo=windows-terminal)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Windows-blue?style=for-the-badge&logo=windows)

**Hotspot Auto-Connect** is a robust Windows Batch script designed to aggressively search for and connect to a specific Wi-Fi network (like a mobile hotspot) as soon as you unlock your PC. It features an automated retry loop and a visually appealing ASCII success screen, making it a must-have utility for mobile internet users who face connection delays.

### ✨ Key Features
* **Aggressive Reconnection Loop:** Disconnects from any stale networks and continuously searches for your specific hotspot until a connection is established.
* **Unlock Trigger:** Designed to be triggered instantly upon Windows workstation unlock using Task Scheduler.
* **Visual Feedback:** Features a clean console interface that prevents spamming, culminating in a beautiful, UTF-8 encoded ASCII art success screen.
* **Lightweight:** Pure Windows batch script requiring no external dependencies or installations.

---

### ⚙️ Configuration Guide

Before running the script, you **MUST** update the `WIFI_NAME` variable with your own Wi-Fi/Hotspot name (SSID).

1. Open `AutoConnect.bat` in Notepad or any text editor.
2. Locate the **USER CONFIGURATION SECTION** at the top of the script.
3. Replace the default name with your exact Wi-Fi or Hotspot SSID.

**Update this single line:**
```bat
set "WIFI_NAME=YOUR_WIFI_NAME_HERE"
```

> **Note:** Ensure you keep the quotation marks ("") around your network name if it contains spaces.

### 🚀 Setup: Automate via Task Scheduler

To make the script run automatically every time you wake or unlock your PC, follow these exact steps:

**1. Create the Task**
* Open the **Windows Start Menu**, search for **Task Scheduler**, and open the app.
* In the right-hand 'Actions' panel, click **Create Task...** (Do *not* select Create Basic Task).

**2. General Tab**
* In the 'Name' field, type a name (e.g., `Hotspot Auto-Connect`).
* Check the box for **Run with highest privileges**.

**3. Triggers Tab**
* Click **New...**. 
* From the 'Begin the task' dropdown, select **On workstation unlock**. 
* Click OK.

**4. Actions Tab**
* Click **New...**. 
* Keep 'Action' as **Start a program**. 
* Click the **Browse** button and select your saved `AutoConnect.bat` file. 
* Click OK.

**5. Conditions Tab (Crucial for Laptops)**
* Check the box for **Wake the computer to run this task**.
* Uncheck the box for **Start the task only if the computer is on AC power** (so it runs perfectly on battery).
* Click **OK** at the bottom to save.

---

### 🔗 Download/Source link
- Download/Source link - [https://github.com/mogdho/Hotspot-Auto-Connect]
