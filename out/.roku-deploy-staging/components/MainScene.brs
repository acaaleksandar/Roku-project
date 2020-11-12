sub init()    
    m.top.backgroundURI = ""
    m.top.backgroundColor = "#0b0b0b"

    m.homeScreen = m.top.findNode("homeScreen")   
    m.detailScreen = m.top.findNode("detailScreen")
    m.videoComponent = m.top.findNode("videoComponent")
    m.detailScreen.observeField("content", "getVideoContent")
    m.global.addFields({
        "HomeScreen": m.homeScreen,
        "DetailScreen": m.detailScreen,
        "VideoComponent": m.videoComponent
    })
    startingPageContent()
end sub

function showScreen(content = invalid)
    if m.homeScreen.isInFocusChain() then
        m.homeScreen.visible = false
        m.videoComponent.visible = true
        m.detailScreen.visible = true
        m.detailScreen.content = content
    else
        m.homeScreen.visible = true
        m.videoComponent.visible = false
        m.detailScreen.visible = false
        m.homeScreen.getChild(3).SetFocus(true)
    end if
end function

sub getVideoContent(videoContent)
    node = videoContent.getData()
    m.videoComponent.content = node
end sub
