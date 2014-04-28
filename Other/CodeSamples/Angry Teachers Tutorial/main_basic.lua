-- define W and H of the screen
W, H = display.contentWidth, display.contentHeight

-- startup the physics engine
local physics = require("physics")
physics.start()

-- draw a circle
local circle = display.newCircle( 100, H/2, 20 )
physics.addBody(circle, "dynamic", {radius=20})

-- draw a floor
local floor = display.newRect(0, H-30, W, 30)
physics.addBody(floor, "static")

-- touch event for the circle to kick the ball
function circle:touch(event)
	if (event.phase == "began") then
		self:applyLinearImpulse(.2, -0.1, event.x, event.y)
	end
end
circle:addEventListener("touch", circle)

-- make some blocks to knock down
for i=1, 5 do
	local block = display.newRect(W-100, H-30-30*i, 30, 30)
	physics.addBody(block, "dynamic")
end

for i=1, 5 do
	local block = display.newRect(W-200, H-30-30*i, 30, 30)
	physics.addBody(block, "dynamic")
end

-- add a roof
local roof = display.newRect(W-200, H-300, 130, 20)
physics.addBody(roof, "dynamic")

-- add a target circle
local target = display.newCircle( W-135, H-100, 30 )
physics.addBody(target, "dynamic", {radius=30})