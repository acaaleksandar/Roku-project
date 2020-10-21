' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********  

sub init()    
    m.top.backgroundURI = ""
    m.top.backgroundColor = "#f9f9f9"
    
    m.top.SetFocus(true)
    m.customComponent = m.top.findNode("CustomComponent")
    m.serviceComponent = m.top.findNode("ServiceComponent")

    m.global.addFields({
        "CustomComponent": m.customComponent,
        "ServiceComponent": m.serviceComponent,
        "MainScene": m.top
    })
End sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function
