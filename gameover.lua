--locals and required
local composer = require("composer")
local scene = composer.newScene()
local nextLevelButton
-------------------------------------------------------------------------------------------------------------------------------------------

--create scene
function scene:create( event )
    local group = self.view
    nextLevelButton = display.newImage("nextbtn.png",display.contentCenterX, display.contentCenterY)
    group:insert(nextLevelButton)
 end
------------------------------------------------------------------------------------------------------------------------------------------

-- show scene 
function scene:show( event )
    local phase = event.phase
    composer.removeScene("gamelevel" )
    if ( phase == "did" ) then
      nextLevelButton:addEventListener("tap",startNewGame)
      Runtime:addEventListener ( "enterFrame", starGenerator)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------

--hide scene 
function scene:hide(event )
    local phase = event.phase
    if ( phase == "will" ) then
        Runtime:removeEventListener("enterFrame", starGenerator)
        nextLevelButton:removeEventListener("tap",startNewGame)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------- 
 
 --start game function
function startNewGame()
    composer.gotoScene("level")
end
----------------------------------------------------------------------------------------------------------------------------------------------

--listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
 
return scene