----------------------------------------
--Game Logic and rule systems
----------------------------------------

M = {}


function newPlayer (x, y )
		--create obj
		local player = display.newImage("assets/art/RedRacer.png")
		player.x = x or display.contentWidth * 0.5
		player.y = y or display.contentHeight * 0.5

		--method assigned to palyer
		function player:shoot(event)
				if event.phase == "began" then
					--shoot code--

				end
		end

		return player
end


--Score Module
function newScoreDisplay( x, y )
	
	-- Create a text object to hold the score
	local scoreDisplay = display.newText( "0", 0, 0, "Helvetica-Bold", 18 )
	scoreDisplay:setTextColor( 0, 0, 0, 255 )
	scoreDisplay.x = x or 0
	scoreDisplay.y = y or 0
	
	-- start core at zero
	scoreDisplay.scoreCount = 0
	
	-- Function to change the score
	function scoreDisplay:change( newScore )
		self.scoreCount = newScore
	end
	
	-- return the score object to wherever function was called:
	return scoreDisplay
end


--function newPauseButton( x, y )

--	-- Create the button object
--	local pauseBtn = display.newImage( "pausebtn.png" )
--	pauseBtn.x = x or 0
--	pauseBtn.y = y or 0

--	-- touch event for pause button
--	local function pauseBtn:touch( event )
--		if event.phase == "began" then

--			--[[ game pause code goes here ]]--

--		end
--	end
--	pauseBtn:addEventListener( "touch", pauseBtn )

--	-- return the pause button object to wherever function was called:
--	return pauseBtn
--end

return M