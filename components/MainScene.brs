' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********  

sub init()    
    ' m.myLabel = m.top.findNode("myLabel")
    'm.top.backgroundURI = ""
    'm.top.backgroundColor = "#008b8b"
    
    m.top.SetFocus(true)
End sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function
