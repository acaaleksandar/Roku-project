sub init()    
    m.top.backgroundURI = ""
    m.top.backgroundColor = "#0b0b0b"

    m.homeScreen = m.top.findNode("homeScreen")   
    m.detailScreen = m.top.findNode("detailScreen")
    m.global.addFields({
        "HomeScreen": m.homeScreen,
        "DetailScreen": m.detailScreen,
        "MainScene": m.top
    })
    startingPageContent()
end sub

function showScreen(content = invalid)
    if m.homeScreen.isInFocusChain() then
        m.homeScreen.visible = false
        m.detailScreen.visible = true
        m.detailScreen.content = content
    else
        m.homeScreen.visible = true
        m.detailScreen.visible = false
        m.homeScreen.getChild(3).SetFocus(true)
    end if
end function
