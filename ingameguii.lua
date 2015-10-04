--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ad9da92e433277bbe5480eb32737d4cd:c864ab85a2c5ea6aa768c25f03ec6fa8:06446d290f3aed20daaedb69997d6ba2$
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
            -- flatDark02
            x=166,
            y=2,
            width=61,
            height=76,

        },
        {
            -- flatDark04
            x=292,
            y=2,
            width=76,
            height=61,

        },
        {
            -- flatDark05
            x=370,
            y=2,
            width=75,
            height=61,

        },
        {
            -- flatDark09
            x=229,
            y=2,
            width=61,
            height=75,

        },
        {
            -- flatDark30
            x=447,
            y=2,
            width=48,
            height=48,

        },
        {
            -- flatDark35
            x=2,
            y=2,
            width=80,
            height=80,

        },
        {
            -- flatDark36
            x=84,
            y=2,
            width=80,
            height=80,

        },
    },
    
    sheetContentWidth = 497,
    sheetContentHeight = 84
}

SheetInfo.frameIndex =
{

    ["flatDark02"] = 1,
    ["flatDark04"] = 2,
    ["flatDark05"] = 3,
    ["flatDark09"] = 4,
    ["flatDark30"] = 5,
    ["flatDark35"] = 6,
    ["flatDark36"] = 7,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
