-----------------------------------------------------------------------------------------
--
-- menu.lua
--161395 na customer
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to game
<<<<<<< HEAD
	composer.gotoScene( "gameplay", "fade", 500 )
=======
	composer.gotoScene( "scene1", "fade", 500 )
>>>>>>> origin/master
	
	return true	-- indicates successful touch
end

--backgroud generator
function setupBackground()
	local background = display.newRect(0,0, display.contentWidth, display.contentHeight)
	background:setFillColor(0)
	scene.view:insert(background)
end
	
--setup groupings
function setupGroups()
    asteroidGroup = display.newGroup()
    shipGroup = display.newGroup()
    scene.view:insert(asteroidGroup)
    scene.view:insert(shipGroup)
end

--display setup
function setupDisplay ()
    local tempRect = display.newRect(0,display.contentHeight-70,display.contentWidth,124);
    tempRect:setFillColor(0);
    scene.view:insert(tempRect)
    --local logo = display.newImage("logo.png", display.contentWidth-139,display.contentHeight-70);
    --scene.view:insert(logo)
    local dpad = display.newImage("dpad.png",10,display.contentHeight -70)
  --  scene.view:insert(dpad)
end

--player setup
function setupPlayer()
   --     player = display.newImage("assets/art/RedRacer.png",(display.contentWidth/2)-(playerWidth/2),(display.contentHeight -70)-(playerHeight))
  --      player.name = "Player"
   --     scene.view:insert(player)
end

function setupDPad()
    rectUp = display.newRect( 34, display.contentHeight-70, 23, 23)
    rectUp:setFillColor(1,0,0)
    rectUp.id ="up"
    rectUp.isVisible = false;
    rectUp.isHitTestable = true;
    scene.view:insert(rectUp)
 
    rectDown = display.newRect( 34,display.contentHeight-23, 23,23)
    rectDown:setFillColor(1,0,0)
    rectDown.id ="down"
    rectDown.isVisible = false;
    rectDown.isHitTestable = true;
    scene.view:insert(rectDown)
 
    rectLeft = display.newRect( 10,display.contentHeight-47,23, 23)
    rectLeft:setFillColor(1,0,0)
    rectLeft.id ="left"
    rectLeft.isVisible = false;
    rectLeft.isHitTestable = true;
    scene.view:insert(rectLeft)
 
    rectRight= display.newRect( 58,display.contentHeight-47, 23,23)
    rectRight:setFillColor(1,0,0)
    rectRight.id ="right"
    rectRight.isVisible = false;
    rectRight.isHitTestable = true;
    scene.view:insert(rectRight)
end
function resetShipGrid()
shipGrid = {}
     for i=1, 11 do
         table.insert(shipGrid,0)
     end
end

function moveShip(event)
    if event.phase == "began" then
        if(event.target.id == "up") then
          playerSpeedY = -playerMoveSpeed
        end
        if(event.target.id == "down") then
          playerSpeedY = playerMoveSpeed
        end
        if(event.target.id == "left") then
          playerSpeedX = -playerMoveSpeed
        end
        if(event.target.id == "right") then
          playerSpeedX = playerMoveSpeed
        end
    elseif event.phase == "ended" then
        playerSpeedX = 0
        playerSpeedY = 0 
   end
end

--sound generated system for ships
--local shipSound = audio.loadStream("shipsound.mp3")
--shipSoundChannel = audio.play( shipSound, {loops=-1} )

function gameLoop()
    --SNIP--
   -- numberOfTicks = numberOfTicks + 1
--    movePlayer()
--    movePlayerBullets()
--    checkPlayerBulletsOutOfBounds()
--    moveFreeLifes()
--    checkFreeLifesOutOfBounds()
--    checkPlayerCollidesWithFreeLife()
end

--function movePlayer()
--    player.x = player.x + playerSpeedX
--    player.y = player.y + playerSpeedY
--    if(player.x < 0) then
--        player.x = 0
--   end
--   if(player.x > display.contentWidth - playerWidth) then
--       player.x = display.contentWidth - playerWidth
--   end
--   if(player.y   < 0) then
--       player.y = 0
--  end
--  if(player.y > display.contentHeight - 70- playerHeight) then
--      player.y = display.contentHeight - 70 - playerHeight
--  end
--end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "assets/background.jpg", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	
	-- create/position logo/title image on upper-half of the screen
	--local titleLogo = display.newImageRect( "logo.png", 264, 42 )
	--titleLogo.x = display.contentWidth * 0.5
	--titleLogo.y = 100
	
	-- create a widget button (which will loads level1.lua on release)
	playBtn = widget.newButton{
		label="Start Demo",
		labelColor = { default={255}, over={128} },
		default="assets/button.png",
		over="assets/button-over.png",
            

		
		
		onRelease = onPlayBtnRelease	-- event listener function
	}
	playBtn.x = display.contentWidth*0.5
	playBtn.y = display.contentHeight - 125
    setupBackground()
    setupGroups()
    setupDisplay()
    setupPlayer()
    setupDPad()
    resetShipGrid()

--	slctBtn = widget.newButton{
--		label="Select Ship",
--		labelColor = {default={255}, over={128} },
--		default="button.png",
--		over="button-over.png",

--		onRelease = onSlctBtnRelease --event listener
--	}
--	slctBtn.x = display.contentWidth*0.75
--	slctBtn.y = display.contentHeight - 125
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	--sceneGroup:insert( titleLogo )
	sceneGroup:insert( playBtn )
--	sceneGroup:insert( slctBtn )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end



function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
--rectUp:addEventListener( "touch", moveShip)
--rectDown:addEventListener( "touch", moveShip)
--rectLeft:addEventListener( "touch", moveShip)
--rectRight:addEventListener( "touch", moveShip)
Runtime:addEventListener("enterFrame", gameLoop)
-----------------------------------------------------------------------------------------

return scene