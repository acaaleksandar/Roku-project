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
        for each category in data.categories
            contentRow = node.createChild("ContentNode")
            contentRow.title = category.name
            contentRow.id = category.id
            ' contentRow.Color = "#0b0b0b"
            ' contentRow.TextAttrs = { Color : "#28abb9", Font : "Large", HAlign : "HCenter", VAlign : "VCenter", Direction : "LeftToRight" }
        end for
        
        for each key in data.channels
            for each category in node.getChildren(node.getChildCount(),0)
                if category.id = key.categoryid.toStr() then
                    categoryNode = category
                    content = categoryNode.createChild("MovieRowListItemData")
                    content.posterUrl = key.posterurl
                    content.url = key.url
                    content.Length = key.length
                    content.HDBackgroundImageUrl = key.backgroundimageurl
                    content.Actors = key.cast
                    content.id = key.categoryid
                    content.Description = key.description
                    content.Directors = key.director
                    content.Categories = key.genres
                    content.parentalRating = key.parentalrating
                    content.Streamformat = key.streamformat
                    content.title = key.title
                    content.ReleaseDate = key.year
                    exit for
                end if
            end for
        end for
    end if
    return node
end function

