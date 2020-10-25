sub init()
    m.downBoldText = m.top.findNode("downBoldText")
    m.downLeftText = m.top.findNode("downLeftText")
    m.castLabel = m.top.findNode("castLabel")
    m.actorsName = m.top.findNode("actorsName")
    m.genresId = m.top.findNode("genresId")
    m.genresAv = m.top.findNode("genresAv")
    m.directorsId = m.top.findNode("directorsId")
    m.directorsName = m.top.findNode("directorsName")

    m.downBoldText.font.size = 25
    m.downLeftText.font.size = 18
    m.castLabel.font.size = 18
    m.actorsName.font.size = 18
    m.genresId.font.size = 18
    m.genresAv.font.size = 18
    m.directorsId.font.size = 18
    m.directorsName.font.size = 18
End sub
    
function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result
end function

sub listOfNames(event)
    node = event.getData()
    m.directorsName.text = node.Directors
    m.genresAv.text = node.Categories[0] + ", " + node.Categories[1] + ", " + node.Categories[2] + ", " + node.Categories[3]
 
    for i = 0 to node.Actors.count() - 1
        if i = 0 then
            m.actorsName.text = "         " + node.Actors[i]
        else  
            m.actorsName.text = m.actorsName.text + ", " + node.Actors[i]
        end if
    end for
end sub