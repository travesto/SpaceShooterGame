-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--Display Settings
display.setStatusBar(display.HiddenStatusBar)

display.setDefault( "anchorX", 0.5)
display.setDefault( "anchorY", 0.5)

--Seed Gen
math.randomseed( os.time())

--required
local gameData = require("gamedata")
local composer = require("composer")

--gameData Info
--gameData.invaderNum = 1
--gameData.maxLevels = 5
--gameData.rowsOfInvaders = 7
gameData.asteroidNum = 6

composer.gotoScene("game")