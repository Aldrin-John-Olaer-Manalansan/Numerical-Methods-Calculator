setformat,IntegerFast,D
;setformat,FloatFast,0.2
hotkey,$end,,P100
return

$^v::
loop 21
{
	loop 20
	{
		;random,var,0.0,100.0
		random,var,0,100
		sendinput %var%{enter}
		if stop
			break
	}
	if stop
		break

	send {Right}{Up 20}
}
return

$end::
pause
suspend
stop:=1
exitapp