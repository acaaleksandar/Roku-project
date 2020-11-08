sub init()    
    m.myVideo = m.top.findNode("myVideo")
    m.myVideo.observeField("state","isVideoFinish")
end sub
    
function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "back" and press then
        m.global.ButtonComponent.callFunc("focusSecondBtn")
    end if
    return true  
end function

sub setVideo() as void
    if m.myVideo.state = "none" or m.myVideo.state = "stopped" then
        content = m.top.content
        videoContent = createObject("RoSGNode", "ContentNode")
        videoContent.url = content.url
        videoContent.title = content.title
        videoContent.streamformat = content.streamformat
        m.myVideo.content = videoContent
        m.myVideo.control = "play"
        print m.myVideo.state
        m.global.ButtonComponent.callFunc("editButtonText")
        print "jebem te bas none stopped!!!"
    else if m.myVideo.state = "playing" then
        print "jebem te bas playing!!!"
        m.global.ButtonComponent.callFunc("editButtonText")
        m.myVideo.control = "pause"        
    else if m.myVideo.state = "paused" then
        print "jebem te bas paused!!!"
        m.myVideo.control = "resume"
        m.global.ButtonComponent.callFunc("editButtonText")
    else if m.myVideo.state = "finished" then
        print "jebem te bas!!!"
        m.myVideo.control = "play"
        m.global.ButtonComponent.callFunc("editButtonText")
    end if     
end sub

function getVideoState()
    state = m.myVideo.state
    return state
end function

sub fullScreen()
    m.myVideo.setFocus(true)
    m.myVideo.width = 1920
    m.myVideo.height = 1080
    m.myVideo.translation = [0,0]
end sub

sub revertScreen()
    m.myVideo.width = 650
    m.myVideo.height = 350
    m.myVideo.translation = [1220,630]
end sub

sub isVideoFinish()
    if m.myVideo.state = "finished" then
        m.global.ButtonComponent.callFunc("editButtonText")
    end if
end sub