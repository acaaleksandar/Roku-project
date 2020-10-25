sub init()    
    m.top.backgroundURI = ""
    m.top.backgroundColor = "#0b0b0b"
    
    m.top.SetFocus(true)
    m.backgroundComponent = m.top.findNode("BackgroundComponent")
    m.serviceComponent = m.top.findNode("ServiceComponent")
    m.videoComponent = m.top.findNode("VideoComponent")
    m.buttonComponent = m.top.findNode("ButtonComponent")
    m.textDownComponent = m.top.findNode("TextDownComponent")
    m.textUpComponent = m.top.findNode("TextUpComponent")

    m.global.addFields({
        "BackgroundComponent": m.backgroundComponent,
        "ServiceComponent": m.serviceComponent,
        "VideoComponent": m.videoComponent,
        "ButtonComponent": m.buttonComponent,
        "TextDownComponent": m.textDownComponent,
        "TextUpComponent": m.textUpComponent
    })

    m.global.ServiceComponent.callFunc("myContent")
End sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function
