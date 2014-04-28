-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Starts the physics engine
physics = require "physics"
physics.start()
physics.setDrawMode = "hybrid"

MultiTouch = require("dmc_multitouch")

--Initiates the Storyboard API
storyboard = require "storyboard"



local floor = display.newRect(0,768,1024,20)
	physics.addBody(floor,"static")

local ceiling = display.newRect(0,-1800,1024,20)
	physics.addBody(ceiling, "static")

local leftwall = display.newRect(-20,-1800,20,2568)
	physics.addBody(leftwall, "static")

local rightwall = display.newRect(1024,-1800,20,2568)
	physics.addBody(rightwall, "static")


display.setStatusBar(display.HiddenStatusBar)

W,H = display.contentWidth, display.contentHeight

--backdrop = display.newRect(0,0, 1024, 867)
--backdrop:setFillColor(255)

storyboard.gotoScene( "1754USA")

--[[
local title

local donut = "main"

if storyboard == menu then
	donut = "menu"
	title = display.newText( donut, 0, 0, native.systemFontBold, 60 )
	title.x = W/2
	title.y = H/2-250
	title:setTextColor ( 0,0,0 )
	title:setReferencePoint(display.CenterReferencePoint)



end

--	title = display.newText( "Explore Timelines", 0, 0, native.systemFontBold, 60 )
---	title:setReferencePoint(display.CenterReferencePoint)

--]]
