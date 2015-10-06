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
local asteroidSheetInfo = require("assets.images.asteroids")
local asteroidSheet = graphics.newImageSheet( "assets/images/asteroids.png", asteroidSheetInfo:getSheet() )
local enemySheetInfo = require("assets.images.enemy")
local enemySheet = graphics.newImageSheet( "assets/images/enemy.png", enemySheetInfo:getSheet() )
local laserSheetInfo = require("assets.images.laser")
local laserSheet = graphics.newImageSheet( "assets/images.laser.png", laserSheetInfo:getSheet() )
local playerSheetInfo = require("assets.images.player")
local playerSheet = graphics.newImageSheet( "assets/images/player.png", playerSheetInfo:getSheet() )
local guiSheetInfo = require("assets.images.ingameguii")
local guiSheet = graphics.newImageSheet("assets/images/ingameguii.png", guiSheetInfo:getSheet())
 
 --audio
local shot = audio.loadSound("assets/sounds/laser.mp3")
--local backgroundsnd = audio.loadStream ("")


--local vars here
local currentResource1 = 0
local currentResource2 = 100
local currentResource1Display
local currentResource2Display
local levelProg = 1
local spawnTimer
local shipMoveX = 0
local shipMoveY = 0
local ship
local speed = 3
local shootBtn
local ultBtn
local numEnemy = 0
local numAsteroid = 0
local enemyArray = {}
local asteroidArray = {}
local gameActive

--function declaration
local removeEnemies
local createGame
local createEnemy
local shoot = {}
local ultFire = {}
local createShip
local newGame
local nextLevel
local checkforProgress
local backgroundMusic
local createAsteroid
local removeAsteroid

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



--scene functions
function scene:create(event) --used for creating a scene thats never loaded, been removed or been removed from hidden

local sceneGroup = self.view

physics.start()
physics.pause()

local thisLevel = myData.settings.currentLevel

--obj go here

local background = display.newImageRect("assets/images/blue.png", display.contentWidth, display.contentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    sceneGroup:insert( background )


levelText = display.newText(myData.settings.currentLevel, 25,10, native.systemFontBold, 48)
levelText:setFillColor(0)
levelText.x = display.contentCenterX
levelText.y = display.contentCenterY

sceneGroup:insert(levelText)

currentResource1Display = display.newText("Metal: ",  display.contentWidth - 100, 10, native.systemFont, 10)
currentResource2Display = display.newText("Energy: ",  display.contentWidth - 100, 30, native.systemFont, 10)
sceneGroup:insert(currentResource1Display)
sceneGroup:insert(currentResource2Display)

local leftArrow = display.newSprite( guiSheet, {frames={guiSheetInfo:getFrameIndex("flatDark04")}})
leftArrow.x = 48
leftArrow.y = 300
leftArrow:scale(0.5, 0.5)
local rightArrow = display.newSprite( guiSheet, {frames={guiSheetInfo:getFrameIndex("flatDark05")}})
rightArrow.x = 86
rightArrow.y = 300
rightArrow:scale(0.5, 0.5)
local upArrow = display.newSprite(guiSheet, {frames={guiSheetInfo:getFrameIndex("flatDark02")}})
upArrow.x = 67
upArrow.y = 280
upArrow:scale(0.5, 0.5)
local downArrow = display.newSprite(guiSheet, {frames={guiSheetInfo:getFrameIndex("flatDark09")}})
downArrow.x = 67
downArrow.y = 320
downArrow:scale(0.5, 0.5)

function leftArrowtouch()
	shipMoveX = -speed
end

function rightArrowtouch()
	shipMoveX = speed
end

function upArrowtouch()
	shipMoveY = -speed
end

function downArrowtouch()
	shipMoveY = speed
end

rightArrow:addEventListener ("touch", rightArrowtouch)
leftArrow:addEventListener("touch", leftArrowtouch)
upArrow:addEventListener("touch", upArrowtouch)
downArrow:addEventListener("touch", downArrowtouch)

end
--test systems
function startGame()
	createShip()
end


function scene:show(event) -- show scene stuff and such

local sceneGroup = self.view

local function createShip()
	ship = display.newSprite( playerSheet , {frames={playerSheetInfo:getFrameIndex("playerShip1_red")}})
	physics.addBody(ship, "static", {density = 1, friction = 0, bounce = 0});
	ship.x = 70
	ship.y = display.contentCenterY
	ship.rotation = 90
	ship.myName = "ship"
	ship:scale(0.5, 0.5)
end

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
sceneGroup:insert(ship)

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

