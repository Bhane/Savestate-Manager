;Project 64 1.6 Savestate Manager - https://github.com/Bhane/Savestate-Manager
#Persistent
#InstallKeybdHook
#UseHook

TrayTip Project 64 Savestate Manager, Project 64 SaveState Manager Loaded, 5, 17

SourceDir = C:\Program Files (x86)\Project64 1.6\Save\
CurrentDirPath = %SourceDir%
;CurrentDirPath is set so that it will replace copy/replace the source files before a new directory is set
set_current_dir(folder) {
	global
	TrayTip Project 64 Savestate Manager, Set directory to %folder%, 5, 17
	;Comment out the above line to remove the traytip from displaying on folder change
	set_old_saves()
	CurrentDirPath = %SourceDir%%folder%
	FileCopyDir, %CurrentDirPath%, %SourceDir%, 1
}

set_old_saves(){
;copies the files from the source directory back to the current directory
global
	;if project 64 uses compressed saves, append .zip to each filename
	;FileCopy, %SourceDir%SUPER MARIO 64.pj0.zip, %CurrentDirPath%, 1
	FileCopy, %SourceDir%SUPER MARIO 64.pj0, %CurrentDirPath%, 1
	FileCopy, %SourceDir%SUPER MARIO 64.pj1, %CurrentDirPath%, 1
	FileCopy, %SourceDir%SUPER MARIO 64.pj2, %CurrentDirPath%, 1
	FileCopy, %SourceDir%SUPER MARIO 64.pj3, %CurrentDirPath%, 1
	FileCopy, %SourceDir%SUPER MARIO 64.pj6, %CurrentDirPath%, 1
	FileCopy, %SourceDir%SUPER MARIO 64.pj7, %CurrentDirPath%, 1
	FileCopy, %SourceDir%SUPER MARIO 64.pj8, %CurrentDirPath%, 1
	FileCopy, %SourceDir%SUPER MARIO 64.pj9, %CurrentDirPath%, 1
}

;if hotkeys aren't working, change #IfWinActive to match what AHK's window spy reads from Project 64's window
;or simply comment out the line and close the script when you're not using Project 64
#IfWinActive ahk_class Project64 Version 1.6
;Folder Names can be customized - just make sure they are ...\Project64 1.6\Save\folder-name\
0::	send_num(0, "Bob", "BitDW", "SSL") ;Up on Dpad
1::	send_num(1, "WF", "BBH", "DDD") ;Right on Dpad
2::	send_num(2, "CCM", "LLL", "BitFS") ;Down on Dpad
3::	send_num(3, "JRB", "HMC", "WDW") ;Left on Dpad
+0:: send_num(6, "THI", "RR", "Castle") ;Shift Up on Dpad
+1:: send_num(7, "TTM", "BitFS", "Castle") ;Shift Right on Dpad
+2:: send_num(8, "SL", "Castle", "Castle") ;Shift Down on Dpad
+3:: send_num(9, "TTC", "Castle", "Castle") ;Shift Left on Dpad
4:: toggle_pre_x() ;x button
5:: toggle_pre_y() ;y button

send_num(number,locx,locy,locxy) {
global
	If is_pre_x AND is_pre_y
		set_current_dir(locxy)
	Else if is_pre_x
		set_current_dir(locx)
	Else if is_pre_y
		set_current_dir(locy)
	Else
		Send %number%
clear_pre_x()
clear_pre_y()
}

is_pre_x := False
is_pre_y := False

clear_pre_x() {
	global
	is_pre_x := False
}
toggle_pre_x() {
global
	is_pre_x := ! is_pre_x
}
clear_pre_y() {
	global
	is_pre_y := False
}
toggle_pre_y() {
global
	is_pre_y := ! is_pre_y
}