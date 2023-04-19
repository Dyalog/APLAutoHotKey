
Check() {
  if WinActive("ahk_group Classic") || user_suspend {
    Suspend True
  } else {
    Suspend False
  }
}

SetTimer Check, 500

#SuspendExempt
LControl & Space::
{ if user_suspend
  {
    user_suspend := False
  } else {
    user_suspend := True
  }
}
#SuspendExempt False


; what if no classic?