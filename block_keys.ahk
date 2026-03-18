#Requires AutoHotkey v2.0
#SingleInstance Force

; EXIT HOTKEY: Ctrl+Q closes the game and stops key blocking
^q::{
    Run('taskkill /f /im msedge.exe', , 'Hide')
    Run('taskkill /f /im chrome.exe', , 'Hide')
    ExitApp
}

; Block Windows keys
LWin::return
RWin::return

; Block Alt+Tab, Alt+F4, Alt+Esc
!Tab::return
!F4::return
!Escape::return

; Block Ctrl+Escape (Start menu)
^Escape::return

; Block Ctrl+W (close tab), Ctrl+T (new tab), Ctrl+N (new window)
^w::return
^t::return
^n::return
