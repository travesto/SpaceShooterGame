-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

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


