local folderstring = "The Beginning of a Nation"
W,H = display.contentWidth, display.contentHeight

local storyboard = require "storyboard"

local scene = storyboard.newScene()




function scene:createScene(event)

	local group = self.view
	
end

function scene:enterScene(event) 

	storyboard.removeAll()
	group = display.newGroup()

	background = display.newRect(0,0,1024,768)
	background:setFillColor(200,100,100)
	background.alpha = 1
	background:toBack()
	
	title = display.newText( folderstring, 0, 0, native.systemFontBold, 60 )
	title:setReferencePoint(display.CenterReferencePoint)
	title.x = W/2
	title.y = H/2-250
	title:setTextColor ( 0,0,0 )
	group:insert(title)

	beginDate = 1754
	endDate = 1792

	foldername = "1754 USA"

	print("This is "..foldername)
	dotGroup = {}
	dotGroup[1] = {dot = dot1, date1 = 1754, date2 = 1763, month = {name = nil, value = 0}, place = "nowhere"}
	dotGroup[2] = {dot = dot2, date1 = 1770, date2 = 0, month = {name = "March", value = 3}, place = "nowhere"}
	dotGroup[3] = {dot = dot3, date1 = 1776, date2 = 1783, month = {name = nil, value = 0}, place = "USA"}
	dotGroup[4] = {dot = dot4, 	date1 = 1781, date2 = 0, month = {name = nil, value = 0}, place = "nowhere"}
	dotGroup[5] = {dot = dot5, date1 = 1783, date2 = 1788, month = {name = nil, value = 0}, place = "nowhere"}


	dateGroup = {}
	dateGroup[1] = {date = date1}
	dateGroup[2] = {date = date2}
	dateGroup[3] = {date = date3}
	dateGroup[4] = {date = date4}
	dateGroup[5] = {date = date5}

	photos = {}
	photos[1] =	{hasPhoto = true, hasLine}
	photos[2] = {hasPhoto = true, hasLine}
	photos[3] = {hasPhoto = true, hasLine}
	photos[4] = {hasPhoto = true, hasLine}
	photos[5] = {hasPhoto = true, hasLine}


	btns = {}
	btns[1] = {name = "The French and Indian War"}
	btns[2] = {name = "The Boston Massacre"}
	btns[3] = {name = "The Revolutionary War"}
	btns[4] = {name = "Articles of Confederation Adopted"}
	btns[5] = {name = "A New Form of Government"}

	--Options for the arrowSprite
	options = 
	{
		frames = require("ArrowSprites").frames
	}


	--  You are adding all of the objects you created above into the group called "group".  
	--  Objects you insert last will show up on top of objects you inserted earlier.
--	group:insert(background)
	
--	title:toBack()
	--background:toBack()
	--backdrop:toBack()


	--[[local menubar = ]]require ("timelineMain")
	print(group.numChildren.." :# of items in group")
--[[
	group:insert(subtitle)
	group:insert(timeline)
	group:insert(rightend)
	group:insert(leftend)
	group:insert(arrowText)
	group:insert(arrowText2)
	group:insert(arrowText2)


	group:insert(menubar)
	group:insert(spriteInstance)
	group:insert(memoryBTN)
	group:insert(searchBar)
	group:insert(globe)
	group:insert(globePopUp)

	group:insert(--background2)
	group:insert(doneBtn)
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
				dotGroup[i].dot:setFillColor(0,155,0)
				tansitionDot = dotGroup[i].dot
				
				function tansitionDot:touch(e)
					if e.phase == "began" then
						transition.to(self, {time = 2000, xScale = 100, yScale = 100, x = W/2, y = H/2})
						self:toFront()

					end
					if e.phase == "ended" then
				
						local function transition()
							storyboard.gotoScene(dotGroup[i].date1..dotGroup[i].place,"crossFade", 100)	--(dotGroup[i].date1..dotGroup[i].place, "slideDown", 1000)
							--dotGroup[i].date1..dotGroup[i].place
						end
							timer.performWithDelay(2000, transition)
							--transition()
					end
					group:insert(tansitionDot)
				end

				tansitionDot:addEventListener("touch")
				physics.setDrawMode = ("debug")



			end
		end
		group:insert(title)
	end--final end

function scene:exitScene(event)

	--local group = self.view
	package.loaded["timelineMain"] = nil
	
	display.remove(tansitionDot)
	tansitionDot = nil

	display.remove(timelineMain)
	timeLineGroup = nil

	display.remove(background)
	background = nil

	display.remove(title)
	title = nil

	for i = 1, #photos do
		display.remove(photos[i].line)
		photos[i].line = nil
		if photos[i].hasPerpLine == true then
			display.remove(photos[i].perpLine)
			photos[i].perpLine = nil
		end
		display.remove(photos[i].name)
		photos[i].name = nil
		display.remove(photos[i].line)
		photos[i].line = nil
		display.remove(dotGroup[i].btn)
		dotGroup[i].btn = nil
		display.remove(btns[i].btn)
		btns[i].btn = nil
		display.remove(dateGroup[i].date)
		dateGroup[i].date = nil
	end

	display.remove(group)
	group = nil
 
	

end

function scene:destroyScene(event)


	local group = self.view

end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener( "destroyScene", scene )

return scene
