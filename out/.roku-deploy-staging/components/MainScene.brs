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
    checkUserStatus()
    getScreenContent()
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "OK" and press then
        if m.userComunication <> invalid then
            m.userComunication.visible = false
            insertUserData()
        end if
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

sub insertUserData()
    m.registryTask = createObject("roSGNode", "TaskForRegistry")
    m.registryTask.input = {action:"write", user:"userEnter", userStatus:"true", section:"firstEnterInApp"}
    m.registryTask.observeField("response","userRegistry")
    m.registryTask.control = "RUN"
end sub

sub checkUserStatus()
    m.registryTask = createObject("roSGNode", "TaskForRegistry")
    m.registryTask.input = {action:"checkUser", user:"userEnter", section:"firstEnterInApp"}
    m.registryTask.observeField("response","userRegistry")
    m.registryTask.control = "RUN"
end sub

sub userRegistry(response)
    reg = response.getData()
    m.registryTask.control = "stop"
    if reg = "true" then
        m.leftSideScreen.visible = true
        m.rightSideScreen.visible = true
        m.leftSideScreen.getChild(1).setFocus(true)
    else
        m.userComunication = m.top.createChild("UserInteraction")
        m.userComunication.setFocus(true)
    end if
end sub