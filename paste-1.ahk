^+v:: ; Ctrl+Shift+V 粘贴剪贴板内容，带字符间隔
    ClipSaved := ClipboardAll       ; 备份原剪贴板内容
    if (Clipboard = "") {
        MsgBox, 剪贴板为空，请先复制内容。
        return
    }

    Loop, parse, Clipboard, `n, `r  ; 按行处理
    {
        line := A_LoopField
        if (line != "") {
            Loop, Parse, line
            {
                Send %A_LoopField%
                Sleep 50            ; 每字符间隔 50ms
            }
            Send {Enter}
            Sleep 100              ; 每行间隔 100ms
        }
    }

    Clipboard := ClipSaved          ; 恢复原剪贴板
return

Pause::Pause
Esc::ExitApp
