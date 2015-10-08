--composer stuff
local composer = require("composer")
composer.isDebug = true --for debuging only set to false before release builds
local cWidth = display.contentCenterX
local cHeight = display.contentCenterY

--scene starter
local scene = composer.newScene()

--sprite sheets
local asteroidSheetInfo = require("assets.images.asteroids")
local asteroidSheet = graphics.newImageSheet( "assets/images/asteroids.png", asteroidSheetInfo:getSheet() )
local enemySheetInfo = require("assets.images.enemy")
local enemySheet = graphics.newImageSheet( "assets/images/enemy.png", enemySheetInfo:getSheet() )
local laserSheetInfo = require("assets.images.laser")
local laserSheet = graphics.newImageSheet( "assets/images/laser.png", laserSheetInfo:getSheet() )
local playerSheetInfo = require("assets.images.player")
local playerSheet = graphics.newImageSheet( "assets/images/player.png", playerSheetInfo:getSheet() )
local guiSheetInfo = require("assets.images.ingameguii")
local guiSheet = graphics.newImageSheet("assets/images/ingameguii.png", guiSheetInfo:getSheet())


--physics
local physics = require ("physics")
physics.start()
physics.setGravity (0,0)

--groupings
local enemies = display.newGroup()
local asteroids = display.newGroup()

--globals vars
local gameActive = true
local levelProgress = 1
local numHit = 0
local shipMoveX = 0
local shipMoveY = 0
local ship
local speed = 2
local shootbtn
local numEnemy = 0 
local enemyArray = {}
local onCollision
local alloy = 75
local energy = 100
local gameovertxt
local asteroidTable = {}
local asteroidNum = 0
local canFireBullet = true



--global functions
local removeEnemies
local createGame
local createEnemy
local shoot = {}
local createShip
local newGame
local nextWave
local checkforProgress
local createAmmo
local setAmmoOn
local backgroundMusic
local createAsteroid

--audio
local shot = audio.loadSound("assets/sounds/laser.mp3")
--local backgroundsnd = audio.loadStream ("")

--background
local background = display.newImageRect("assets/images/level001wip.png", display.contentWidth, display.contentHeight) -- <PH> will be replaced by Sunday the 11th
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    


--scoring
textScore = display.newText("Alloy: ".. alloy, 15, 5, nil, 8)
textWave = display.newText("Energy: ".. energy, 22, 15, nil, 8)
textBullets = display.newText("Level: "..levelProgress, 15, 25, nil, 8)

--gamepad
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


-- --fire button
shootbtn = display.newSprite( guiSheet, {frames={guiSheetInfo:getFrameIndex("flatDark35")}})
shootbtn.x = display.contentWidth - 45
shootbtn.y = display.contentHeight - 55
shootbtn:scale(0.5, 0.5)

ultbtn = display.newSprite( guiSheet, {frames={guiSheetInfo:getFrameIndex("flatDark36")}})
ultbtn.x = display.contentWidth - 70
ultbtn.y = display.contentHeight - 25
ultbtn:scale(0.5, 0.5)




--create gamepad
local function stopShip(event)
	if event.phase == "ended" then
			shipMoveX = 0 
	end
	if event.phase == "ended" then
			shipMoveY = 0
	end
end

local function moveShip(event)
	ship.x = ship.x + shipMoveX
	ship.y = ship.y + shipMoveY
end



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

function shootBtntouch()
	shoot()
end

local function createWalls(event)
	if ship.x < 0 then
		ship.x = 0
	end
	if ship.x > display.contentWidth then
		ship.x = display.contentWidth
	end
	if ship.y < 0 then
		ship.y = 0
	end
	if ship.y > display.contentHeight then
		ship.y = display.contentHeight
	end
end



----------------------------------------------
--ship maker
function createShip()
	ship = display.newImage("assets/images/playerShip2_green.png")
	physics.addBody(ship, "static", {density = 1, friction = 0, bounce = 0});
	ship.x = 70
	ship.y = display.contentCenterY
	ship.rotation = 90
	ship.myName = "ship"
	ship:scale(0.5, 0.5)
end

--enemy maker
-- function createEnemy()
	-- numEnemy = numEnemy +1
	-- print(numEnemy)
					-- enemies:toFront()
					-- enemyArray[numEnemy] = display.newSprite( enemySheet , {frames={enemySheetInfo:getFrameIndex("enemyBlue5")}}) --<PH>
					-- physics.addBody(enemyArray[numEnemy] , {density= 0.5, friction = 0, bounce = 0 })
					-- enemyArray[numEnemy].myName = "enemy"
					-- local startingPosition = math.random(1,3)
					-- if (startingPosition == 1) then
						-- startingX = display.contentWidth + 10
						-- startyingY = math.random(0, display.contentHeight)
					-- elseif(startingPosition == 2)then
						-- startingX = math.random(0, display.contentWidth)
						-- startingY = -10
					-- else
						-- startingX = math.random(0, display.contentWidth)
						-- startingY = display.contentHeight +10
					-- end

					-- enemyArray[numEnemy].x = startingX
					-- enemyArray[numEnemy].y = startingY

					-- -- enemyArray[numEnemy] .y = startlocationY
					-- -- enemyArray.rotation = 180 --not working as intended
					-- -- enemyArray.numBullets = 5

					
					-- enemyArray[numEnemy]:scale(0.5, 0.5)

					 -- transition.to ( enemyArray[numEnemy] , {time = math.random (12000, 20000), x = ship.x +500, y= math.random (0, display.contentHeight)})
					 -- enemies:insert(enemyArray[numEnemy])
-- end



--shoot to kill yeah?
	function shoot(event)
		
		if(canFireBullet == true) then
			local bullet = display.newSprite( laserSheet , {frames={laserSheetInfo:getFrameIndex("laserBlue04")}})
			physics.addBody(bullet, "static", {density = 1, friction = 0, bounce = 0});
			bullet.x = ship.x + 40
    		bullet.y = ship.y
    		bullet.rotation = ship.rotation
			bullet.gravityScale = 0
   			bullet.name = 'bullet'
   			bullet.isBullet = true
			bullet.isSensor = true
			canFireBullet = false
			audio.play(shot)
   			
    		bullet:scale(0.5, 0.5)
			
			transition.to ( bullet, { time = 1000, x = 1000, y = ship.y, 
				onComplete = function(self) self.parent:remove(self); self = nil;
				
				end
				})
			
		else
			return
		end
			local function enableBulletFire()
				canFireBullet = true
			end
			timer.performWithDelay(300, enableBulletFire,1)
			
		
		
	end

--asteroid
-- function createAsteroid()
	-- asteroidNum = asteroidNum +1
	-- print(asteroidNum)
					-- asteroids:toFront()
					-- asteroidTable[asteroidNum] = display.newSprite( asteroidSheet , {frames={asteroidSheetInfo:getFrameIndex("meteorGrey_big2")}}) --<PH>
					-- physics.addBody(asteroidTable[asteroidNum] , {density= 0.5, friction = 0, bounce = 0 })
					-- asteroidTable[asteroidNum].myName = "asteroid"
					-- local startingPosition = math.random(1,3)
					-- if (startingPosition == 1) then
						-- startingX = display.contentWidth + 10
						-- startyingY = math.random(0, display.contentHeight)
					-- elseif(startingPosition == 2)then
						-- startingX = math.random(0, display.contentWidth)
						-- startingY = -10
					-- else
						-- startingX = math.random(0, display.contentWidth)
						-- startingY = display.contentHeight +10
					-- end

					-- asteroidTable[asteroidNum].x = startingX
					-- asteroidTable[asteroidNum].y = startingY

					-- asteroidTable[asteroidNum]:scale(0.5, 0.5)
					

					-- transition.to ( asteroidTable[asteroidNum] , {time = math.random (12000, 20000), x = ship.x +500, y= math.random (0, display.contentHeight)})
					-- asteroids:insert(asteroidTable[asteroidNum])
-- end


--collisions
function onCollision(event)
	if(event.object1.myName =="ship" and event.object2.myName =="enemy") then	
			
			
			local function setgameOver()
			composer.removeScene( "gameover", false )
			composer.gotoScene( "gameover", { effect = "crossFade", time = 333 } )
			
			end
			-- use setgameover after transition complete to avoid that user clicks gameover before the transition is completed
			transition.to( ship, { time=1500, xScale = 0.4, yScale = 0.4, alpha=0, onComplete=setgameOver  } )
			gameActive = false
			removeEnemies()
			audio.fadeOut(backgroundsnd)
			display.remove()
			
			
			
	end	
	
	if(event.object1.myName =="ship" and event.object2.myName =="ammo") then
		local function sizeBack()
		ship.xScale = 1.0
		ship.yScale = 1.0 
		end
		transition.to( ship, { time=500, xScale = 1.2, yScale = 1.2, onComplete = sizeBack  } )
		numBullets = numBullets + 3 
		textBullets.text = "Bullets "..numBullets
		event.object2:removeSelf()
		event.object2.myName=nil
		timer.cancel(rotationTimer)
		audio.play(ammosnd)
		
	end
 
	if((event.object1.myName=="enemy" and event.object2.myName=="bullet") or 
		(event.object1.myName=="bullet" and event.object2.myName=="enemy")) then
			event.object1:removeSelf()
			event.object1.myName=nil
			event.object2:removeSelf()
			event.object2.myName=nil
			score = score + 10
			textScore.text = "Score: "..score
			numHit = numHit + 1
			print ("numhit "..numHit)
			end
	if((event.object1.myName=="asteroid" and event.object2.myName== "bullet")or
		(event.object1.myName=="bullet" and event.object2.myName=="asteroid"))then
		event.object1:removeSelf()
		event.object1.myName=nil
		event.object2:removeSelf()
		event.object2.myName=nil
		score = score + 5
		textScore.text = "Score: "..score
		numHit = numHit + 1
		print("numhit "..numHit)
	end

	
end

--remove the dead ones
-- function removeEnemies()
	-- for i =1, #enemyArray do
		-- if (enemyArray[i].myName ~= nil) then
		-- enemyArray[i]:removeSelf()
		-- enemyArray[i].myName = nil
		-- end
	-- end
-- end

--remove destroyed asteroid
-- function removeAsteroid()
	-- for i = 1, #asteroidTable do
		-- if( asteroidTable[i].myName~= nil) then
			-- asteroidTable[i]:removeSelf()
			-- asteroidTable[i].myName = nil
		-- end
	-- end
-- end



--more fun stuff
function nextWave (event)
	display.remove(event.target)
	numHit = 0
	gameActive = true 
end
 

 
 
local function checkforProgress()
		if numHit == waveProgress then
			gameActive = false
			audio.play(wavesnd)
			removeEnemies()
			waveTxt = display.newText(  "Wave "..waveProgress.. " Completed", cWidth-80, cHeight-100, nil, 20 )
			waveProgress = waveProgress + 1
			textWave.text = "Wave: "..waveProgress
			print("wavenumber "..waveProgress)
			waveTxt:addEventListener("tap",  nextWave)
end

-- remove enemies which are not shot
	
	
end

--music time

-- function backgroundMusic()
-- 	audio.play (backgroundsnd, { loops = -1})
-- 	audio.setVolume(0.5, {backgroundsnd} ) 	
-- end

-- heart of the game
function startGame()
createShip()
-- createAsteroid()

-- backgroundMusic()
 
-- shootbtn:addEventListener ( "tap", shoot:tap )

shootbtn:addEventListener("touch", shootBtntouch)
rightArrow:addEventListener ("touch", rightArrowtouch)
leftArrow:addEventListener("touch", leftArrowtouch)
upArrow:addEventListener("touch", upArrowtouch)
downArrow:addEventListener("touch", downArrowtouch)
Runtime:addEventListener("enterFrame", createWalls)
Runtime:addEventListener("enterFrame", moveShip)
Runtime:addEventListener("touch", stopShip)
Runtime:addEventListener("collision" , onCollision)
 
timer.performWithDelay(5000, ammoStatus,0)
timer.performWithDelay ( 5000, setAmmoOn, 0 )
timer.performWithDelay(300, checkforProgress,0)
 
end
 
startGame()
 
return scene