Installation & Setup Guide

This document provides step-by-step instructions for installing, running, and configuring the HP OMEN Key Remapper on Windows 10 and 11.

Prerequisites

* **Operating System:** Windows 10 or Windows 11
* **Hardware:** HP OMEN Series Laptop
* **Driver:** Original HP System Event Utility drivers must be installed (required for `hpqBEvnt` WMI events).

Execution Methods

### Method 1: Manual Execution
To run the script on demand without opening a command prompt window:
1. Download or clone this repository to a local directory.
2. Double-click `StartHidden.vbs`.

Method 2: Run Automatically on Windows Startup (Recommended)

To ensure the key remapper active every time Windows starts:

1. Press `Win + R` on your keyboard to open the **Run** dialog.
2. Type `shell:startup` and press `Enter`. This opens the Windows Startup folder:
   ```text
   C:\Users\<Username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
