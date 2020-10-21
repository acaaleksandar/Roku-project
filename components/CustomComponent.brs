sub init()
    m.rect =  m.top.findNode("rect")
    m.name = m.top.findNode("name")    
    m.poster = m.top.findNode("myPoster")
    
    m.rect.width = 1000
    m.rect.height = 350
    m.rect.translation = [0,0]
    m.name.text = firstLetterToUppercase("hello World, A SceneGraph application consists of one or more custom SceneGraph components defined in XML files.")
    m.name.width = 500
    m.name.height = 350
    m.poster.uri = "pkg:/images/icon_focus_hd.png"
    m.poster.width = 500
    m.poster.height = 350
    m.poster.translation = [500,0]   
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function

sub onLabelTextChange()
    print "label text changed"
end sub