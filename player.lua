--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7813f9800f9506798240bed5902964cc:bd10d786746391c7317c98c8f20721ef:b2f580ea7c37465eac371f095cbaf8c7$
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
            -- playerShip1_blue
            x=2,
            y=310,
            width=99,
            height=75,

        },
        {
            -- playerShip1_green
            x=2,
            y=387,
            width=99,
            height=75,

        },
        {
            -- playerShip1_orange
            x=2,
            y=464,
            width=99,
            height=75,

        },
        {
            -- playerShip1_red
            x=2,
            y=541,
            width=99,
            height=75,

        },
        {
            -- playerShip2_blue
            x=2,
            y=2,
            width=112,
            height=75,

        },
        {
            -- playerShip2_green
            x=2,
            y=79,
            width=112,
            height=75,

        },
        {
            -- playerShip2_orange
            x=2,
            y=156,
            width=112,
            height=75,

        },
        {
            -- playerShip2_red
            x=2,
            y=233,
            width=112,
            height=75,

        },
        {
            -- playerShip3_blue
            x=2,
            y=618,
            width=98,
            height=75,

        },
        {
            -- playerShip3_green
            x=2,
            y=695,
            width=98,
            height=75,

        },
        {
            -- playerShip3_orange
            x=2,
            y=772,
            width=98,
            height=75,

        },
        {
            -- playerShip3_red
            x=2,
            y=849,
            width=98,
            height=75,

        },
    },
    
    sheetContentWidth = 116,
    sheetContentHeight = 926
}

SheetInfo.frameIndex =
{

    ["playerShip1_blue"] = 1,
    ["playerShip1_green"] = 2,
    ["playerShip1_orange"] = 3,
    ["playerShip1_red"] = 4,
    ["playerShip2_blue"] = 5,
    ["playerShip2_green"] = 6,
    ["playerShip2_orange"] = 7,
    ["playerShip2_red"] = 8,
    ["playerShip3_blue"] = 9,
    ["playerShip3_green"] = 10,
    ["playerShip3_orange"] = 11,
    ["playerShip3_red"] = 12,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
