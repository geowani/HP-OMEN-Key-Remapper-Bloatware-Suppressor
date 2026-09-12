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
