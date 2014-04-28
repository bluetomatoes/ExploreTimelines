

-- define W and H of the screen
W, H = display.contentWidth, display.contentHeight

-- startup the physics engine


-- load sounds
local wheee = audio.loadSound("wheee.wav")
local ouch = audio.loadSound("ouch.wav")
local gotcha = audio.loadSound("gotcha.wav")

-- sky background
local sky = display.newImageRect("sky.jpg", W, H)
sky.x, sky.y = W/2, H/2

-- draw a circle
local circle = display.newImageRect( "ms_lura.png", 40, 40 )
circle.x, circle.y = 100, H/2
physics.addBody(circle, "dynamic", {radius=20, density=0.5, friction=1, bounce=0.35})

-- draw a floor
local floor = display.newImageRect("grass.jpg", W, 30)
floor.x, floor.y = W/2, H-15
physics.addBody(floor, "static", {density=1.0, friction=1, bounce=0.65})

-- touch event for the circle to kick the ball
function circle:touch(event)
	if (event.phase == "began") then
		self:applyLinearImpulse(10, -5, self.x, self.y)
		audio.play(wheee)
	end
end
circle:addEventListener("touch", circle)

-- make some blocks to knock down
for i=1, 4 do
	local block = display.newImageRect("crate.jpg", 30, 30)
	block.x, block.y = W-100, H-30-30*i
	physics.addBody(block, "dynamic", {density=0.5, friction=1, bounce=0.35})
end

for i=1, 4 do
	local block = display.newImageRect("crate.jpg", 30, 30)
	block.x, block.y = W-200, H-30-30*i
	physics.addBody(block, "dynamic", {density=0.5, friction=1, bounce=0.35})
end

-- add a roof
local roof = display.newImageRect("crate.jpg", 130, 20)
roof.x, roof.y = W-150, H-300
physics.addBody(roof, "dynamic")

-- add a target circle
local target = display.newImageRect( "ms_lanzot.png", 60, 60 )
target.x, target.y = W-150, H-100
physics.addBody(target, "dynamic", {radius=30, density=0.5, friction=1, bounce=0.35})

-- ouch on collision with target
function onCollision(event)
	if (event.phase == "began") then
		if (event.object1 == circle and event.object2 == target) then
			audio.play(gotcha)
		end
		if (event.object1 ~= circle and event.object1 ~= floor and event.object2 == target) then
			audio.play(ouch)
		end
	end
end
Runtime:addEventListener("collision", onCollision);
