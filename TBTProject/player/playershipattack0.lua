--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:5012b796593e04af8bfd626e38f9f79a:30685e5c36d7c233e7fcbe4dccfc3e33:5e1c4ed4819f8ffa6de5317c69f24e39$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- RedRacer000
            x=2,
            y=2,
            width=1803,
            height=2407,

            sourceX = 1526,
            sourceY = 95,
            sourceWidth = 4200,
            sourceHeight = 3000
        },
        {
            -- RedRacer001
            x=1807,
            y=2,
            width=1803,
            height=2407,

            sourceX = 1526,
            sourceY = 95,
            sourceWidth = 4200,
            sourceHeight = 3000
        },
        {
            -- RedRacer002
            x=3612,
            y=2,
            width=1803,
            height=2407,

            sourceX = 1526,
            sourceY = 95,
            sourceWidth = 4200,
            sourceHeight = 3000
        },
        {
            -- RedRacer003
            x=5417,
            y=2,
            width=1803,
            height=2407,

            sourceX = 1526,
            sourceY = 95,
            sourceWidth = 4200,
            sourceHeight = 3000
        },
    },
    
    sheetContentWidth = 7222,
    sheetContentHeight = 2411
}

SheetInfo.frameIndex =
{

    ["RedRacer000"] = 1,
    ["RedRacer001"] = 2,
    ["RedRacer002"] = 3,
    ["RedRacer003"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
