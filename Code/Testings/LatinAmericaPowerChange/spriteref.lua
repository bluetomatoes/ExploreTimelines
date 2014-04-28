	local options = 
	{
		frames = require("PowerChange").frames
	}




	PCSpritesSheet = graphics.newImageSheet("images/LatinAmericaSprite.png",options)
	spriteOptions = {name ="PowerChange", start=1, count=18,time=10000}
	spriteInstance = display.newSprite( PCSpritesSheet, spriteOptions )
	spriteInstance:setReferencePoint(display.CenterReferencePoint)
	spriteInstance.x = 200
	spriteInstance.y = 1000
	spriteInstance:play()