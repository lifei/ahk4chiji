; GPL v3

; 变量声明

KeySquat := "Ctrl"
KeyTarget := "P"
KeyWalk := "C"

; 环境初始化

#NoEnv
#InstallKeybdHook
#InstallMouseHook
#SingleInstance force
SetTitleMatchMode 2
SendMode Input
#UseHook On
~Home::Suspend
~End::ExitApp

; Shift+Space = 大跳

*$+Space::
  KeyWait, Space, T0.08
  If ErrorLevel {
    SendInput {Space}{%KeySquat% Down}
    Sleep 500
    SendInput {%KeySquat% Up}}
  } else {
    SendInput {Space}
  }
  return

; 走路时打开肩射模式
~*$C::
  Send {%KeyTarget% down} 
  Send {%KeyWalk% down} 
  sleep 250
  While NOT GetKeyState(KeyWalk, "P") AND NOT GetKeyState(KeyTarget, "P") AND NOT GetKeyState("RButton", "P") AND NOT GetKeyState("Space", "P") AND NOT GetKeyState("R", "P") AND NOT GetKeyState("Tab", "P") { 
    sleep 10 
  } 
  Send {%KeyTarget% up} 
  Send {%KeyWalk% up}
  return ; 这段是走路瞄准 

~*$RButton::
  Send {%KeyTarget%}
  return

ToolTip(label){
  ToolTip, %label%, 930, 650
  SetTimer, RemoveToolTip, 1000
  return
  RemoveToolTip:
  SetTimer, RemoveToolTip, Off
  ToolTip
  return
}
