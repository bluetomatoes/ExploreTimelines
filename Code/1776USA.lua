W,H = display.contentWidth, display.contentHeight
local storyboard = require "storyboard"
local scene = storyboard.newScene()

foldername = "1776 USA"




function scene:createScene(event)

	
end

function scene:enterScene(event) 
	group = display.newGroup()

	storyboard.removeAll()

--	background = display.newRect(0,0,1024,768)
--	background:setFillColor(70,148,30)
--	group:insert(background)

	title = display.newText( "The Revolutionary War", 0, 0, native.systemFontBold, 60 )
	title:setReferencePoint(display.CenterReferencePoint)
	title.x = W/2
	--set original location.x
	title.y = H/2-250
	--set original location.y
	title:setTextColor ( 0,0,0 )
	group:insert(title)
	--background:toBack()

	
	--group:insert(--background)
	--group:insert(title)

	beginDate = 1775
	endDate = 1784


	dotGroup = {}
	dotGroup[1] = {dot = dot1, date1 = 1775, date2 = 0, month = {name = "April", value = 4}, place = "nowhere"}
	dotGroup[2] = {dot = dot2, date1 = 1776, date2 = 0, month = {name = "March", value = 3}, place = "nowhere"}
	dotGroup[3] = {dot = dot3, date1 = 1776, date2 = 0, month = {name = "July", value = 7}, place = "nowhere"}
	dotGroup[4] = {dot = dot4, date1 = 1776, date2 = 0, month = {name = "December", value = 12}, place = "nowhere"}
	dotGroup[5] = {dot = dot5, date1 = 1777, date2 = 0, month = {name = "October", value = 10}, place = "nowhere"}
	dotGroup[6] = {dot = dot6, date1 = 1778, date2 = 0, month = {name = "February", value = 2}, place = "nowhere"}
	dotGroup[7] = {dot = dot7, date1 = 1781, date2 = 0, month = {name = "October", value = 10}, place = "nowhere"}
	dotGroup[8] = {dot = dot8, date1 = 1783, date2 = 0, month = {name = "October", value = 10}, place = "nowhere"}


	dateGroup = {}
	dateGroup[1] = {date = date1}
	dateGroup[2] = {date = date2}
	dateGroup[3] = {date = date3}
	dateGroup[4] = {date = date4}
	dateGroup[5] = {date = date5}
	dateGroup[6] = {date = date6}
	dateGroup[7] = {date = date7}
	dateGroup[8] = {date = date8}

	photos = {}
	photos[1] =	{hasPhoto = true}
	photos[2] = {hasPhoto = true}
	photos[3] = {hasPhoto = true}
	photos[4] =	{hasPhoto = true}
	photos[5] = {hasPhoto = true}
	photos[6] = {hasPhoto = true}
	photos[7] = {hasPhoto = true}
	photos[8] = {hasPhoto = true}



	btns = {}
	btns[1] = {name = "The Battle of Lexington and Concord"}
	btns[2] = {name = "The Siege of Boston"}
	btns[3] = {name = "The Declaration of Independence"}
	btns[4] = {name = "Victory in Trenton"}
	btns[5] = {name = "Victory at Saratoga"}
	btns[6] = {name = "France Officially Enters the War"}
	btns[7] = {name = "The British Surrender"}
	btns[8] = {name = "The Treaty of Paris"}


	--Options for the arrowSprite
	options = 
	{
		frames = require("ArrowSprites").frames
	}
		


	require("timelineMain")
--[[
	group:insert(subtitle)
	group:insert(timeline)
	group:insert(rightend)
	group:insert(leftend)
	group:insert(arrowText)
	group:insert(arrowText2)
	group:insert(arrowText2)

	for i = 1, #photos do
		if photos[i].hasPerpLine == true then
			print("Hello salmon")		
		end
	end

	group:insert(--background2)
	group:insert(doneBtn)

	
	group:insert(menubar)
	group:insert(spriteInstance)
	group:insert(memoryBTN)
	group:insert(searchBar)
	group:insert(globe)
	group:insert(globePopUp)
	]]
--[[
	timelineMain.calculateDistance()
	timelineMain.displayDot()
	timelineMain.createContent()
	timelineMain.calculateLocation()
	timelineMain.calculatePos()
	--timelineMain.zoomPhotos()
	--timelineMain.insertTables()
	timelineMain.dragObjs()

	for i = 1, #photos do 
		if photos[i].hasPhoto == true then
		group:insert(photos[i].name)
		end
	end
	for i = 1, #btns do
		group:insert(btns[i].btn)
	end
	for i = 1, #dotGroup do
		group:insert(dotGroup[i].dot)
		group:insert(dateGroup[i].date)
	end
]]
--this part can probably be moved back
	for i = 1, #dotGroup do
		if dotGroup[i].place ~= "nowhere" then --so all of the ones that link to somewhere else
			print("dot "..i.." has a place, which is: "..dotGroup[i].place)
			dotGroup[i].dot:setFillColor(0,0,0)
			dot = dotGroup[i].dot
				
			function dot:touch(e)
				if e.phase == "ended" then
					print("Dot Touch Ended")
					storyboard.gotoScene(dotGroup[i].date1..dotGroup[i].place,"slideDown", 100)	--(dotGroup[i].date1..dotGroup[i].place, "slideDown", 1000)
					print("Got to gotoScene")
				end
			end

			dot:addEventListener("touch")

		--display.remove(menubar)
		--menubar = nil


		end
	end
	
		physics.setDrawMode = "debug"
--final end
	
	--background.alpha = 0.5
end

function scene:exitScene(event)

	-- any objects you created in EnterScene need to be removed here.  So you will remove EventListeners and display objects here.  Example code below.

	display.remove(timeLineGroup)
	timeLineGroup = nil

	--display.remove(--background)
	--background = nil

	display.remove(title)
	title = nil

	for i = 1, #photos do
		display.remove(photos[i].line)
		photos[i].line = nil
		if photos[i].hasPerpLine == true then
			display.remove(photos[i].perpLine)
			photos[i].perpLine = nil

		end
	end

	display.remove(group)
	group = nil
 
	package.loaded["timelineMain"] = nil



end

function scene:destroyScene(event)



end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener( "destroyScene", scene )

return scene
