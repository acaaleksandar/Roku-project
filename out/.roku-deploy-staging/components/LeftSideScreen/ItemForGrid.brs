function init() as void
    m.itemImage = m.top.findNode("itemImage")
    m.itemText = m.top.findNode("itemText")
    m.itemText.font.size = 25
end function

function itemContentChanged() as void
    itemData = m.top.itemContent
    m.itemImage.uri = itemData.posterUrl
    m.itemText.text = m.top.itemContent.title + " (" + m.top.itemContent.releaseDate + ")"
end function