user_suspend := False

CapsLock & SC029::
{ if GetKeyState("Shift","P") {
  Send "⌺"
} else {
  Send "⋄"
}}



RAlt & SC029::
{ if GetKeyState("Shift","P") {
  Send "⌺"
} else {
  Send "⋄"
}}


RControl & i::
{ if GetKeyState("Shift","P") {
  Send "⍸"
} else {
  Send "⍳"
}}

GroupAdd "Classic", "ahk_exe C:\Program Files\Dyalog\Dyalog APL-64 17.1 Classic\dyalog.exe"

Check() {
  if WinActive("ahk_group Classic") || user_suspend {
    Suspend True
  } else {
    Suspend False
  }
}
ToggleSuspend() {
  global user_suspend
  if user_suspend {
    user_suspend := False
  } else {
    user_suspend := True
  }
}

SetTimer Check, 500

#SuspendExempt
LControl & Space::ToggleSuspend
#SuspendExempt False

