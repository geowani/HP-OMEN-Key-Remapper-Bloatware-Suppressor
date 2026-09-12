Set shell = CreateObject("WScript.Shell")

' Terminate HP OMEN background process
shell.Run "taskkill.exe /IM OmenCommandCenterBackground.exe /F", 0, True

' Connect to WMI interface
Set wmi = GetObject("winmgmts:\\.\root\wmi")

' Intercept HP OMEN hardware key event
Set events = wmi.ExecNotificationQuery( _
    "SELECT * FROM hpqBEvnt WHERE EventData = 8613 AND EventID = 29")

' Event loop
Do
    Set evt = events.NextEvent()
    shell.Run "explorer.exe", 1, False
Loop
