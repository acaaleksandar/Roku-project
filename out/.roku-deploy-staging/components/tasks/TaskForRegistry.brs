sub init()    
    m.top.functionname = "rigistryHandler"
End sub

sub rigistryHandler()
    input = m.top.input
    response = "false"
    if input.action = "write" then
        insertUserData(input.key, input.value, input.section)
        response = "true"
    else if input.action = "checkUser" then
        response = selectUserStatus(input.key, input.section)
    end if
    m.top.response = response
end sub

sub insertUserData(key, value, sectionName)
    section = createObject("roRegistrySection", sectionName)
    section.write(key, value)
    section.flush()
end sub

function selectUserStatus(key, sectionName)
    section = createObject("roRegistrySection", sectionName)
    if section.exists(key) then
        return section.read(key)
    else
        return "false"
    end if
end function