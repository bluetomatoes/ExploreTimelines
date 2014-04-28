-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

	local options = 
	{
		frames = require("PowerChange").frames
	}


	PCSpritesSheet = graphics.newImageSheet("LatinAmericaSprite.png",options)
	spriteOptions = {name ="PowerChange", start=1, count=18,time=10000}
	spriteInstance = display.newSprite( PCSpritesSheet, spriteOptions )
	spriteInstance:setReferencePoint(display.CenterReferencePoint)
	spriteInstance.x = 400
	spriteInstance.y = 600
	spriteInstance.xScale = 1.5
	spriteInstance.yScale = 1.5
	spriteInstance:play()

