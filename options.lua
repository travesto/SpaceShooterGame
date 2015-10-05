local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local myData = require( "mydata" )
local utility = require( "utility" ) 
local device = require( "device" )

local params
if device.isAndroid then
    widget.setTheme( "widget_theme_android_holo_dark" )
end

-- Handle press events for the switches
local function onSoundSwitchPress( event )
    local switch = event.target

    if switch.isOn then
        myData.settings.soundOn = true
    else
        myData.settings.soundOn = false
    end
    utility.saveTable(myData.settings, "settings.json")
end

local function onMusicSwitchPress( event )
    local switch = event.target

    if switch.isOn then
        myData.settings.musicOn = true
    else
        myData.settings.musicOn = false
    end
    utility.saveTable(myData.settings, "settings.json")
end

-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.gotoScene("menu", { effect = "crossFade", time = 333 })
    end
end

--
-- Start the composer event handlers
--
function scene:create( event )
    local sceneGroup = self.view

    params = event.params
        
    --
    -- setup a page background, really not that important though composer
    -- crashes out if there isn't a display object in the view.
    --
   local background = display.newImageRect("blue.png", display.contentWidth, display.contentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    sceneGroup:insert( background )

    local title = display.newText("Galaxy", 100, 32, native.systemFontBold, 32 )
    title.x = display.contentCenterX
    title.y = 40
    title:setFillColor( 0,1,0 )
    sceneGroup:insert( title )
	
	local versionText = display.newText("Version 0.3 Build (051015)Development", 12, 12, native.systemFont, 8)
	versionText.x = 75
	versionText.y = 350
	versionText:setFillColor(0,1,0)
	sceneGroup:insert(versionText)

    local soundLabel = display.newText("Sound Effects", 100, 32, native.systemFont, 18 )
    soundLabel.x = display.contentCenterX - 75
    soundLabel.y = 130
    soundLabel:setFillColor( 0,1,0 )
    sceneGroup:insert( soundLabel )

    local soundOnOffSwitch = widget.newSwitch({
        style = "onOff",
        id = "soundOnOffSwitch",
        initialSwitchState = myData.settings.soundOn,
        onPress = onSoundSwitchPress
    })
    soundOnOffSwitch.x = display.contentCenterX + 100
    soundOnOffSwitch.y = soundLabel.y
    sceneGroup:insert( soundOnOffSwitch )

    local musicLabel = display.newText("Music", 100, 32, native.systemFont, 18 )
    musicLabel.x = display.contentCenterX - 75
    musicLabel.y = 180
    musicLabel:setFillColor( 0,1,0 )
    sceneGroup:insert( musicLabel )

    local musicOnOffSwitch = widget.newSwitch({
        style = "onOff",
        id = "musicOnOffSwitch",
        initialSwitchState = myData.settings.musicOn,
        onPress = onMusicSwitchPress
    })
    musicOnOffSwitch.x = display.contentCenterX + 100
    musicOnOffSwitch.y = musicLabel.y
    sceneGroup:insert( musicOnOffSwitch )

    -- Create the widget
    local doneButton = widget.newButton({
        id = "button1",
        label = "Done",
        width = 100,
        height = 32,
        onEvent = handleButtonEvent
    })
    doneButton.x = display.contentCenterX 
    doneButton.y = display.contentHeight - 40
    sceneGroup:insert( doneButton )

end

function scene:show( event )
    local sceneGroup = self.view

    params = event.params

    if event.phase == "did" then
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    
    if event.phase == "will" then
    end

end

function scene:destroy( event )
    local sceneGroup = self.view
    
end

---------------------------------------------------------------------------------
-- END OF IMPLEMENTATION
---------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
