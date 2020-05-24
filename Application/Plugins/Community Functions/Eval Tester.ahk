#Include %A_ScriptDir%/Eval.ahk
#SingleInstance Force
SetBatchLines, -1

Gui, +HwndTester
Gui, Add, Text, x10 y10 w100, Expression:
Gui, Add, Edit, xp y+5 w600 r10 vInput gRun
Gui, Add, Text, xp y+10, Results:
Gui, Add, Edit, xp y+5 w600 r10 vOutput ReadOnly
Gui, Add, Button, xp y+5 w100 r2 gEvaluate, Evaluate (F5)
Gui, Add, CheckBox, x+10 yp+10 w80 r1 vAutoRun Checked, Auto-Run
Gui, Show,, Expression Tester
return

GuiClose:
ExitApp

Run:
Gui, Submit, NoHide
If (!AutoRun)
    return
Evaluate:
Gui, Submit, NoHide
Result:=evaluate(Input)
GuiControl,, Output, %Result%
return

#If WinActive("ahk_id " Tester)
F5::
GoSub, Evaluate
return

evaluate(Input)
{
Result := StrReplace(Input, "`n", ",")
loop
{
	Try
	{
		Result := Eval(Result)
		Result := StrJoin(Result, "`n")
	}
	msgbox % Result
	if (Result+0!="") or (Result="")
		break
}
return Result+0
}