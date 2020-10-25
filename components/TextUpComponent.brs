sub init()
    m.upBoldText = m.top.findNode("upBoldText")
    m.title = m.top.findNode("title")
    m.yearLabel = m.top.findNode("yearLabel")
    m.parentsWarned = m.top.findNode("parentsWarned")
    m.durationLabel = m.top.findNode("durationLabel")
    m.genreAdventure = m.top.findNode("genreAdventure")
    m.genreDramas = m.top.findNode("genreDramas")
    m.genreAction = m.top.findNode("genreAction")
    m.separator1 = m.top.findNode("separator1")
    m.separator2 = m.top.findNode("separator2")
    m.descriptionId = m.top.findNode("descriptionId")
    m.actorsId = m.top.findNode("actorsId")
    m.directorId = m.top.findNode("directorId")
    m.directors = m.top.findNode("directors")

    m.upBoldText.font.size = 25
    m.title.font.size = 70
    m.yearLabel.font.size = 20
    m.durationLabel.font.size = 20
    m.parentsWarned.font.size = 20
    m.genreAdventure.font.size = 20
    m.genreDramas.font.size = 20
    m.genreAction.font.size = 20
    m.separator1.font.size = 20
    m.separator2.font.size = 20
    m.descriptionId.font.size = 20
    m.actorsId.font.size = 20
    m.directorId.font.size = 20
    m.directors.font.size = 20
End sub
    
function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result
end function

sub reciveContant(event)
    node = event.getData()
    m.descriptionId.text = node.Description
    m.title.text = node.Title
    m.genreAdventure.text = node.Categories[0]
    m.genreDramas.text = node.Categories[1]
    m.genreAction.text = node.Categories[2]
    m.actorsId.text = node.Actors[0] + ", " + node.Actors[1] + ", " + node.Actors[2]
    m.directorId.text = node.Directors
end sub