--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:cd3ba89c62e90e96f6de13651a3e6d85:3793035ad1170f29584d89f35bef9ef3:cf7f0d408ba594f9d39622245c880bbf$
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
            -- meteorBrown_big1
            x=446,
            y=2,
            width=101,
            height=84,

        },
        {
            -- meteorBrown_big2
            x=2,
            y=2,
            width=120,
            height=98,

        },
        {
            -- meteorBrown_big3
            x=652,
            y=2,
            width=89,
            height=82,

        },
        {
            -- meteorBrown_big4
            x=246,
            y=2,
            width=98,
            height=96,

        },
        {
            -- meteorBrown_med1
            x=834,
            y=2,
            width=43,
            height=43,

        },
        {
            -- meteorBrown_med3
            x=879,
            y=2,
            width=45,
            height=40,

        },
        {
            -- meteorBrown_small1
            x=879,
            y=44,
            width=28,
            height=28,

        },
        {
            -- meteorBrown_small2
            x=879,
            y=74,
            width=29,
            height=26,

        },
        {
            -- meteorBrown_tiny1
            x=939,
            y=44,
            width=18,
            height=18,

        },
        {
            -- meteorBrown_tiny2
            x=959,
            y=44,
            width=16,
            height=15,

        },
        {
            -- meteorGrey_big1
            x=549,
            y=2,
            width=101,
            height=84,

        },
        {
            -- meteorGrey_big2
            x=124,
            y=2,
            width=120,
            height=98,

        },
        {
            -- meteorGrey_big3
            x=743,
            y=2,
            width=89,
            height=82,

        },
        {
            -- meteorGrey_big4
            x=346,
            y=2,
            width=98,
            height=96,

        },
        {
            -- meteorGrey_med1
            x=834,
            y=47,
            width=43,
            height=43,

        },
        {
            -- meteorGrey_med2
            x=926,
            y=2,
            width=45,
            height=40,

        },
        {
            -- meteorGrey_small1
            x=909,
            y=44,
            width=28,
            height=28,

        },
        {
            -- meteorGrey_small2
            x=910,
            y=74,
            width=29,
            height=26,

        },
        {
            -- meteorGrey_tiny1
            x=941,
            y=78,
            width=18,
            height=18,

        },
        {
            -- meteorGrey_tiny2
            x=959,
            y=61,
            width=16,
            height=15,

        },
    },
    
    sheetContentWidth = 977,
    sheetContentHeight = 102
}

SheetInfo.frameIndex =
{

    ["meteorBrown_big1"] = 1,
    ["meteorBrown_big2"] = 2,
    ["meteorBrown_big3"] = 3,
    ["meteorBrown_big4"] = 4,
    ["meteorBrown_med1"] = 5,
    ["meteorBrown_med3"] = 6,
    ["meteorBrown_small1"] = 7,
    ["meteorBrown_small2"] = 8,
    ["meteorBrown_tiny1"] = 9,
    ["meteorBrown_tiny2"] = 10,
    ["meteorGrey_big1"] = 11,
    ["meteorGrey_big2"] = 12,
    ["meteorGrey_big3"] = 13,
    ["meteorGrey_big4"] = 14,
    ["meteorGrey_med1"] = 15,
    ["meteorGrey_med2"] = 16,
    ["meteorGrey_small1"] = 17,
    ["meteorGrey_small2"] = 18,
    ["meteorGrey_tiny1"] = 19,
    ["meteorGrey_tiny2"] = 20,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
