-------------------------------------------------------------------------------
--
-- <scene>.lua
--
-------------------------------------------------------------------------------

local sceneName = ...

local composer = require( "composer" )
local gamelogic = require( "level1" )

-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )

-------------------------------------------------------------------------------


function startTimers()
    firePlayerBulletTimer = timer.performWithDelay(2000, firePlayerBullet, -1)
    generateAsteroidTimer = timer.performWithDelay( 5000, generateAsteroid ,-1)
 --   generateFreeLifeTimer = timer.performWithDelay(7000,generateFreeLife, - 1)
end

--create scene information
function scene:create()
    local shipSound = audio.loadStream("shipsound.mp3")
    shipSoundChannel = audio.play( shipSound, {loops =-1} )
    Runtime:addEventListener("enterFrame", gameLoop)
    startTimers()
end

--fire at enemies
function firePlayerBullet()
    local tempBullet = display.newImage("bullet.png", (player.x+player.Width/2) - bulletWidth,player.y-bulletHeight)
    table.insert(playerBullets,tempBullet);
    shipGroup:insert(tempBullet)
end

function movePlayerBullets()
    if(#playerBullets > 0) then
        for i=1,#playerBullets do
            playerBullets[i]. y = playerBullets[i].y - 7
    end
   end
end



function checkPlayerBulletsOutOfBounds()
 if(#playerBullets > 0) then
     for i=#playerBullets,1,-1 do
            if(playerBullets[i].y < -18) then
        playerBullets[i]:removeSelf()
        playerBullets[i] = nil
        table.remove(playerBullets,i)
            end
       end
     end
end

function generateAsteroid()
    local tempRock = display.newImage("asteroid1.png", math.random(0,display.contentWidth - asteroidWidth),-asteroidHeight)
    table.insert(asteroid,tempRock)
    asteroidGroup:insert( tempRock )
end

function moveAsteroid()
if(#islands > 0) then
    for i=1, #islands do
        asteroid[i].y = asteroid[i].y + 3
   end
  end
end

function  checkAsteroidOutOfBounds() 
    if(#islands > 0) then
        for i=#asteroid,1,-1 do
            if(asteroid[i].y > display.contentHeight) then
            asteroid[i]:removeSelf()
        asteroid[i] = nil
        table.remove(asteroid,i)
    end
      end
  end
end

--ships extra lives can be decided upon before implementation. 
--code already setup and awaiting decisions.

--function generateFreeLife ()
--    if(numberOfLives >= 6) then
--    return
--   end
--   local freeLife = display.newImage("newlife.png", math.random(0,display.contentWidth - 40), 0);
--   table.insert(freeLifes,freeLife)
--   shipGroup:insert(freeLife)
--end 
function moveFreeLifes()
    if(#freeLifes > 0) then
    for i=1,#freeLifes do
        freeLifes[i].y = freeLifes[i].y  +5
    end
   end
end

function  checkFreeLifesOutOfBounds() 
    if(#freeLifes > 0) then
        for i=#freeLifes,1,-1 do
            if(freeLifes[i].y > display.contentHeight) then
            freeLifes[i]:removeSelf()
        freeLifes[i] = nil
        table.remove(freeLifes,i)
       end
    end
     end
 end

 --collisions
 function hasCollided( obj1, obj2 )
   if ( obj1 == nil ) then 
      return false
   end
   if ( obj2 == nil ) then  
      return false
   end
 
   local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
   local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
   local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
   local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
 
   return (left or right) and (up or down)
end

--more collisons
function checkPlayerCollidesWithFreeLife() 
    if(#freeLifes > 0) then
        for i=#freeLifes,1,-1 do
         if(hasCollided(freeLifes[i], player)) then
            freeLifes[i]:removeSelf()
        freeLifes[i] = nil
        table.remove(freeLifes, i)
        numberOfLives = numberOfLives + 1
        hideLives()
        showLives()
        end
    end
    end
end

function hideLives()
    for i=1, 6 do
        livesImages[i].isVisible = false
   end
end

function showLives()
    for i=1, numberOfLives do
        livesImages[i].isVisible = true;
    end
end
