sub init()
    m.poster = m.top.findNode("myPoster")
    m.buttonComponent = m.top.findNode("buttonComponent")
    m.textUpComponent = m.top.findNode("textUpComponent")
    m.textDownComponent = m.top.findNode("textDownComponent")
    
    m.poster.width = 1920
    m.poster.height = 600
    m.poster.translation = [0,0]   
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "back" and press then
        mainScene = m.top.getParent()
        video = par.getChild(2).getChild(0)
        video.control = "stop"
        m.buttonComponent.callFunc("revName")
    end if
    return true 
end function

sub onContentChange(event)
    node = event.getData()
    m.buttonComponent.getChild(1).SetFocus(true)
    m.poster.uri = node.HDBackgroundImageUrl
    m.poster.failedBitmapUri = "pkg:/images/venom.jpg"
    m.textUpComponent.content = node
    m.textDownComponent.content = node
end sub
