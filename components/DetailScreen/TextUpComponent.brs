sub init()
    m.upBoldText = m.top.findNode("upBoldText")
    m.title = m.top.findNode("title")
    m.yearLabel = m.top.findNode("yearLabel")
    m.parentsWarned = m.top.findNode("parentsWarned")
    m.durationLabel = m.top.findNode("durationLabel")
    m.genreAdventure = m.top.findNode("genreAdventure")
    m.genreDramas = m.top.findNode("genreDramas")
    m.genreAction = m.top.findNode("genreAction")
    m.descriptionId = m.top.findNode("descriptionId")
    m.actorsId = m.top.findNode("actorsId")
    m.directorId = m.top.findNode("directorId")
    m.directors = m.top.findNode("directors")
    m.movieDetails = m.top.findNode("movieDetails")
    m.directorLabel = m.top.findNode("directorLabel")

    sizeXL = 70
    sizeL = 25
    sizeS = 20

    setChildrenFont(m.movieDetails, sizeS)
    setChildrenFont(m.directorLabel, sizeS)

    m.upBoldText.font.size = sizeL
    m.title.font.size = sizeXL
    m.descriptionId.font.size = sizeS
    m.actorsId.font.size = sizeS
End sub
  
function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result
end function

sub receiveContent(event)
    node = event.getData()
    m.descriptionId.text = node.Description
    m.title.text = node.Title
    m.genreAdventure.text = node.Categories[0]
    m.genreDramas.text = node.Categories[1]
    m.genreAction.text = node.Categories[2]
    m.actorsId.text = node.Actors[0] + ", " + node.Actors[1] + ", " + node.Actors[2]
    m.directorId.text = node.Directors
end sub