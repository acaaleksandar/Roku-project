sub init()
    m.backgroundImage = m.top.findNode("backgroundImage")
    m.top.observeField("focusedChild", "onFocusChanged")
    m.top.focusBitmapUri = "pkg:/images/unfocusedButton.png"
    m.top.childRenderOrder="first"
    m.top.showFocusFootprint = true
    
    ? "hello"
End sub

function onKeyEvent(key as String, press as Boolean) as Boolean   
    result = false
    
    return result
end function

sub replayButton()
    m.firstBtn.text = "Replay"
end sub

sub onFocusChanged()
    if m.top.focusedChild = invalid
        ' ? "98765434567890-0987654345678"
        m.top.focusBitmapUri = "pkg:/images/unfocusedButton.png"
        m.top.focusFootprintBitmapUri = "pkg:/images/button.png"
    else
        m.top.focusBitmapUri = "pkg:/images/button.png"
        m.top.focusFootprintBitmapUri = "pkg:/images/unfocusedButton.png"
    end if
end sub