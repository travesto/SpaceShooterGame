--level001 build 
--pcg content will be here. 
-- infomation for required
--use multiple files to create this one level. 
--will require json, composer, sprite sheets, game data file, physics and individual groupings for certain stuff.

local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
local json = require("json")
local utility = require("utility")
local physics = require("physics")
local myData = require("myData")

--sprite sheets
local asteroidSheetInfo = require("asteroids")
 local asteroidSheet = graphics.newImageSheet( "asteroids.png", asteroidSheetInfo:getSheet() )
  local enemySheetInfo = require("enemy")
 local enemySheet = graphics.newImageSheet( "enemy.png", enemySheetInfo:getSheet() )
  local laserSheetInfo = require("laser")
 local laserSheet = graphics.newImageSheet( "laser.png", laserSheetInfo:getSheet() )
  local playerSheetInfo = require("player")
 local playerSheet = graphics.newImageSheet( "player.png", playerSheetInfo:getSheet() )
 local guiSheetInfo = require("ingameguii")
 local guiSheet = graphics.newImageSheet("ingameguii.png", guiSheetInfo:getSheet())
 
 --audio
 local shot = audio.loadSound("laser.mp3")
--local backgroundsnd = audio.loadStream ("")

--local vars here
local currentResource1
local currentResource2
local currentResource1Display
local currentResource2Display
local levelText
local spawnTimer

--groupings
local enemies = display.newGroup()
local asteroids = display.newGroup()

--local functions
local function handleWin(event)
if event.phase == "ended" then
	composer.removeScene("nextlevel")
	composer.gotoScene("nextlevel", {time= 500, effect = "crossfade"})
end
return true
end
local function handleLoss(event)
if event.phase == "ended" then
	composer.removeScene("gameover")
	composer.gotoScene("gameover", {time = 500, effect = "crossFade"})
end
return true
end

for a = 1, 3, 1 do
    asteroid = display.newSprite( asteroidSheet , {frames={asteroidSheetInfo:getFrameIndex("meteorGrey_big2")}})
    asteroid.name = ("asteroid" .. a)
    asteroid.id = a
    asteroid.x = 800
    asteroid.y = 600
    asteroid.speed = 0
        --variable used to determine if they are in play or not
    asteroid.isAlive = false
        
    
    -- group:insert(asteroids)
end



-- function updateAsteroids()
		-- for a =1, myData.asteroid, 1 do
			-- if(asteroid[a].isAlive == true) then
				-- (asteroid[a]):translate(speed * -1, 0)
				-- if(asteroid[a].y > player.y) then
					-- asteroid[a].y = asteroid[a].y -1
				-- end
				-- if(asteroid[a].y < player.y) then
					-- asteroid[a].y = asteroid[a].y + 1
				-- end	
				-- if(asteroid[a].x < -80) then
					-- asteroid[a].x = 800
					-- asteroid[a].y = 600
					-- asteroid[a].speed = 0
					-- asteroid[a].isAlive = false;
				-- end
			-- end
		-- end

-- end

--scene functions
function scene:create(event) --used for creating a scene thats never loaded, been removed or been removed from hidden

local sceneGroup = self.view

physics.start()
physics.pause()

local thisLevel = myData.settings.currentLevel

--obj go here

 local background = display.newImageRect("blue.png", display.contentWidth, display.contentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    sceneGroup:insert( background )


levelText = display.newText(myData.settings.currentLevel, 0,0, native.systemFontBold, 48)
levelText:setFillColor(0)
levelText.x = display.contentCenterX
levelText.y = display.contentCenterY

sceneGroup:insert(levelText)

currentResource1Display = display.newText("Metal: ",  display.contentWidth - 100, 10, native.systemFont, 10)
currentResource2Display = display.newText("Energy: ",  display.contentWidth - 100, 30, native.systemFont, 10)
 sceneGroup:insert(currentResource1Display)
 sceneGroup:insert(currentResource2Display)

end
--test systems


function scene:show(event) -- show scene stuff and such

local sceneGroup = self.view

if event.phase == "did" then
physics.start()
physics.setGravity(0,0)
transition.to (levelText, {time = 500, alpha = 0})
-- spawnTimer = timer.performWithDelay(8000, function() updateAsteroids(); end, 10)
else
currentResource1 = 100
currentResource1Display.text = string.format ("%06d", currentResource1)
currentResource2 = 100
currentResource2Display.text = string.format ("%03d", currentResource2)
end
sceneGroup:insert(asteroids)
end

function scene:hide(event) --stop physics, timers, and audio
local sceneGroup = self.view

if event.phase == "will" then
physics.stop()
timer.cancel(spawnTimer)
end
end

function scene:destroy(event) --destroy audio and anything else not removed
local sceneGroup = self.view
end

--end implementation
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene

