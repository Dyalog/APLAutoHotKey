#SuspendExempt
LControl & Space::Suspend
#SuspendExempt False



^SC029::Send "⋄"
^+SC029::Send "⌺"
Control & a::
{ if GetKeyState("Shift","P") {
  Send ""
} else {
  Send "⍺"
}}

GroupAdd "Classic", "ahk_exe C:\Program Files (x86)\Dyalog\Dyalog APL 12.1 Classic\dyalog.exe"
GroupAdd "Classic", "ahk_exe C:\Program Files\Dyalog\Dyalog APL-64 17.1 Classic\dyalog.exe"

^t::Send "~"
^+t::Send "⍨"
^6::Send "≥"
^+6::Send "⍉"

Check() {
  if WinActive("ahk_group Classic") {
    Suspend True
  } else {
    Suspend False
  }
}

SetTimer Check, 500
