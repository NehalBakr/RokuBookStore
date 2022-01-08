'*************************************************************
'** Hello World example
'** Copyright (c) 2015 Roku, Inc.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK License Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'*************************************************************

sub Main()
    print "in showChannelSGScreen"
    'Indicate this is a Roku SceneGraph application'
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    m.global = screen.getGlobalNode()  
    m.global.addfield("resRatio","float",FALSE)
    m.global.resRatio = calculateResRatio()

    scene = screen.CreateScene("MainScene")
    screen.show()
    scene.observeField("exitApp", m.port)

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then
                return
            end if
        else if msgType = "roSGNodeEvent" then
            field = msg.getField()
            if field = "exitApp" then
                return
            end if
        end if
    end while
end sub

function calculateResRatio() as float
    resRatio = 0.0
    deviceInfo = CreateObject("roDeviceInfo")
    displayMode = deviceInfo.GetDisplayMode()

    if displayMode = "1080p" then
        resRatio = 1080 / 1080
    else if displayMode = "720p" then
        resRatio = 720 / 1080
    else
        resRatio = 480 / 1080
    end if

    return resRatio
end function

