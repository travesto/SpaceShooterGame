--splash screen settings
composer = require ("composer")
local scene = composer.newScene()


function scene:create( event )
    local sceneGroup = self.view

local splashScreen = display.newImage( "assets/images/iPad-Splash.png" ) --Your splash image
sceneGroup:insert(splashScreen)
 
local gotonextscene = function()
    composer.gotoScene( "menu","crossFade", 500 ) --Your next scene
    
end

end
local sceneTimer = timer.performWithDelay( 3000, gotonextscene, 1 )