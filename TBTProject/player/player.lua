-------------------------------------------
-- player.lua
-- pulls player ships from images
-- settings for each ship will be seperate
-- pulls for the settings
-------------------------------------------


-- player settings?
function setupPlayer()
	local options = {width = playerWidth, height = playerHeight, numFrames = 1}
	local playerSheet = graphics.newImageSheet( "assets/art/RedRacer.png", options )
	local sequenceData = {
	{ start =1, count =1, time = 300, loopCount=0}
	}
	playerShip = display.newSprite( playerSheet, sequenceData)
	playerShip.name = "Red Racer"
	playerShip.x = display.contentCenterX- playerWidth /2
	playerShip.y = display.contentHeight - playerheight -10
	playerShip:play()
	scene.view:insert(playerShip)
	local physicsData = (require "shapedefs").physicsData(1.0)
	physics.addBody(playerShip, physicsData:get("ship"))
	playerShip.gravityScale = 0
end
