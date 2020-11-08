sub startingPageContent()
    m.getDataTask = CreateObject("roSGNode", "GetDataTask")
    m.getDataTask.url = "https://api.npoint.io/b096a65d709fbe682348"
    m.getDataTask.observeField("response", "dataTaskResponse")
    m.getDataTask.control = "RUN"
end sub

sub dataTaskResponse(obj)
    m.global.homeScreen.content = obj.getData()
end sub