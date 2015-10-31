--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8b0a97c3f4db8c69eb50b7fb7ecf2717:e8f1967a5c43cf0ee92977a816da138b:271037b97ff01aa5009d6ce7d5f6c68c$
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
            -- CrabHead25
            x=279,
            y=2,
            width=151,
            height=214,

        },
        {
            -- CrabHead_centergun25
            x=169,
            y=273,
            width=108,
            height=101,

        },
        {
            -- PrayingMantis25
            x=279,
            y=218,
            width=120,
            height=288,

        },
        {
            -- Radial_125
            x=2,
            y=2,
            width=275,
            height=269,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 279,
            sourceHeight = 271
        },
        {
            -- RedRacer_genericbullet25
            x=169,
            y=376,
            width=92,
            height=14,

        },
        {
            -- RedRacer_skin125
            x=2,
            y=273,
            width=165,
            height=237,

        },
    },
    
    sheetContentWidth = 432,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["CrabHead25"] = 1,
    ["CrabHead_centergun25"] = 2,
    ["PrayingMantis25"] = 3,
    ["Radial_125"] = 4,
    ["RedRacer_genericbullet25"] = 5,
    ["RedRacer_skin125"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
