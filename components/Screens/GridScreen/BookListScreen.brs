sub init()
    m.markupList = m.top.findNode("markupList")
    m.resRatio = m.global.resRatio

    m.markupList.translation = [100 * m.resRatio, 100 * m.resRatio]
    m.markupList.itemSize = [1500 * m.resRatio, 250 * m.resRatio] 
    m.markupList.itemSpacing = [24 * m.resRatio, 25 * m.resRatio]

    m.markupList.SetFocus(true)
end sub

sub onResume()
    m.markupList.SetFocus(true)
endsub

sub deInit()
    m.markupList = invalid
end sub