--requirements
local composer = require("composer")
composer.isDebug = true


--scene
local scene = composer.newScene()

--local vars
local starFieldGenerator = require("starfieldgenerator")
local physics = require("physics")
local gameData = require( "game" )
physics.start()
local player
local playerHeight = 125
local playerWidth = 94
local invaderSize = 32 -- The width and height of the invader image
local leftBounds = 30 -- the left margin
local rightBounds = display.contentWidth - 30 -- the right margin
local spawnTimer
local spawnedObjects = {}
local asteroidSpeed = 10
local invaderHalfWidth = 16
local invaders = {} -- Table that holds all the invaders
local invaderSpeed = 5 --how fast the enemy moves
local playerBullets = {} -- Table that holds the players Bullets
local canFireBullet = true
local invadersWhoCanFire = {} -- Table that holds the invaders that are able to fire bullets
local invaderBullets = {}
local numberOfLives = 3
local playerIsInvincible = false -- to debug colliders and other stuff
local rowOfInvadersWhoCanFire = 5
local invaderFireTimer -- timer used to fire invader bullets
local gameIsOver = true; -- debug the game over function
local drawDebugButtons = {}  --Temporary buttons to move player in simulator
local enableBulletFireTimer -- timer that enables player to fire
local score -- game score
--------------------------------------------------------------------------------------------------------------

--spawn systems
local spawnParams = {
    xMin = 0,
    xMax = 700,
    yMin = 0,
    yMax = 5,
    spawnTime = 200,
    spawnOnTimer =12,
    spawnInitial = 4 -- can be changed
}

local function spawnItem( bounds )

    -- create sample item
    local item = display.newCircle( 0, 0, 30 )
    item:setFillColor( .5, .1, .5)
    
    -- position item randomly within set bounds
    item.x = math.random( bounds.xMin, bounds.xMax )
    item.y = math.random( bounds.yMin, bounds.yMax )

    -- add item to spawnedObjects table for tracking purposes
    spawnedObjects[#spawnedObjects+1] = item
end


-- Spawn controller
local function spawnController( action, params )

    -- cancel timer on "start" or "stop", if it exists
    if ( spawnTimer and ( action == "start" or action == "stop" ) ) then
        timer.cancel( spawnTimer )
    end

    -- Start spawning
    if ( action == "start" ) then

        -- gather/set spawning bounds
        local spawnBounds = {}
        spawnBounds.xMin = params.xMin or 0
        spawnBounds.xMax = params.xMax or display.contentWidth
        spawnBounds.yMin = params.yMin or 0
        spawnBounds.yMax = params.yMax or display.contentHeight
        -- gather/set other spawning params
        local spawnTime = params.spawnTime or 1000
        local spawnOnTimer = params.spawnOnTimer or 50
        local spawnInitial = params.spawnInitial or 0

        -- if spawnInitial > 0, spawn n item(s) instantly
        if ( spawnInitial > 0 ) then
            for n = 1,spawnInitial do
                spawnItem( spawnBounds )
            end
        end

        -- start repeating timer to spawn items
        if ( spawnOnTimer > 0 ) then
            spawnTimer = timer.performWithDelay( spawnTime,
                function() spawnItem( spawnBounds ); end,
            spawnOnTimer )
        end
    
    -- Pause spawning
    elseif ( action == "pause" ) then
        timer.pause( spawnTimer )

    -- Resume spawning
    elseif ( action == "resume" ) then
        timer.resume( spawnTimer )

    end
end

spawnController ("start", spawnParams)
--------------------------------------------------------------------------------------------------------------
--player functions

function setupPlayer()
    local options = { width = playerWidth,height = playerHeight,numFrames = 2}
    local playerSheet = graphics.newImageSheet( "player.png", options )
    local sequenceData = {
     {  start=2, count=2, time=300,   loopCount=0 }
    }
    player = display.newSprite( playerSheet, sequenceData )
    player.name = "playeranim"
    player.x = display.contentCenterX- playerWidth /2 
    player.y = display.contentHeight - playerHeight - 10
    player:play()
    scene.view:insert(player)
   -- local physicsData = (require "shapedefs").physicsData(1.0) --notfound?
    --physics.addBody( player, physicsData:get("player"))
    player.gravityScale = 0
end
--redo all of setupPlayer with new code after implementing CC0 content from Kenny.nl

function firePlayerBullet()
    if(canFireBullet == true)then
        local tempBullet = display.newImage("laser.png", player.x, player.y - playerHeight/ 2)
        tempBullet.name = "playerBullet"
        scene.view:insert(tempBullet)
        physics.addBody(tempBullet, "dynamic" )
        tempBullet.gravityScale = 0
        tempBullet.isBullet = true
        tempBullet.isSensor = true
        tempBullet:setLinearVelocity( 0,-400)
        table.insert(playerBullets,tempBullet)
        local laserSound = audio.loadSound( "laser.mp3" )
        local laserChannel = audio.play( laserSound )
        audio.dispose(laserChannel)
        canFireBullet = false
 
    else
        return
    end
    local function enableBulletFire()
        canFireBullet = true
    end
    timer.performWithDelay(300,enableBulletFire,1)
end

function killPlayer()
    numberOfLives = numberOfLives- 1;
      if(numberOfLives <= 0) then
        gameData.invaderNum  = 1
        composer.gotoScene("start")
    else
        playerIsInvincible = true
        spawnNewPlayer()
    end
end

function spawnNewPlayer()
    local numberOfTimesToFadePlayer = 5
    local numberOfTimesPlayerHasFaded = 0
     
    local  function fadePlayer()
        player.alpha = 0;
        transition.to( player, {time=400, alpha=1,  })
        numberOfTimesPlayerHasFaded = numberOfTimesPlayerHasFaded + 1
        if(numberOfTimesPlayerHasFaded == numberOfTimesToFadePlayer) then
            playerIsInvincible = false
        end
    end
     
  fadePlayer()
  timer.performWithDelay(400, fadePlayer,numberOfTimesToFadePlayer)
end
--------------------------------------------------------------------------------------------------------------

--debug function
function drawDebugButtons()
    local function movePlayer(event)
        if(event.target.name == "left") then
            player.x = player.x - 5
        elseif(event.target.name == "right") then
            player.x = player.x + 5
        end
    end
    local left = display.newRect(60,700,50,50)
    left.name = "left"
    scene.view:insert(left)
    local right = display.newRect(display.contentWidth-60,700,50,50)
    right.name = "right"
    scene.view:insert(right)
    left:addEventListener("tap", movePlayer)
    right:addEventListener("tap", movePlayer)
end

-----------------------------------------------------------------------------------------------------------------------------------
--remove off screen bullets
function checkPlayerBulletsOutOfBounds()
    if(#playerBullets > 0)then
        for i = #playerBullets,1,-1 do
            if(playerBullets[i].y < 0) then
                playerBullets[i]:removeSelf()
                playerBullets[i] = nil
                table.remove(playerBullets,i)
            end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------
--enemy functions
-- function setupInvaders()  -- change this to spawn enemies
--     local xPositionStart =display.contentCenterX - invaderHalfWidth - (gameData.invaderNum *(invaderSize + 10))
--     local numberOfInvaders = gameData.invaderNum *2+1 
--     for i = 1, gameData.rowsOfInvaders do
--         for j = 1, numberOfInvaders do
--             local tempInvader = display.newImage("invader.png",xPositionStart + ((invaderSize+10)*(j-1)), i * 46 )
--             tempInvader.name = "invader"
--             if(i== gameData.rowsOfInvaders)then
--                 table.insert(invadersWhoCanFire,tempInvader)
--             end
--             physics.addBody(tempInvader, "dynamic" )
--             tempInvader.gravityScale = 0
--             tempInvader.isSensor = true
--             scene.view:insert(tempInvader)
--             table.insert(invaders,tempInvader)
--         end
--     end
-- end
-- --this will be changed
-- --setup individual enemies as own code for dev build (031015) will use one enemy and one set of asteroids

-- function moveInvaders()
--     local changeDirection = false
--     for i=1, #invaders do
--           invaders[i].x = invaders[i].x + invaderSpeed
--         if(invaders[i].x > rightBounds - invaderHalfWidth or invaders[i].x < leftBounds + invaderHalfWidth) then
--             changeDirection = true;
--         end
--      end
--     if(changeDirection == true)then
--         invaderSpeed = invaderSpeed*-1
--         for j = 1, #invaders do
--             invaders[j].y = invaders[j].y+ 46
--         end
--         changeDirection = false;
--     end 
-- end



-- function checkInvaderBulletsOutOfBounds()
--     if (#invaderBullets > 0) then
--         for i=#invaderBullets,1,-1 do
--             if(invaderBullets[i].y > display.contentHeight) then
--                 invaderBullets[i]:removeSelf()
--                 invaderBullets[i] = nil
--                 table.remove(invaderBullets,i)
--             end
--         end
--     end
-- end

--------------------------------------------------------------------------------------------------------------------------
--asteroids
--will spawn asteroids
-- function setupAsteroids()
--     local spawnController("start", spawnParams)
--     local numberofAsteroids = gameData.asteroidNum *2+1
--     for  i =1, gameData.astroidMax do
--         for j = 1, numberofAsteroids do
--             local tempAsteroid display.newCircle(xPositionStart + ((asteroidSize+10)*(j-1)), i*46)
--             tempAsteroid.name = "asteroid"
--             physics.addBody(tempAsteroid, "dynamic")
--             tempAsteroid.gravityScale = 0
--             tempAsteroid.isSensor = true
--             scene.view:insert(tempAsteroid)
--             table.insert(asteroids, tempAsteroid)
--         end
--     end
-- end

-- function moveAsteroids()
--     local changeDirection = false
--     for i=1, #asteroids 
--            asteroids[i].x = asteroids[i].x + asteroidSpeed
--         if(asteroids[i].x > rightBounds - asteroidHalfWidth or asteroid[i].x < leftBounds + asteroidHalfWidth) then
--             changeDirection = true;
--         end
--     end
--     if(changeDirection == true)then
--         asteroidSpeed = asteroidSpeed*-1
--         for j =1 #asteroids do
--             asteroids[j].y = asteroids[j].y+46
--         end
--         changeDirection = false;
--     end
-- end

--------------------------------------------------------------------------------------------------------------------------
--loop function
function gameLoop()
    checkPlayerBulletsOutOfBounds()
    -- moveInvaders()
    -- checkInvaderBulletsOutOfBounds()
end
--------------------------------------------------------------------------------------------------------------------------
--colliders
-- function onCollision(event)
--     local function removeInvaderAndPlayerBullet(event)
--         local params = event.source.params
--         local invaderIndex = table.indexOf(invaders,params.theInvader)
--         local invadersPerRow = gameData.invaderNum *2+1
--         if(invaderIndex > invadersPerRow) then
--             table.insert(invadersWhoCanFire, invaders[invaderIndex - invadersPerRow])
--        end
--         params.theInvader.isVisible = false
--         physics.removeBody(  params.theInvader )
--         table.remove(invadersWhoCanFire,table.indexOf(invadersWhoCanFire,params.theInvader))
         
--         if(table.indexOf(playerBullets,params.thePlayerBullet)~=nil)then
--             physics.removeBody(params.thePlayerBullet)
--             table.remove(playerBullets,table.indexOf(playerBullets,params.thePlayerBullet))
--             display.remove(params.thePlayerBullet)
--             params.thePlayerBullet = nil
--         end
--       end
       
--       if ( event.phase == "began" ) then
--             if(event.object1.name == "invader" and event.object2.name == "playerBullet")then
--                 local tm = timer.performWithDelay(10, removeInvaderAndPlayerBullet,1)
--                 tm.params = {theInvader = event.object1 , thePlayerBullet = event.object2}
--             end
          

--       if(event.object1.name == "playerBullet" and event.object2.name == "invader") then
--            local tm = timer.performWithDelay(10, removeInvaderAndPlayerBullet, 1)
--            tm.params = {thePlayerBullet = event.object1 , theInvader = event.object2}
--       end

--       if(event.object1.name == "player" and event.object2.name == "invaderBullet") then
--             table.remove(invaderBullets,table.indexOf(invaderBullets,event.object2))
--             event.object2:removeSelf()
--             event.object2 = nil
--             if(playerIsInvincible == false) then
--               killPlayer()
--             end
--             return
--         end
         
--         if(event.object1.name == "invaderBullet" and event.object2.name == "player") then
--             table.remove(invaderBullets,table.indexOf(invaderBullets,event.object1))
--             event.object1:removeSelf()
--             event.object1 = nil
--             if(playerIsInvincible == false) then
--                 killPlayer()
--             end
--             return
--         end
      
--        if(event.object1.name == "player" and event.object2.name == "invader") then
--             numberOfLives = 0
--             killPlayer()
--         end
         
--          if(event.object1.name == "invader" and event.object2.name == "player") then
--             numberOfLives = 0
--             killPlayer()
--         end

--       if(table.indexOf(params.thePlayerBullet)~=nil)then
--             physics.removeBody(playerBullets, params.thePlayerBullet)
--             table.remove(playerBullets,table.indexOf(playerBullets,params.thePlayerBullet))
--             display.remove(params.thePlayerBullet)
--             params.thePlayerBullet = nil
--         end
  
  
--     end
-- end

----------------------------------------------------------------------------------------------------------------------------------------
--level completion
-- function levelComplete()
--     gameData.invaderNum = gameData.invaderNum + 1
--     if(gameData.invaderNum <= gameData.maxLevels) then
--         composer.gotoScene("gameover")
--     else
--         gameData.invaderNum = 1
--         composer.gotoScene("start")
--     end
-- end

-----------------------------------------------------------------------------------------------------------------------------------------


--create scene
function scene:create(event)
    local group = self.view
    starGenerator = starFieldGenerator.new(200,group,5)
    setupPlayer()
end

--scene show
function scene:show(event)
    local phase = event.phase
    local previousScene = composer.getSceneName("previous")
  a  composer.removeScene(previousScene)
    local group = self.view
    if (phase == "did") then
        Runtime:addEventListener("enterFrame", gameLoop)
        Runtime:addEventListener("enterFrame", starGenerator)
        Runtime:addEventListener("tap", firePlayerBullet)
      --  Runtime:addEventListener("collision", onCollison)
        invaderFireTimer = timer.performWithDelay(1500, fireInvaderBullet, -1)
    end
end

--hide scene
function scene:hide (event)
    local phase = event.phase
    local group = self.view
    if ( phase == "will" ) then
        Runtime:removeEventListener("enterFrame", gameLoop)
        Runtime:removeEventListener("enterFrame", starGenerator)
        Runtime:removeEventListener("tap", firePlayerBullet)
      --  Runtime:removeEventListener("collision", onCollision)
        timer.cancel(invaderFireTimer)
    end
end

function fireInvaderBullet()
    if(#invadersWhoCanFire >0) then
        local randomIndex = math.random(#invadersWhoCanFire)
        local randomInvader = invadersWhoCanFire[randomIndex]
        local tempInvaderBullet = display.newImage("laser.png", randomInvader.x , randomInvader.y + invaderSize/2)
        tempInvaderBullet.name = "invaderBullet"
        scene.view:insert(tempInvaderBullet)
        physics.addBody(tempInvaderBullet, "dynamic" )
        tempInvaderBullet.gravityScale = 0
        tempInvaderBullet.isBullet = true
        tempInvaderBullet.isSensor = true
        tempInvaderBullet:setLinearVelocity( 0,400)
        table.insert(invaderBullets, tempInvaderBullet)
    else
        -- levelComplete()
    end  
end


--listeners
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene