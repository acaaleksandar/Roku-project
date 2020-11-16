sub init()    
    m.top.backgroundURI = ""
    m.top.backgroundColor = "#0b0b0b"
    m.userComunication = m.top.findNode("userComunication")
    m.leftSideScreen = m.top.findNode("leftSideScreen")   
    m.rightSideScreen = m.top.findNode("rightSideScreen")
    m.videoComponent = m.top.findNode("videoComponent")
    m.rightSideScreen.observeField("content", "getVideoContent")
    m.global.addFields({
        "LeftSideScreen": m.leftSideScreen,
        "RightSideScreen": m.rightSideScreen,
        "VideoComponent": m.videoComponent
    })
    getScreenContent()
    checkUser = readFromRegistry("userEnter", "firstEnterInApp")
    if checkUser = "true" then
        m.userComunication.visible = false
        m.leftSideScreen.visible = true
        m.rightSideScreen.visible = true
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "OK" and press and m.userComunication.isInFocusChain() then
        ' m.videoComponent.visible = false
        m.userComunication.visible = false
        m.leftSideScreen.visible = true
        m.rightSideScreen.visible = true
        ' m.leftSideScreen.getChild(1).SetFocus(true)
        writeToRegistry("userEnter", "true" ,"firstEnterInApp")
        print "hello olo"
    end if
    return true  
end function

sub regulateDialogVisibility()
    if m.rightSideScreen.opacity = 1 then
        m.rightSideScreen.opacity = 0.0
    else
        m.rightSideScreen.opacity = 1
    end if
end sub

function showMovieDetails(content = invalid)
    m.rightSideScreen.content = content
    m.leftSideScreen.getChild(1).SetFocus(true)
end function

function videoPlay()
    if m.videoComponent.isInFocusChain() then
        m.leftSideScreen.visible = true
        m.videoComponent.visible = false
        m.rightSideScreen.visible = true
        m.leftSideScreen.getChild(1).SetFocus(true)
    else
        m.leftSideScreen.visible = false
        m.videoComponent.visible = true
        m.rightSideScreen.visible = false
        m.videoComponent.SetFocus(true)
    end if
end function

sub getVideoContent(videoContent)
    node = videoContent.getData()
    m.videoComponent.content = node
end sub

sub writeToRegistry(key, value, sectionName)
    section = createObject("roRegistrySection", sectionName)
    section.write(key, value)
    section.flush()
end sub

function readFromRegistry(key, sectionName)
    section = createObject("roRegistrySection", sectionName)
    if section.exists(key) then
        return section.read(key)
    else
        return invalid
    end if
end function
