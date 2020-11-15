sub init()    
    m.top.functionname = "urlRequest"
End sub

function urlRequest()
    url = m.top.url
    urlTransfer = CreateObject("roUrlTransfer")
    urlTransfer.setUrl(url)
    port = CreateObject("roMessagePort")
    urlTransfer.setPort(port)
    urlTransfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    urlTransfer.InitClientCertificates()
    if urlTransfer.asyncGetToString() then
        msg = wait(5000, port)
        if msg.getResponseCode() = 200 then
            if (type(msg) = "roUrlEvent") then
                m.top.response = prepareNode(msg)
            end if
        else
            ' m.top.response = "Error"
            print "Error"    
        end if
    end if
end function

function prepareNode(obj)
    data = parseJSON(obj.getString())
    node = CreateObject("roSGNode", "ContentNode")
    if data.doesExist("channels") and data.doesExist("categories") then
        for each channel in data.channels
            content = node.createChild("DataForEachItem")
            content.posterUrl = channel.posterurl
            content.url = channel.url
            content.length = channel.length
            content.hDBackgroundImageUrl = channel.backgroundimageurl
            content.actors = channel.cast
            ' content.id = key.id
            content.description = channel.description
            content.directors = channel.director
            content.categories = channel.genres
            content.parentalRating = channel.parentalrating
            content.streamFormat = channel.streamformat
            content.title = channel.title
            content.releaseDate = channel.year
        end for
        ' for each key in data.channels
        '     content = node.createChild("DataForEachItem")
            
        '     exit for
        ' end for
        ' for each category in data.categories
        '     contentRow = node.createChild("ContentNode")
        '     contentRow.title = category.name
        '     contentRow.id = category.id
        ' end for
        
        ' for each key in data.channels
        '     for each category in node.getChildren(node.getChildCount(),0)
        '         if category.id = key.categoryid.toStr() then
        '             categoryNode = category
        '             content = categoryNode.createChild("DataForEachItem")
        '             content.posterUrl = key.posterurl
        '             content.url = key.url
        '             content.Length = key.length
        '             content.HDBackgroundImageUrl = key.backgroundimageurl
        '             content.Actors = key.cast
        '             content.id = key.categoryid
        '             content.Description = key.description
        '             content.Directors = key.director
        '             content.Categories = key.genres
        '             content.parentalRating = key.parentalrating
        '             content.Streamformat = key.streamformat
        '             content.title = key.title
        '             content.ReleaseDate = key.year
        '             exit for
        '         end if
        '     end for
        ' end for
    end if
    print node
    return node
end function

