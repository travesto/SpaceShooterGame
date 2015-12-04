local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local utility = require( "utility" )
local ads = require( "ads" )

local params

local myData = require( "mydata" )



local function handlePlayButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.removeScene( "game", false )
        composer.gotoScene("game", { effect = "crossFade", time = 333 })
    end
end

local function handlePlayerButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.removeScene("playerselect", false )
        composer.gotoScene("playerselect", {effect = "crossFade", time = 333})
    end
end

-- local function handleHelpButtonEvent( event )
    -- if ( "ended" == event.phase ) then
        -- composer.gotoScene("help", { effect = "crossFade", time = 333, isModal = true })
    -- end
-- end

local function handleCreditsButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.gotoScene("credits", { effect = "crossFade", time = 333 })
    end
end

local function handleSettingsButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.gotoScene("options", { effect = "crossFade", time = 333 })
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
    local background = display.newImageRect("assets/images/Main_Menu_Background.png", display.contentWidth, display.contentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    sceneGroup:insert( background )

    -- local title = display.newText("Galaxy", 100, 32, native.systemFontBold, 32 )
    -- title.x = display.contentCenterX
    -- title.y = 40
    -- title:setFillColor( 0,1,0 )
    -- sceneGroup:insert( title )
	---------------------------------------------------------------------------------------------------------------------------------------------------------------
	local versionText = display.newText("Version 0.8.9.2 (041215) Development", 12, 12, native.systemFont, 8)
	versionText.x = 75
	versionText.y = 350
	versionText:setFillColor(0,1,0)
	sceneGroup:insert(versionText)
	--[[
    -- Create the widget
    local playButton = widget.newButton({
        id = "button1",
        label = "Play",
       	width = 100,
        height = 32,
		onEvent = handlePlayButtonEvent,
		labelColor = {default = { 1,1,1}, over = {1,1,1}}
    })
    playButton.x = display.contentCenterX
    playButton.y = display.contentCenterY - 10
    sceneGroup:insert( playButton )
    ]]

    -- Create playerselect widget
    local playerButton = widget.newButton({
        id = "button3",
        label = "Play",
        width = 100,
        height = 32,
        onEvent = handlePlayerButtonEvent,
        labelColor = {default = { 1,1,1}, over = {1,1,1}}
    })
    playerButton.x = display.contentCenterX
    playerButton.y = display.contentCenterY -10
    sceneGroup:insert (playerButton)
    
    -- Create the widget
    local settingsButton = widget.newButton({
        id = "button2",
        label = "Settings",
        width = 100,
        height = 32,
        onEvent = handleSettingsButtonEvent,
		labelColor = {default = { 1,1,1}, over = {1,1,1}}
    })
    settingsButton.x = display.contentCenterX
    settingsButton.y = display.contentCenterY + 50
    sceneGroup:insert( settingsButton )

    -- -- Create the widget
    -- local helpButton = widget.newButton({
        -- id = "button3",
        -- label = "Help",
        -- width = 100,
        -- height = 32,
        -- onEvent = handleHelpButtonEvent
    -- })
    -- helpButton.x = display.contentCenterX
    -- helpButton.y = display.contentCenterY + 30
    -- sceneGroup:insert( helpButton )

    -- Create the widget
    -- local creditsButton = widget.newButton({
        -- id = "button4",
        -- label = "Credits",
        -- width = 100,
        -- height = 32,
        -- onEvent = handleCreditsButtonEvent
    -- })
    -- creditsButton.x = display.contentCenterX
    -- creditsButton.y = display.contentCenterY + 90
    -- sceneGroup:insert( creditsButton )

end

function scene:show( event )
    local sceneGroup = self.view

    params = event.params
    utility.print_r(event)

    if params then
        print(params.someKey)
        print(params.someOtherKey)
    end

    if event.phase == "did" then
        composer.removeScene( "game" ) 
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
