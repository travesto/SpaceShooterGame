--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:07e61c3a4bead9a17aa32b5faa7f055b:0f5fa596db4549b7a9eba09531c0a71e:ccc845fcea7877c714e6b9a1b1e28af7$
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
            -- enemyBlack1
            x=1242,
            y=2,
            width=93,
            height=84,

        },
        {
            -- enemyBlack2
            x=2,
            y=2,
            width=104,
            height=84,

        },
        {
            -- enemyBlack3
            x=426,
            y=2,
            width=103,
            height=84,

        },
        {
            -- enemyBlack4
            x=1622,
            y=2,
            width=82,
            height=84,

        },
        {
            -- enemyBlack5
            x=846,
            y=2,
            width=97,
            height=84,

        },
        {
            -- enemyBlue1
            x=1337,
            y=2,
            width=93,
            height=84,

        },
        {
            -- enemyBlue2
            x=108,
            y=2,
            width=104,
            height=84,

        },
        {
            -- enemyBlue3
            x=531,
            y=2,
            width=103,
            height=84,

        },
        {
            -- enemyBlue4
            x=1706,
            y=2,
            width=82,
            height=84,

        },
        {
            -- enemyBlue5
            x=945,
            y=2,
            width=97,
            height=84,

        },
        {
            -- enemyGreen1
            x=1432,
            y=2,
            width=93,
            height=84,

        },
        {
            -- enemyGreen2
            x=214,
            y=2,
            width=104,
            height=84,

        },
        {
            -- enemyGreen3
            x=636,
            y=2,
            width=103,
            height=84,

        },
        {
            -- enemyGreen4
            x=1790,
            y=2,
            width=82,
            height=84,

        },
        {
            -- enemyGreen5
            x=1044,
            y=2,
            width=97,
            height=84,

        },
        {
            -- enemyRed1
            x=1527,
            y=2,
            width=93,
            height=84,

        },
        {
            -- enemyRed2
            x=320,
            y=2,
            width=104,
            height=84,

        },
        {
            -- enemyRed3
            x=741,
            y=2,
            width=103,
            height=84,

        },
        {
            -- enemyRed4
            x=1874,
            y=2,
            width=82,
            height=84,

        },
        {
            -- enemyRed5
            x=1143,
            y=2,
            width=97,
            height=84,

        },
    },
    
    sheetContentWidth = 1958,
    sheetContentHeight = 88
}

SheetInfo.frameIndex =
{

    ["enemyBlack1"] = 1,
    ["enemyBlack2"] = 2,
    ["enemyBlack3"] = 3,
    ["enemyBlack4"] = 4,
    ["enemyBlack5"] = 5,
    ["enemyBlue1"] = 6,
    ["enemyBlue2"] = 7,
    ["enemyBlue3"] = 8,
    ["enemyBlue4"] = 9,
    ["enemyBlue5"] = 10,
    ["enemyGreen1"] = 11,
    ["enemyGreen2"] = 12,
    ["enemyGreen3"] = 13,
    ["enemyGreen4"] = 14,
    ["enemyGreen5"] = 15,
    ["enemyRed1"] = 16,
    ["enemyRed2"] = 17,
    ["enemyRed3"] = 18,
    ["enemyRed4"] = 19,
    ["enemyRed5"] = 20,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
