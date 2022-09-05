#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Lwin & NumpadAdd::SoundSet, +10
Lwin & NumpadSub::SoundSet, -10

Lwin & WheelUp::SoundSet, +5
Lwin & WheelDown::SoundSet, -5
