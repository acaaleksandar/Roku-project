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
    m.downBoldText = m.top.findNode("downBoldText")
    m.downLeftText = m.top.findNode("downLeftText")
    m.castLabel = m.top.findNode("castLabel")
    m.actorsName = m.top.findNode("actorsName")
    m.genresId = m.top.findNode("genresId")
    m.genresAv = m.top.findNode("genresAv")
    m.directorsId = m.top.findNode("directorsId")
    m.directorsName = m.top.findNode("directorsName")
    m.textWraper = m.top.findNode("textWraper")

    sizeXL = 45
    sizeL = 25
    sizeS = 20
    setChildrenFont(m.movieDetails, sizeS)
    setChildrenFont(m.directorLabel, sizeS)
    m.upBoldText.font.size = sizeL
    m.title.font.size = sizeXL
    m.descriptionId.font.size = sizeS
    m.actorsId.font.size = sizeS
    m.downBoldText.font.size = sizeL
    for i = 0 to m.textWraper.getChildCount() - 1
        m.textSize = m.textWraper.getChild(i)
        m.textSize.font.size = sizeS
    end for
End sub
  
function onKeyEvent(key as String, press as Boolean) as Boolean    
    return false
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
    m.downLeftText.text = node.Description
    m.directorsName.text = node.Directors
    m.yearLabel.text = node.ReleaseDate
    m.parentsWarned.text = node.parentalRating
    m.durationLabel.text = setVideoDuration(node.Length)
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