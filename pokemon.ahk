; This program is free software: you can redistribute it and/or modify 
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.

#SingleInstance force
#Persistent
#NoEnv

TrayTip, Poketroller 1.0, Running..., 1, 1
SetTimer, WatchPOV, 5 ; start POV timer

Joy9::Pause

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

	Joy3::SendInput {F13} ; X - Null
	Joy4::SendInput {F13} ; Y - Null
	Joy5::SendInput {Left} ; Left Bumper
	Joy6::SendInput {Right} ; Right Bumper

	Joy8::SendInput {F10} ; Start - Menu
	Joy7::SendInput {B} ; Select - Bag
	
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
}

#IfWinActive
