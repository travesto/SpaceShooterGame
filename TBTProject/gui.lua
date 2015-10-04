--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:18429e8c4a8f1f6a9a653b4e79dd081b:7ad329fb40b888db4b72dab2ff4a08a3:109a633fbcccdf9dd8adc72b3a4e0e61$
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
            -- buttonBlue
            x=2,
            y=2,
            width=222,
            height=39,

        },
        {
            -- buttonGreen
            x=226,
            y=2,
            width=222,
            height=39,

        },
        {
            -- buttonRed
            x=2,
            y=43,
            width=222,
            height=39,

        },
        {
            -- buttonYellow
            x=226,
            y=43,
            width=222,
            height=39,

        },
        {
            -- playerLife1_blue
            x=158,
            y=84,
            width=33,
            height=26,

        },
        {
            -- playerLife1_green
            x=193,
            y=84,
            width=33,
            height=26,

        },
        {
            -- playerLife1_orange
            x=228,
            y=84,
            width=33,
            height=26,

        },
        {
            -- playerLife1_red
            x=263,
            y=84,
            width=33,
            height=26,

        },
        {
            -- playerLife2_blue
            x=2,
            y=84,
            width=37,
            height=26,

        },
        {
            -- playerLife2_green
            x=41,
            y=84,
            width=37,
            height=26,

        },
        {
            -- playerLife2_orange
            x=80,
            y=84,
            width=37,
            height=26,

        },
        {
            -- playerLife2_red
            x=119,
            y=84,
            width=37,
            height=26,

        },
        {
            -- playerLife3_blue
            x=298,
            y=84,
            width=32,
            height=26,

        },
        {
            -- playerLife3_green
            x=332,
            y=84,
            width=32,
            height=26,

        },
        {
            -- playerLife3_orange
            x=366,
            y=84,
            width=32,
            height=26,

        },
        {
            -- playerLife3_red
            x=400,
            y=84,
            width=32,
            height=26,

        },
    },
    
    sheetContentWidth = 450,
    sheetContentHeight = 112
}

SheetInfo.frameIndex =
{

    ["buttonBlue"] = 1,
    ["buttonGreen"] = 2,
    ["buttonRed"] = 3,
    ["buttonYellow"] = 4,
    ["playerLife1_blue"] = 5,
    ["playerLife1_green"] = 6,
    ["playerLife1_orange"] = 7,
    ["playerLife1_red"] = 8,
    ["playerLife2_blue"] = 9,
    ["playerLife2_green"] = 10,
    ["playerLife2_orange"] = 11,
    ["playerLife2_red"] = 12,
    ["playerLife3_blue"] = 13,
    ["playerLife3_green"] = 14,
    ["playerLife3_orange"] = 15,
    ["playerLife3_red"] = 16,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
