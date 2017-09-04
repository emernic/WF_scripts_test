global sprint := 0
global unfocused := 0
global typing := 0
global justattacked := 0
SetTimer, checkfocuslabel, 100

~LButton Up::
global justattacked
justattacked := 1
SetTimer, justattackedlabel, -300
return

*t::
send t
global unfocused
global typing
if (unfocused = 0 && typing = 0)
{
    typing := 1
    send {lshift up}
}
return

*Escape::
send {Escape}
global unfocused
global typing
if (unfocused = 0 && typing = 1)
{
    typing := 0
}
return

checkfocuslabel:
global unfocused
global typing
global sprint
IfWinNotActive, WARFRAME
{
    unfocused := 1
    send {lshift up}
}
else
{
    unfocused := 0
}
return

*k::
send k
global sprint
if (sprint = 0)
{
    sprint := 1
    Gosub, sprintdownlabel
}
else
{
    sprint := 0
    Gosub, sprintuplabel
    SetTimer, sprintdownlabel, Off
}
return

sprintuplabel:
global unfocused
global typing
global sprint
if (unfocused = 0 && typing = 0)
{
    send {lshift up}
}
if (sprint = 1)
{
    SetTimer, sprintdownlabel, -10
}
return

sprintdownlabel:
global unfocused
global typing
global justattacked
if (unfocused = 0 && typing = 0 && justattacked = 0 && !(GetKeyState("LButton","P")))
{
    send {lshift down}
}
SetTimer, sprintuplabel, -1000
return

justattackedlabel:
global justattacked
justattacked := 0
return