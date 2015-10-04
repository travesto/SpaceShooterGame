--requireds
local composer = require("composer")
 local sheetInfo = require("gui")
 local myImageSheet = graphics.newImageSheet( "gui.png", sheetInfo:getSheet() )


--for development builds use "DEMO.lua" for testing



--scenes
local scene = composer.newScene()

--create a scene
function scene:create( event )
    local group = self.view
    
    local blueSprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("buttonBlue")}})
    blueSprite.x = 510
    blueSprite.y = 550
    blueSprite.name = "start button"
    local StartText = display.newText("Start Demo", 510, 550, "Conquest", 30)
    StartText:setFillColor(0)

    blueSprite:addEventListener("tap", startGame)
    blueSprite.text = "tap"

    -- local grnSprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("buttonGreen")}})
    -- grnSprite.x = 510
    -- grnSprite.y = 600
    -- grnSprite.name = "options"

    -- grnSprite:addEventListener("tap", options)
    -- grnSprite.text = "tap options"
    -- local OptionText = display.newText("Options", 510, 600, "Conquest", 30)
    -- OptionText:setFillColor(0)

    local function tapListener(event)
        local object = event.target
        print(object.name.. "Tap!")
    end

    local function touchListener(event)
        local object = event.target
        print(event.target.name "Touched"..event.phase)
    end


    composer.isDebug = true
    
    local background = display.newImageRect("blue.png", display.contentWidth, display.contentHeight)--<PH>
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    local initText = display.newText("Galaxy", display.contentCenterX,display.contentCenterY - 200, "Conquest", 70,group) --<PH>
    local versionText = display.newText("Version 0.2 Build(041015)Development", 225, 750, "conquest",25, group)

    initText:setFillColor(0,1,0)
    versionText:setFillColor(0,1,0)


  
   group:insert(background)
   group:insert(initText)
   group:insert(versionText)   
   group:insert(blueSprite)
   group:insert(StartText)
    
end

--show scene
function scene:show( event )
    local phase = event.phase
    local previousScene = composer.getSceneName("previous")
    if(previousScene~=nil) then
        composer.removeScene(previousScene)
    end
    if (phase == "did") then
    
        
    end
end

--hide scene
function scene:hide( event )
    local phase = event.phase
    if ( phase == "will" ) then

        
    end
    

end

function scene:destroy(event)
    local group = self.view
    

end


--go to gameActual
function startGame()
    composer.gotoScene("demo", "fade", 500)--use demo instead of level for testing game systems
    return true
end

-- function options()
--     composer.showOverlay ("options" , {effect = "fade" , params = {levelNum = "game" }})
--     return true
-- end



--listeners
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene