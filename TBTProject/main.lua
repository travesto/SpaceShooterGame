--Main.lua changed Wed september 30

--no status bar
display.setStatusBar(display.HiddenStatusBar)

--anchors
display.setDefault("anchorX", 0)
display.setDefualt("anchorY", 0)

--random seed
math.randomseed(os.time())

local storyboard = require"storyboard"
storyboard.gotoScene("menu")
