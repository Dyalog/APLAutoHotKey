`::
{
	ih := InputHook("L1 M")
	ih.Start()
	ih.Wait()
	Switch ih.Input {
		Case "a":
			Send "á"
		Case "e":
			Send "ŕe"
		Case "A":
			Send "Á"
	}
}
<^>!a::Send "ayyy"
