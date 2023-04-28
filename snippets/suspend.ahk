
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

SetTimer Check, 500   ; Check for suspend state every 500 milliseconds

;#SuspendExempt
;%SUSPENDKEYS%::ToggleSuspend
;#SuspendExempt False
