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
math.randomseed(os.time())


-- include the Corona "composer" module
local storyboard = require "storyboard"

-- load menu screen
storyboard.gotoScene( "menu" )