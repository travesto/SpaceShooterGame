local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local utility = require( "utility" )
local myData = require( "mydata" )

local params

--local sprite sheet

 local playerSheetInfo = require("assets.images.player")
 local playerSheet = graphics.newImageSheet( "assets/images/player.png", playerSheetInfo:getSheet() )

local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.removeScene( "menu", false )
        composer.gotoScene( "menu", { effect = "crossFade", time = 333 } )
    end
end

local function handleLevelSelect( event )

    if ( "ended" == event.phase ) then
        -- set the current level to the ID of the selected level
        myData.settings.currentLevel = event.target.id
        composer.removeScene( "level001", false ) --demo will be used to test certain settings and features with out damaging actual level functionality
        composer.gotoScene( "level001", { effect = "crossFade", time = 333 } ) --demo will be used to test certain settings and features with out damaging actual level functionality
    end
end

local function handleLevelSelect2( event )

    if ( "ended" == event.phase ) then
        -- set the current level to the ID of the selected level
        myData.settings.currentLevel = event.target.id
        composer.removeScene( "level002", false ) --demo will be used to test certain settings and features with out damaging actual level functionality
        composer.gotoScene( "level002", { effect = "crossFade", time = 333 } ) --demo will be used to test certain settings and features with out damaging actual level functionality
    end
end

local function handleLevelSelect3( event )

    if ( "ended" == event.phase ) then
        -- set the current level to the ID of the selected level
        myData.settings.currentLevel = event.target.id
        composer.removeScene( "level003", false ) --demo will be used to test certain settings and features with out damaging actual level functionality
        composer.gotoScene( "level003", { effect = "crossFade", time = 333 } ) --demo will be used to test certain settings and features with out damaging actual level functionality
    end
end

local function handleLevelSelect4( event )

    if ( "ended" == event.phase ) then
        -- set the current level to the ID of the selected level
        myData.settings.currentLevel = event.target.id
        composer.removeScene( "level004", false ) --demo will be used to test certain settings and features with out damaging actual level functionality
        composer.gotoScene( "level004", { effect = "crossFade", time = 333 } ) --demo will be used to test certain settings and features with out damaging actual level functionality
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
   local background = display.newImageRect("assets/images/blue.png", display.contentWidth, display.contentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    sceneGroup:insert( background )

    local selectLevelText = display.newText("Select a ship", 125, 32, native.systemFontBold, 32)
    selectLevelText:setFillColor( 0,1,0 )
    selectLevelText.x = display.contentCenterX
    selectLevelText.y = 50
    sceneGroup:insert(selectLevelText)
	
	local versionText = display.newText("Version 0.4 Build (131015)Development", 12, 12, native.systemFont, 8)
	versionText.x = 75
	versionText.y = 350
	versionText:setFillColor(0,1,0)
	sceneGroup:insert(versionText)



		
		
	local shipButton1 = widget.newButton
	{
		width = 99,
		height = 75,
		defaultFile = "assets/images/playerShip1_red.png",
		
		onEvent = handleLevelSelect
	}
	
	local shipButton2 = widget.newButton
	{
		width = 112,
		height = 75,
		defaultFile = "assets/images/playerShip2_green.png" ,
		
		onEvent = handleLevelSelect2
	}
	
	local shipButton3 = widget.newButton
	{
		width = 98,
		height = 75,
		defaultFile = "assets/images/playerShip3_orange.png",
		
		onEvent = handleLevelSelect3
	}
	
	local shipButton4 = widget.newButton
	{
		width = 91,
		height = 91,
		defaultFile = "assets/images/ufoYellow.png",
		
		onEvent = handleLevelSelect4
	}
	
	
        shipButton1.x = 55
		shipButton1.y = 125
		
		shipButton2.x = 180
		shipButton2.y = 125
		
		shipButton3.x = 300
		shipButton3.y = 125
		
		shipButton4.x = 425
		shipButton4.y = 125
		
        
    
    sceneGroup:insert(shipButton1)
	sceneGroup:insert(shipButton2)
	sceneGroup:insert(shipButton3)
	sceneGroup:insert(shipButton4)

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
