Set WScriptShell = CreateObject("Wscript.Shell")
WScriptShell.Run "wscript.exe """ & CreateObject("Scripting.FileSystemObject").GetAbsolutePathName("OmenKeyRemapper.vbs") & """", 0, False
