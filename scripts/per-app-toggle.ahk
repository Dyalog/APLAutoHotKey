; Script to demonstrate per-application toggle state

user_suspend := False
;didn't work out how to loop all but first in app Map
;so have a separate Boolean for general suspend
app_suspend := Map("User", False, "Classic", True, "Notepad", False, "VSCode", False)

CapsLock & SC029::
{ if GetKeyState("Shift","P") {
  Send "⌺"
} else {
  Send "⋄"
}}

Ctrl & SC035::
{ if GetKeyState("Shift","P") {
  Send "⍠"
} else {
  Send "⌿"
}}

GroupAdd "Classic", "ahk_exe C:\Program Files (x86)\Dyalog\Dyalog APL 12.1 Classic\\dyalog.exe"
GroupAdd "Classic", "ahk_exe C:\Program Files\Dyalog\Dyalog APL-64 17.1 Classic\dyalog.exe"
GroupAdd "Classic", "ahk_exe C:\Program Files\Dyalog\Dyalog APL-64 19.0 Classic\dyalog.exe"

GroupAdd "Notepad", "ahk_exe C:\Windows\System32\notepad.exe"

GroupAdd "VSCode", "ahk_exe C:\Users\rpark\AppData\Local\Programs\Microsoft VS Code\Code.exe"

Check() {
  global user_suspend
  global app_suspend
  for group, state in app_suspend
    if WinActive("ahk_group " group) && state {
      Suspend True
    } else if user_suspend {
      Suspend True
    } else {
      Suspend False
    }
}

ToggleSuspend() {
  global user_suspend
  global app_suspend
  for group, state in app_suspend
    if WinActive("ahk_group " group) {
      if state {
        app_suspend[group] := False
      } else {
        app_suspend[group] := True
      }
    } else {
      if user_suspend {
        user_suspend := False
      } else {
        user_suspend := True
      }
    }
}

SetTimer Check, 500

#SuspendExempt
LCtrl & Space::ToggleSuspend
#SuspendExempt False

#SuspendExempt   ; inspect app_suspend states
CapsLock & i::
{
  for group, state in app_suspend
    Send group state
}
#SuspendExempt False