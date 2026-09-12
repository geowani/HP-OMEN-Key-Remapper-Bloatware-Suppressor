HP OMEN Key Remapper & Bloatware Suppressor

A lightweight, background utility written in native VBScript to intercept the physical OMEN key on HP OMEN laptops. It suppresses default background services and redirects the key action to open Windows File Explorer or any user-defined application.

Currently configured to launch **Windows File Explorer** (`explorer.exe`).

Motivation

HP OMEN laptops feature a dedicated hardware key mapped to launch *OMEN Gaming Hub*. This software suite initiates background services (`OmenCommandCenterBackground.exe`) that continuously consume system RAM and CPU overhead.

This project provides a dependency-free solution to disable the heavy background process and repurpose the physical key into a practical shortcut using native Windows components.

Technical Overview

The application relies on Windows Management Instrumentation (WMI) to capture driver-level keyboard events directly from the HP system driver interface (`hpqBEvnt`).

* **Process Management:** Terminates active instances of `OmenCommandCenterBackground.exe`.
* **Hardware Interception:** Listens to `root\wmi` events filtered by `EventID = 29` and `EventData = 8613`.
* **Action Execution:** Executes a silent loop triggering `explorer.exe` upon event registration.
* **Zero Dependencies:** Uses standard Windows Script Host (`wscript.exe`), requiring no third-party runtimes or compilers.
  
Customization

To assign a different application to the OMEN key, open `OmenKeyRemapper.vbs` and replace `explorer.exe` with your target executable path inside the loop:

```vbscript
' Example: Open Windows Terminal
shell.Run "wt.exe", 1, False

' Example: Open Google Chrome
shell.Run "chrome.exe", 1, False
```

Technical Background & Reverse Engineering

Unlike standard key remapping software that listens to generic virtual key codes, the physical OMEN key sends low-level hardware signals handled directly by HP's proprietary system drivers. Prior to this project, limited documentation existed on how to cleanly intercept this trigger without relying on heavy background utilities.

Through reverse engineering WMI (Windows Management Instrumentation) hardware events, the specific driver signal emitted by the HP keyboard driver (`hpqBEvnt`) was identified:

* **EventID:** `29`
* **EventData:** `8613`

By targeting these exact parameters directly at the WMI event-sink level, this utility bypasses the default HP event loop, suppressing the launch of OMEN Gaming Hub and allowing instant command execution.
