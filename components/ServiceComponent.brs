sub init()    
    
End sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function

sub myContent()
    node = CreateObject("roSGNode", "ContentNode")
    node.hDPosterUrl = "pkg:/images/venom.jpg"
    node.Directors = "Mimi Leder"
    node.Title = "Deep Impact"
    node.Categories = "Adventure, Dramas, Action, Sci-Fi"
    node.Categories = ["Adventure", "Drama", "Action", "Sci-Fi"]
    node.Actors	 = ["Robert Duvall", "Tea Leoni", "Elijah Wood", "Redgrave","Freeman", "Schell", "J Cromwel", "Aleksic", "Laura Innes", "Eldar", "Favreu", "Mary McCornak", "Bair Underwood", "Wentz", "Bruce Weitz", "Brantley", "ONeal Compot", "Kisted", "Denis Crosby", "Aleksandar Veliki"]
    node.Description = "Troubled people attempt to mend their lives as they brace themselves for a comet that thretens Earth."
    m.global.TextDownComponent.content = node
    m.global.BackgroundComponent.content = node
    m.global.TextUpComponent.content = node
end sub