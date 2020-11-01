sub setChildrenFont(node, fontSize)
    for i = 0 to node.getChildCount() - 1
        childrenFont(node, i, fontSize)
    end for
end sub

sub childrenFont(parentComp, index, size)
    childComp = parentComp.getChild(index)
    childComp.font.size = size
end sub