sub Main()
    showChannelSGScreen()
end sub

sub showChannelSGScreen()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("MainScene")
    screen.show()
    exitScene = scene.getChild(1)
    exitScene.observeField("closeScreen", m.port)
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then 
                return
            end if
        else if msgType = "roSGNodeEvent" then
            field = msg.getField()
            if field = "closeScreen" then 
                return
            end if
        end if
    end while
end sub
