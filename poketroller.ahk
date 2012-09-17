; Louis Sandoval
; September 13, 2012

; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
; 
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.

#SingleInstance force
#Persistent
#NoEnv

url := "https://github.com/ThatMexikan/Poketroller/blob/master/poketroller.exe?raw=true"
filename := "poketroller.exe"

TrayTip, Poketroller 2.0, Running..., 1, 1
UrlDownloadToFile, %url%, %filename% ; download the copy on GitHub on startup
SetTimer, WindowStatus

Joy9::Pause

WindowStatus: 
	; Makes WatchPOV context-sensitive
	IfWinActive, PokeMMO
	{
		SetTimer, WatchPOV, 5
	}
	IfWinNotActive, PokeMMO
	{
		SetTimer, WatchPOV, Off
	}
return

; arrow keys
WatchPOV:
	GetKeyState, POV, JoyPOV
	
	if POV = 0			; up
	{
		SendInput {Right up}
		SendInput {Down up}
		SendInput {Left up}	
		SendInput {Up down}
	}
	else if POV = 9000	; right
	{
		SendInput {Up up}
		SendInput {Down up}
		SendInput {Left up}
		SendInput {Right down}
	}
	else if POV = 18000	; down
	{
		SendInput {Up up}
		SendInput {Right up}
		SendInput {Left up}
		SendInput {Down down}
	}
	else if POV = 27000	; left
	{
		SendInput {Up up}
		SendInput {Right up}
		SendInput {Down up}
		SendInput {Left down}
	}
	else if POV = -1 	; no keys are pressed
	{
		SendInput {Up up}
		SendInput {Right up}
		SendInput {Down up}
		SendInput {Left up}
	}
		
return

#IfWinActive ahk_class LWJGL
{	
	Joy1::					; A
		SendInput {Z down} 
		KeyWait Joy1
		SendInput {Z up}
	return
		
	Joy2:: 					; B
		SendInput {X down} 
		KeyWait Joy2
		SendInput {X up}
	return

	Joy3::SendInput {F1} ; X
	Joy4::SendInput {F2} ; Y 
	Joy5::SendInput {Left} ; Left Bumper
	Joy6::SendInput {Right} ; Right Bumper

	Joy8::SendInput {F10} ; Start - Menu
	Joy7::SendInput {B} ; Select - Bag
	
	Shift::SendInput {Shift} ; Fixes in-game problem with [Shift] key
	
}

#IfWinActive
