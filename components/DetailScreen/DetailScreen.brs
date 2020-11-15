sub init()
    m.poster = m.top.findNode("myPoster")
    m.movieDetails = m.top.findNode("movieDetails")
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
    end if
    return true 
end function

sub onContentChange(event)
    node = event.getData()
    m.poster.uri = node.HDBackgroundImageUrl
    m.poster.failedBitmapUri = "pkg:/images/venom.jpg"
    m.movieDetails.content = node
end sub
