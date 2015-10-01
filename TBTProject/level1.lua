-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

--vars-----------------------------------------------------------------------------------
local playerSpeedY = 0
local playerSpeedX = 0
local playerMoveSpeed = 7
local playerWidth  = 60
local playerHeight = 48
local bulletWidth  = 8
local bulletHeight =  19
local asteroidHeight = 81
local asteroidWidth = 100
local numberofEnemysToGenerate = 0
local numberOfEnemysGenerated = 0
local playerBullets = {} -- Holds all the bullets the player fires
local enemyBullets = {} -- Hold the bullets from "all" enemy ships
local asteroid = {} --  Holds all the asteroids
local shipGrid = {} -- Holds 0 or 1 (11 of them for making a grid system)
local enemyShips = {}  -- Holds all of the enemy planes
local livesImages = {}  -- Holds all of the "free life" images
local numberOfLives = 3
local freeLifes = {} -- Holds all the ingame free lives
local playerIsInvincible = false --for debugs
local gameOver = false
local numberOfTicks = 0 -- A number that is incremented each frame of the game
local asteroidGroup -- A group to hold all of the asteroids
local shipGroup -- A group that holds all the ships, bullets, etc
local player
local shipSoundChannel -- SoundChannel for the 
local firePlayerBulletTimer
local generateAsteroidTimer
local fireEnemyBulletsTimer
local generateFreeLifeTimer
local rectUp -- The "up" control on the DPAD
local rectDown -- The "down" control on the DPAD
local rectLeft -- The "left" control on the DPAD
local rectRight -- The "right" control on the DPAD
-----------------------------------------------------------------------------------------


return scene