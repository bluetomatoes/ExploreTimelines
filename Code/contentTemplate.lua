W,H = display.contentWidth, display.contentHeight


--Requires the Storyboard API
storyboard = require ("storyboard")
scene = storyboard.newScene()

--Requires the menubar, which is present in all content 

--location = "nowhere"

--Requires the multitouch external module





function scene:createScene(event)

	group = self.view
	
end

function scene:enterScene(event) 
storyboard.removeAll()
	-- create object
	
	group = self.view

	print("This is Scene BAD KITTY")    -- Print messages should show up in the terminal when you run the simulator.
	beginDate = 0
	endDate = 10



	--Sets the beginning and ending of the timeline






	--The name of the folder holding the images
	foldername = "String"

	--The table which includes all the dots. Create as many as  you need. The date 1 represents the starting date, and date 2 represents the ending date(assuming it's a time period.)
	--The value is the month, 10 = october, 4 = april, etc.
	dotGroup = {}

	dotGroup[1] = {dot = dot1, date1 = 0, date2 = 0, month = {name = "Month", value = 0}, place = "nowhere"}
	dotGroup[2] = {dot = dot1, date1 = 6, date2 = 0, month = {name = "Month", value = 0}, place = "nowhere"}

	--The date table.
	dateGroup = {}
	dateGroup[1] = {date = date1}
	dateGroup[2] = {date = date2}


	--The photo table. If one event doesn't have a photo, hasPhoto will equal false
	photos = {}

	photos[1] =	{PosX = 0, PosY = 0, xOrigin = 0, yOrigin = 0, hasPhoto = true}
	photos[2] = {PosX = 0, PosY = 0,xOrigin = 0, yOrigin = 0, hasPhoto = false}

	--The buttons. These are the white rectangles which tell you the name of the event.

	btns = {}
	btns[1] = {name = "String No. 1"}
	btns[2] = {name = "String No. 2"}



	--Options for the arrowSprite
	options = 
	{
		frames = require("ArrowSprites").frames
	}

	-- These are the new objects you are creating.  Make sure to declare each of the objects above.

	--Change the background color every time.
	background = display.newRect(0,0,W, H)
	background:setFillColor(70,148,30)

	--Set your title. You may need 2 rows. 
	title = display.newText( "String", 0, 0, native.systemFontBold, 60 )
	title:setReferencePoint(display.CenterReferencePoint)
	title.x = W/2
	--set original location.x
	title.y = H/2-250
	--set original location.y
	title:setTextColor ( 0,0,0 )

	group:insert(background)
	group:insert(title)



	menubar = require ("timelineMain")

end

function scene:exitScene(event)
	group = self.view

	-- any objects you created in EnterScene need to be removed here.  So you will remove EventListeners and display objects here.  Example code below.
	display.remove(group)
	group = nil

	helptext.alpha = 0

	-- this is how you remove an event listener
	spriteInstance:removeEventListener( "touch", spriteInstance )	


	memoryBTN:removeEventListener("touch",memoryBTN)

	globe:removeEventListener("touch")

	Runtime:removeEventListener("enterFrame",monitorScore)

	--revoDot:removeEventListener("touch")
	
	
--[[
	FIWar:removeEventListener("touch")
	revoWar:removeEventListener("touch")
	constitution:removeEventListener("touch")
	massacre:removeEventListener("touch")

]]

end

function scene:destroyScene(event)


	group = self.view

end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener( "destroyScene", scene )

return scene
