sub init()
    m.myVideo = m.top.findNode("myVideo")
    m.myVideo.observeField("state","isVideoFinish")
    m.myVideo.width = 1920
    m.myVideo.height = 1080
    m.myVideo.translation = [0,0]
end sub
    
function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "back" and press then
        mainScene = m.top.getParent()
        video = mainScene.getChild(2).getChild(0)
        video.control = "stop"
        mainScene.callFunc("videoPlay")
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
        mainScene = m.top.getParent()
        mainScene.callFunc("videoPlay")
        m.myVideo.setFocus(true)
    end if     
end sub

sub isVideoFinish()
    if m.myVideo.state = "finished" then
        m.myVideo.control = "play"
    end if
end sub