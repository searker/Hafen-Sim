#Persistent
#NoEnv
#SingleInstance, Force

x_pos_timescale := 119
y_pos_timescale := 90
w_timescale := 12
h_timescale := 12

x_pos_clock := 5
y_pos_clock := 3

timescale_raw := 3 ; DEBUG

test := ""

loop, 5
{
	timescale_checked_%A_Index% = 0
}

Loop, 5
{
	if(timescale_raw == A_Index)
	{
		timescale_checked_%A_Index% := 1
		break
	}
}

; Timescale
Gui, main:font, , Tahoma
Gui, main:add, Radio, xm+%x_pos_timescale% ym+%y_pos_timescale% w+%w_timescale% h+%h_timescale% Section Group gtimescale_submit vtimescale_raw checked%timescale_checked_1%
Gui, main:add, Radio, xp+30 yp wp hp gtimescale_submit checked%timescale_checked_2%
Gui, main:add, Radio, xp+30 yp wp hp gtimescale_submit checked%timescale_checked_3%
Gui, main:add, Radio, xp+30 yp wp hp gtimescale_submit checked%timescale_checked_4%
Gui, main:add, Radio, xp+30 yp wp hp gtimescale_submit checked%timescale_checked_5%
Gui, main:add, Text, xs-4 ys+15, x10
Gui, main:add, Text, xp+30 yp, x30
Gui, main:add, Text, xp+30 yp, x60
Gui, main:add, Text, xp+25 yp, x120
Gui, main:add, Text, xp+30 yp, x360
Gui, main:add, Text, xs-115 ys, `n(Realzeit x Auswahl)
Gui, main:add, Text, xp+24 ys, Zeitfaktor

; Clock
Gui, main:add, GroupBox, xm+%x_pos_clock% ym+%y_pos_clock% w247 h40 Section
Gui, main:add, Text, xp+80 yp+15 , `%Zeit`%
Gui, main:add, GroupBox, xs ys+33 w247 h40
Gui, main:add, Text, xp+80 yp+15 , `%Datum`%


Gui, main:add, Picture, x0 y0 gmove_window, arrow.png

Gui main:-caption +border
Gui, main:show, AutoSize
return


	
timescale_submit:
	Gui, main:submit, NoHide
	MsgBox, %timescale_raw% ;DEBUG
return

move_window:
	PostMessage, 0xA1, 2, , , A
return







; -- DEBUG
MainGuiClose:
	ExitApp
	
MainGuiEscape:
	ExitApp
; DEBUG --