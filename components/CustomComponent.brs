sub init()
    m.rect =  m.top.findNode("rect")
    m.name = m.top.findNode("name")    
    m.poster = m.top.findNode("myPoster")
    m.firstButtonGroup = m.top.findNode("firstButtonGroup")
    m.secondButtonGroup = m.top.findNode("secondButtonGroup")
    m.myFirstVideo = m.top.findNode("myFirstVideo")
    m.firstButtonGroup.setFocus(true)
    
    setVideo()

    m.secondButtonGroup.observeField("buttonSelected","onButtonSelected")

    m.rect.width = 1000
    m.rect.height = 350
    m.rect.translation = [0,0]

    m.name.text = firstLetterToUppercase("hello World, A SceneGraph application consists of one or more custom SceneGraph components defined in XML files.")
    m.name.width = 500
    m.name.height = 350
    'm.name.translation = [15,15]

    ' m.name.text = "hello World"
    ' m.name.text = firstLetterToUppercase(m.name.text)

    m.poster.uri = "pkg:/images/icon_focus_hd.png"
    m.poster.width = 500
    m.poster.height = 350
    m.poster.translation = [500,0]   
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean   
    if key = "right" and press then    
        m.secondButtonGroup.setFocus(true)
    else if key = "left" and press then
        m.firstButtonGroup.setFocus(true)
    end if
    return true 
end function

sub onButtonSelected()
    if m.secondButtonGroup.buttonSelected = 0 then
        print "klik na trece dugme"
    else if m.secondButtonGroup.buttonSelected = 1 then
        print "klik na cetvrto dugme"
    end if
end sub

sub setVideo() as void
    videoContent = createObject("RoSGNode", "ContentNode")
    videoContent.url = "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8"
    videoContent.title = "Test Video"
    videoContent.streamformat = "hls"

    m.myFirstVideo.content = videoContent
    m.myFirstVideo.control = "play"
end sub