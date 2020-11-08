sub init()
    m.upBoldText = m.top.findNode("upBoldText")
    m.title = m.top.findNode("title")
    m.yearLabel = m.top.findNode("yearLabel")
    m.parentsWarned = m.top.findNode("parentsWarned")
    m.durationLabel = m.top.findNode("durationLabel")
    m.movieDetails = m.top.findNode("movieDetails")

    sizeXL = 50
    sizeL = 35

    setChildrenFont(m.movieDetails, sizeL)

    m.upBoldText.font.size = sizeXL
    m.title.font.size = sizeL
End sub
  
function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result
end function

sub receiveContent(event)
    content = event.getData()
    m.title.text = content.title
    m.yearLabel.text = content.ReleaseDate
    m.parentsWarned.text = content.parentalRating
    m.durationLabel.text = content.Length
    ' movieSec = content.Length
    ' minutesM = movieSec/60
    ' hoursM =
end sub