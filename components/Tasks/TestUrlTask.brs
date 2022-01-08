sub init()
    m.top.functionName = "loadData"
end sub

sub loadData()
    request = CreateObject("roURLTransfer")
    port = CreateObject("roMessagePort")
    request.SetPort(port)
    request.SetURL("http://de-coding-test.s3.amazonaws.com/books.json")
    data = request.AsyncGetToString()

    count = 0
    jsonstr = ""
    error = ""
    while count < 4 ' You must decide how long to wait for the response from masterURL
        msg = port.waitMessage(4000)
        if msg <> invalid and type(msg) = "roUrlEvent"
            code = msg.GetResponseCode()
            if code = 200
                jsonstr = msg.getString()
            else
                ? "code " code
                error = msg.GetFailureReason()
                ? "error " error
            end if
            exit while
        end if
        count = count + 1
    end while
    if 0 < jsonstr.len()
        items = parseJSON(jsonstr)
        rootChildren = []
        if invalid <> items 
            for each item in items
                rootChildren.push(getChildInfo(item))
            end for
            contentNode = createObject("RoSGNode", "ContentNode")
            contentNode.update({
                children : rootChildren
            }, true)
            m.top.content = contentNode
        endif
    end if

end sub

function getChildInfo(child as object) as object
    item = {}
    item.title = child.title
    item.hdPosterURL = child.imageURL
    return item
end function