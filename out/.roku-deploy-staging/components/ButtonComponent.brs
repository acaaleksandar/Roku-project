sub init()    
    m.firstButtonGroup = m.top.findNode("firstButtonGroup")
    m.firstBtn = m.top.findNode("firstBtn")
    m.secondBtn = m.top.findNode("secondBtn")
    m.backgroundImage = m.top.findNode("backgroundImage")
    m.buttonPlay = m.top.findNode("buttonPlay")
    m.fullScreen = m.top.findNode("fullScreen")
    m.firstButtonGroup.setFocus(true)
    m.firstButtonGroup.observeField("buttonSelected","onButtonSelected")

    m.firstButtonGroup.focusBitmapUri = "pkg:/images/button.png"
    m.firstButtonGroup.focusFootprintBitmapUri = "pkg:/images/button.png"
    m.firstButtonGroup.textColor = "#fdf7f7"
    m.firstButtonGroup.focusedTextColor = "#fdf7f7"
    m.firstBtn.iconUri = "pkg:/images/pleja.png"
    m.firstBtn.focusedIconUri = "pkg:/images/pleja.png"
    m.secondBtn.iconUri = "pkg:/images/unFocusedfullScreen.png"
    m.secondBtn.focusedIconUri = "pkg:/images/focusedfullScreen.png"    
    m.buttonPlay.font.size = 30
    m.fullScreen.font.size = 30
End sub

function onKeyEvent(key as String, press as Boolean) as Boolean   
    if key = "right" and press then    
        m.firstBtn.showFocusFootprint = true
        m.firstBtn.focusFootprintBitmapUri = "pkg:/images/unfocusedButton.png"
        m.secondBtn.setFocus(true)
        m.backgroundImage.translation=[60,400]
    else if key = "left" and press then
        m.firstBtn.setFocus(true)
        m.backgroundImage.translation=[490,400]
    else if key = "back" and press then
        m.global.VideoComponent.callFunc("revertScreen")
    end if
    return true 
end function

sub onButtonSelected()
    if m.firstButtonGroup.buttonSelected = 0 then
        m.global.VideoComponent.callFunc("setVideo")
    else if m.firstButtonGroup.buttonSelected = 1 then
        m.global.VideoComponent.callFunc("fullScreen")
    end if
end sub

sub pauseButton()
    m.buttonPlay.text = "Pause"
end sub

sub playButton()
    m.buttonPlay.text = "Play"
end sub

sub replayButton()
    m.buttonPlay.text = "Replay"
end sub
