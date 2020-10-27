sub init()
    m.downBoldText = m.top.findNode("downBoldText")
    m.downLeftText = m.top.findNode("downLeftText")
    m.castLabel = m.top.findNode("castLabel")
    m.actorsName = m.top.findNode("actorsName")
    m.genresId = m.top.findNode("genresId")
    m.genresAv = m.top.findNode("genresAv")
    m.directorsId = m.top.findNode("directorsId")
    m.directorsName = m.top.findNode("directorsName")
    m.textWraper = m.top.findNode("textWraper")

    sizeL = 25
    sizeS = 18

    m.downBoldText.font.size = sizeL

    for i = 0 to m.textWraper.getChildCount() - 1
        m.textSize = m.textWraper.getChild(i)
        m.textSize.font.size = sizeS
    end for
End sub
    
function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result
end function

sub receiveContent(event)
    node = event.getData()
    m.downLeftText.text = node.Description
    m.directorsName.text = node.Directors
    
    for a = 0 to node.Categories.count() - 1
        if a = 0 then
            m.genresAv.text = node.Categories[a]
        else
            m.genresAv.text += ", " + node.Categories[a]
        end if        
    end for
 
    for i = 0 to node.Actors.count() - 1
        if i = 0 then
            m.actorsName.text = "         " + node.Actors[i]
        else  
            m.actorsName.text += ", " + node.Actors[i]
        end if
    end for
end sub