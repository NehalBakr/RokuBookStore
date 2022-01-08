sub init()
    m.top.observeField("visible", "onVisiblityChange")
end sub

sub goToSpecificScreen(screenInfoMap as object)
    m.top.getScene().navigateScreen = screenInfoMap
end sub

sub onVisiblityChange(event)
    if event.getData() = true
        onResume()
    else if event.getData() = false
        onPause()  
    end if
end sub

sub onResume()
endsub

sub onPause()
endsub    