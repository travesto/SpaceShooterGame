-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

<<<<<<< HEAD
-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

--RNG systems
math.randomseed( os.time() )


-- include the Corona "composer" module
local composer = require "composer"

-- load menu screen
composer.gotoScene( "menu" )

--function scene:create( event )
--	local group = self.view
--    setupBackground()
--    setupGroups()
--    setupDisplay()
--    setupPlayer()
--end
--scene:addEventListener( "create", scene)


=======
--Display Settings
display.setStatusBar(display.HiddenStatusBar)

display.setDefault( "anchorX", 0.5)
display.setDefault( "anchorY", 0.5)

<<<<<<< HEAD
--Seed Gen
math.randomseed( os.time())
=======
--RNG systems
math.randomseed( os.time() )
>>>>>>> origin/master

--required
local gameData = require("gamedata")
local composer = require("composer")

<<<<<<< HEAD
--gameData Info
--gameData.invaderNum = 1
--gameData.maxLevels = 5
--gameData.rowsOfInvaders = 7
gameData.asteroidNum = 6

composer.gotoScene("game")
=======
-- include the Corona "composer" module
local composer = require "composer"

-- load menu screen
composer.gotoScene( "menu" )

--function scene:create( event )
--	local group = self.view
--    setupBackground()
--    setupGroups()
--    setupDisplay()
--    setupPlayer()
--end
--scene:addEventListener( "create", scene)


>>>>>>> origin/master
>>>>>>> origin/master
