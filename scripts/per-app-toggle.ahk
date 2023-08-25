; Script to demonstrate per-application toggle state

user_suspend := False
;didn't work out how to loop all but first in app_suspend Map
;so have a separate Boolean for general suspend
app_suspend := Map("Classic", True, "Notepad", False, "VSCode", False)

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
  sus := False
  app_active := False
  For group, state in app_suspend
    If WinActive("ahk_group " group) {
      app_active := True   ; any group window is active
      sus := state         ; and its suspend state is True
    }
  If app_active {
    Suspend sus
  } else {
    Suspend user_suspend
  }
}

ToggleSuspend() {
  global user_suspend
  global app_suspend
  app_active := False   ; Any group window is active
  For group in app_suspend
    If WinActive("ahk_group " group) {
      app_active := True
      app_suspend[group] := !app_suspend[group]
    }
  If !app_active {
    user_suspend := !user_suspend
  }
}

;SetTimer Check, 500

NotepadCheck() {
  WinWaitActive "ahk_group Notepad"
    Send "notepad now"
    Suspend app_suspend["Notepad"]
  WinWaitNotActive "ahk_group Notepad"
    NotepadCheck()
}

NotepadCheck()

#SuspendExempt
LCtrl & Space::ToggleSuspend
#SuspendExempt False

#SuspendExempt   ; inspect app_suspend states
CapsLock & i::
{
  for group, state in app_suspend
    Send group state
  Send user_suspend
}
#SuspendExempt False