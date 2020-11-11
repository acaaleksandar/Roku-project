function init()
    m.startingPageTextComponent = m.top.findNode("startingPageTextComponent")
    m.contentRowList = m.top.findNode("contentRowList")
    m.dialogOnBack = m.top.findNode("dialogOnBack")
    m.contentRowList.numRows = 3
    m.contentRowList.itemSize = [1600, 500]
    m.contentRowList.rowHeights = [500]
    m.contentRowList.rowItemSize = [ [350, 500] ]
    m.contentRowList.itemSpacing = [0, 80]
    m.contentRowList.rowItemSpacing = [ [50, 500] ]
    m.contentRowList.rowLabelOffset = [ [0, 30] ]
    m.contentRowList.rowFocusAnimationStyle = "fixedFocusWrap"
    m.contentRowList.showRowLabel = [true, true]
    m.contentRowList.rowLabelColor = "#fffaed"
    m.backgroundPoster = m.top.findNode("backgroundPoster")
    m.backgroundPoster.width = 1920
    m.backgroundPoster.height = 1080
    m.backgroundPoster.translation = [0,0]
    m.contentRowList.visible = true
    m.contentRowList.SetFocus(true)
    m.contentRowList.ObserveField("rowItemFocused", "onRowItemFocused")
    m.contentRowList.ObserveField("rowItemSelected", "onRowItemSelected") 
end function

function receiveContent(obj)
    m.contentRowList.content = obj.getData()    
end function

function onRowItemFocused() as void
    row = m.contentRowList.rowItemFocused[0]
    col = m.contentRowList.rowItemFocused[1]
    focusChild = m.contentRowList.content.getChild(row).getChild(col)
    m.backgroundPoster.uri = focusChild.HDBackgroundImageUrl
    m.backgroundPoster.failedBitmapUri = "pkg:/images/hollow.jpg"
    m.startingPageTextComponent.content = focusChild
end function

function onRowItemSelected() as void
    row = m.contentRowList.rowItemSelected[0]
    col = m.contentRowList.rowItemSelected[1]
    m.selectedChild = m.contentRowList.content.getChild(row).getChild(col)
    m.top.getParent().callFunc("showScreen",m.selectedChild)
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    row = m.contentRowList.rowItemFocused[0]
    col = m.contentRowList.rowItemFocused[1]
    focusChild = m.contentRowList.content.getChild(row).getChild(col)
    myFocus = false
    if key = "back" and press then
        if focusChild.title="Deep Impact" and focusChild.id = "1" then
            m.dialogOnBack.visible = true
            m.dialogOnBack.buttons = ["Yes", "No"]
            m.dialogOnBack.buttonGroup.getChild(0).iconUri = ""
            m.dialogOnBack.buttonGroup.getChild(0).focusedIconUri = ""
            m.dialogOnBack.buttonGroup.getChild(1).iconUri = ""
            m.dialogOnBack.buttonGroup.getChild(1).focusedIconUri = ""
            m.dialogOnBack.ObserveField("buttonSelected","onButtonSelected")
            m.dialogOnBack.setFocus(true)
            myFocus = true
        else
            m.contentRowList.jumpToRowItem = [0,0]
            myFocus = true
        end if
    end if
    return myFocus  
end function

sub onButtonSelected()
    if m.dialogOnBack.buttonSelected = 1 then
        setDialog()
    else
        setDialog()
        m.top.closeScreen = true
    end if
end sub

sub setDialog()
    m.dialogOnBack.close = true
    m.dialogOnBack.visible = false
    m.contentRowList.setFocus(true)
end sub

