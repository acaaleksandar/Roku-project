sub init()
    m.rect =  m.top.findNode("rect")  
    m.poster = m.top.findNode("myPoster")
    
    m.rect.width = 1920
    m.rect.height = 1000
    m.rect.translation = [0,0]
    m.poster.width = 1920
    m.poster.height = 600
    m.poster.translation = [0,0]   
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function

sub onContentChange(event)
    node = event.getData()
    m.poster.uri = node.hDPosterUrl
end sub
