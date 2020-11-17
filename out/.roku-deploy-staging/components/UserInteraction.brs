sub init()    
    m.welcomeText = m.top.findNode("welcomeText")
    m.pressText = m.top.findNode("pressText")
    m.welcomePoster = m.top.findNode("welcomePoster")
    m.welcomeText.text = "Welcome To My Channel!"
    m.pressText.text = "Press Ok To Jump In!"
    m.welcomeText.font.size = 100
    m.pressText.font.size = 60
    m.welcomePoster.uri = "pkg:/images/hollow.jpg"
    m.welcomePoster.opacity = 0.25
    m.welcomePoster.setFocus(true)
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "OK" and press then
       return false
    else
        return true
    end if
end function