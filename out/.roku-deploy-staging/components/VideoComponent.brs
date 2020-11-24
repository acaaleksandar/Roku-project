sub init()    
    m.myVideo = m.top.findNode("myVideo")
    m.videoPoster = m.top.findNode("videoPoster")
    m.myVideo.observeField("state","isVideoFinish")
    m.videoPoster.uri = "pkg:/images/videoImage.png"
end sub
    
function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "back" and press then
        m.global.DetailScreen.getChild(1).callFunc("focusSecondBtn")
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
        m.videoPoster.visible = false
        m.myVideo.visible = true
        m.myVideo.control = "play"
        m.global.DetailScreen.getChild(1).callFunc("editButtonText")
    else if m.myVideo.state = "playing" then
        m.global.DetailScreen.getChild(1).callFunc("editButtonText")
        m.myVideo.control = "pause"        
    else if m.myVideo.state = "paused" then
        m.myVideo.control = "resume"
        m.global.DetailScreen.getChild(1).callFunc("editButtonText")
    else if m.myVideo.state = "finished" then
        m.myVideo.control = "play"
        m.videoPoster.visible = false
        m.myVideo.visible = true
        m.global.DetailScreen.getChild(1).callFunc("editButtonText")
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
    m.myVideo.height = 680
    m.myVideo.translation = [1220,270]
end sub

sub isVideoFinish()
    if m.myVideo.state = "finished" then
        m.global.DetailScreen.getChild(1).callFunc("editButtonText")
        m.global.DetailScreen.getChild(1).callFunc("focusSecondBtn")
        videoVisibility()
    end if
    if m.myVideo.state = "stopped" then
        videoVisibility()
    end if
end sub

sub videoVisibility()
    m.videoPoster.visible = true
    m.myVideo.visible = false
end sub