function init() as void
    m.itemImage = m.top.findNode("itemImage")
    m.itemText = m.top.findNode("itemText")
end function

function itemContentChanged() as void
    itemData = m.top.itemContent
    m.itemImage.uri = itemData.posterUrl
end function