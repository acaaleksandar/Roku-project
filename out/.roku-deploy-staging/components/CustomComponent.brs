sub init()
    m.rect =  m.top.findNode("rect")
    m.name = m.top.findNode("name")    
    m.poster = m.top.findNode("myPoster")
    m.firstButtonGroup = m.top.findNode("firstButtonGroup")
    m.secondButtonGroup = m.top.findNode("secondButtonGroup")
    m.firstButtonGroup.setFocus(true)

    m.secondButtonGroup.observeField("buttonSelected","onButtonSelected")

    m.rect.width = 1000
    m.rect.height = 500
    m.rect.translation = [0,0]

    m.name.text = firstLetterToUppercase("hello World, A SceneGraph application consists of one or more custom SceneGraph components defined in XML files.")
    m.name.width = 500
    m.name.height = 500
    'm.name.translation = [15,15]

    ' m.name.text = "hello World"
    ' m.name.text = firstLetterToUppercase(m.name.text)

    m.poster.uri = "pkg:/images/icon_focus_hd.png"
    m.poster.width = 500
    m.poster.height = 500
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