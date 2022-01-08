function deInitAll(node as Object)
    for each element in node.GetChildren(-1, 0)
        element.callFunc("deInit")
         if element.getChildCount() > 0
            deInitAll(element)
        end if
    end for
end function