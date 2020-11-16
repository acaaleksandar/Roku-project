sub getScreenContent()
    m.getDataTask = CreateObject("roSGNode", "GetDataTask")
    m.getDataTask.url = "https://api.npoint.io/b096a65d709fbe682348"
    m.getDataTask.observeField("response", "dataTaskResponse")
    m.getDataTask.control = "RUN"
end sub

sub dataTaskResponse(obj)
    m.global.leftSideScreen.content = obj.getData()
end sub

sub checkUserStatus()
    m.registryTask = createObject("roSGNode", "TaskForRegistry")
    m.registryTask.observeField("response","onRegistryResponse")
    m.registryTask.control = "RUN"
end sub

sub onRegistryResponse(response)
    m.top.getParent().userStatus = response.getString()
end sub