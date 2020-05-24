#noenv
#singleinstance force
SetBatchLines,-1
#NoEnv
#KeyHistory 0
SetControlDelay,-1
;SetWinDelay, -1
ListLines Off
Process, Priority, , A
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
AutoTrim, Off
#MaxThreadsBuffer On

GUI,HQ:Default
GUI,HQ: Add, Tab3,x0 y0,General|Settings|About
GUI,HQ: Tab, 1
GUI,HQ: Add, ActiveX, vbackground1 hwndbackground1hwnd x0 y0,% "mshtml:<img src=""" A_ScriptDir "\Plugins\Animations\background1.gif""width=""" A_ScreenWidth-15 """ height=""" A_ScreenHeight-75 """>"
GUI,HQ: Add, text, vtextxi x457 y31 Hidden ,%A_Space%Xi: 
GUI,HQ: Add, edit, vxi gchecknumber x472 y28 w100 h21 Hidden , 0
GUI,HQ: Add, combobox,% " hidden Simple gsetexpression vguiworkingexpression x" A_ScreenWidth*4/5+10 " y115 w" A_ScreenWidth*1/5-40 " h" A_Screenheight*4/5-32
GUI,HQ: Add, text,% " hidden vworkingexpressiontext x" A_ScreenWidth*4/5+10 " y100",%A_Space%Possible Working Expressions( g(x) = ): 

GUI,HQ: Add, combobox,% " hidden Simple gfocuscombobox vequationsystem x" A_ScreenWidth*4/5+10 " y115 w" A_ScreenWidth*1/5-40 " h" A_Screenheight*4/5-32,3*x-0.1*y-0.2*z=7.85|0.1*x+7*y-0.3*z=-19.3|0.3*x-0.2*y+10*z=71.4

focuscombobox:=equationsystem
GUI,HQ: Add, button,% " hidden vaddeq gaddeq x" A_ScreenWidth*4/5+10 " y60",Add
GUI,HQ: Add, button,% " hidden vdeleq gdeleq x" A_ScreenWidth*4/5+100 " y60",Delete
GUI,HQ: Add, checkbox, hidden x262 y28 h13 guserelaxation vuserelaxation,Relaxation:
GUI,HQ: Add, edit, hidden vrelaxation hwndHED x340 y28 w100 h21,1
GUI,HQ: Add, updown, hidden -2 vrelaxationdummy hwndHUD x340 y28 w100 h21
CustomIncrement("relaxationdummy",HUD,HED,.05,0,2) ; (ControlID,UpDownHWND,EditBuddyHWND,Increment,MinRangeLimit,MaxRangeLimit)

GUI,HQ: Add, text,hidden x800 y65 vformatmodetext,%A_Space%Mode: 
GUI,HQ: Add, dropdownlist,hidden gformatmode vformatmode x835 y62 w100 choose2,Equation|Matrix

global givenmatrix:=[[]]
givenmatrix[1]:=([38,1,44,97,83,67,88,88,34,86,41,57,63,42,75,14,25,3,64,69,2])
givenmatrix.push([68,16,78,45,0,11,46,32,9,79,24,88,9,73,80,94,95,15,30,55,75])
givenmatrix.push([45,68,56,23,92,48,34,37,82,14,50,40,88,48,98,96,52,12,3,36,45])
givenmatrix.push([88,76,78,92,52,16,83,59,22,42,34,92,46,73,82,10,24,87,20,6,26])
givenmatrix.push([62,94,1,12,43,6,21,33,16,75,22,6,49,83,71,7,22,62,93,49,26])
givenmatrix.push([37,31,93,1,49,73,15,73,32,44,58,24,17,14,80,78,75,27,68,98,37])
givenmatrix.push([59,46,41,41,96,75,63,4,24,69,10,47,2,75,5,73,57,21,10,66,93])
givenmatrix.push([34,94,39,99,23,3,65,18,88,18,29,12,37,82,93,25,91,26,26,76,66])
givenmatrix.push([18,69,18,68,35,74,55,52,7,42,90,18,32,37,86,56,3,88,63,57,13])
givenmatrix.push([31,56,44,25,86,34,50,84,96,11,93,6,27,67,22,3,33,75,98,55,57])
givenmatrix.push([48,45,9,96,79,5,57,55,78,88,32,20,82,30,32,97,67,68,83,80,79])
givenmatrix.push([9,12,88,0,70,51,6,41,67,62,0,1,51,3,36,21,39,97,20,38,8])
givenmatrix.push([69,10,68,43,44,43,79,97,41,81,94,76,85,30,81,33,59,26,25,89,76])
givenmatrix.push([10,3,100,38,43,99,65,43,85,90,3,10,34,35,72,65,76,60,96,95,90])
givenmatrix.push([30,50,68,78,81,88,32,20,18,18,62,55,15,98,39,16,69,68,85,17,6])
givenmatrix.push([7,22,10,77,35,79,44,96,37,43,13,47,62,2,42,20,31,40,93,73,51])
givenmatrix.push([37,37,98,94,33,52,18,55,93,65,77,96,17,38,77,65,93,87,33,8,97])
givenmatrix.push([51,8,58,24,25,31,20,55,45,79,46,97,31,2,53,1,80,72,34,38,84])
givenmatrix.push([4,88,45,41,24,51,37,92,27,6,60,84,65,81,86,76,60,94,96,22,30])
givenmatrix.push([75,43,46,1,53,2,60,24,31,92,53,62,37,11,82,24,50,40,19,19,39])

;global givenmatrix	:=  [[3,-0.1,-0.2,7.85]
;						,[0.1,7,-0.3,-19.3]
;						,[0.3,-0.2,10,71.4]]

GUI,HQ: Add, text,hidden vunknowncounttext x13 y31,%A_Space%Number of Unknowns: 
GUI,HQ: Add, edit,hidden vunknowncountdummy number x120 y28 w125 h21
GUI,HQ: Add, updown,hidden 0x80 gunknowncount vunknowncount x120 y28 w125 h21 range1-4294967296,% givenmatrix.Length()

GUI,HQ: Add, listview,% "hidden -LV0x10 -ReadOnly NoSort NoSortHdr Grid r4 hwndHLV2 vLV2 vmatrixgiven AltSubmit x1 y100 w" (A_ScreenWidth*(2/4))-20 " h" A_Screenheight*4/5-20

; Create a new instance of LV_InCellEdit for HLV2 with options HiddenCol1 and BlankSubItem
ICELV2 := New LV_InCellEdit(HLV2,True,,"savematrix")
gosub,unknowncount

GUI,HQ: Add, listview,% "hidden -LV0x10 NoSort NoSortHdr Grid vmatrixanswer x1 y100 w" (A_ScreenWidth*2/4)-10 " x" (A_ScreenWidth*2/4) " h" A_Screenheight*4/5-20

GUI,HQ: Add, text, hidden x257 y31 vderdegtext,%A_Space%Derivative Degree: 
GUI,HQ: Add, edit, hidden vderdegdummy Number x350 y28 w85 h21
GUI,HQ: Add, updown,hidden 0x80 vderdeg x350 y28 w85 h21 range1-4294967296, 3
GUI,HQ: Add, text, hidden vtextvarx x457 y31,%A_Space%x: 
GUI,HQ: Add, edit, hidden vvarx gchecknumber x472 y28 w100 h21, 3
GUI,HQ: Add, text, hidden vtextvarh x455 y62,%A_Space%h: 
GUI,HQ: Add, edit, hidden vvarh gchecknumber x473 y59 w100 h21, 0.01

GUI,HQ: Add, text, hidden x257 y31 vupperlimittext,%A_Space%Upper Limit: 
GUI,HQ: Add, Edit,hidden gupperlowerlimits vupperlimit hwndHED x320 y28 w85 h21,1
GUI,HQ: Add, updown,hidden -2 vupperlimitdummy hwndHUD x320 y28 w85 h21
CustomIncrement("upperlimitdummy",HUD,HED,.25) ; (ControlID,UpDownHWND,EditBuddyHWND,Increment,MinRangeLimit,MaxRangeLimit)
GUI,HQ: Add, text, hidden x257 y60 vlowerlimittext,%A_Space%Lower Limit: 
GUI,HQ: Add, Edit,hidden gupperlowerlimits vlowerlimit hwndHED x320 y60 w85 h21,0
GUI,HQ: Add, updown,hidden -2 vlowerlimitdummy hwndHUD x320 y60 w85 h21
CustomIncrement("lowerlimitdummy",HUD,HED,.25) ; (ControlID,UpDownHWND,EditBuddyHWND,Increment,MinRangeLimit,MaxRangeLimit)
GUI,HQ: Add, text, hidden vSegmentstext x415 y31,%A_Space%Segments: 
GUI,HQ: Add, Edit, hidden vSegmentsdummy gmonitorsample x472 y28 w100 h21 Number
GUI,HQ: Add, UpDown, hidden 0x80 vSegments gmonitorsample x472 y28 w100 h21 range1-4294967296,1

GUI,HQ: Add, text,hidden x435 y65 vsimpsonruletext,%A_Space%Mode: 
GUI,HQ: Add, dropdownlist,hidden gmonitorsample vsimpsonrule x472 y62 w100 choose2,1/3|3/8

GUI,HQ: Add, listview,% "hidden -LV0x10 Grid NoSort NoSortHdr vmixedlv gmixedlv AltSubmit x" 5+(A_ScreenWidth*4/5) " y100 w" (A_ScreenWidth*1/5)-18 " h" A_Screenheight*4/5-20,Mode|Segments|%A_Space%
Menu,mixintegmenu, Add,Move Upwards,mixintegup
Menu,mixintegmenu, Add,Move Downwards,mixintegdown
Menu,mixintegmenu, Add,DELETE,mixintegdelete
GUI,HQ: Add, dropdownlist,% "hidden vmixintegmode gmonitorsample x" 40+A_ScreenWidth*4/5 " y27 w120 choose1",Trapezoidal Rule|Simpson's 1/3 Rule|Simpson's 3/8 Rule
GUI,HQ: Add, button,% "hidden vmixintegadd gmixintegadd x" 180+A_ScreenWidth*4/5 " y40",Add

GUI,HQ: Add, Edit,hidden vsampleend x330 y28 w85 h21,4
GUI,HQ: Add, Edit,hidden vsamplestart x330 y60 w85 h21,0
GUI,HQ: Add, Edit,hidden vstepsize hwndHED x855 y62 w100,0.5
GUI,HQ: Add, updown,hidden -2 vstepsizedummy hwndHUD x855 y62 w100 h21
CustomIncrement("stepsizedummy",HUD,HED,.1,0) ; (ControlID,UpDownHWND,EditBuddyHWND,Increment,MinRangeLimit,MaxRangeLimit)
GUI,HQ: Add, text,hidden x970 y62 vcorrectioncounttext,%A_Space%Correction Count: 
GUI,HQ: Add, Edit,hidden vcorrectioncount x1060 y62 w100,1
GUI,HQ: Add, updown,hidden 0x80 vcorrectioncountdummy x1060 y62 w100 h21 range1-4294967295,1
GUI,HQ: Add, text,hidden vguiequationtext x1 y31 cblue ,%A_Space%Equation:
GUI,HQ: Add, edit,hidden vguiequation gcheckequation x55 y28 w190 h21, dy/dx=-2*x**3+12*x**2-20*x+8.5
GUI,HQ: Add, button, vgraph ggraph x970 y28 w56 h23 hidden ,Graph

GUI,HQ: Add, text, vtextxl x457 y31,%A_Space%Xl: 
GUI,HQ: Add, edit, vxl gchecknumber x472 y28 w100 h21, 0
GUI,HQ: Add, text, vtextxu x455 y62,%A_Space%Xu: 
GUI,HQ: Add, edit, vxu gchecknumber x473 y59 w100 h21, 1
GUI,HQ: Add, text, x280 y31 vtolerancetext,%A_Space%Tolerance: 
GUI,HQ: Add, edit, vtolerance gcheckpositivenumber x335 y28 w100 h21, 0.0000001
global tolerance
GUI,HQ: Add, text, x585 y31,%A_Space%Decimal Places: 
GUI,HQ: Add, edit, vdecimalplacesdummy x668 y28 w100 h21 Number
GUI,HQ: Add, updown,0x80 vdecimalplaces x335 y62 w100 h21 range1-4294967295, 4
GUI,HQ: Add, text, x608 y65,%A_Space%Angle Unit: 
GUI,HQ: Add, dropdownlist, vangleunit gcheckequation x668 y62 w100 choose2,Degree|Radian
GUI,HQ: Add, button, vcalculate gcalculate x800 y28 w56 h23, Calculate
GUI,HQ: Add, button, vstop gstop x860 y28 w56 h23 hidden , Stop
GUI,HQ: Add, text, vguiformulatext x13 y31 cblue ,%A_Space%f(x) = 
GUI,HQ: Add, edit, vguiformula gcheckequation x45 y28 w200 h21, exp(-x)-x

;~~~~~~~~UNCOMMENT TO PARA MADISABLE ANG IBANG METHOD

GUI,HQ: Add, text, x1 y65,%A_Space%Method:
GUI,HQ: Add, dropdownlist,vtype gchangetype x45 y62 w200 AltSubmit choose9,Bisection|False Position(Regula Falsi)|Fixed Point|Secant|Newton-Raphson|Newton|Gauss-Seidel|Gauss-Jacobi|Gauss Elimination|Gauss-Jordan Elimination|LU Decomposition|Matrix Inverse|Numerical Differentiation|Trapezoidal Rule of Integration|Simpson's Rule of Integration|Mixed Integration Method|Euler's Method of ODE|Midpoint Method of ODE|Ralston's Method of ODE|Heun's Method of ODE

;~~~~~~~~~

GUI,HQ: Add, listview,% "-LV0x10 Grid NoSort NoSortHdr vlistview x1 y100 w" A_ScreenWidth*4/5 " h" A_Screenheight*4/5-20, Iteration|Xl|Xu|Xm|f(Xl)|f(Xu)|f(Xm)|`%Error|%A_Space%%A_Tab%

GUI,HQ:Tab,2
GUI,HQ: Add, ActiveX, vbackground2 hwndbackground2hwnd x0 y0,% "mshtml:<img src=""" A_ScriptDir "\Plugins\Animations\background2.gif""width=""" A_ScreenWidth-15 """ height=""" A_ScreenHeight-75 """>"
GUI,HQ: Add, button,gmaximadir x1 y30 h20,Maxima Directory
global maximadir
if FileExist(A_ScriptDir "\Plugins\maxima-5.43.0\bin\maxima.bat")
	maximadir:=A_ScriptDir "\Plugins\maxima-5.43.0\bin\maxima.bat"
GUI,HQ: Add, edit,% "vmaximadir x100 y30 h20 readonly w" A_ScreenWidth*4/5,%maximadir%

GUI,HQ: Add, button,gdircmd x1 y60 h20,CMD Directory
global vComSpec
if A_Is64bitOS
	tmpr=x64
else tmpr=x86
if FileExist(A_ScriptDir "\Plugins\GNU MCU Eclipse\" tmpr "\2.12-20190422-1053\bin\sh.exe")
	vComSpec:=A_ScriptDir "\Plugins\GNU MCU Eclipse\" tmpr "\2.12-20190422-1053\bin\sh.exe"
else vComSpec := A_ComSpec ? A_ComSpec : ComSpec
GUI,HQ: Add, edit,% "vvComSpec x100 y60 h20 readonly w" A_ScreenWidth*4/5,%vComSpec%

GUI,HQ: Add,checkbox,gusebackground vusebackground checked,Show Animated Background
GUI,HQ:Tab,3
GUI,HQ: Add, ActiveX, vbackground3 hwndbackground3hwnd x0 y0,% "mshtml:<img src=""" A_ScriptDir "\Plugins\Animations\background3.gif""width=""" A_ScreenWidth-15 """ height=""" A_ScreenHeight-75 """>"
GUI,HQ: Add,text,x5 y30,
(
~~~~~~~~~~Numerical Methods Calculator~~~~~~~~~~


Author:		Aldrin John O. Manalansan
Course:		Engineering
Program:	BSECE

Artificial Knowledge for Numerical Methods
Professor:	Engr. Jasmin Ladrillono
Academic Year:	2019-2020


~~~~~~~~~~~POWERED BY~~~~~~~~~~~
		AUTOHOTKEY
MAXIMA COMPUTER ALGEBRAIC SYSTEM
)
;(
;~~~~~~~~~~Numerical Methods Calculator~~~~~~~~~~
;
;Group Members:
;		Aldrin John O. Manalansan
;		Kierren Noel L. Oribello
;		Kevin V. Crisolo
;		John Matthew Quilao
;		Jellai Joenelle Canonizado
;		Romiel Jan Sambat
;		Kingfai Aaron Sit
;
;Artificial Knowledge for Numerical Methods
;Professor:	Engr. Jasmin Ladrillono
;School Year:	2019-2020
;
;
;~~~~~~~~~~~POWERED BY~~~~~~~~~~~
;		AUTOHOTKEY
;MAXIMA COMPUTER ALGEBRAIC SYSTEM
;)

listviewparam=listview,matrixanswer ; register this listviews as colored listviews
loop,parse,listviewparam,`,
	LVA_ListViewAdd(A_LoopField)
listviewparam=
OnMessage("0x4E", "LVA_OnNotify")

GUI,HQ: +HwndGuiHwnd
GUI,HQ:show,,Numerical Methods Calculator
gosub,changetype
GUI,HQ: +LastFoundExist
IfWinExist
{
	VarSetCapacity( rect, 16, 0 )
	DllCall("GetClientRect", uint, MyGuiHWND := WinExist(), uint, &rect )
	W := NumGet( rect, 8, "int" )
	H := NumGet( rect, 12, "int" )
}
WinMove,ahk_id %background1hwnd%,,-10,-15,%W%,%H%
WinSet,Bottom,,ahk_id %background1hwnd%
WinMove,ahk_id %background2hwnd%,,-10,-15,%W%,%H%
WinSet,Bottom,,ahk_id %background2hwnd%
WinMove,ahk_id %background3hwnd%,,-10,-15,%W%,%H%
WinSet,Bottom,,ahk_id %background3hwnd%
W:=H:=rect:=MyGuiHWND:=background1hwnd:=background2hwnd:=background3hwnd:=""

gosub,equate ; recallibrate the formula
Hotkey,$~+!^l,,P100
return

graph: ; graph generator
Gui,ListView,listview
guicontrolget,samplestart,,samplestart
guicontrolget,sampleend,,sampleend
guicontrolget,stepsize,,stepsize
if !LV_GetCount()
	gosub,calculate

GUI grapher:New 
GUI grapher:+hwndgrapherhwnd +Resize
GUI grapher:Show,Maximize

maximum:=minimum:=""
for index, in approximategraph
{
	tmpr:=approximategraph[index,2]
	
	if (minimum="") or (minimum>tmpr)
	{
		minimum:=tmpr
		save1:=index
	}
	if (maximum="") or (maximum<tmpr)
	{
		maximum:=tmpr
		save2:=index
	}
}
for index, in truegraph
{
	tmpr:=truegraph[index,2]
	if (minimum="") or (minimum>tmpr)
	{
		minimum:=tmpr
		save1:=index
	}
	if (maximum="") or (maximum<tmpr)
	{
		maximum:=tmpr
		save2:=index
	}
}
chart1 := new gdipChart(grapherhwnd,"",[floor(samplestart),floor(minimum),ceil(sampleend)-floor(samplestart),ceil(maximum)-floor(minimum)])
maximum:=minimum:=""

streams:=[]
stream := chart1.addDataStream(truegraph,0xFF00FF00 )
stream.setVisible()
streams.push( stream )
stream := chart1.addDataStream(approximategraph,0xFF0000FF )
stream.setVisible()
streams.push( stream )

chart1.setVisible()

return

usebackground:
guicontrolget,usebackground,,usebackground
GuiControl,Show%usebackground%,background1
GuiControl,Show%usebackground%,background2
GuiControl,Show%usebackground%,background3
return

mixedlv:
if (A_GuiEvent="RightClick") or (A_GuiEvent="R")
	Menu,mixintegmenu,Show
return

mixintegup:
Gui,ListView,mixedlv
loop % LV_GetCount()
{
	tmpr1:=LV_GetNext(A_Index-1)
	if (tmpr1=A_Index) and (tmpr1!=1)
	{
		LV_GetText(tmpr1,A_Index,1)
		LV_GetText(tmpr2,A_Index-1,1)
		LV_Modify(A_Index,,tmpr2)
		LV_Modify(A_Index-1,,tmpr1)
		LV_GetText(tmpr1,A_Index,2)
		LV_GetText(tmpr2,A_Index-1,2)
		LV_Modify(A_Index,"-Select col2",tmpr2)
		LV_Modify(A_Index-1,"Select col2",tmpr1)
	}
	else if (tmpr1=0)
		break
}
tmpr1:=tmpr2:=""
return

mixintegdown:
Gui,ListView,mixedlv
count:=LV_GetCount()
loop % count
{
	index:=count-A_Index+1
	tmpr1:=LV_GetNext(index-1)
	if (tmpr1=index) and (tmpr1!=count)
	{
		LV_GetText(tmpr1,index,1)
		LV_GetText(tmpr2,index+1,1)
		LV_Modify(index,,tmpr2)
		LV_Modify(index+1,,tmpr1)
		LV_GetText(tmpr1,index,2)
		LV_GetText(tmpr2,index+1,2)
		LV_Modify(index,"-Select col2",tmpr2)
		LV_Modify(index+1,"Select col2",tmpr1)
	}
}
count:=index:=tmpr1:=tmpr2:=""
return

mixintegdelete:
Gui,ListView,mixedlv
count:=LV_GetCount()
loop % count
{
	index:=count-A_Index+1
	if (LV_GetNext(index-1)=index)
		LV_Delete(index)
}
index:=count:=""
return

mixintegadd:
guicontrolget,Segments,,Segments
guicontrolget,mixintegmode,,mixintegmode
Gui,ListView,mixedlv
GuiControl,-Redraw,%A_DefaultListView%
LV_Add("Vis",mixintegmode,Segments)
LV_ModifyCol(1,"AutoHDR Center"),LV_ModifyCol(2,"AutoHDR Center")
GuiControl,+Redraw,%A_DefaultListView%
return

maximadir:
Gui +OwnDialogs
FileSelectFile,file,3,,Commonly found at ~~~~bin\maxima.bat,maxima.bat
if file<>
{
	GuiControl,Text,maximadir,%file%
}
return

dircmd:
Gui +OwnDialogs
FileSelectFile,file,3,,Commonly found at ~~~~bin\sh.exe,sh.exe
if file<>
{
	GuiControl,Text,vComSpec,%file%
}
return

monitorsample:
tmpr:=Segmentsdummy
guicontrolget,Segmentsdummy,,Segmentsdummy
guicontrolget,type,,type
if (type=16)
{
	guicontrolget,mixintegmode,,mixintegmode
	if (mixintegmode="Simpson's 1/3 Rule")
	{
		if (Segmentsdummy<2)
		{
			GuiControl,text,Segments,2
		}
		else if (Mod(Segmentsdummy,2)!=0)
		{
			if (Segmentsdummy<tmpr)
			{
				GuiControl,,Segments,+-1
			}
			else
			{
				GuiControl,,Segments,+1
			}
		}
	}
	else if (mixintegmode="Simpson's 3/8 Rule")
	{
		if (Segmentsdummy<3)
		{
			GuiControl,text,Segments,3
		}
		else if (Mod(Segmentsdummy,3)!=0)
		{
			if (Segmentsdummy<tmpr)
			{
				GuiControl,,Segments,% "+-" Mod(Segmentsdummy,3)
			}
			else
			{
				GuiControl,,Segments,% "+" 3-Mod(Segmentsdummy,3)
			}
		}
	}
	else if (Segmentsdummy<1)
	{
		GuiControl,text,Segments,1
	}
	guicontrolget,Segmentsdummy,,Segmentsdummy
}
else
{
	guicontrolget,simpsonrule,,simpsonrule
	if (type=15)
		if (simpsonrule="1/3") and (Segmentsdummy<2)
			GuiControl,,Segments,2
		else if (simpsonrule="3/8") and (Segmentsdummy<3)
			GuiControl,,Segments,3
	else if (Segmentsdummy<1)
		GuiControl,,Segments,1
	guicontrolget,Segmentsdummy,,Segmentsdummy
	if (type=15)
	{
		if (simpsonrule="1/3")
		{
			if (Segmentsdummy<2)
			{
				GuiControl,text,Segments,2
			}
			else if (Mod(Segmentsdummy,2)!=0)
			{
				if (Segmentsdummy<tmpr)
				{
					GuiControl,,Segments,+-1
				}
				else
				{
					GuiControl,,Segments,+1
				}
			}
		}
		else if (simpsonrule="3/8")
		{
			if (Segmentsdummy<2)
			{
				GuiControl,text,Segments,3
			}
			else if (Mod(Segmentsdummy,3)!=0)
			{
				if (Segmentsdummy<tmpr)
				{
					GuiControl,,Segments,% "+-" Mod(Segmentsdummy,3)
				}
				else
				{
					GuiControl,,Segments,% "+" 3-Mod(Segmentsdummy,3)
				}
			}
		}
	}
	guicontrolget,Segmentsdummy,,Segmentsdummy
}
return

upperlowerlimits:
guicontrolget,lowerlimit,,lowerlimit
guicontrolget,upperlimit,,upperlimit
if (lowerlimit>upperlimit)
{
	if A_GuiControl=lowerlimit
		GuiControl,text,upperlimit,% lowerlimit+.25-mod(lowerlimit,.25)
	else if A_GuiControl=upperlimit
		GuiControl,text,lowerlimit,% upperlimit-.25+mod(lowerlimit,.25)
}
return

userelaxation:
guicontrolget,userelaxation,,userelaxation
if userelaxation
{
	GuiControl,show,relaxation
	GuiControl,show,relaxationdummy
}
else
{
	GuiControl,hide,relaxation
	GuiControl,hide,relaxationdummy
}
return

formatmode:
GuiControl,show,userelaxation
gosub,userelaxation
guicontrolget,formatmode,,formatmode
if (formatmode="Matrix")
{
	guicontrol,hide,workingexpressiontext
	guicontrol,hide,equationsystem
	guicontrol,hide,listview
	
	GuiControl,show,matrixanswer
	Gui,ListView,matrixanswer
	
	LV_ClearAll(0)
	
	GuiControl,show,matrixgiven
	Gui,ListView,matrixgiven
	gosub,unknowncount
	GuiControl,show,unknowncounttext
	GuiControl,show,unknowncount
	GuiControl,show,unknowncountdummy
}
else
{
	GuiControl,show,addeq
	GuiControl,show,deleq
	GuiControl,show,equationsystem
	GuiControl,show,workingexpressiontext
	GuiControl,text,workingexpressiontext,System of Linear Equations:
	GuiControl,show,listview
	Gui,ListView,listview
	
	LV_ClearAll(0)
	
	GuiControl,hide,matrixanswer
	GuiControl,hide,matrixgiven
	GuiControl,hide,unknowncounttext
	GuiControl,hide,unknowncount
	GuiControl,hide,unknowncountdummy
}
return

savematrix(State,HLV,HED,Row,Col,Text)
{
	if (State="END")
	{
		givenmatrix[Row,Col-1]:=Text
	}
	return
}


;group work ; logic ng GUI interface kung pano nacocontrol ang dami ng unknowns
;row = unknowns
;column = unknowns+1
unknowncount: ; subroutine
GuiControlGet,unknowncount,,unknowncount
Gui,ListView,matrixgiven
GuiControl,-Redraw,matrixgiven
LV_ClearAll()
loop % LV_GetCount("Column")-1
	lv_deletecol(2)
lv_modifycol(1,0,"") ; hide column 1 which is bugged
GuiControlGet,type,,type
;if (type=12)
;	columncount:=unknowncount
;else
	columncount:=unknowncount+1
loop %unknowncount% ; for rows
{
	if (debugmode=1)
		msgbox unknowncount
	LV_Add()
	row:=A_Index
	loop % columncount ;for columns
	{
		if (debugmode=1)
			msgbox unknowncount
		column:=A_Index
		if (row=1)
			if (column=columncount) ;and (type!=12)
				LV_InsertCol(column+1,,"Constant")
			else
				LV_InsertCol(column+1,,"X" column)
		if (givenmatrix[row,column]="")
			givenmatrix[row,column]:=0
		LV_Modify(row,"col" column+1,givenmatrix[row,column])
	}
}
gui,submit,nohide
loop % LV_GetCount("Column")-1
{
	LV_ModifyCol(A_Index+1,"AutoHDR Center")
}
GuiControl,+Redraw,matrixgiven
return
;~~~~~~~~~~~~~~~~~~~~~~~~~~~

focuscombobox:
focusedcombobox:=A_GuiControl
return

$~+!^l::
if (debugmode!=1)
	global debugmode=1
else global debugmode=0
ToolTip,DEBUGMODE: %debugmode%
SetTimer, RemoveToolTip, -500
return

RemoveToolTip:
ToolTip
return

addeq:
guicontrolget,addeq,,%focusedcombobox%
if (addeq!="")
{
	GUI,HQ: +Disabled
	gui,show,,PLEASE WAIT!!!
	loop
	{
		if (debugmode=1)
			msgbox addeq
		guicontrol,choose,%focusedcombobox%,%A_Index%
		guicontrol,+AltSubmit,%focusedcombobox%
		guicontrolget,%focusedcombobox%,,%focusedcombobox%
		guicontrol,-AltSubmit,%focusedcombobox%
		if (%focusedcombobox%!=A_Index)
		{
			guicontrol,,%focusedcombobox%,%addeq%
			guicontrol,choose,%focusedcombobox%,% A_Index
			break
		}
		guicontrolget,%focusedcombobox%,,%focusedcombobox%
		if (%focusedcombobox%=addeq)
			return
	}
	gui,show,,Numerical Methods Calculator
	GUI,HQ: -Disabled
}
return

deleq:
guicontrolget,deleq,,%focusedcombobox%
param=|
GUI,HQ: +Disabled
gui,show,,PLEASE WAIT!!!
loop
{
	if (debugmode=1)
		msgbox deleq
	guicontrol,choose,%focusedcombobox%,%A_Index%
	guicontrol,+AltSubmit,%focusedcombobox%
	guicontrolget,%focusedcombobox%,,%focusedcombobox%
	guicontrol,-AltSubmit,%focusedcombobox%
	if (%focusedcombobox%!=A_Index)
		break
	guicontrolget,%focusedcombobox%,,%focusedcombobox%
	if (%focusedcombobox%!=deleq)
		param.=%focusedcombobox% "|"
	else if (A_Index!=1)
		param.="|"
}
gui,show,,Numerical Methods Calculator
GUI,HQ: -Disabled
guicontrol,,%focusedcombobox%,%param%
return

checkequation:
gui,submit,nohide
guicontrol,,guiworkingexpression,|
settimer,equate,1,-1
return

equate:
gui,submit,nohide
dummyguiformula:=guiformula
global formula:=RegExReplace(guiformula,"i)(?<=[^a-zA-Z]|^)x(?=[^a-zA-Z]|$)","variable")
formula:=ahk2maxima(formula) ; convert ahk language related into maxima language related for its own compatibility
formula:=maximasolver("combine(" formula ");") ; simplify the equation
formula:=maxima2ahk(formula) ; convert maxima language related into ahk language related for its own compatibility
if (instr(formula,"http://maxima.sourceforge.net")>0)
{
	if (dummyguiformula=guiformula) ; if user did not changed the working expression, this fixed the USER FASLTY TYPE ON THE EDITBOX AND THE PROGRAM BECOMES CONFUSED BUG!
		settimer,equate,off
	return
}
strreplace(formula,"variable","variable",count) ; count thee number of occurence of "variable"
loop %count%
{
	if (dummyguiformula=guiformula) ; if user did not changed the working expression
	{
		NewStr := SubStr(formula,1,InStr(formula,"variable",,,A_Index)+7)
		workingexpression := StrReplace(formula,NewStr,NewStr "1",,1) ; add an extra "1" string at the end of the match character
		workingexpression:=ahk2maxima(workingexpression) ; convert ahk language related into maxima language related for its own compatibility
		global workingexpression:=maximasolver("solve(" workingexpression ",variable1);")
		workingexpression:=maxima2ahk(workingexpression) ; convert maxima language related into ahk language related for its own compatibility
		guicontrol,,guiworkingexpression,% strreplace(workingexpression,"variable","x") "||"
	}
	else
		return
}

if (angleunit!="Radian")
{
	param=sin\(|cos\(|tan\(|csc\(|sec\(|cot\(|sinh\(|cosh\(|tanh\(|csch\(|sech\(|coth\(|asin\(|acos\(|atan\(|acsc\(|asec\(|acot\(|asinh\(|acosh\(|atanh\(|acsch\(|asech\(|acoth\(
	formula:=RegExReplace(formula,"i)" param,"$0(3.141592653589793238462643383279502884197169399375105820974944592307816406286/180)*")
	workingexpression:=RegExReplace(workingexpression,"i)(?<=(" param "))","$0(3.141592653589793238462643383279502884197169399375105820974944592307816406286/180)*")
}
if (dummyguiformula=guiformula)
	settimer,equate,off
return

setexpression:
gui,submit,nohide
workingexpression:=fixangleunit(RegExReplace(guiworkingexpression,"i)(?<=[^a-zA-Z])x","variable"))
return

checkpositivenumber: ;checks if the tolerance is a positive number and not a string
gui,submit,nohide
if %A_GuiControl% is not number
	sendinput,{BS}
else if (%A_GuiControl% <0)
	sendinput,{BS}
return

checknumber: ;checks if the control is a number and not a string
gui,submit,nohide
if %A_GuiControl% is not number
	if (%A_GuiControl%!="-")
		sendinput,{BS}
return

changetype: ; if we change the calculation type we hide some guicontrols and the listview header texts, this do the trick
guicontrol,Focus,background1
GUI,HQ: +Disabled
gui,show,,Changing Parameters`, PLEASE WAIT!!!
gui,submit,nohide

param=textxl,xl,textxu,xu,textxi,xi,guiworkingexpression,workingexpressiontext,equationsystem,addeq,deleq,guiformulatext,guiformula,matrixanswer,matrixgiven,listview,unknowncounttext,unknowncount,unknowncountdummy,tolerancetext,tolerance,textvarx,varx,textvarh,varh,derdegdummy,derdeg,derdegtext,userelaxation,relaxation,relaxationdummy,formatmode,formatmodetext,upperlimittext,lowerlimittext,upperlimit,lowerlimit,upperlimitdummy,lowerlimitdummy,Segmentstext,Segments,Segmentsdummy,simpsonrule,simpsonruletext,mixedlv,mixintegmode,mixintegadd,samplestart,sampleend,stepsize,stepsizedummy,guiequation,guiequationtext,graph,correctioncount,correctioncountdummy,correctioncounttext
loop,parse,param,`,
	GuiControl,hide,%A_LoopField%

if (type=1)
{
	param=Iteration|Xl|Xu|Xm|f(Xl)|f(Xu)|f(Xm)|`%Error|
	GuiControl,show,tolerancetext
	GuiControl,show,tolerance
	GuiControl,show,guiformulatext
	GuiControl,show,guiformula
	GuiControl,show,textxl
	GuiControl,text,textxl,%A_Space%Xl:
	GuiControl,show,xl
	GuiControl,show,textxu
	GuiControl,text,textxu,%A_Space%Xu:
	GuiControl,show,xu
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}
else if (type=2)
{
	param=Iteration|Xl|Xu|Xc|f(Xl)|f(Xu)|f(Xc)|`%Error|
	GuiControl,show,tolerancetext
	GuiControl,show,tolerance
	GuiControl,show,guiformulatext
	GuiControl,show,guiformula
	GuiControl,show,textxl
	GuiControl,text,textxl,%A_Space%Xl:
	GuiControl,show,xl
	GuiControl,show,textxu
	GuiControl,text,textxu,%A_Space%Xu:
	GuiControl,show,xu
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}
else if (type=3)
{
	param=Iteration|Xi|g(Xi)|`%Error|
	GuiControl,show,tolerancetext
	GuiControl,show,tolerance
	GuiControl,show,guiformulatext
	GuiControl,show,guiformula
	GuiControl,show,textxi
	GuiControl,show,xi
	GuiControl,show,guiworkingexpression
	GuiControl,show,workingexpressiontext
	GuiControl,text,workingexpressiontext,Possible Working Expressions( g(x) = ):
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}
else if (type=4)
{
	param=Iteration|Xo-1|Xo|Xo+1|f(Xo-1)|f(Xo)|f(Xo+1)|`%Error|
	GuiControl,show,tolerancetext
	GuiControl,show,tolerance
	GuiControl,show,guiformulatext
	GuiControl,show,guiformula
	GuiControl,show,textxl
	GuiControl,text,textxl,%A_Space%Xl:
	GuiControl,show,xl
	GuiControl,show,textxu
	GuiControl,text,textxu,%A_Space%Xu:
	GuiControl,show,xu
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}
else if (type=5) or (type=6)
{
	param=Iteration|Xi|`%Error|
	GuiControl,show,tolerancetext
	GuiControl,show,tolerance
	GuiControl,show,guiformulatext
	GuiControl,show,guiformula
	GuiControl,show,textxi
	GuiControl,show,xi
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}
else if (type=7) or (type=8)
{
	param=
	GuiControl,show,formatmode
	GuiControl,show,formatmodetext
	GuiControl,text,formatmodetext,%A_Space%Mode:
	gosub,formatmode
}
else if (type>=9) and (type<=12)
{
	param=
	GuiControl,show,matrixanswer
	Gui,ListView,matrixanswer
	LV_ClearAll(0) ; clean the listview by deleting all its rows
	GuiControl,show,matrixgiven
	Gui,ListView,matrixgiven
	gosub,unknowncount
	GuiControl,show,unknowncounttext
	GuiControl,show,unknowncount
	GuiControl,show,unknowncountdummy
}
else if (type=13)
{
	;param=True Value|Forward D.D.|Backward D.D|Central D.D.|Forward D.D True `%Error|Backward D.D. True `%Error|Central D.D. True `%Error
	param=Method of Differentiation|Computed Value|Relative True `%Error|
	GuiControl,show,guiformulatext
	GuiControl,show,guiformula
	GuiControl,show,derdegtext
	GuiControl,show,derdeg
	GuiControl,show,derdegdummy
	GuiControl,show,textvarx
	GuiControl,show,varx
	GuiControl,show,textvarh
	GuiControl,show,varh
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}
else if (type=14)
{
	param=True Value|Estimated Value|Relative True `%Error|
	gosub,monitorsample
	GuiControl,show,guiformulatext
	GuiControl,show,guiformula
	GuiControl,show,lowerlimit
	GuiControl,show,lowerlimitdummy
	GuiControl,show,lowerlimittext
	GuiControl,text,lowerlimittext,%A_Space%Lower Limit:
	GuiControl,show,upperlimit
	GuiControl,show,upperlimitdummy
	GuiControl,show,upperlimittext
	GuiControl,text,upperlimittext,%A_Space%Upper Limit:
	GuiControl,show,Segmentstext
	GuiControl,Move,Segmentstext,x415 y8
	GuiControl,show,Segmentsdummy
	GuiControl,Move,Segmentsdummy,x472 y5
	GuiControl,show,Segments
	GuiControl,Move,Segments,x550 y5
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}
else if (type=15)
{
	param=True Value|Estimated Value|Relative True `%Error|
	gosub,monitorsample
	GuiControl,show,guiformulatext
	GuiControl,show,guiformula
	GuiControl,show,lowerlimit
	GuiControl,show,lowerlimitdummy
	GuiControl,show,lowerlimittext
	GuiControl,text,lowerlimittext,%A_Space%Lower Limit:
	GuiControl,show,upperlimit
	GuiControl,show,upperlimitdummy
	GuiControl,show,upperlimittext
	GuiControl,text,upperlimittext,%A_Space%Upper Limit:
	GuiControl,show,Segmentstext
	GuiControl,Move,Segmentstext,x415 y8
	GuiControl,show,Segmentsdummy
	GuiControl,Move,Segmentsdummy,x472 y5
	GuiControl,show,Segments
	GuiControl,Move,Segments,x550 y5
	GuiControl,show,simpsonruletext
	GuiControl,Move,simpsonruletext,x435 y42
	GuiControl,show,simpsonrule
	GuiControl,Move,simpsonrule,x472 y39
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}
else if (type=16)
{
	param=True Value|Estimated Value|Relative True `%Error|
	gosub,monitorsample
	GuiControl,show,guiformulatext
	GuiControl,show,guiformula
	GuiControl,show,lowerlimit
	GuiControl,show,lowerlimitdummy
	GuiControl,show,lowerlimittext
	GuiControl,text,lowerlimittext,%A_Space%Lower Limit:
	GuiControl,show,upperlimit
	GuiControl,show,upperlimitdummy
	GuiControl,show,upperlimittext
	GuiControl,text,upperlimittext,%A_Space%Upper Limit:
	GuiControl,show,mixedlv
	GuiControl,show,mixintegadd
	GuiControl,show,mixintegmode
	GuiControl,show,Segmentstext
	GuiControl,Move,Segmentstext,% "x" 3+A_ScreenWidth*4/5 " y39"
	GuiControl,show,Segmentsdummy
	GuiControl,Move,Segmentsdummy,% "x" 60+A_ScreenWidth*4/5 " y36"
	GuiControl,show,Segments
	GuiControl,Move,Segments,% "x" 60+78+A_ScreenWidth*4/5 " y36"
	GuiControl,show,simpsonruletext
	GuiControl,Move,simpsonruletext,% "x" 3+A_ScreenWidth*4/5 " y8"
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}
if (type>=17) and (type<=19)
{
	param=X|Y(True Value)|Y(Approximate Value)|`%Error|
	GuiControl,show,guiequationtext
	GuiControl,show,guiequation
	GuiControl,show,textxl
	GuiControl,text,textxl,%A_Space%X:
	GuiControl,show,xl
	GuiControl,show,textxu
	GuiControl,text,textxu,%A_Space%Y:
	GuiControl,show,xu
	GuiControl,show,graph
	GuiControl,show,stepsize
	GuiControl,show,stepsizedummy
	GuiControl,show,samplestart
	GuiControl,show,lowerlimittext
	GuiControl,text,lowerlimittext,%A_Space%Sample Start:
	GuiControl,move,lowerlimittext,w70
	GuiControl,show,sampleend
	GuiControl,show,upperlimittext
	GuiControl,text,upperlimittext,%A_Space%Sample End:
	GuiControl,move,upperlimittext,w70
	GuiControl,show,formatmodetext
	GuiControl,text,formatmodetext,%A_Space%Step Size:
	GuiControl,move,formatmodetext,w55
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}
if (type=20)
{
	param=X|Y(True Value)|Y(Approximate Value)|`%Error|
	GuiControl,show,correctioncounttext
	GuiControl,show,correctioncountdummy
	GuiControl,show,correctioncount
	GuiControl,show,guiequationtext
	GuiControl,show,guiequation
	GuiControl,show,textxl
	GuiControl,text,textxl,%A_Space%X:
	GuiControl,show,xl
	GuiControl,show,textxu
	GuiControl,text,textxu,%A_Space%Y:
	GuiControl,show,xu
	GuiControl,show,graph
	GuiControl,show,stepsize
	GuiControl,show,stepsizedummy
	GuiControl,show,samplestart
	GuiControl,show,lowerlimittext
	GuiControl,text,lowerlimittext,%A_Space%Sample Start:
	GuiControl,move,lowerlimittext,w70
	GuiControl,show,sampleend
	GuiControl,show,upperlimittext
	GuiControl,text,upperlimittext,%A_Space%Sample End:
	GuiControl,move,upperlimittext,w70
	GuiControl,show,formatmodetext
	GuiControl,text,formatmodetext,%A_Space%Step Size:
	GuiControl,move,formatmodetext,w55
	GuiControl,show,listview
	Gui,ListView,listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows
}

loop,parse,param,|
	LV_InsertCol(A_Index,,A_LoopField)
loop,parse,param,|
	LV_ModifyCol(A_Index,"AutoHDR Center")
param=

gui,show,,Numerical Methods Calculator
GUI,HQ: -Disabled
guicontrol,Focus,type
return

~enter:: ; pressing enter key
if (WinActive("A")!=GuiHwnd)
	return
calculate: ; clicking the CALCULATE button
gui,submit,nohide

param1=xl,xu,xi,guiworkingexpression,tolerance,decimalplaces,decimalplacesdummy,angleunit,guiformula,type,equationsystem,addeq,deleq,guiformula,matrixanswer,matrixgiven,listview,unknowncount,unknowncountdummy,tolerance,varx,varh,derdegdummy,derdeg,userelaxation,relaxation,relaxationdummy,formatmode,upperlimit,lowerlimit,upperlimitdummy,lowerlimitdummy,Segments,Segmentsdummy,simpsonrule,mixedlv,mixintegmode,mixintegadd,samplestart,sampleend,stepsize,stepsizedummy,guiequation,graph,correctioncount,correctioncountdummy

loop,parse,param1,`,
	guicontrol,+Disabled,%A_LoopField%

guicontrol,hide,calculate ; hide the calculate button guicontrol
guicontrol,show,stop ; shows the stop button guicontrol

SetFormat, float,0.%decimalplaces% ; sets how many decimal places the future operations will have

global stopswitch=0 ; this is the indicator that the stop key of continuing the iteration is of, when this becomes 1 then the iterations will stop
if (type=1)
	bisection(xl,xu)
else if (type=2)
	falseposition(xl,xu)
else if (type=3)
	fixedpoint(xi)
else if (type=4)
	secant(xl,xu)
else if (type=5)
	newtonraphson(xi)
else if (type=6)
	newton(xi)
else if (type=7)
	gaussseidel()
else if (type=8)
	gaussjacobi()
else if (type=9)
	gaussjordan("gauss")
else if (type=10)
	gaussjordan()
else if (type=11)
	ludecomposition()
else if (type=12)
	matrixinverse()
else if (type=13)
	numericaldifferentiation(varx,varh,derdeg)
else if (type=14)
	trapezoidalintegration(lowerlimit,upperlimit,Segments)
else if (type=15)
	simpsonintegration(lowerlimit,upperlimit,Segments)
else if (type=16)
	mixedintegration(lowerlimit,upperlimit)
else if (type=17)
	eulerode(guiequation,xl,xu,samplestart,sampleend,stepsize)
else if (type=18)
	midpointode(guiequation,xl,xu,samplestart,sampleend,stepsize)
else if (type=19)
	ralstonode(guiequation,xl,xu,samplestart,sampleend,stepsize)
else if (type=20)
	heunode(guiequation,xl,xu,samplestart,sampleend,stepsize,correctioncount)

guicontrol,hide,stop ; hides the stop button guicontrol
guicontrol,show,calculate ; show the calculate button guicontrol

loop,parse,param1,`,
	guicontrol,-Disabled,%A_LoopField% ; shows the stop button guicontrol
param1=

return

stop:
stopswitch=1
guicontrol,hide,stop ; hides the stop button guicontrol
return

;-------NUMERICAL METHODS-------
bisection(xl,xu)
{
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	gui,submit,nohide
	loop
	{
		xm:=(xl+xu)/2
		
		if (A_Index=1)
		{
			oldxm:=0
			error:=100
		}
		else
			error:=abs((xm-oldxm)*100/xm)
		
		LV_Add(,A_Index,RTZ(xl),RTZ(xu),RTZ(xm),RTZ(f(xl)),RTZ(f(xu)),RTZ(f(xm)),RTZ(error) "%")
		
		oldxm:=xm
			
		if (error<=tolerance*100) or (stopswitch=1)
		{
			break
		}
		else
		{
			if f(xl)*f(xm)<0
			{
				xu:=xm
			}
			else if f(xl)*f(xm)>0
			{
				xl:=xm
			}
			else
			{
				break
			}
		}
	}
	LVA_EraseAllCells("listview") ;remove cells coloring
	LVA_SetCell("listview",0,4,"","0xFF0000") ;column cells coloring to red
	LVA_SetCell("listview",LV_GetCount(),4,"0x00FF00","") ; give the final answer a greenfill background
	LVA_Refresh("listview") ; set the listview coloring by redrawing the listview
	loop 8
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	return
}

falseposition(xl,xu)
{
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	gui,submit,nohide
	loop
	{
		xc:=((xl*f(xu))-(xu*f(xl)))/(f(xu)-f(xl))
		
		if (A_Index=1)
		{
			oldxc:=0
			error:=100
		}
		else
			error:=abs((xc-oldxc)*100/xc)
		
		LV_Add(,A_Index,RTZ(xl),RTZ(xu),RTZ(xc),RTZ(f(xl)),RTZ(f(xu)),RTZ(f(xc)),RTZ(error) "%")
		
		oldxc:=xc
			
		if (error<=tolerance*100) or (stopswitch=1)
			break
		else
		{
			if f(xl)*f(xc)<0
				xu:=xc
			else if f(xl)*f(xc)>0
				xl:=xc
			else
				break
		}
	}
	
	LVA_EraseAllCells("listview") ;remove cells coloring
	LVA_SetCell("listview",0,4,"","0xFF0000") ;column cells coloring to red
	LVA_SetCell("listview",LV_GetCount(),4,"0x00FF00","") ; give the final answer a greenfill background
	LVA_Refresh("listview") ; set the listview coloring by redrawing the listview
	loop 8
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	
	
	return
}

secant(xl,xu)
{
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	gui,submit,nohide
	loop
	{
		xc:=((xl*f(xu))-(xu*f(xl)))/(f(xu)-f(xl))
		
		if (A_Index=1)
		{
			oldxc:=0
			error:=100
		}
		else
			error:=abs((xc-oldxc)*100/xc)
		
		LV_Add(,A_Index,RTZ(xl),RTZ(xu),RTZ(xc),RTZ(f(xl)),RTZ(f(xu)),RTZ(f(xc)),RTZ(error) "%")
		
		oldxc:=xc
			
		if (error<=tolerance*100) or (stopswitch=1)
			break
		else
		{
			xl:=xu
			xu:=xc
		}
	}
	
	LVA_EraseAllCells("listview") ;remove cells coloring
	LVA_SetCell("listview",0,4,"","0xFF0000") ;column cells coloring to red
	LVA_SetCell("listview",LV_GetCount(),4,"0x00FF00","") ; give the final answer a greenfill background
	LVA_Refresh("listview") ; set the listview coloring by redrawing the listview
	loop 8
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	
	
	return
}

fixedpoint(xi)
{
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	gui,submit,nohide
	loop
	{
		xo:=g(xi)
		if (A_Index=1)
		{
			error:=100
		}
		else
		{
			error:=abs((xo-xi)*100/xo)
		}
		
		LV_Add(,A_Index-1,RTZ(xi),RTZ(xo),RTZ(error) "%")
		
		xi:=xo
			
		if (error<=tolerance*100) or (stopswitch=1)
			break
	}
	
	LVA_EraseAllCells("listview") ;remove cells coloring
	LVA_SetCell("listview",0,3,"","0xFF0000") ;column cells coloring to red
	LVA_SetCell("listview",LV_GetCount(),3,"0x00FF00","") ; give the final answer a greenfill background
	LVA_Refresh("listview") ; set the listview coloring by redrawing the listview
	loop 8
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	
	return
}

newtonraphson(xi)
{
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	gui,submit,nohide
	1stderivative:=derivative(formula)
	loop
	{
		xo:=xi-(f(xi)/MonsterEval(strreplace(1stderivative,"variable",xi)))
		if (A_Index=1)
		{
			error:=100
		}
		else
		{
			error:=abs((xo-xi)*100/xo)
		}
		
		LV_Add(,A_Index-1,RTZ(xi),RTZ(error) "%")
		
		xi:=xo
			
		if (error<=tolerance*100) or (stopswitch=1)
			break
	}
	
	LVA_EraseAllCells("listview") ;remove cells coloring
	LVA_SetCell("listview",0,2,"","0xFF0000") ;column cells coloring to red
	LVA_SetCell("listview",LV_GetCount(),2,"0x00FF00","") ; give the final answer a greenfill background
	LVA_Refresh("listview") ; set the listview coloring by redrawing the listview
	loop 8
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	
	return
}

newton(xi)
{
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	gui,submit,nohide
	1stderivative:=derivative(formula)
	2ndderivative:=derivative(formula,2)
	loop
	{
		xo:=xi-(MonsterEval(strreplace(1stderivative,"variable",xi))/MonsterEval(strreplace(2ndderivative,"variable",xi)))
		if (A_Index=1)
		{
			error:=100
		}
		else
		{
			error:=abs((xo-xi)*100/xo)
		}
		
		LV_Add(,A_Index-1,RTZ(xi),RTZ(error) "%")
		
		xi:=xo
			
		if (error<=tolerance*100) or (stopswitch=1)
			break
	}
	
	LVA_EraseAllCells("listview") ;remove cells coloring
	LVA_SetCell("listview",0,2,"","0xFF0000") ;column cells coloring to red
	LVA_SetCell("listview",LV_GetCount(),2,"0x00FF00","") ; give the final answer a greenfill background
	LVA_Refresh("listview") ; set the listview coloring by redrawing the listview
	loop 8
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	
	return
}

gaussseidel()
{
	if (formatmode="Matrix")
		Gui,ListView,matrixanswer
	else Gui,ListView,listview
	if detectunknownsandequations(equations,unknowns)
	{
		LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
		LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
		LV_ClearAll(0) ; clean the listview by deleting all its rows and columns
		
		;set the header of the listview
		LV_InsertCol(1,,"Iteration")
		for temp,unknown in unknowns
			LV_InsertCol(A_Index+1,,unknown)
		for temp,unknown in unknowns
			LV_InsertCol(A_Index+1+unknowns.Length(),,unknown " %Error")
		loop % LV_GetCount("Column")
			LV_ModifyCol(A_Index,"AutoHDR Center")
		;
		guicontrolget,userelaxation,,userelaxation
		if userelaxation
			guicontrolget,relaxation,,relaxation
		results:=[]
		loop
		{
			iteration:=A_Index
			LV_Add("Vis",iteration)
			unsatisfiedunknowns:=equations.Length()
			resultparser:=iteration,errorparser:=""
			for equationindex,expression in equations
			{
				for unknownsindex,unknown in unknowns
					if (equationindex!=unknownsindex)
					{
					
						if (results[unknownsindex]="")
						{
							expression:=RegExReplace(expression,unknown "(?=[+\-*/)0-9.=]|$)",0)
						}
						else
						{
							expression:=RegExReplace(expression,unknown "(?=[+\-*/)0-9.=]|$)","(" results[unknownsindex] ")")
						}
					}
				if (iteration=1)
				{
					oldresult:=0
				}
				else
				{
					oldresult:=results[equationindex]
				}
				results[equationindex]:=MonsterEval(expression)+0
				if userelaxation
					results[equationindex]:=(relaxation*results[equationindex])+((1-relaxation)*oldresult)
				error:=abs(100*(results[equationindex]-oldresult)/results[equationindex])
				if (error/100<=tolerance)
					unsatisfiedunknowns-- ; how many unknows have errors will decrease
				
				LV_Modify(iteration,"Col" equationindex+1,RTZ(results[equationindex])),LV_Modify(iteration,"Col" equationindex+1+unknowns.Length(),RTZ(error) "%")
				;resultparser.="," results[equationindex],errorparser.="," error
			}
			if (unsatisfiedunknowns<=0) or (stopswitch=1)
				break
		}
		
		; listview coloring system
		color:=resolution:=floor(255/ceil(unknowns.Length()/3)),start:=red:=blue:=green:=0
		loop % unknowns.Length()
		{
			start++
			if (start=1)
				red:=0,blue:=0,green:=color
			else if (start=2)
				red:=0,blue:=color,green:=0
			else if (start=3)
				red:=color,blue:=0,green:=0
			else if (start=4)
				red:=0,blue:=color,green:=color
			else if (start=5)
				red:=color,blue:=color,green:=0
			else if (start=6)
				red:=color,blue:=0,green:=color
			else if (start=7)
			{
				red:=color,blue:=color,green:=color
				color+=resolution,start:=0
			}
			backgroundcolor := "0x" Format("{1:0.2x}",red) Format("{1:0.2x}",green) Format("{1:0.2x}",blue)
			textcolor := "0x" Format("{1:0.2x}",255-red) Format("{1:0.2x}",255-green) Format("{1:0.2x}",255-blue)
			LVA_SetCell(A_DefaultListView,LV_GetCount(),A_Index+1,backgroundcolor,textcolor) ; give the final answer a greenfill background
		}
		LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
		color:=resolution:=start:=red:=blue:=green:=backgroundcolor:=textcolor:=""
		;
		
		loop % (2*unknowns.Length())+1
			LV_ModifyCol(A_Index,"AutoHDR Center")
		LV_Modify(LV_GetCount(),"Vis")
	}
}

gaussjacobi()
{
	if (formatmode="Matrix")
		Gui,ListView,matrixanswer
	else Gui,ListView,listview
	if detectunknownsandequations(equations,unknowns)
	{
		LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
		LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
		LV_ClearAll(0) ; clean the listview by deleting all its rows and columns
		
		;set the header of the listview
		LV_InsertCol(1,,"Iteration")
		for temp,unknown in unknowns
			LV_InsertCol(A_Index+1,,unknown)
		for temp,unknown in unknowns
			LV_InsertCol(A_Index+1+unknowns.Length(),,unknown " %Error")
		loop % LV_GetCount("Column")
			LV_ModifyCol(A_Index,"AutoHDR Center")
		;
		
		guicontrolget,userelaxation,,userelaxation
		if userelaxation
			guicontrolget,relaxation,,relaxation
		results:=[]
		loop
		{
			iteration:=A_Index
			LV_Add("Vis",iteration)
			unsatisfiedunknowns:=equations.Length()
			resultparser:=iteration,errorparser:=""
			for equationindex,expression in equations
			{
				for unknownsindex,unknown in unknowns
					if (equationindex!=unknownsindex)
					{
					
						if (iteration=1)
						{
							expression:=RegExReplace(expression,unknown "(?=[+\-*/)0-9.=]|$)",0)
						}
						else
						{
							expression:=RegExReplace(expression,unknown "(?=[+\-*/)0-9.=]|$)","(" results[unknownsindex] ")")
						}
					}
				if (iteration=1)
				{
					oldresult:=0
				}
				else
				{
					oldresult:=results[equationindex]
				}
				results[equationindex]:=MonsterEval(expression)+0
				if userelaxation
					results[equationindex]:=(relaxation*results[equationindex])+((1-relaxation)*oldresult)
				error:=abs(100*(results[equationindex]-oldresult)/results[equationindex])
				if (error/100<=tolerance)
					unsatisfiedunknowns-- ; how many unknows have errors will decrease
				
				LV_Modify(iteration,"Col" equationindex+1,RTZ(results[equationindex])),LV_Modify(iteration,"Col" equationindex+1+unknowns.Length(),RTZ(error) "%")
				;resultparser.="," results[equationindex],errorparser.="," error
			}
			if (unsatisfiedunknowns<=0) or (stopswitch=1)
				break
		}
		
		; listview coloring system
		color:=resolution:=floor(255/ceil(unknowns.Length()/3)),start:=red:=blue:=green:=0
		loop % unknowns.Length()
		{
			start++
			if (start=1)
				red:=0,blue:=0,green:=color
			else if (start=2)
				red:=0,blue:=color,green:=0
			else if (start=3)
				red:=color,blue:=0,green:=0
			else if (start=4)
				red:=0,blue:=color,green:=color
			else if (start=5)
				red:=color,blue:=color,green:=0
			else if (start=6)
				red:=color,blue:=0,green:=color
			else if (start=7)
			{
				red:=color,blue:=color,green:=color
				color+=resolution,start:=0
			}
			backgroundcolor := "0x" Format("{1:0.2x}",red) Format("{1:0.2x}",green) Format("{1:0.2x}",blue)
			textcolor := "0x" Format("{1:0.2x}",255-red) Format("{1:0.2x}",255-green) Format("{1:0.2x}",255-blue)
			LVA_SetCell(A_DefaultListView,LV_GetCount(),A_Index+1,backgroundcolor,textcolor) ; give the final answer a greenfill background
		}
		LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
		color:=resolution:=start:=red:=blue:=green:=backgroundcolor:=textcolor:=""
		;
		
		loop % (2*unknowns.Length())+1
			LV_ModifyCol(A_Index,"AutoHDR Center")
		LV_Modify(LV_GetCount(),"Vis")
	}
}

gaussjordan(eliminationtype:="jordan")
{
	GuiControl,-Redraw,matrixgiven
	GuiControl,-Redraw,matrixanswer
	Gui,ListView,matrixgiven
	gui,submit,nohide
	;matrix and constant array text generator
	gaussmatrix:=[[]]
	loop % LV_GetCount()
	{
		if (stopswitch=1)
			return
		row:=A_Index
		loop % LV_GetCount("Column")-1
		{
			if (stopswitch=1)
				return
			column:=A_Index
			LV_GetText(tmpr,row,column+1)
			gaussmatrix[row,column]:=tmpr
		}
	}
	;
	
	;upper triangular matrix calculator ; pivoting method ; group work : dynamic sizing ; dating 3x3 ginawa naming dynamic
	guicontrolget,decimalplaces,,decimalplaces
	colcount:=gaussmatrix[1].Count(),rowcount:=gaussmatrix.Count()
	loop % colcount-2 ; loop na tumatarget sa column number :)
	{
		if (stopswitch=1)
			return
		column:=A_Index
		loop % rowcount-column ; loop na tumatarget sa row number :D
		{
			if (stopswitch=1) ; tagadetect ng bug
				return
			row:=A_Index+column
			pivotdividend:=gaussmatrix[row,column],pivotdivisor:=gaussmatrix[column,column]
			loop % colcount ; loop na tumatarget sa paulit ulit na multiplicative pivoting
			{
				if (stopswitch=1) ; tagadetect ng bug
					return
				if (decimalplaces>=32) ; pag number of decimal places at mas marami sa 32
				{
					setformat,float,0.%decimalplaces% ; tagaspecify ng number of decimal places
				}
				else setformat,float,0.32
				gaussmatrix[row,A_Index]:=format("{1:0." decimalplaces "f}",gaussmatrix[row,A_Index]-(gaussmatrix[column,A_Index]*pivotdividend/pivotdivisor)) ; pivoting
				setformat,float,0.%decimalplaces%
				gaussmatrix[row,A_Index]+=0
			}
		}
	}
	;
	
	if (eliminationtype="jordan") ; if method is gauss-jordan elimination
	{
		for row, in gaussmatrix
		{
			if (stopswitch=1)
				return
			divisor:=gaussmatrix[row,row]
			for column, in gaussmatrix[1]
			{
				if (stopswitch=1)
					return
				if (decimalplaces>=32)
				{
					setformat,float,0.%decimalplaces%
				}
				else setformat,float,0.32
				gaussmatrix[row,column]:=format("{1:0." decimalplaces "f}",gaussmatrix[row,column]/divisor)+0
				setformat,float,0.%decimalplaces%
				gaussmatrix[row,A_Index]+=0
			}
		}
	}
	; end of upper triangular matrix
	
	Gui,ListView,matrixanswer
	LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
	LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows and columns
	LV_InsertCol(1)
	
	if (eliminationtype="jordan") ; if method is gauss-jordan elimination
	{
		command=echelon
		LV_Add(,"Echelon Form")
	}
	else ; if method is gauss elimination
	{
		command=triangularize
		LV_Add(,"Upper Triangular Form")
	}
	
	for row, in gaussmatrix
	{
		if (stopswitch=1)
			return
		LV_Add()
		LVrow:=LV_GetCount()
		for column, in gaussmatrix[1]
		{
			if (stopswitch=1)
				return
			if (row=1)
			{
				if (A_Index=colcount)
					LV_InsertCol(A_Index+1,"Center","Constant")
				else LV_InsertCol(A_Index+1,"Center","X" A_Index)
			}
			LV_Modify(LVrow,"col" A_Index+1,RTZ(gaussmatrix[row,column]))
			LVA_SetCell(A_DefaultListView,LVrow,A_Index+1,"Black","White") ; give the matrix a black background and white texts
		}
	}
	
	;unknowns value generation
	unknowns:=[]
	if (eliminationtype="jordan") ; if method is gauss-jordan elimination, do upper triangular elimination
	{
		loop % colcount-2
		{
			if (stopswitch=1)
				return
			column:=colcount-A_Index
			loop % column-1
			{
				if (stopswitch=1)
					return
				row:=column-A_Index
				pivotdividend:=gaussmatrix[row,column],pivotdivisor:=gaussmatrix[column,column]
				loop % colcount
				{
					if (stopswitch=1)
						return
					if (decimalplaces>=32)
					{
						setformat,float,0.%decimalplaces%
					}
					else setformat,float,0.32
					gaussmatrix[row,A_Index]:=format("{1:0." decimalplaces "f}",gaussmatrix[row,A_Index]-(gaussmatrix[column,A_Index]*pivotdividend/pivotdivisor))
					setformat,float,0.%decimalplaces%
					gaussmatrix[row,A_Index]+=0
				}
			}
		}
		for row, in gaussmatrix
		{
			unknowns[A_Index]:=format("{1:0." decimalplaces "g}",gaussmatrix[row,colcount])
		}
		
		LV_Add(),LV_Add(),LV_Add(,"Jordan Form")
		for row, in gaussmatrix
		{
			LV_Add()
			LVrow:=LV_GetCount()
			for column, in gaussmatrix[1]
			{
				LV_Modify(LVrow,"col" A_Index+1,RTZ(gaussmatrix[row,column]))
				LVA_SetCell(A_DefaultListView,LVrow,A_Index+1,"0x00FF00","Black") ; give the matrix a black background and white texts
			}
		}
	}
	else ; group work: ~dynamic sizing~ do "back substitution method for gauss elimination ; hinahanap na unknowns
	{
		loop % rowcount ; loop na nakapagspecify ng row number
		{
			row:=rowcount+1-A_Index
			summation:=0 ; set natin initially every loop ng row yung sum of all left sided terms sa "A*X = B" where yung A*X is sinusum lahat 
			loop % colcount-row ; loop na nakapagspecify ng row number
			{
				column:=row-1+A_Index
				if (column!=row)
				{
					summation+=(unknowns[column]*gaussmatrix[row,column]) ; sum lahat ng terms sa column
				}
			}
			unknowns[row]:=format("{1:0." decimalplaces "g}",(gaussmatrix[row,colcount]-summation)/gaussmatrix[row,row]) ; compute yung unknown gamit yung basic math manipulation "Xc=(A-B)/C"
		}
	}
	;end of unknowns value generation
	
	count:=unknowns.Count(),color:=resolution:=floor(255/ceil(count/3)),start:=red:=blue:=green:=0 ; listview coloring system
	LV_Add(),LV_Add(),LV_Add(,"Value of Unknowns"),LV_Add()
	for index,value in unknowns
	{
		if (stopswitch=1)
			return
		LV_Modify(LV_GetCount(),"col" A_Index+1,"X" index " = " RTZ(value))
		
		; listview coloring system
		start++
		if (start=1)
			red:=0,blue:=0,green:=color
		else if (start=2)
			red:=0,blue:=color,green:=0
		else if (start=3)
			red:=color,blue:=0,green:=0
		else if (start=4)
			red:=0,blue:=color,green:=color
		else if (start=5)
			red:=color,blue:=color,green:=0
		else if (start=6)
			red:=color,blue:=0,green:=color
		else if (start=7)
		{
			red:=color,blue:=color,green:=color
			color+=resolution,start:=0
		}
		backgroundcolor := "0x" Format("{1:0.2x}",red) Format("{1:0.2x}",green) Format("{1:0.2x}",blue)
		textcolor := "0x" Format("{1:0.2x}",255-red) Format("{1:0.2x}",255-green) Format("{1:0.2x}",255-blue)
		LVA_SetCell(A_DefaultListView,LV_GetCount(),A_Index+1,backgroundcolor,textcolor) ; give the final answer a design
		;
	}
	; listview coloring system
	LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
	;
	
	tmpr:=LV_GetCount("Column")
	;LV_InsertCol(tmpr)
	loop % tmpr
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	GuiControl,+Redraw,matrixgiven
	GuiControl,+Redraw,matrixanswer
}

;gaussjordan(eliminationtype:="jordan")
;{
;	GuiControl,-Redraw,matrixgiven
;	GuiControl,-Redraw,matrixanswer
;	Gui,ListView,matrixgiven
;	gui,submit,nohide
;	guicontrolget,decimalplaces,,decimalplaces
;	setformat,float,0.%decimalplaces%
;	
;	;matrix and constant array text generator
;	gaussmatrix=
;	constants=[
;	loop % LV_GetCount()
;	{
;		if (stopswitch=1)
;			return
;		if A_Index=1
;			gaussmatrix.="["
;		else gaussmatrix.=",[",constants.=","
;		row:=A_Index
;		loop % LV_GetCount("Column")-1
;		{
;			if (stopswitch=1)
;				return
;			column:=A_Index+1
;			LV_GetText(tempor,row,column)
;			if (column=LV_GetCount("Column"))
;				constants.=tempor
;			else if (column=LV_GetCount("Column")-1)
;				gaussmatrix.=tempor
;			else gaussmatrix.=tempor ","
;		}
;		gaussmatrix.="]"
;	}
;	constants.="]"
;	;
;	
;	;matrix generation of upper triangular matrix
;	Gui,ListView,matrixanswer
;	LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
;	LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
;	LV_ClearAll(0) ; clean the listview by deleting all its rows and columns
;	LV_InsertCol(1)
;	
;	if (eliminationtype="jordan") ; if method is gauss-jordan elimination
;	{
;		command=echelon
;		LV_Add(,"Echelon Form")
;	}
;	else ; if method is gauss elimination
;	{
;		command=triangularize
;		LV_Add(,"Upper Triangular Form")
;	}
;	
;	tempor:=regexreplace(StrReplace(maximasolver("keepfloat:true$" command "(addcol(matrix(" gaussmatrix "),matrix(" constants ")));",,1),"],[","|"),"matrix\(|]|\[","")
;	StrReplace(tempor,")",")",count)
;	param:=SubStr(tempor,1,InStr(tempor,")",,,count)-1)
;	row:=1
;	loop,parse,param,|
;	{
;		if (stopswitch=1)
;			return
;		LV_Add(),row++
;		loop,parse,A_LoopField,`,
;		{
;			if (stopswitch=1)
;				return
;			column:=A_Index+1
;			if (row=2)
;				LV_InsertCol(column,,"X" A_Index)
;			LV_Modify(row,"col" column,MonsterEval(A_LoopField)+0)
;			LVA_SetCell(A_DefaultListView,row,column,"Black","White") ; give the matrix a black background and white texts
;		}
;	}
;	LV_ModifyCol(LV_GetCount("Column"),"AutoHDR Center","Constant")
;	
;	tempor:=StrReplace(maximasolver("matsolve(A,b):=block(   [AugU],   AugU:echelon(addcol(A,b)),   backsolve(AugU) );backsolve(augU):=block( [i,j,m,n,b,x,klist,k,np,nosoln:false], [m,n]:matsize(augU), b:col(augU,n), klist:makelist(concat('%k,i),i,1,n-1), k:0, x:transpose(matrix(klist)), for i:m thru 1 step -1 do (   np:pivot(row(augU,i)),    if is(equal(np,n)) then     (nosoln:true,return())   else if not(is(equal(np,0))) then     (x[np]:b[i],     for j:np+1 thru n-1 do       x[np]:x[np]-augU[i,j]*x[j])    ), if nosoln then     return([]) else    return(expand(x)) )$matsize(A):=[length(A),length(transpose(A))]$pivot(rr):=block([i,rlen], p:0, rlen:length(transpose(rr)), for i:1 thru rlen do(  if is(equal(part(rr,1,i),1)) then (p:i,return())),  return(p))$keepfloat:true$matsolve(matrix(" gaussmatrix "),matrix(" constants "));"),"matrix(","")
;	StrReplace(tempor,")",")",count)
;	param:=SubStr(tempor,1,InStr(tempor,")",,,count)-1)
;	
;	if (eliminationtype="jordan") ; if method is gauss-jordan elimination
;	{
;		LV_Add(),LV_Add(),LV_Add(,"Jordan Form"),LV_Add(),row+=4
;		loop,parse,param,`,
;		{
;			if (stopswitch=1)
;				return
;			LV_Add(),row++,rowindex:=A_Index
;			loop % LV_GetCount("Column")-1
;			{
;				if (stopswitch=1)
;					return
;				if (rowindex=A_Index)
;					LV_Modify(row,"col" A_Index+1,1)
;				else if (A_Index+1=LV_GetCount("Column")) 
;					LV_Modify(row,"col" A_Index+1,MonsterEval(A_LoopField)+0)
;				else LV_Modify(row,"col" A_Index+1,0)
;				LVA_SetCell(A_DefaultListView,row,A_Index+1,"Red","Black") ; give the matrix a red background
;			}
;		}
;	}
;	
;	StrReplace(param,",",,count),count++,color:=resolution:=floor(255/ceil(count/3)),start:=red:=blue:=green:=0 ; listview coloring system
;	LV_Add(),LV_Add(),LV_Add(,"Value of Unknowns"),LV_Add(),row+=4
;	loop,parse,param,`,
;	{
;		if (stopswitch=1)
;			return
;		LV_Modify(row,"col" A_Index+1,"X" A_Index " = " MonsterEval(A_LoopField)+0)
;		
;		; listview coloring system
;		start++
;		if (start=1)
;			red:=0,blue:=0,green:=color
;		else if (start=2)
;			red:=0,blue:=color,green:=0
;		else if (start=3)
;			red:=color,blue:=0,green:=0
;		else if (start=4)
;			red:=0,blue:=color,green:=color
;		else if (start=5)
;			red:=color,blue:=color,green:=0
;		else if (start=6)
;			red:=color,blue:=0,green:=color
;		else if (start=7)
;		{
;			red:=color,blue:=color,green:=color
;			color+=resolution,start:=0
;		}
;		backgroundcolor := "0x" Format("{1:0.2x}",red) Format("{1:0.2x}",green) Format("{1:0.2x}",blue)
;		textcolor := "0x" Format("{1:0.2x}",255-red) Format("{1:0.2x}",255-green) Format("{1:0.2x}",255-blue)
;		LVA_SetCell(A_DefaultListView,row,A_Index+1,backgroundcolor,textcolor) ; give the final answer a design
;		;
;	}
;	; listview coloring system
;	LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
;	color:=resolution:=start:=red:=blue:=green:=backgroundcolor:=textcolor:=""
;	;
;	
;	tmpr:=LV_GetCount("Column")
;	LV_InsertCol(tmpr+1)
;	loop % tmpr
;		LV_ModifyCol(A_Index,"AutoHDR Center")
;	LV_Modify(LV_GetCount(),"Vis")
;	GuiControl,+Redraw,matrixgiven
;	GuiControl,+Redraw,matrixanswer
;}

ludecomposition()
{
	GuiControl,-Redraw,matrixgiven
	GuiControl,-Redraw,matrixanswer
	Gui,ListView,matrixgiven
	gui,submit,nohide
	
	;matrix and constant array text generator
	lumatrix=
	constants=
	loop % LV_GetCount()
	{
		if (stopswitch=1)
			return
		if A_Index=1
			lumatrix.="[",constants.="["
		else lumatrix.=",[",constants.=",["
		row:=A_Index
		loop % LV_GetCount("Column")-1
		{
			if (stopswitch=1)
				return
			column:=A_Index+1
			LV_GetText(tempor,row,column)
			if (column=LV_GetCount("Column"))
				constants.=tempor
			else if (column=LV_GetCount("Column")-1)
				lumatrix.=tempor
			else lumatrix.=tempor ","
		}
		lumatrix.="]",constants.="]"
	}
	;
	
	;matrix generation of upper triangular matrix
	Gui,ListView,matrixanswer
	LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
	LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows and columns
	LV_InsertCol(1)
	
	information:=regexreplace(maximasolver("keepfloat:true$x:lu_factor(matrix(" lumatrix "),floatfield)$b:get_lu_factors(x)$b[2];b[3];lu_backsub(x,matrix(" constants "));",,0),"\s","")
	row:=0
	loop 3
	{
		if (stopswitch=1)
			return
		FoundPos1 := InStr(information,")",,InStr(information,"(%o",,,A_Index)+1)+1,FoundPos2 := InStr(information,"(%o",,,A_Index+1)
		if (FoundPos2<1)
			FoundPos2:=strlen(information)+1
		tempor := regexreplace(strreplace(SubStr(information,FoundPos1,FoundPos2-FoundPos1),"],[","|"),"matrix\(|\[|]","")
		StrReplace(tempor,")",")",count)
		param:=SubStr(tempor,1,InStr(tempor,")",,,count)-1)
		
		if (A_Index=1)
			LV_Add(,"Lower Triangular Matrix")
		else if (A_Index=2)
			LV_Add(,"Upper Triangular Matrix")
		else
		{
			LV_Add(,"Value of Unknowns")
			LV_ModifyCol(1,"AutoHDR Center")
		}
		row++
		
		if (A_Index=3)
		{
			StrReplace(param,"|",,count),count++,color:=resolution:=floor(255/ceil(count/3)),start:=red:=blue:=green:=0 ; listview coloring system
			LV_Add(),row++
			LV_InsertCol(LV_GetCount("Column")+1)
			loop,parse,param,|
			{
				if (stopswitch=1)
					return
				LV_Modify(row,"col" A_Index+1,"X" A_Index " = " RTZ(MonsterEval(A_LoopField)+0))
				LV_ModifyCol(A_Index+1,"AutoHDR Center")
				
				; listview coloring system
				start++
				if (start=1)
					red:=0,blue:=0,green:=color
				else if (start=2)
					red:=0,blue:=color,green:=0
				else if (start=3)
					red:=color,blue:=0,green:=0
				else if (start=4)
					red:=0,blue:=color,green:=color
				else if (start=5)
					red:=color,blue:=color,green:=0
				else if (start=6)
					red:=color,blue:=0,green:=color
				else if (start=7)
				{
					red:=color,blue:=color,green:=color
					color+=resolution,start:=0
				}
				backgroundcolor := "0x" Format("{1:0.2x}",red) Format("{1:0.2x}",green) Format("{1:0.2x}",blue)
				textcolor := "0x" Format("{1:0.2x}",255-red) Format("{1:0.2x}",255-green) Format("{1:0.2x}",255-blue)
				LVA_SetCell(A_DefaultListView,row,A_Index+1,backgroundcolor,textcolor) ; give the final answer a design
				;
			}
			; listview coloring system
			LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
			color:=resolution:=start:=red:=blue:=green:=backgroundcolor:=textcolor:=""
			;
		}
		else
		{
			savedcolorindex:=A_Index ;listview coloring system
			loop,parse,param,|
			{
				LV_Add(),row++
				loop,parse,A_LoopField,`,
				{
					column:=A_Index
					if (row=2)
						LV_InsertCol(column+1,,"X" A_Index)
					LV_Modify(row,"col" column+1,RTZ(MonsterEval(A_LoopField)+0))
					if (savedcolorindex=1)
						LVA_SetCell(A_DefaultListView,row,column+1,"Blue","White") ; give the matrix a black background and white texts
					else if (savedcolorindex=2)
						LVA_SetCell(A_DefaultListView,row,column+1,"Red","Black") ; give the matrix a black background and white texts
				}
			}
			LV_Add(),LV_Add(),row+=2
		}
	}
	
	LV_Modify(LV_GetCount(),"Vis")
	GuiControl,+Redraw,matrixgiven
	GuiControl,+Redraw,matrixanswer
}

matrixinverse()
{
	GuiControl,-Redraw,matrixgiven
	GuiControl,-Redraw,matrixanswer
	Gui,ListView,matrixgiven
	gui,submit,nohide
	
	;matrix and constant initializer
	matrices:=[[]],constants:=[[]]
	loop % LV_GetCount()
	{
		row:=A_Index
		loop % LV_GetCount("Column")-1
		{
			column:=A_Index+1
			LV_GetText(tmpr,row,column)
			if (column=LV_GetCount("Column"))
				constants[row,1]:=tmpr
			else matrices[row,column-1]:=tmpr
		}
	}
	;
	guicontrolget,decimalplaces,,decimalplaces
	setformat,float,0.%decimalplaces%
	inversematrix:=__Matrix.Inverse(matrices) ;compute the inverse matrix)
	matrices=
	unknowns:=__Matrix.Multiply(inversematrix,constants) ; compute the unknowns
	constants=
	setformat,float,0.%decimalplaces%g
	for row, in inversematrix
		for column, in inversematrix
		{
			inversematrix[row,column]+=0
		}
	for row, in unknowns
		for column, in unknowns
		{
			unknowns[row,column]+=0
		}
	
	if (stopswitch=1)
		return
	
	;matrix generation
	Gui,ListView,matrixanswer
	LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
	LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
	LV_ClearAll(0) ; clean the listview by deleting all its rows and columns
	LV_InsertCol(1)
	LV_Add(,"A^(-1) :")
	Random,colorindex,1,3
	Loop % inversematrix.Count()
	{
		LV_Add()
		row:=A_Index
		LVrow:=LV_GetCount()
		Loop % inversematrix[1].Count()
		{
			if (row=1)
				LV_InsertCol(A_Index+1,"AutoHDR Center","X" A_Index)
			LV_Modify(LVrow,"col" A_Index+1,inversematrix[row,A_Index])
			if (colorindex=1)
				LVA_SetCell(A_DefaultListView,LVrow,A_Index+1,"Red","Black") ; give the matrix a Red background and Black texts
			else if (colorindex=2)
				LVA_SetCell(A_DefaultListView,LVrow,A_Index+1,"Blue","Yellow") ; give the matrix a Blue background and Yellow texts
			else 
				LVA_SetCell(A_DefaultListView,LVrow,A_Index+1,"Green","White") ; give the matrix a White background and Blue texts
		}
	}
	
	count:=unknowns.Count(),color:=resolution:=floor(255/ceil(count/3)),start:=red:=blue:=green:=0 ; listview coloring system
	LV_Add(),LV_Add(),LV_Add(,"A^(-1)B :"),LV_Add(),row:=LV_GetCount()
	for index, in unknowns
	{
		if (stopswitch=1)
			return
		LV_Modify(row,"col" A_Index+1,"X" A_Index " = " unknowns[index,1])
		
		; listview coloring system
		start++
		if (start=1)
			red:=0,blue:=0,green:=color
		else if (start=2)
			red:=0,blue:=color,green:=0
		else if (start=3)
			red:=color,blue:=0,green:=0
		else if (start=4)
			red:=0,blue:=color,green:=color
		else if (start=5)
			red:=color,blue:=color,green:=0
		else if (start=6)
			red:=color,blue:=0,green:=color
		else if (start=7)
		{
			red:=color,blue:=color,green:=color
			color+=resolution,start:=0
		}
		backgroundcolor := "0x" Format("{1:0.2x}",red) Format("{1:0.2x}",green) Format("{1:0.2x}",blue)
		textcolor := "0x" Format("{1:0.2x}",255-red) Format("{1:0.2x}",255-green) Format("{1:0.2x}",255-blue)
		LVA_SetCell(A_DefaultListView,LV_GetCount(),A_Index+1,backgroundcolor,textcolor) ; give the final answer a design
		;
	}
	inversematrix:=unknowns:=""
	
	LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
	LV_InsertCol(LV_GetCount("Column")+1)
	loop % LV_GetCount("Column")
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	GuiControl,+Redraw,matrixgiven
	GuiControl,+Redraw,matrixanswer
	Gui,ListView,matrixgiven
}

numericaldifferentiation(x,h,nth)
{
	GuiControl,-Redraw,listview
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	gui,submit,nohide
	Forward := Backward := Central := 0
	Index := nth
	loop % nth+1
	{
		if (stopswitch=1)
			return
		Order := A_Index-1
		Forward := Forward + ((((-1) ** (Order + Mod(nth,2))) * combin(nth, Order) * f(x + (Order * h))) / (h ** nth))
		Backward := Backward + ((((-1) ** Order) * combin(nth, Order) * f(x - (Order * h))) / (h ** nth))
		Central := Central + ((((-1) ** Order) * combin(nth, Order) * f(x + (Index * h))) / ((2 * h) ** nth))
		Index := Index - 2
	}
	TrueValue:=maximasolver("diff(" formula ",variable," nth ")$ev(%,variable=float(" x "),simp);")+0
	
	;LV_Add(,TrueValue,Forward,Backward,Central,abs(100*(Forward-TrueValue)/Forward),abs(100*(Backward-TrueValue)/Backward),abs(100*(Central-TrueValue)/Central))
	
	LV_Add(,"True Value:",RTZ(TrueValue),"0%")
	LV_Add(,"Forward Divided Difference:",RTZ(Forward),RTZ(abs(100*(TrueValue-Forward)/TrueValue)) "%")
	LV_Add(,"Backward Divided Difference:",RTZ(Backward),RTZ(abs(100*(TrueValue-Backward)/TrueValue)) "%")
	LV_Add(,"Central Divided Difference:",RTZ(Central),RTZ(abs(100*(TrueValue-Central)/TrueValue)) "%")
	
	LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
	LVA_SetCell(A_DefaultListView,2,2,"Red","Black") ; give the matrix a Red background and Black texts
	LVA_SetCell(A_DefaultListView,3,2,"Blue","Yellow") ; give the matrix a Blue background and Yellow texts
	LVA_SetCell(A_DefaultListView,4,2,"Green","White") ; give the matrix a White background and Blue texts
	LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
	
	loop % LV_GetCount("Column")
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	GuiControl,+Redraw,listview
}

trapezoidalintegration(lowerlimit,upperlimit,Segments:=1,doesreturn:="")
{
	GuiControl,-Redraw,listview
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	
	result:=0
	loop % Segments-1
	{
		if (stopswitch=1)
			return
		result+=f(lowerlimit+(A_Index*((upperlimit-lowerlimit)/Segments)))
	}
	result:=((upperlimit-lowerlimit)/(2*Segments))*(f(upperlimit)+f(lowerlimit)+(2*result))
	
	if (doesreturn!="get")
	{
		trueresult:=maximasolver("float(integrate(" formula ",variable," lowerlimit "," upperlimit "));")+0
		
		LV_Add(,RTZ(trueresult),RTZ(result),RTZ(abs(100*(trueresult-result)/trueresult)))
		
		LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
		LVA_SetCell(A_DefaultListView,1,1,"0x0000FF","Yellow") ; give the true value a Blue background and Yellow text
		LVA_SetCell(A_DefaultListView,1,2,"0x00FF00","Black") ; give the approximate result a Green background and Black text
		LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
		
		loop % LV_GetCount("Column")
			LV_ModifyCol(A_Index,"AutoHDR Center")
		LV_Modify(LV_GetCount(),"Vis")
		GuiControl,+Redraw,listview
	}
	else
	{
		GuiControl,+Redraw,listview
		return result
	}
}

simpsonintegration(lowerlimit,upperlimit,Segments:=2,doesreturn:="")
{
	GuiControl,-Redraw,listview
	GuiControlGet,simpsonrule,,simpsonrule
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	
	result:=0
	resolution:=(upperlimit-lowerlimit)/Segments
	if (simpsonrule="1/3")
	{
		loop % Segments/2
		{
			if (stopswitch=1)
				return
			result+=(4*f(lowerlimit+(((2*A_Index)-1)*resolution)))+(2*f(lowerlimit+(2*A_Index*resolution)))
		}
		result:=(f(lowerlimit)-f(upperlimit)+result)*resolution/3
	}
	else if (simpsonrule="3/8")
	{
		
		loop % Segments/3
		{
			if (stopswitch=1)
				return
			result+=(3*f(lowerlimit+(resolution*((3*A_Index)-2))))+(3*f(lowerlimit+(resolution*((3*A_Index)-1))))+(2*f(lowerlimit+(3*resolution*A_Index)))
		}
		result:=(f(lowerlimit)-f(upperlimit)+result)*3*resolution/8
	}
	
	if (doesreturn!="get")
	{
		trueresult:=maximasolver("float(integrate(" formula ",variable," lowerlimit "," upperlimit "));")+0
		
		LV_Add(,RTZ(trueresult),RTZ(result),RTZ(abs(100*(trueresult-result)/trueresult)))
		
		LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
		LVA_SetCell(A_DefaultListView,1,1,"0x0000FF","Yellow") ; give the true value a Blue background and Yellow text
		LVA_SetCell(A_DefaultListView,1,2,"0x00FF00","Black") ; give the approximate result a Green background and Black text
		LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
		
		loop % LV_GetCount("Column")
			LV_ModifyCol(A_Index,"AutoHDR Center")
		LV_Modify(LV_GetCount(),"Vis")
		GuiControl,+Redraw,listview
	}
	else
	{
		GuiControl,+Redraw,listview
		return result
	}
}

mixedintegration(lowerlimit,upperlimit)
{
	Gui,ListView,mixedlv
	Result:=Segments:=0,truelowerlimit:=lowerlimit,trueupperlimit:=upperlimit
	loop % LV_GetCount()
	{
		LV_GetText(tmpr,A_Index,2)
		Segments+=tmpr
	}
	Height:=(upperlimit-lowerlimit)/Segments
	loop % LV_GetCount()
	{
		Gui,ListView,mixedlv
		LV_GetText(Segments,A_Index,2)
		upperlimit:=lowerlimit+(Height*Segments)
		LV_GetText(tmpr,A_Index,1)
		if (tmpr="Trapezoidal Rule")
			Result+=trapezoidalintegration(lowerlimit,upperlimit,Segments,"get")
		else if (tmpr="Simpson's 1/3 Rule")
		{
			GuiControl, Choose, simpsonrule,1
			Result+=simpsonintegration(lowerlimit,upperlimit,Segments,"get")
		}
		else if (tmpr="Simpson's 3/8 Rule")
		{
			GuiControl, Choose, simpsonrule,2
			Result+=simpsonintegration(lowerlimit,upperlimit,Segments,"get")
		}
		lowerlimit:=upperlimit
		if (stopswitch=1)
			return
	}
	trueresult:=maximasolver("float(integrate(" formula ",variable," truelowerlimit "," trueupperlimit "));")+0
	
	LV_Add(,RTZ(trueresult),RTZ(Result),RTZ(abs(100*(trueresult-Result)/trueresult)))
	
	LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
	LVA_SetCell(A_DefaultListView,1,1,"0x0000FF","Yellow") ; give the true value a Blue background and Yellow text
	LVA_SetCell(A_DefaultListView,1,2,"0x00FF00","Black") ; give the approximate result a Green background and Black text
	LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
	
	loop % LV_GetCount("Column")
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	GuiControl,+Redraw,listview
}

eulerode(equation,Xi,Yi,samplestart,sampleend,stepsize)
{
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	Xi+=0,Yi+=0,samplestart+=0,sampleend+=0,stepsize+=0
	if regexmatch(equation,"d.*?\/d.*?(?=(\+|-|\*|\/|=|$|\)))")
	{
		pos:=1
		While pos := RegExMatch(equation,"d.*?\/d.*?(?=(\+|-|\*|\/|=|$|\)))",Match,pos+StrLen(Match))
		{
			FoundPos:=InStr(Match,"/")
			variable1:=SubStr(Match,2,FoundPos-2)
			variable2:=SubStr(Match,FoundPos+2,strlen(Match)-1-FoundPos)
			expression:=StrReplace(equation,Match,"_sAisuanelm_czYziOa_WHka" A_Index)
			equation:=StrReplace(equation,Match,"'diff(" variable1 "," variable2 ")")
		}
		Strreplace(expression,"_sAisuanelm_czYziOa_WHka",,count)
		loop %count%
		{
			index:=count-A_Index+1
			if instr(expression,"_sAisuanelm_czYziOa_WHka" index)
			{
				expression:=maxima2ahk(maximasolver("expand(solve(" expression ",_sAisuanelm_czYziOa_WHka" index "));"))
				loop %count%
				{
					if (stopswitch=1)
						return
					if (A_Index!=index)
						expression:=Strreplace(expression,"_sAisuanelm_czYziOa_WHka" A_Index)
				}
				break
			}
		}
		;expression:=maxima2ahk(maximasolver("expand(float(solve(" expression "," variable1 ")));"))
	}
	partialsolution:=maxima2ahk(maximasolver("ic1(ode2(" ahk2maxima(equation) "," variable1 "," variable2 ")," variable2 "=" Xi "," variable1 "=" Yi ");"))
	;partialsolution:=regexreplace(partialsolution,"((\+|-|\*|\/)(\(*)?%c(\)*)?)|((\(*)?%c(\)*)?(\+|-|\*|\/))")
	;partialsolution:=strreplace(partialsolution,"%c",1)
	partialsolution:=fixangleunit(partialsolution)
	
	truevalue:=MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",Xi))+0
	LV_Add(,RTZ(samplestart+0),RTZ(truevalue+0),RTZ(Yi+0),RTZ(100*(truevalue-Yi)/truevalue) "%")
	
	global approximategraph:=[],truegraph:=[]
	approximategraph[0]:=[samplestart+0,Yi+0]
	savesamplestart:=samplestart
	loop
	{
		if (stopswitch=1)
			return
		samplestart+=stepsize
		if (samplestart>sampleend)
		{
			break
		}
		truevalue:=MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",Xi+stepsize))+0
		
		Yi+=stepsize*MonsterEval(regexreplace(regexreplace(expression,"(?<=[^a-zA-Z]|^)" variable1 "(?=[^a-zA-Z]|$)",Yi),"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",Xi)) ;euler's method
		
		approximategraph[A_Index]:=[samplestart+0,Yi+0]
		
		LV_Add(,RTZ(samplestart),RTZ(truevalue),RTZ(Yi),RTZ(100*(truevalue-Yi)/truevalue) "%")
		Xi+=stepsize
	}
	
	
	LVA_EraseAllCells("listview") ;remove cells coloring
	LVA_SetCell("listview",0,2,"","0x00FF00") ;column 2 cells coloring to green
	LVA_SetCell("listview",0,3,"","0x0000FF") ;column 3 cells coloring to blue
	LVA_Refresh("listview") ; set the listview coloring by redrawing the listview
	loop % LV_GetCount("Column")
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	
	stepsize:=((sampleend-savesamplestart)/1000)
	loop 1001
	{
		if (stopswitch=1)
			return
		truegraph[A_Index-1]:=[savesamplestart+0,MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",savesamplestart))+0]
		savesamplestart+=stepsize
	}
}

midpointode(equation,Xi,Yi,samplestart,sampleend,stepsize)
{
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	Xi+=0,Yi+=0,samplestart+=0,sampleend+=0,stepsize+=0
	if regexmatch(equation,"d.*?\/d.*?(?=(\+|-|\*|\/|=|$|\)))")
	{
		pos:=1
		While pos := RegExMatch(equation,"d.*?\/d.*?(?=(\+|-|\*|\/|=|$|\)))",Match,pos+StrLen(Match))
		{
			FoundPos:=InStr(Match,"/")
			variable1:=SubStr(Match,2,FoundPos-2)
			variable2:=SubStr(Match,FoundPos+2,strlen(Match)-1-FoundPos)
			expression:=StrReplace(equation,Match,"_sAisuanelm_czYziOa_WHka" A_Index)
			equation:=StrReplace(equation,Match,"'diff(" variable1 "," variable2 ")")
		}
		Strreplace(expression,"_sAisuanelm_czYziOa_WHka",,count)
		loop %count%
		{
			index:=count-A_Index+1
			if instr(expression,"_sAisuanelm_czYziOa_WHka" index)
			{
				expression:=maxima2ahk(maximasolver("expand(solve(" expression ",_sAisuanelm_czYziOa_WHka" index "));"))
				loop %count%
				{
					if (stopswitch=1)
						return
					if (A_Index!=index)
						expression:=Strreplace(expression,"_sAisuanelm_czYziOa_WHka" A_Index)
				}
				break
			}
		}
		variables:=[variable2,variable1],fi(,,expression) ; initialize the settings for the fi() function
	}
	partialsolution:=maxima2ahk(maximasolver("ic1(ode2(" ahk2maxima(equation) "," variable1 "," variable2 ")," variable2 "=" Xi "," variable1 "=" Yi ");"))
	;partialsolution:=regexreplace(partialsolution,"((\+|-|\*|\/)(\(*)?%c(\)*)?)|((\(*)?%c(\)*)?(\+|-|\*|\/))")
	;partialsolution:=strreplace(partialsolution,"%c",1)
	partialsolution:=fixangleunit(partialsolution)
	truevalue:=MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",Xi))+0
	LV_Add(,RTZ(samplestart+0),RTZ(truevalue+0),RTZ(Yi+0),RTZ(100*(truevalue-Yi)/truevalue) "%")
	global approximategraph:=[],truegraph:=[]
	approximategraph[0]:=[samplestart+0,Yi+0]
	savesamplestart:=samplestart
	loop
	{
		if (stopswitch=1)
			return
		samplestart+=stepsize
		if (samplestart>sampleend)
		{
			break
		}
		truevalue:=MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",Xi+stepsize))+0
		
		Yi+=stepsize*fi(variables,[Xi+(stepsize/2),Yi+(stepsize*fi(variables,[Xi,Yi])/2)]) ;midpoint method
		
		approximategraph[A_Index]:=[samplestart+0,Yi+0]
		
		LV_Add(,RTZ(samplestart),RTZ(truevalue),RTZ(Yi),RTZ(100*(truevalue-Yi)/truevalue) "%")
		Xi+=stepsize
	}
	
	
	LVA_EraseAllCells("listview") ;remove cells coloring
	LVA_SetCell("listview",0,2,"","0x00FF00") ;column 2 cells coloring to green
	LVA_SetCell("listview",0,3,"","0x0000FF") ;column 3 cells coloring to blue
	LVA_Refresh("listview") ; set the listview coloring by redrawing the listview
	loop % LV_GetCount("Column")
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	
	stepsize:=((sampleend-savesamplestart)/1000)
	loop 1001
	{
		if (stopswitch=1)
			return
		truegraph[A_Index-1]:=[savesamplestart+0,MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",savesamplestart))+0]
		savesamplestart+=stepsize
	}
}

ralstonode(equation,Xi,Yi,samplestart,sampleend,stepsize)
{
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	Xi+=0,Yi+=0,samplestart+=0,sampleend+=0,stepsize+=0
	if regexmatch(equation,"d.*?\/d.*?(?=(\+|-|\*|\/|=|$|\)))")
	{
		pos:=1
		While pos := RegExMatch(equation,"d.*?\/d.*?(?=(\+|-|\*|\/|=|$|\)))",Match,pos+StrLen(Match))
		{
			FoundPos:=InStr(Match,"/")
			variable1:=SubStr(Match,2,FoundPos-2)
			variable2:=SubStr(Match,FoundPos+2,strlen(Match)-1-FoundPos)
			expression:=StrReplace(equation,Match,"_sAisuanelm_czYziOa_WHka" A_Index)
			equation:=StrReplace(equation,Match,"'diff(" variable1 "," variable2 ")")
		}
		Strreplace(expression,"_sAisuanelm_czYziOa_WHka",,count)
		loop %count%
		{
			index:=count-A_Index+1
			if instr(expression,"_sAisuanelm_czYziOa_WHka" index)
			{
				expression:=maxima2ahk(maximasolver("expand(solve(" expression ",_sAisuanelm_czYziOa_WHka" index "));"))
				loop %count%
				{
					if (stopswitch=1)
						return
					if (A_Index!=index)
						expression:=Strreplace(expression,"_sAisuanelm_czYziOa_WHka" A_Index)
				}
				break
			}
		}
		variables:=[variable2,variable1],fi(,,expression) ; initialize the settings for the fi() function
	}
	partialsolution:=maxima2ahk(maximasolver("ic1(ode2(" ahk2maxima(equation) "," variable1 "," variable2 ")," variable2 "=" Xi "," variable1 "=" Yi ");"))
	;partialsolution:=regexreplace(partialsolution,"((\+|-|\*|\/)(\(*)?%c(\)*)?)|((\(*)?%c(\)*)?(\+|-|\*|\/))")
	;partialsolution:=strreplace(partialsolution,"%c",1)
	partialsolution:=fixangleunit(partialsolution)
	
	truevalue:=MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",Xi))+0
	LV_Add(,RTZ(samplestart+0),RTZ(truevalue+0),RTZ(Yi+0),RTZ(100*(truevalue-Yi)/truevalue) "%")
	global approximategraph:=[],truegraph:=[]
	approximategraph[0]:=[samplestart+0,Yi+0]
	savesamplestart:=samplestart
	loop
	{
		if (stopswitch=1)
			return
		samplestart+=stepsize
		if (samplestart>sampleend)
		{
			break
		}
		truevalue:=MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",Xi+stepsize))+0
		
		;ralston's method
		k1:=fi(variables,[Xi,Yi])
		k2:=fi(variables,[Xi+(3*stepsize/4),Yi+(k1*3*stepsize/4)])
		Yi+=stepsize*((k1/3)+(k2*2/3))
		;
		
		approximategraph[A_Index]:=[samplestart+0,Yi+0]
		
		LV_Add(,RTZ(samplestart),RTZ(truevalue),RTZ(Yi),RTZ(100*(truevalue-Yi)/truevalue) "%")
		Xi+=stepsize
	}
	
	
	LVA_EraseAllCells("listview") ;remove cells coloring
	LVA_SetCell("listview",0,2,"","0x00FF00") ;column 2 cells coloring to green
	LVA_SetCell("listview",0,3,"","0x0000FF") ;column 3 cells coloring to blue
	LVA_Refresh("listview") ; set the listview coloring by redrawing the listview
	loop % LV_GetCount("Column")
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	
	stepsize:=((sampleend-savesamplestart)/1000)
	loop 1001
	{
		if (stopswitch=1)
			return
		truegraph[A_Index-1]:=[savesamplestart+0,MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",savesamplestart))+0]
		savesamplestart+=stepsize
	}
}

heunode(equation,Xi,Yi,samplestart,sampleend,stepsize,correctioncount)
{
	Gui,ListView,listview
	LV_ClearAll() ; clean the listview by deleting all its rows
	Xi+=0,Yi+=0,samplestart+=0,sampleend+=0,stepsize+=0
	
	;partial solution generator
	if regexmatch(equation,"d.*?\/d.*?(?=(\+|-|\*|\/|=|$|\)))")
	{
		pos:=1
		While pos := RegExMatch(equation,"d.*?\/d.*?(?=(\+|-|\*|\/|=|$|\)))",Match,pos+StrLen(Match))
		{
			FoundPos:=InStr(Match,"/")
			variable1:=SubStr(Match,2,FoundPos-2)
			variable2:=SubStr(Match,FoundPos+2,strlen(Match)-1-FoundPos)
			expression:=StrReplace(equation,Match,"_sAisuanelm_czYziOa_WHka" A_Index)
			equation:=StrReplace(equation,Match,"'diff(" variable1 "," variable2 ")")
		}
		Strreplace(expression,"_sAisuanelm_czYziOa_WHka",,count)
		loop %count%
		{
			index:=count-A_Index+1
			if instr(expression,"_sAisuanelm_czYziOa_WHka" index)
			{
				expression:=maxima2ahk(maximasolver("expand(solve(" expression ",_sAisuanelm_czYziOa_WHka" index "));"))
				loop %count%
				{
					if (stopswitch=1)
						return
					if (A_Index!=index)
						expression:=Strreplace(expression,"_sAisuanelm_czYziOa_WHka" A_Index)
				}
				break
			}
		}
		variables:=[variable2,variable1],fi(,,expression) ; initialize the settings for the fi() function
	}
	partialsolution:=maxima2ahk(maximasolver("ic1(ode2(" ahk2maxima(equation) "," variable1 "," variable2 ")," variable2 "=" Xi "," variable1 "=" Yi ");"))
	;partialsolution:=regexreplace(partialsolution,"((\+|-|\*|\/)(\(*)?%c(\)*)?)|((\(*)?%c(\)*)?(\+|-|\*|\/))")
	;partialsolution:=strreplace(partialsolution,"%c",1)
	partialsolution:=fixangleunit(partialsolution)
	;
	truevalue:=MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",Xi))+0
	LV_Add(,RTZ(samplestart+0),RTZ(truevalue+0),RTZ(Yi+0),RTZ(100*(truevalue-Yi)/truevalue) "%")
	
	global approximategraph:=[],truegraph:=[]
	approximategraph[0]:=[samplestart+0,Yi+0]
	savesamplestart:=samplestart
	loop
	{
		if (stopswitch=1)
			return
		samplestart+=stepsize
		if (samplestart>sampleend)
		{
			break
		}
		truevalue:=MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",Xi+stepsize))+0
		
		;heun's method
		fYi:=fi(variables,[Xi,Yi])
		Corrector:=Yi+stepsize*fYi ; predictor
		loop %correctioncount% ; corrector
		{
			if (stopswitch=1)
				return
			Corrector:=Yi+(fYi+fi(variables,[Xi+stepsize,Corrector]))/2
		}
		Yi:=Corrector
		;
		
		approximategraph[A_Index]:=[samplestart+0,Yi+0]
		
		LV_Add(,RTZ(samplestart),RTZ(truevalue),RTZ(Yi),RTZ(100*(truevalue-Yi)/truevalue) "%")
		Xi+=stepsize
	}
	
	LVA_EraseAllCells("listview") ;remove cells coloring
	LVA_SetCell("listview",0,2,"","0x00FF00") ;column 2 cells coloring to green
	LVA_SetCell("listview",0,3,"","0x0000FF") ;column 3 cells coloring to blue
	LVA_Refresh("listview") ; set the listview coloring by redrawing the listview
	loop % LV_GetCount("Column")
		LV_ModifyCol(A_Index,"AutoHDR Center")
	LV_Modify(LV_GetCount(),"Vis")
	
	stepsize:=((sampleend-savesamplestart)/1000)
	loop 1001
	{
		if (stopswitch=1)
			return
		truegraph[A_Index-1]:=[savesamplestart+0,MonsterEval(regexreplace(partialsolution,"(?<=[^a-zA-Z]|^)" variable2 "(?=[^a-zA-Z]|$)",savesamplestart))+0]
		savesamplestart+=stepsize
	}
}
;-------END OF NUMERICAL METHODS-------

;------ N(x) ENGINES ------

detectunknownsandequations(byref equations,byref unknowns)
{
	equations:=[],unknowns:=[] ; declare this parameters as array
	
	guicontrolget,formatmode,,formatmode
	if (formatmode="Matrix")
	{
		Gui,ListView,matrixgiven
		loop % LV_GetCount()
		{
			row:=A_Index
			loop % LV_GetCount("Column")-1
			{
				LV_GetText(tmpr,row,A_Index+1)
				if (A_Index=1)
					equations[row].="((" tmpr ")*X" A_Index ")"
				else if (A_Index=LV_GetCount("Column")-1)
					equations[row].="=" tmpr
				else equations[row].="+((" tmpr ")*X" A_Index ")" 
			}
		}
		loop % LV_GetCount("Column")-2
			unknowns.Push("X" A_Index)
		Gui,ListView,matrixanswer
	}
	else
	{
		loop
		{
			guicontrol,choose,equationsystem,%A_Index%
			guicontrol,+AltSubmit,equationsystem
			guicontrolget,equationsystem,,equationsystem
			guicontrol,-AltSubmit,equationsystem
			if (equationsystem!=A_Index)
				break
			guicontrolget,equationsystem,,equationsystem
			equationsystem:=ahk2maxima(equationsystem) ; convert ahk language related into maxima language related for its own compatibility
			equationsystem:=maximasolver("powerdisp:true$combine(" equationsystem ");",0) ; simplify the equation
			equations[A_Index]:=maxima2ahk(equationsystem) ; convert maxima language related into ahk language related for its own compatibility
		}
		arr:=[],testArr:=[] ; declare required arrays
		loop % equations.Length()
		{
			equationindex:=A_Index
			pos:=1
			While pos := RegExMatch(equations[equationindex],"[^+\-*/()0-9.=]+?(?=[+\-*/)0-9.=]|$)",Match,pos+StrLen(Match))
			{
				if !testArr.HasKey(Match)
					testArr[Match] := true, unknowns.Push(Match)
			}
		}
		arr:=testArr:="" ;void array
	}
	
	if (unknowns.Length()!=equations.Length())
		return 0
	else
	{
		sorter:=unknowns.Clone()
		loop % equations.Length()
		{
			equationindex:=A_Index
			loop % unknowns.Length()
			{
				unknownindex:=A_Index
				if (sorter[unknownindex]!="") and (RegExMatch(equations[equationindex],sorter[unknownindex] "(?=[+\-*/)0-9.=]|$)"))	;-	check if the unknown exist on the equation
				{
					equations[equationindex]:=ahk2maxima(equations[equationindex]) ; convert ahk language related into maxima language related for its own compatibility
					equations[equationindex]:=maximasolver("solve(" equations[equationindex] "," sorter[unknownindex] ");")
					equations[equationindex]:=maxima2ahk(equations[equationindex]) ; convert maxima language related into ahk language related for its own compatibility
					sorter[unknownindex]:=""
					break
				}
			}
		}
		return 1
	}
}

smartdetectunknownsandequations(byref equations,byref unknowns)
{
	equations:=[],unknowns:=[] ; declare this parameters as array
	loop
	{
		guicontrol,choose,equationsystem,%A_Index%
		guicontrol,+AltSubmit,equationsystem
		guicontrolget,equationsystem,,equationsystem
		guicontrol,-AltSubmit,equationsystem
		if (equationsystem!=A_Index)
			break
		guicontrolget,equationsystem,,equationsystem
		equationsystem:=ahk2maxima(equationsystem) ; convert ahk language related into maxima language related for its own compatibility
		equationsystem:=maximasolver("powerdisp:true$combine(" equationsystem ");",0) ; simplify the equation
		equations[A_Index]:=maxima2ahk(equationsystem) ; convert maxima language related into ahk language related for its own compatibility
	}
	arr:=[],testArr:=[] ; declare required arrays
	loop % equations.Length()
	{
		equationindex:=A_Index
		pos:=1
		While pos := RegExMatch(equations[equationindex],"[^+\-*/()0-9.=]+?(?=[+\-*/)0-9.=]|$)",Match,pos+StrLen(Match))
		{
			if !testArr.HasKey(Match)
				testArr[Match] := true, unknowns.Push(Match)
		}
	}
	arr:=testArr:="" ;void array
	
	if (unknowns.Length()!=equations.Length())
		return 0
	else
	{
		sorter:=[]
		loop % equations.Length()
		{
			equationindex:=A_Index
			loop % unknowns.Length()
			{
				if RegExMatch(equations[equationindex],unknowns[A_Index] "(?=[+\-*/)0-9.=]|$)")
				{
					;sorter[0][A_Index]				-	number of times the unknown existed on all equations (eg. unknown "a" can be found at eq1,eq2 but not on eq3 therefore this results to 2)
					;sorter[equationindex][0]		-	number of unknowns the equation has (eg. eq1 == a+b+c=0 therefore this results to 3)
					
					if sorter[0][A_Index] is integer
						sorter[0][A_Index]++
					else sorter[0][A_Index]:=1
					
					if sorter[equationindex][0] is integer
					sorter[equationindex][0]++
					else sorter[equationindex][0]:=1
				}
			}
		}
		
		;sort contents of array of equations into descending order accourding to the number of unknowns existed on it
		for equationindex1, in equations
			for equationindex2, in equations
				if (equationindex1<equationindex2) and (sorter[equationindex1][0]<sorter[equationindex2][0])
				{
					tempor:=equations[equationindex1],equations[equationindex1]:=equations[equationindex2],equations[equationindex2]:=tempor
					tempor:=sorter[equationindex1][0],sorter[equationindex1][0]:=sorter[equationindex2][0],sorter[equationindex2][0]:=tempor
				}
		
		;sort contents of array of unknowns into ascending order accourding to the number of times it existed on all equations
		for equationindex1, in unknowns
			for equationindex2, in unknowns
				if (equationindex1<equationindex2) and (sorter[0][equationindex1]>sorter[0][equationindex2])
				{
					tempor:=unknowns[equationindex1],unknowns[equationindex1]:=unknowns[equationindex2],unknowns[equationindex2]:=tempor
					tempor:=sorter[0][equationindex1],sorter[0][equationindex1]:=sorter[0][equationindex2],sorter[0][equationindex2]:=tempor
				}
		
		sorter:=unknowns.Clone()
		loop % equations.Length()
		{
			equationindex:=A_Index
			loop % unknowns.Length()
			{
				unknownindex:=A_Index
				if (sorter[unknownindex]!="") and (RegExMatch(equations[equationindex],sorter[unknownindex] "(?=[+\-*/)0-9.=]|$)"))	;-	check if the unknown exist on the equation
				{
					equations[equationindex]:=ahk2maxima(equations[equationindex]) ; convert ahk language related into maxima language related for its own compatibility
					equations[equationindex]:=maximasolver("solve(" equations[equationindex] "," sorter[unknownindex] ");")
					equations[equationindex]:=maxima2ahk(equations[equationindex]) ; convert maxima language related into ahk language related for its own compatibility
					sorter[unknownindex]:=""
					break
				}
			}
		}
		return 1
	}
}

f(variable)
{
	return MonsterEval(strreplace(formula,"variable",variable))+0
}

g(variable)
{
	return MonsterEval(strreplace(workingexpression,"variable",variable))+0
}

derivative(expression,nth:=1) ; expression consist of the evaluated expression while nth is the nth derivative being evaluated
{
	expression:=ahk2maxima(expression) ; convert ahk language related into maxima language related for its own compatibility
	expression:=maximasolver("diff(" expression ",variable," nth ");")
	expression:=maxima2ahk(expression) ; convert maxima language related into ahk language related for its own compatibility
	return expression
}

fi(variables:="",values:="",expressiondummy:="")
;variables		-	an array of variables that detects all given variables
;values			-	array of values that is the counterpart of each unknowns
;expressiondummy-	initialize the function's working expression
{
	static expression
	if expressiondummy!=
		expression:=expressiondummy
	else if (expression="") or !IsObject(variables) or !IsObject(values)
		return
	
	expressiondummy:=expression
	for index,variable in variables
	{
		expressiondummy:=regexreplace(expressiondummy,"(?<=[^a-zA-Z]|^)" variable "(?=[^a-zA-Z]|$)",values[index])
	}
	return MonsterEval(expressiondummy)
}
;------------

;------------TRIGONOMETRIC FUNCTIONS------------------
csc(x)
{
	return 1/sin(x)
}

sec(x)
{
	return 1/cos(x)
}

cot(x)
{
	return 1/tan(x)
}

acsc(x)
{
	return asin(1/x)
}

asec(x)
{
	return acos(1/x)
}

acot(x)
{
	return atan(1/x)
}

sinh(x)
{
	return (exp(x)-exp(-x))/2
}

cosh(x)
{
	return (exp(x)+exp(-x))/2
}

tanh(x)
{
	return (exp(x)-exp(-x))/(exp(x)+exp(-x))
}

csch(x)
{
	return 2/(exp(x)-exp(-x))
}

sech(x)
{
	return 2/(exp(x)+exp(-x))
}

coth(x)
{
	return (exp(x)+exp(-x))/(exp(x)-exp(-x))
}

asinh(x)
{
	return ln(x+sqrt((x**2)+1))
}

acosh(x)
{
	return ln(x+sqrt((x**2)-1))
}

atanh(x)
{
	return ln((1-x)/(1+x))/2
}

acsch(x)
{
	return asinh(1/x)
}

asech(x)
{
	return acosh(1/x)
}

acoth(x)
{
	return ln((1+x)/(1-x))/2
}
;-------------------------------------

;------------ALGEBRAIC FUNCTIONS------------------
combin(a,b)
{
;pascal's triangle combinational function
; a - row in the triangle starting at 1
; b - column in the triangle starting at 0
	return fact(a)/(fact(b)*fact(a-b))
}
fact(x)
{
	value:=1
	loop % x
		value*=A_Index
	return value
}

logn(value,base:=10)
{
	return log(value)/log(2)
}

mod(a,b,decimalplaces:="") ; since autohotkey built-in modulo has a bug, this will fix the problem for integers and floating points
/*
computation was
if decimalplaces=
	return round(a - (b * floor(round(a/b,13))),13)+0 ; since 14th or 15th decimalplaces and above provides unexpected numbers, this fixes the problem
else return round(a - (b * floor(round(a/b,decimalplaces))),decimalplaces)+0 ; user can specify the decimal places of the rounding
modulo:=rtrim(rtrim(modulo,0),".") ; remove trailing zeros and dot if not needed
*/
{
  modulo:=((decimalplaces="")?(round(a - (b * floor(round(a/b,13))),13)):(round(a - (b * floor(round(a/b,decimalplaces))),decimalplaces)))+0
  return rtrim(rtrim(modulo,0),".")
}
;-------------------------------------

;------------MY CREATED FUNCTIONS------------------
;Created by me
CustomIncrement(UpDownID,hUpDown,hBuddy,Increment,minrange:="",maxrange:="")
{
	GuiControlGet,Newer,,%hUpDown%
	GuiControl,text,%hUpDown%,5
	GuiControlGet,Newer,,%hUpDown%
	CtrlFunc := Func("IncrementComputer").Bind(hUpDown,hBuddy,Increment,minrange,maxrange)
	GuiControl, +g,%UpDownID%,%CtrlFunc%
}

IncrementComputer(hUpDown,hBuddy,Increment,minrange,maxrange)
{
	; hUpDown   -  handle to the UpDown control
	; hBuddy    -  handle to the buddy control
	; Increment -  custom incre4ment
	static Older:=5
	GuiControlGet,Newer,,%hUpDown%
	GuiControlGet,value,,%hBuddy%
	value:=(Newer>Older?Increment:-Increment)+value-mod(value,Increment)
	if (minrange!="") and (value<minrange)
		value:=minrange
	else if (maxrange!="") and (value>maxrange)
		value:=maxrange
	
	ControlSetText,,%value%,ahk_id %hBuddy%
	
	GuiControl,text,%hUpDown%,5
	
	GuiControl,Focus,%hBuddy%
}
;

RTZ(value) ; remove trailing zeroes and dot at the right
{
	return rtrim(rtrim(value,0),".")
}

fixangleunit(variable)
{
	guicontrolget,angleunit,,angleunit
	if (angleunit!="Radian")
	{
		variable:=RegExReplace(variable,"i)sin\(|cos\(|tan\(|csc\(|sec\(|cot\(|sinh\(|cosh\(|tanh\(|csch\(|sech\(|coth\(|asin\(|acos\(|atan\(|acsc\(|asec\(|acot\(|asinh\(|acosh\(|atanh\(|acsch\(|asech\(|acoth\(","$0(3.141592653589793238462643383279502884197169399375105820974944592307816406286/180)*")
	}
	return variable
}

ahkmaxima(expression,convertto:="maxima")
{
	if (convertto="maxima")
		function=ahk2maxima
	else function=maxima2ahk
	if IsObject(expression)
	{
		newexpression:=[]
		for row,value in expression
			if IsObject(value[1])
				for column,value1 in value[1]
					newexpression[row][column]:=%function%(value1)
			else newexpression[row]:=%function%(value)
	}
	else newexpression:=%function%(expression)
	return newexpression
}

ahk2maxima(expression)
{
	expression:=strreplace(expression,"ln(","log(")
	expression:=strreplace(expression,"log(","log10(")
	expression:=strreplace(expression,"**","^")
	
	; ahk factorial to maxima factorial converter
	if instr(expression,"fact(")
	{
		StrReplace(expression,"fact(","fact(",count)
		loop % count
		{
			FoundPos := InStr(expression,"fact(",,,A_Index)-1,bracket:=0
			loop
			{
				if !(FoundPos := RegExMatch(expression,"\(|\)",match,FoundPos+1))
					break
				if (match="(")
					bracket++
				else if (match=")")
					bracket--
				if (bracket<=0)
				{
					tmpr:=SubStr(expression,1,FoundPos)
					expression:=strreplace(expression,tmpr,tmpr "!)")
					break
				}
			}
		}
		expression:=strreplace(expression,"fact(","((")
	}
	;
	return expression ; continue here
}

maxima2ahk(expression)
{
	expression:=strreplace(expression,"%e^(","exp(")
	if instr(expression,"%e^")
	{
		expression:=RegExReplace(expression,"(?<=%e\^).*?(?=(\+|-|\*|\/|=|\)|$))","$0)")
		expression:=strreplace(expression,"%e^","exp(")
	}
	;string inversion to allow regex to search backwards
	sLen:=strLen(expression)
	loop % sLen
		nStr.=subStr(expression,sLen--,1)
	expression:=nStr,sLen:=nStr:=""
	;
	if instr(expression,"!)")
	{
		StrReplace(expression,"!)","!)",count)
		loop % count
		{
			savedpos := FoundPos := InStr(expression,"!)")-1,bracket:=0
			loop
			{
				if !(FoundPos := RegExMatch(expression,"\(|\)",match,FoundPos+1))
					break
				if (match="(")
					bracket--
				else if (match=")")
					bracket++
				if (bracket<=0)
				{
					if !(regexmatch(SubStr(expression,FoundPos+1,1),"\+|-|\*|\/|\("))
					{
						FoundPos:=regexmatch(expression,"\+|-|\*|\/|\(",,FoundPos+1)-1
						tmpr:=SubStr(expression,1,FoundPos)
						expression:=strreplace(expression,tmpr,tmpr "(tcaf")
						expression:=substr(expression,1,savedpos) ")" substr(expression,savedpos+2,strlen(expression)-savedpos-1)
					}
					else
					{
						tmpr:=SubStr(expression,1,FoundPos)
						expression:=strreplace(expression,tmpr,tmpr "(tcaf")
						expression:=substr(expression,1,savedpos) substr(expression,savedpos+2,strlen(expression)-savedpos-1)
					}
					break
				}
			}
		}
	}
	loop
		if instr(expression,"!")
		{
			expression:=RegExReplace(expression,"(?<=!)[^!].*?(?=(\+|-|\*|\/|=|$))","ndqwoufhqonwqjdjwqlzmcli$0(tcaf")
			expression:=strreplace(expression,"!ndqwoufhqonwqjdjwqlzmcli",")")
		}
		else break
	;string inversion to allow regex to search backwards
	sLen:=strLen(expression)
	loop % sLen
		nStr.=subStr(expression,sLen--,1)
	expression:=nStr,sLen:=nStr:=""
	;
	expression:=strreplace(expression,"log(","ln(")
	expression:=strreplace(expression,"log10(","log(")
	expression:=strreplace(expression,"^","**")
	
	return expression
}

maximasolver(vScript,isexpression:=1,trimmingtype:=2,vPathExe = "")
/*
trimming type of values:
0	-	do not use any trimming operations
1	-	do trimming operations BUT Will not trim square brackets("[" and "]")
ANY	-	DO FULL TRIMMING FEATURE
*/
{
	global maximaPID
	if (vPathExe="")
		if FileExist(maximadir)
			vPathExe:=maximadir
		else
		{
			guicontrolget,maximadir,,maximadir
			if FileExist(maximadir)
				vPathExe:=maximadir
			else vPathExe=%A_ScriptDir%\Plugins\maxima-5.43.0\bin\maxima.bat
		}
	
	DetectHiddenWindows, On
	if !fileexist(vComSpec)
		vComSpec := A_ComSpec ? A_ComSpec : ComSpec
	Run, % vComSpec,,Hide,vmaximaPID
	WinWait, % "ahk_pid " vmaximaPID
	DllCall("kernel32\AttachConsole", "UInt",vmaximaPID)
	oShell := ComObjCreate("WScript.Shell")
	oExec := oShell.Exec(Chr(34) vPathExe Chr(34))
	oExec.StdIn.Write("%edispflag:true$display2d:false$exptdispflag:false$leftjust:true$sqrtdispflag:false$stardisp:true$" vScript "quit();")
	oExec.StdIn.Close()
	vStdOut := oExec.StdOut.ReadAll()
	DllCall("kernel32\FreeConsole")
	Process, Close, % vmaximaPID
	oShell := oExec := ""
	if (trimmingtype=1)
		if isexpression
			vStdOut:=RegExReplace(vStdOut,".*%o.*?\)|.*=|\s","")
		else
			vStdOut:=RegExReplace(vStdOut,".*%o.*?\)|\s","")
	else if (trimmingtype!=0)
		if isexpression
			vStdOut:=RegExReplace(vStdOut,".*%o.*?\)|.*=|\s|]|\[","")
		else
			vStdOut:=RegExReplace(vStdOut,".*%o.*?\)|\s|]|\[","")
	if (vStdOut="")
		vStdOut:=0
	return vStdOut
}

LV_ClearAll(switch:="-column")
{
	LVA_EraseAllCells(A_DefaultListView) ;remove cells coloring
	LVA_Refresh(A_DefaultListView) ; set the listview coloring by redrawing the listview
	
	if !instr(switch,"-row")
		LV_Delete()
	
	if !instr(switch,"-column")
		loop % LV_GetCount("Column")
			LV_DeleteCol(1)
}
;-------------------------------------

;------------COMMUNITY FUNCTIONS------------------
#include %A_ScriptDir%\Plugins\Community Functions\gdipChart.ahk			; math grapher
#Include %A_ScriptDir%\Plugins\Community Functions\Class_LV_InCellEdit.ahk	; editable listviews controls
#include %A_ScriptDir%\Plugins\Community Functions\LVA.ahk					; colored listviews
#include %A_ScriptDir%\Plugins\Community Functions\Monster.ahk				; powerful string to math evaluator
#include %A_ScriptDir%\Plugins\Community Functions\MatrixClass.ahk			; powerfull matrix computer for AHK
;#include %A_ScriptDir%\Plugins\Community Functions\Eval.ahk
;evaluate(Input)
;{
;	if (RegExReplace(A_FormatFloat,"[^.\d]")<0.15)
;	{
;		saveddecimalplaces:=A_FormatFloat
;		SetFormat, float,0.15 ; 15 decimal places is the default of autohotkey
;	}
;	
;	Result:=MonsterEval(Input)+0
;	backupresult := StrReplace(Input, "`n", ",")
;	loop
;	{
;		Try
;		{
;			backupresult := Eval(backupresult)
;			backupresult := StrJoin(backupresult, "`n")
;		}
;		if (backupresult+0!="") or (backupresult="")
;			break
;	}
;	backupresult+=0
;	
;	if Result is Number
;	{
;		if ((backupresult>0) and (Result<0)) or ((backupresult<0) and (Result>0)) ; the eval function has bug on its sign, checking the sign of the old eval function will do it precisely
;			backupresult*=-1
;		accuracyerror:=abs(100*(backupresult-Result)/backupresult)
;		if (accuracyerror<=1) and (accuracyerror!="")
;		{
;			Result:=backupresult
;		}
;	}
;	else if (Result="") and (backupresult!="")
;	{
;		Result:=backupresult
;	}
;	if saveddecimalplaces is Number
;		SetFormat, float,%saveddecimalplaces% ; return the number of decimal places format back
;	return Result
;}
;-------------------------------------

HQguiclose:
~end::
Process, Close, % vmaximaPID
exitapp