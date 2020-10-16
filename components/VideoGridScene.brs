' ********** Copyright 2016 Roku Corp.  All Rights Reserved. ********** 

function init()
    m.VideoGrid = m.top.findNode("VideoGrid")
    m.VideoGrid.setFocus(true)
    
    'initializing of Video grid by setting its input values
    m.VideoGrid.liveContent = getLiveItemContent()
    m.VideoGrid.liveVideo.liveUrl=LiveUrls().live1
    m.VideoGrid.liveVideo.liveLoadingPoster="pkg:/images/liveNotAvailable.png"
    m.VideoGrid.observeField("gridRowItemSelected", "onGridRowItemSelected")
    
    m.UIConstants = m.top.createChild("UIConstants")
    if m.UIConstants.isHD or m.UIConstants.isFHD then
        m.gridNumRows = 5 
        m.gridItemNum = 4
        m.VideoGrid.GridItemNum = m.gridItemNum
        m.VideoGrid.Grid.content = getGridContent()
        m.VideoGrid.offset = [122, 80]
        m.VideoGrid.liveGain = 0.56
        m.VideoGrid.descAllign = "left"
    else if m.UIConstants.isSD
        m.gridNumRows = 6 
        m.gridItemNum = 3
        m.VideoGrid.Grid.content = getGridContent()
        m.VideoGrid.GridItemNum = m.gridItemNum
        m.VideoGrid.offset = [50, 40]
        m.VideoGrid.liveGain = 0.642
        m.VideoGrid.descAllign = "left"
    end if    
end function


sub onGridRowItemSelected()
    rowItemSelected = m.grid.gridRowItemSelected
    rowIndex = rowItemSelected[0]
    itemIndex = rowItemSelected[1]
    selectedItemContent = m.grid.gridContent.getChild(rowIndex).getChild(itemIndex)
    ? selectedItemContent.description
end sub

function LiveUrls() as Object
    return {
    live1   : "http://roku.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/37d290e03d894135b07c5e514cbad72d/dfd02160a5374c39967c105a8cfff3a1/roku_ep_115_segment_3_ufc_nw_051815.mp4"
    }
end function

function getGridContent() as Object
    content = createObject("roSGNode", "ContentNode")
    for r = 0 to m.gridNumRows - 1
        row = content.createChild("ContentNode")
        for i = 0 to m.gridItemNum + 1
            item = row.createChild("ContentNode")
            item.description = "This is item " + stri(r + 1) + stri(i + 1)
            item.title = "Title " 
            item.ContentType = "ContentType " 
            item.titleSeason = "TitleSeason " 
            item.Live = false
            item.Length=100 
            item.ReleaseDate="3/31/2009 " 
            item.Rating="PG-13"
            item.StarRating=60
            item.UserStarRating=80
            item.ShortDescriptionLine1="The Dark Knight"
            item.ShortDescriptionLine2="Rent $1.99, Buy $14.99"  
            item.EpisodeNumber="1"
            item.NumEpisodes="40"
            item.Actors=["Brad Pitt", "Angelina Jolie"]
            SetPosters(item)
        end for
    end for
    
    return content
end function

' For presentation only
function getLiveItemContent() as Object
    longString =""'"Dig my grave and raise my barrow By the Dnieper-side, In Ukraina, my own land, A fair land and wide. I will lie and watch the cornfields, Listen through the years, To the river voices roaring, Roaring in my ears.  When I hear the call, Of the racing flood, Loud with hated blood, I will leave them all, Fields and hills; and force my way, Right up to the Throne Where God sits alone; Clasp His feet and prayï¿½ But till that day, What is God to me? Bury me, be done with me, Rise and break your chain, Water your new liberty, With blood for rain. Then, in the mighty family, Of all men that are free, May be sometimes, very softly, You will speak of me?"
    content = createObject("roSGNode", "ContentNode")
    content.title = "Live stream " + longString
    content.description = "Some description goes here " + longString
    content.releaseDate = "18/11/2015 " + longString
    
    return content
end function

Sub SetPosters(content)
    if m.PosterIndex = invalid OR m.PosterIndex > 12
        m.PosterIndex = 1
    end if
    url = "https://devtools.web.roku.com/samples/images/Landscape_" + m.PosterIndex.toStr().trim() + ".jpg"
    m.PosterIndex = m.PosterIndex + 1
    content.HDPosterURL = url
End Sub

