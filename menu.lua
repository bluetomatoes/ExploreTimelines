W,H = display.contentWidth, display.contentHeight

local storyboard = require ("storyboard")
local scene = storyboard.newScene()



function scene:createScene(event)

	local group = self.view
end

function scene:enterScene(event) 

	-- create object

 
-- touch listener function



	
	local group = self.view

	print("This is Menu")

	--objects
	background = display.newImage("images/Background.png")

	
	local donut = "donutHole"


	start = display.newImage("images/start.png")
	start:setReferencePoint(display.CenterReferencePoint)
	start.x = W/2
	start.y = H/2

	group:insert(background)
	group:insert(start)


	function start:touch(e)
			if e.phase == "ended" then
				storyboard.gotoScene("1754USA", "slideLeft", 1000)
			end
	end


	start:addEventListener( "touch" )

--Final end

end

function scene:exitScene(event)
	local group = self.view

	-- any objects you created in EnterScene need to be removed here. 
	--So you will remove EventListeners and display objects here.
	display.remove(group)
	group = nil

	-- this is how you remove an event listener
	start:removeEventListener( "touch" )	

end

function scene:destroyScene(event)


	local group = self.view

end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener( "destroyScene", scene )

return scene
