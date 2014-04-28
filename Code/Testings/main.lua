-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local bkg = display.newRect(0,0,1024,768)
bkg:setFillColor(255,255,255)
local popover_gradient = graphics.newGradient(
	{5, 18, 189},
	{0, 6, 31},
	"down")


local g = graphics.newGradient(
  { 255, 255, 255 },
  { 200, 200, 100 },
  "down" )

local popover = display.newRect(100,100, 250, 200)
popover:setFillColor(0,4,31)
popover.alpha = 1

local poptop = display.newRect(100,70, 250, 30)
poptop:setFillColor(184, 192, 255)
poptop.alpha = 0.8

local selection = display.newRoundedRect(110, 120, 230, 30, 8)