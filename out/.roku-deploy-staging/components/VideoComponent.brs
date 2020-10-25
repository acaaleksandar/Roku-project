sub init()    
    m.myVideo = m.top.findNode("myVideo")
    m.myVideo.observeField("state","isVideoFinish")
End sub
    
function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function

sub setVideo() as void
    if m.myVideo.state = "none" then
        videoContent = createObject("RoSGNode", "ContentNode")
        videoContent.url = "http://playertest.longtailvideo.com/adaptive/oceans_aes/oceans_aes.m3u8"
        videoContent.title = "New Video"
        videoContent.streamformat = "hls"
        m.myVideo.content = videoContent
        m.myVideo.control = "play"
        m.global.ButtonComponent.callFunc("pauseButton")
    else if m.myVideo.state = "playing" then
        m.myVideo.control = "pause"
        m.global.ButtonComponent.callFunc("playButton")
    else if m.myVideo.state = "paused" then
        m.myVideo.control = "resume"
        m.global.ButtonComponent.callFunc("pauseButton")
    else if m.myVideo.state = "finished" then
        m.myVideo.control = "play"
        m.global.ButtonComponent.callFunc("pauseButton")
    end if     
end sub

sub fullScreen()
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
        m.global.ButtonComponent.callFunc("replayButton")
    end if
end sub