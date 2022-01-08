sub init()
    m.title =  m.top.FindNode("itemTitle")
    m.poster = m.top.FindNode("itemPoster")

    m.poster.width = m.global.resRatio * 150
    m.poster.height = m.global.resRatio * 220
    m.poster.loadWidth = m.global.resRatio * 150
    m.poster.loadWidth = m.global.resRatio * 220
    
    m.title.width = 1100 * m.global.resRatio
    m.title.font.size = 32 * m.global.resRatio
end sub

sub OnContentSet()
    content = m.top.itemContent
    if content <> invalid 
        m.poster.uri = content.hdPosterUrl
        m.title.text = content.title
    end if
end sub

sub deInit()
    m.title = invalid
    m.poster =invalid
endsub