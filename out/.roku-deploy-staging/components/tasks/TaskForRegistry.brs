sub init()    
    m.top.functionname = "rigistryHandler"
End sub

sub rigistryHandler()
    input = m.top.input
    response = "false"
    if input.action = "write" then
        insertUserData(input.user, input.userStatus, input.section)
        response = "true"
    else if input.action = "checkUser" then
        response = selectUserStatus(input.user, input.section)
    end if
    m.top.response = response
end sub

sub insertUserData(user, userStatus, sectionName)
    section = createObject("roRegistrySection", sectionName)
    section.write(user, userStatus)
    section.flush()
end sub

function selectUserStatus(user, sectionName)
    section = createObject("roRegistrySection", sectionName)
    if section.exists(user) then
        return section.read(user)
    else
        return "false"
    end if
end function