sub init()
    m.movieDetails = m.top.findNode("movieDetails")
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
    m.movieDetails.content = node
end sub
