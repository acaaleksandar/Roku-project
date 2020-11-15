function init()
    m.markupGridContent = m.top.findNode("markupGridContent")
    ' columnWidths="[350]" 
    m.markupGridContent.numColumns = 5
    m.markupGridContent.numRows = 5
    m.markupGridContent.itemSize = [130,300]
    m.markupGridContent.rowHeights = [300]
    m.markupGridContent.rowSpacings = [50,50,50,50,50,50,50,50,50,50]
    m.markupGridContent.columnSpacings = [ 50,50,50,50 ]
    ' m.markupGridContent.sectionDividerSpacing = 50
    ' m.markupGridContent.sectionDividerLeftOffset = 0 ' 0 ili skloni
    m.backgroundPoster = m.top.findNode("backgroundPoster")
    m.backgroundPoster.width = 1920
    m.backgroundPoster.height = 1080
    m.backgroundPoster.translation = [0,0]
    m.markupGridContent.visible = true
    m.markupGridContent.SetFocus(true)
    m.markupGridContent.ObserveField("itemFocused", "onItemFocused")
    m.markupGridContent.ObserveField("itemSelected", "onItemSelected") 
end function

function receiveContent(obj)
    m.markupGridContent.content = obj.getData()
    print  m.markupGridContent.content
end function

function onItemFocused() as void
    row = m.markupGridContent.itemFocused
    focusChild = m.markupGridContent.content.getChild(row)
    m.top.getParent().callFunc("showScreen",focusChild)
    m.backgroundPoster.uri = focusChild.HDBackgroundImageUrl
    m.backgroundPoster.failedBitmapUri = "pkg:/images/hollow.jpg"
end function

function onItemSelected() as void
    ' row = m.markupGridContent.itemSelected
    ' selectedChild = m.markupGridContent.content.getChild(row).getChild(row)
    m.global.VideoComponent.callFunc("setVideo")
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "back" and press then
        row = m.markupGridContent.itemFocused
        focusChild = m.markupGridContent.content.getChild(row).getChild(row)
        if row = 0 then
            m.dialog = m.top.createChild("Dialog")
            m.dialog.title = "Warning"
            m.dialog.message = "Do you really want to exit?"
            m.dialog.buttons = ["Yes", "No"]
            m.dialog.buttonGroup.getChild(0).iconUri = ""
            m.dialog.buttonGroup.getChild(0).focusedIconUri = ""
            m.dialog.buttonGroup.getChild(1).iconUri = ""
            m.dialog.buttonGroup.getChild(1).focusedIconUri = ""
            m.dialog.optionsDialog = true
            m.dialog.messageFont = "font:LargeBoldSystemFont"
            m.dialog.ObserveField("buttonSelected","onButtonSelected")
            m.dialog.setFocus(true)
            return true
        else
            m.markupGridContent.jumpToItem = 0
            return true
        end if
    end if
    return false  
end function

sub onButtonSelected()
    if m.dialog.buttonSelected = 1 then
        closeDialog()
    else
        closeDialog()
        m.top.closeScreen = true
    end if
end sub

sub closeDialog()
    m.dialog.close = true
    m.dialog.visible = false
    m.markupGridContent.setFocus(true)
end sub