sub init()    
    m.top.functionname = "urlRequest"
End sub

function urlRequest()
    url = m.top.url
    urlTransfer = CreateObject("roUrlTransfer")
    urlTransfer.setUrl(url)
    port = CreateObject("roMessagePort")
    urlTransfer.setPort(port)

    if urlTransfer.asyncGetToString() then
        msg = wait(5000, port)
        if msg.getResponseCode() = 200 then
            if (type(msg) = "roUrlEvent") then
                m.top.response = prepareNode(msg)
            end if
        else
            m.top.response = "Error"     
        end if
    end if
end function

function prepareNode(obj)
    data = parseJSON(obj.getString())
    print data
    print type(data)
   
    if data.doesExist("data") then
        for each key in data.data
            print key
        end for
    end if
end function