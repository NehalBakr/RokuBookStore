sub init()
    runTask()
end sub

sub runTask()
    m.TestUrlTask = CreateObject("roSGNode", "TestUrlTask")
    m.TestUrlTask.observeField("content", "loadContent")
    m.TestUrlTask.control = "RUN"
end sub

sub loadContent()
    m.top.screen.content = m.TestUrlTask.content
end sub

sub deInit()
    m.TestUrlTask.unobserveField("content")
    m.TestUrlTask = invalid
end sub