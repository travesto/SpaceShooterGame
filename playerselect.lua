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
	
	local versionText = display.newText("Version 0.3 Build (051015)Development", 12, 12, native.systemFont, 8)
	versionText.x = 75
	versionText.y = 350
	versionText:setFillColor(0,1,0)
	sceneGroup:insert(versionText)

    --local x = 90
    --local y = 115
    local x = 0
    local y = 0
    local buttons = {}
    local buttonBackgrounds = {}
    local buttonGroups = {}
    local levelSelectGroup = display.newGroup()
    local cnt = 1
    for i = 1, myData.maxShips do
        buttonGroups[i] = display.newGroup()
        buttonBackgrounds[1] = display.newSprite( playerSheet , {frames={playerSheetInfo:getFrameIndex("playerShip1_red")}})--place the ships in center to be selected 
        buttonBackgrounds[2] = display.newSprite( playerSheet , {frames={playerSheetInfo:getFrameIndex("playerShip2_green")}})
		buttonBackgrounds[3] = display.newSprite( playerSheet , {frames={playerSheetInfo:getFrameIndex("playerShip3_orange")}})
		buttonBackgrounds[4] = display.newSprite( playerSheet , {frames={playerSheetInfo:getFrameIndex("playerShip1_blue")}})
        if myData.settings.unlockedLevels == nil then
            myData.settings.unlockedLevels = 10
        end
        
        if i <= myData.settings.unlockedLevels then
            buttonGroups[i].alpha = 1.0
            buttonGroups[i]:addEventListener( "touch", handleLevelSelect )
        else
            buttonGroups[i].alpha = 0.5
        end
        buttons[i] = buttonBackgrounds[i]
        buttons[i].x = x
        buttons[i].y = y
        buttonGroups[i]:insert(buttons[i])
		
		
		-- buttonBackgrounds[1].x = 55
		-- buttonBackgrounds[1].y = 125
		
		-- buttonBackgrounds[2].x = 180
		-- buttonBackgrounds[2].y = 125
		
		-- buttonBackgrounds[3].x = 300
		-- buttonBackgrounds[3].y = 125
		
		-- buttonBackgrounds[4].x = 425
		-- buttonBackgrounds[4].y = 125

        x = x + 98
        cnt = cnt + 1
        if cnt > 5 then
            cnt = 1
            x = x + 125
            y = y + 125
        end
        levelSelectGroup:insert(buttonGroups[i])
    end
    sceneGroup:insert(levelSelectGroup)
    levelSelectGroup.x = display.contentCenterX - 100
    levelSelectGroup.y = 120

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
