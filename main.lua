-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require( "widget" )
local ads = require( "ads" )
local store = require( "store" )
local gameNetwork = require("gameNetwork")
local utility = require( "utility" )
local myData = require( "mydata" )
local device = require( "device" )

_G.playerShip=""

display.setStatusBar( display.HiddenStatusBar )


centerX = display.contentWidth / 2
centerY = display.contentHeight / 2
withScrn = display.contentWidth
heightScrn = display.contentHeight
topScrn = display.screenOriginY
leftScrn = display.screenOriginX

 
 

 
local splash = display.newImage ("assets/images/iPad-Splashv33.png")
splash.x = centerX
splash.y = centerY

 
local function endSplash ()
 
    splash:removeSelf()
    splash = nil
 
   
 
    composer.gotoScene ( "menu", { effect = "zoomOutIn"} )
end 
 
timer.performWithDelay(3000, endSplash)









math.randomseed( os.time() )

if device.isAndroid then
	widget.setTheme( "widget_theme_android_holo_light" )
    store = require("plugin.google.iap.v3")
end

--
-- Load saved in settings
--
myData.settings = utility.loadTable("settings.json")
if myData.settings == nil then
	myData.settings = {}
	myData.settings.soundOn = true
	myData.settings.musicOn = true
    myData.settings.isPaid = false
	myData.settings.currentLevel = 1
	myData.settings.unlockedLevels = 20
    myData.settings.bestScore = 0
	myData.settings.levels = {}
	utility.saveTable(myData.settings, "settings.json")
end
if myData.settings.bestScore == nil then
    myData.settings.bestScore = 0
end


local function onKeyEvent( event )

    local phase = event.phase
    local keyName = event.keyName
    print( event.phase, event.keyName )

    if ( "back" == keyName and phase == "up" ) then
        if ( composer.getCurrentSceneName() == "menu" ) then
            native.requestExit()
        else
            composer.gotoScene( "menu", { effect="crossFade", time=500 } )
        end
        return true
    end
    return false
end

--add the key callback
if device.isAndroid then
    Runtime:addEventListener( "key", onKeyEvent )
end
--Game Music Goes here
-- Define music variables
local gameMusic = audio.loadStream( "assets/sounds/looperman-l-0671112-0089763-danke-cosmic-signs.wav" )
 
-- Play the music
local gameMusicChannel = audio.play( gameMusic, { loops = -1 } )

--
-- handle system events
--
local function systemEvents(event)
    print("systemEvent " .. event.type)
    if event.type == "applicationSuspend" then
        utility.saveTable( myData.settings, "settings.json" )
    elseif event.type == "applicationResume" then
        -- 
        -- login to gameNetwork code here
        --
    elseif event.type == "applicationExit" then
        utility.saveTable( myData.settings, "settings.json" )
    elseif event.type == "applicationStart" then
        --
        -- Login to gameNetwork code here
        --
        --
        -- Go to the menu
        --
        composer.gotoScene( "menu", { time = 250, effect = "fade" } )
    end
    return true
end
Runtime:addEventListener("system", systemEvents)
