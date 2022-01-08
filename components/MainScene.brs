sub init()
    m.container = m.top.findNode("container")
    m.top.observeField("navigateScreen", "navigateScreens")
    m.top.navigateScreen = { componentName: "BookListScreen", type: "push", controller: "GridScreenController" }
end sub

sub navigateScreens()
    m.navigatorArrayField = m.top.navigateScreen

    m.screenComponent = CreateObject("roSGNode", m.navigatorArrayField["componentName"])
    if m.navigatorArrayField["type"] = "push" then
        showScreenWithoutReplace(m.screenComponent)
    else if m.navigatorArrayField["type"] = "remove" then
        closeScreen()
    end if
end sub

sub showScreenWithoutReplace(screen as object)
    if m.container.getChildCount() > 0
        m.container.getChild(m.container.getChildCount() - 1).visible = false
    end if
    m.container.appendChild(screen)
    screen.setFocus(true)
    m.controller = CreateObject("roSGNode", m.navigatorArrayField["controller"])
    m.controller.screen = screen
    if m.navigatorArrayField["data"] <> invalid
        m.controller.item = m.navigatorArrayField["data"]
    end if
end sub

sub closeScreen()
    currentScreen = m.container.getChild(m.container.getChildCount() - 1)
    m.controller.callFunc("deInit")
    deInitAll(currentScreen)
    m.container.removeChildIndex(m.container.getChildCount() - 1)
    m.container.getChild(m.container.getChildCount() - 1).visible = true
    m.container.getChild(m.container.getChildCount() - 1).setFocus(true)
end sub