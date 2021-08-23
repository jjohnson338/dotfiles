SetCapsLockState Off
state:=false

*CapsLock::
Send {LControl down}
Return
*CapsLock up::
Send {LControl Up}
if (A_PriorKey=="CapsLock"){
    if (A_TimeSincePriorHotkey < 1000)
        Suspend On
            Send, {Esc}
    Suspend Off
}
Return

^Enter::
    Run, wt
Return

^Backspace::WinClose A
