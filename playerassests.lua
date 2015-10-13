-- create player assests for three player ships.
--This should create a scroll able view of selectable ships.
--"I've only proved that it is correct, not that it works" - DEK
-- Use placeholder images.

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require("widget")
local myApp = require("myapp")

widget.setTheme(myApp.theme)

--display ship types
--local slideView = require( "slideView" )

local photoFiles = {
	"ship1.png",
	"ship2.png,
	"ship3.png",
}

local photosThumbnails = {}
local photosThumbGroups = {}

local function showPhoto(event)
	if event.phase == "ended" then
        composer.showOverlay("slideView", {time=250, effect="crossFade", params={start=event.target.index, images=photoFiles}})
	end
	return true
end

function scene:create( event )
    local sceneGroup = self.view

    local background = display.newRect(0,0,display.contentWidth, display.contentHeight)
    background:setFillColor( 0.95, 0.95, 0.95 )
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2

    sceneGroup:insert(background)

    })
    
    local row = 0
    local col = 0

    local thumbnailMask = graphics.newMask("images/mask-80x80.png")

    local groupOffset = 0
    if tonumber( system.getInfo("build") ) < 2013.2000 then
        groupOffset = 40
    end

    local maxCol = math.floor( display.contentWidth / 80 ) - 1

    for i = 1, #photoFiles do
    	photosThumbnails[i] = display.newImage(photoFiles[i])
    	local aspectRatio = photosThumbnails[i].width / photosThumbnails[i].height
    	local scale
    	if aspectRatio > 1 then -- landscape photo
    		scale = 80 / photosThumbnails[i].height
    	else
    		scale = 80 / photosThumbnails[i].width
    	end
    	--print(scale, aspectRatio, photosThumbnails[i].width, photosThumbnails[i].width * scale, photosThumbnails[i].height, photosThumbnails[i].height * scale)
   		photosThumbnails[i]:scale(scale,scale)
   		photosThumbGroups[i] = display.newGroup()
   		photosThumbnails[i].x = groupOffset --col * 80 + 40
   		photosThumbnails[i].y = groupOffset --row * 80 + 40 + 70
   		photosThumbGroups[i]:insert(photosThumbnails[i])
		photosThumbGroups[i].x = col * 80 + 40
		photosThumbGroups[i].y = row * 80 + 40 + 70
		photosThumbGroups[i]:setMask(thumbnailMask)
		photosThumbGroups[i].maskX = groupOffset
		photosThumbGroups[i].maskY = groupOffset 
		photosThumbGroups[i].index = i
		photosThumbGroups[i]:addEventListener("touch", showPhoto)
		col = col + 1
		if col > maxCol then 
			row = row + 1
			col = 0
		end
		sceneGroup:insert(photosThumbGroups[i])

    end
    print("Memory", system.getInfo("textureMemoryUsed") / (1024 * 1024))
end

function scene:show( event )
    local sceneGroup = self.view
    
end

function scene:hide( event )
    local sceneGroup = self.view

    --
    -- Clean up any native objects and Runtime listeners, timers, etc.
    --
    
end

function scene:destroy( event )
    local sceneGroup = self.view
    
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene