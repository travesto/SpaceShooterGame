local composer = require("composer")
local sheetInfo = require("gui")
local myImageSheet = graphics.newImageSheet( "gui.png", sheetInfo:getSheet() )
local scene = composer.newScene()

local infoText = display.newText("Nothing is implemented here at this moment.", 350, 350, "Conquest", 30)
infoText:setFillColor(1) 

local redSprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("buttonRed")}})
    redSprite.x = 510
    redSprite.y = 550
    redSprite.name = "start button"
    local StartText = display.newText("Main Menu", 510, 550, "Conquest", 30)
    StartText:setFillColor(0)

return scene