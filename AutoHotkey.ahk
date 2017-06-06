^!f::
   Run "C:\Program Files (x86)\Far2\Far.exe"
Return

^!b::
IfWinExist, Windows PowerShell
{
    WinActivate
}			
else
{
    Run %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe 
    WinWait Windows PowerShell
    WinActivate
}

Send cd %SANDBOX%\trunk{Enter}
Send mvn ``-Dcsf.container=jboss clean install{Enter}
Return
      	
^!t::
IfWinExist ahk_exe chrome.exe
    winactivate ahk_exe chrome.exe
else
    run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
WinWait ahk_exe chrome.exe
WinActivate ahk_exe chrome.exe
WinWaitActive ahk_exe chrome.exe
Send ^1
Send t
Return
