-- This file is for use with Corona SDK
--
-- It is intended for use with the image sheet and sprite API's
-- 
-- This module writes no global values, not even the module table
--
-- Usage example:
			---local options =
			--{
			--	frames = require("ArrowSprites").frames,
			--}
 			--local imageSheet = graphics.newImageSheet( "ArrowSprites.png", options )
 			--local spriteOptions = { name="ArrowSprites", start=1, count=8, time=1000 }
  			--local spriteInstance = display.newSprite( imageSheet, spriteOptions )
 

local sheetData = {}

sheetData.frames = {
	{
		x = 2,
		y = 2,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},

	{
		x = 52,
		y = 2,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
	
	{
		x = 102,
		y = 2,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
	{
		x = 2,
		y = 46,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},

	{
		x = 52,
		y = 46,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
		{
		x = 102,
		y = 46,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
		{
		x = 2,
		y = 90,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
		{
		x = 52,
		y = 90,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
	-----Other Way
		{
		x = 52,
		y = 90,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
	{
		x = 2,
		y = 90,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
	{
		x = 102,
		y = 46,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
	
	{
		x = 52,
		y = 46,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
		{
		x = 2,
		y = 46,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
		{
		x = 102,
		y = 2,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
		{
		x = 52,
		y = 2,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
		{
		x = 2,
		y = 2,
		width = 50,
		height = 44,
		sourceX = 1,
		sourceY = 20,
		sourceWidth = 50,
		sourceHeight = 44,
	},
}

return sheetData
