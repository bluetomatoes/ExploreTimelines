-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Starts the physics engine
local physics = require "physics"
physics.start()

--Initiates the Storyboard API
local storyboard = require "storyboard"
storyboard.gotoScene ( "scene1")

local floor = display.newRect(0,768,1024,20)
	physics.addBody(floor,"static")

local ceiling = display.newRect(0,-1800,1024,20)
	physics.addBody(ceiling, "static")

local leftwall = display.newRect(-20,-1800,20,2568)
	physics.addBody(leftwall, "static")

local rightwall = display.newRect(1024,-1800,20,2568)
	physics.addBody(rightwall, "static")

