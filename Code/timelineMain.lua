
-----------------------------------------------------------------------------------------
--
-- timelineMain.lua
--
-----------------------------------------------------------------------------------------
W, H = display.contentWidth, display.contentHeight

physics.pause()

local endgamecounter = 0
MultiTouch = require("dmc_multitouch")

menubar = display.newRect(0,0,1024,70)
menubar:setFillColor(159,182,205)

--The subtitle says the beginning and the end date.
subtitle = display.newText(beginDate.."-"..endDate,0,0, native.systemFont, 40)
subtitle:setReferencePoint(display.CenterReferencePoint)
subtitle.x = W/2
subtitle.y = H/2-190
subtitle:setTextColor (0)

--The actual timeline. The y is based off of where the subtitle is.
timeline = display.newRect(0, 0, 800,6)
timeline:setReferencePoint(display.CenterReferencePoint)
timeline.x = W/2
timeline.y = subtitle.y + 50
timeline:setFillColor(84)

timeSpan = endDate - beginDate
yearlength = timeline.contentWidth / timeSpan

rightend = display.newRect(0,0, 6,100)
rightend:setReferencePoint(display.centerReferencePoint)
rightend.x = 915
rightend.y = timeline.y
rightend:setFillColor(84)

leftend = display.newRect(0,0, 6, 100)
leftend:setReferencePoint(display.centerReferencePoint)
leftend.x = 115
leftend.y = timeline.y
leftend:setFillColor(84)

arrowText = display.newText("Tap for the next", 970, H/2, native.systemFont, 12)
arrowText:setReferencePoint(display.CenterReferencePoint)
arrowText.x = 970
arrowText.y= timeline.y-40
arrowText:setTextColor(25)

arrowText2 = display.newText("time period.", 0, 0, native.systemFont, 12 )
arrowText2:setReferencePoint(display.CenterReferencePoint)
arrowText2.x = 970
arrowText2.y = timeline.y-28
arrowText2:setTextColor(25)

globePopUp = display.newImage("images/globePopUp.png",820,62)
globePopUp.alpha = 0

background2 = display.newRect(0,0,1024,768)
background2:setFillColor(25)
background2.alpha = 0

doneBtn = display.newImage("images/doneBtn.png")
doneBtn.x = 30
doneBtn.y = 40
doneBtn.alpha = 0


--[[
	--group:insert(menubar)
	--group:insert(subtitle)
	--group:insert(timeline)
	--group:insert(rightend)
	--group:insert(leftend)
	--group:insert(arrowText)
	--group:insert(arrowText2)
	--group:insert(arrowText2)

	--group:insert(--background2)
	--group:insert(doneBtn)
]]
local options = 
{
	frames = require("ArrowSprites").frames
}

ArrowSpritesSheet = graphics.newImageSheet("images/ArrowSprites.png",options)
spriteOptions = {name ="ArrowSprites", start=1, count=16,time=1800}
spriteInstance = display.newSprite( ArrowSpritesSheet, spriteOptions )
spriteInstance:setReferencePoint(display.CenterReferencePoint)
spriteInstance.x = 970
spriteInstance.y = timeline.y
spriteInstance:play()

memoryBTN = display.newImage("images/MemoryTest.png", 500,500)
memoryBTN:setReferencePoint(display.CenterReferencePoint)
memoryBTN.x = 830
memoryBTN.y = 35
memoryBTN:toFront()

searchBar = display.newImage("images/SearchBar.png")
searchBar:setReferencePoint(display.CenterReferencePoint)
searchBar.x, searchBar.y = 540, 35


globe = display.newImage("images/EarthBW.png",0,0)
globe:setReferencePoint(display.CenterReferencePoint)
memoryBTN:setReferencePoint(display.CenterRightReferencePoint)
globe.x = (display.contentWidth - memoryBTN.x)/2 + memoryBTN.x
globe.y = menubar.y
memoryBTN:setReferencePoint(display.CenterReferencePoint)
globe:toFront()
 
globePopUp = display.newImage("images/globePopUp.png",820,62)
globePopUp.alpha = 0
globePopUp:toFront()


--Prepares to place the dots in the correct position
function calculateDistance()
	for i = 1, #dotGroup do
		--If this is a time period (x-y):
		if dotGroup[i].date2 ~= 0 then
			dotGroup[i].length = dotGroup[i].date2 - dotGroup[i].date1
			dotGroup[i].pixelLength = dotGroup[i].length * yearlength
		--If this is a solitary event(x): 
		elseif dotGroup[i].date2 == 0 then
			dotGroup[i].length = 0
		end
		--Declaring of variables
		dotGroup[i].distance = dotGroup[i].date1 - beginDate
		--Declare's the dot's position on the timeline
		dotGroup[i].x = yearlength*dotGroup[i].distance
		--If the dot is on the the first year of the timeline, it's x is equal to the leftend
		if dotGroup[i].distance == 0 then
			dotGroup[i].x = leftend.x
		end	
	end	
end
calculateDistance()

--Places the dots and the dates in the correct position, generates the date text
function displayDot()
	for i = 1, #dotGroup do
		if dotGroup[i].date2 ~= 0 then

			--The distance between the end of one timespan to the beginning of the timeline, in years
			dotGroup[i].timeDist = dotGroup[i].date2 - beginDate
			--The distance between the beginning and ending of the event, in years
			dotGroup[i].distance = dotGroup[i].date2 - dotGroup[i].date1
			--The length of the timepsan in pixels
			dotGroup[i].pixelLength = dotGroup[i].distance * yearlength
			--The declaring of the actual rounded rectangle
			dotGroup[i].dot = display.newRoundedRect(0,timeline.y,dotGroup[i].pixelLength,15,5)
			dotGroup[i].dot:setReferencePoint(display.CenterReferencePoint)
			--Dot is the timeDist -  1/2 * the distance (so distance between the beginDate and the midpoint of the timespan) + beginDate.x
			dotGroup[i].dot.x = (dotGroup[i].timeDist - dotGroup[i].distance * 1/2) * yearlength + leftend.x
			print(dotGroup[i].dot.x)
			--Creation of dates
			dateGroup[i].date = display.newText(dotGroup[i].date1.."-"..dotGroup[i].date2,dotGroup[i].dot.x, timeline.y + 10, native.systemFont, 12)
			dateGroup[i].date:setTextColor(25,25,25)
		elseif dotGroup[i].date2 == 0 then
			dotGroup[i].dot = display.newCircle(0,0,10)
			local dot = dotGroup[i].dot
			dot.blendMode = "multiply"
			dotGroup[i].dot:setReferencePoint(display.centerReferencePoint)
			dotGroup[i].dot.x = ((dotGroup[i].date1 - beginDate) * yearlength) + (100/12 * dotGroup[i].month.value) + leftend.x
			
			print(dotGroup)
			
			if dotGroup[i].month.value == 0 then

				dateGroup[i].date = display.newText(dotGroup[i].date1, dotGroup[i].dot.x, timeline.y + 10, native.systemFont, 12)
			elseif dotGroup[i].month.value ~= 0 then
				dateGroup[i].date = display.newText(dotGroup[i].month.name.." "..dotGroup[i].date1, dotGroup[i].dot.x, timeline.y + 10, native.systemFont, 12)
			end
		end

		dotGroup[i].dot:setFillColor(25,25,25)


		dateGroup[i].date:setReferencePoint(display.CenterReferencePoint)
		
		dateGroup[i].date.y = timeline.y + 20
		dateGroup[i].date:setTextColor(25,25,25)
		dateGroup[i].date.x = dotGroup[i].dot.x
		dotGroup[i].dot:setReferencePoint(display.centerReferencePoint)
		dotGroup[i].dot.y = timeline.y
	end
end

displayDot()
	

function createContent()
	--First Buttons
	for i = 1, #btns do
		--Creates a display group with the btn rectangle and they btn text.
		btns[i].btn = display.newGroup()
		--Creates the text on the button
		btns[i].text = display.newText(btns[i].name, 0, 0, native.systemFont, 12)
		btns[i].text:setReferencePoint(display.centerReferencePoint)
		btns[i].text:setTextColor(25,25,25)
		btns[i].text.x = 0
		btns[i].text.y = 0
		--Creates the --background rectangle
		btns[i].bkg = display.newRect(0,0, btns[i].text.width + 4, btns[i].text.height + 4)
		btns[i].bkg:setReferencePoint(display.centerReferencePoint)
		btns[i].bkg.x = 0
		btns[i].bkg.y = 0
		--inserts the objects into the groups
		btns[i].btn:insert(btns[i].bkg)
		btns[i].btn:insert(btns[i].text)
		btns[i].btn:setReferencePoint(display.CenterReferencePoint)	
		btns[i].btn.x = dotGroup[i].dot.x
		btns[i].btn.y = dateGroup[i].date.y + 20

	end
	--Second photos
	
	for i = 1, #photos do
		if photos[i].hasPhoto == true then
			photos[i].name = display.newImage("images/"..foldername.."/photo"..i..".png", dotGroup[i].dot.x, timeline.y + 60, widthSize , heightSize )
			--print(i,photos[i].name.width,photos[i].name.height)
			photos[i].name.x = dotGroup[i].dot.x
			photos[i].name:setReferencePoint(display.CenterReferencePoint)
			group:insert(photos[i].name)
		end
	end
end
createContent()

function calculateLocation()
	for i =1, #photos do
		if photos[i].hasPhoto == true then
			photos[i].name.xSize = photos[i].name.width
			photos[i].name.ySize = photos[i].name.height
		
			photos[i].name.width = photos[i].name.width * 1/5
			photos[i].name.height = photos[i].name.height * 1/5
	
			photos[i].name.y = dateGroup[i].date.y + 40 + photos[i].name.height * 1/2
		end
	end
end
calculateLocation()

--creating Origins
for i =1, #photos do
	photos[i].xOrigin = photos[i].name.x
	photos[i].yOrigin = photos[i].name.y
	photos[i].ref = display.newCircle(photos[i].name.x, photos[i].name.y, 0.1)
	photos[i].ref.alpha = 0
	group:insert(photos[i].ref)
	physics.addBody(photos[i].name, "dynamic", {bounce = 0.1, friction = 0.3})
	photos[i].line = display.newLine(dotGroup[i].dot.x,timeline.y,dotGroup[i].dot.x, timeline.y)
end

for i = 1, #btns do
	btns[i].xOrigin = btns[i].btn.x
	btns[i].yOrigin = btns[i].btn.y
	btns[i].ref = display.newCircle(btns[i].btn.x, btns[i].btn.y, 0.1)
	btns[i].ref.alpha = 0
	btns[i].ref:setFillColor(255,0,0)
	group:insert(btns[i].ref)
	physics.addBody(btns[i].btn, "dynamic", {bounce = 0.1, friction = 0.3})
	--print("INFO"..btns[i].name..photos[i].name.y - timeline.y)
end
local run_number = 0
local function calculatePos()
	for i = 1, #photos do

		if photos[i].hasPhoto == true then
			local photo = photos[i].name
			local btn = btns[i].name
			
			for i = 1, #photos do
				if photos[i].hasPhoto == true then --if it has a photo
					if photos[i].name.x - photo.x ~= 0 then -- if it is too close horizontally
						if math.abs(photos[i].name.y - photo.y) <= 50 then --if it is too close vertically
							if math.abs(photos[i].name.x - photo.x) <= photos[i].name.width*1/2 + photo.width * 1/2 then --and too close horizontally
								--if run_number < 1 then
									photos[i].name:setReferencePoint(display.CenterReferencePoint)								
									photos[i].line = display.newLine(dotGroup[i].dot.x , timeline.y, dotGroup[i].dot.x, photo.y + photo.height/2 + 20)--create a line
									
									photos[i].line.name = btns[i].name
									--print(#photos[i].line.name)
									photos[i].line:setReferencePoint(display.BottomCenterReferencePoint)
									run_number = run_number + 1

									--A semi random function that defines the color of the line: math.random won't work, because it will change. However, these values are permanent.
									local lineColor1 = (math.fmod(15, i*2)+0.5) * 60
									local lineColor2 = i * 30
									local lineColor3 = math.pow(3, i) * 5
									photos[i].line:setColor(lineColor1,lineColor2,lineColor3)
									--photos[i].line.newname = #photos[i].line.name 
									photos[i].line.width = 3
									--prin)
									local dot = dotGroup[i].dot
									--print("here"..photos[i].line.y - dateGroup[i].date.y)
									local line = photos[i].line


									dateGroup[i].date.y = photos[i].line.y + 8
									btns[i].btn.y = dateGroup[i].date.y + btns[i].btn.height

									photos[i].name.y = photos[i].name.height/2 + btns[i].btn.y + 10
				
									--print("if"..i)
									print(photos[i].line.height)
								--elseif run_number >= 1 then
								--	photos[i].line:append(dotGroup[i].dot.x, photo.y + photo.height/2)
							--	end
									
									--photos[i].line:toBack()
									--background:toBack()
									group:insert(photos[i].name)

									for i = 1, #dotGroup do
										if dotGroup[i].dot then
											dotGroup[i].dot:toFront()
										end
									end

								if photos[i].name.y + photos[i].name.height/2 > 768 then --if the picture is outside of the screen		
									photos[i].name.y = photos[i].line.y --photo y location is at the end of the line
									photos[i].perpLine = display.newLine(photos[i].line.x, photos[i].line.y - 2, photos[i].line.x + i * 20, photos[i].line.y - 2)
									photos[i].perpLine:setReferencePoint(display.CenterRightReferencePoint)
									photos[i].name.x = photos[i].perpLine.x + photos[i].name.width/2 --photo x location is at the end of the line
									photos[i].perpLine:setColor(lineColor1,lineColor2,lineColor3)
									photos[i].perpLine.width = photos[i].line.width --so it is the same length
									photos[i].lineDot = display.newCircle(photos[i].perpLine.x, photos[i].perpLine.y, 4)
									photos[i].lineDot:setFillColor(lineColor1,lineColor2,lineColor3) --creating a dot at the end, that is the same color as the line
									

									btns[i].btn.x = photos[i].name.x
									dateGroup[i].date.x=photos[i].name.x
									
									photos[i].name:setReferencePoint(display.CenterReferencePoint)
									
									--if photos[i].name.y + photos[i].name.height/2 > 768 then --if it is still out of the screen
									photos[i].name.y = photos[i].name.y - photos[i].name.height/2 --moves it up half of its height

									photos[i].name:setReferencePoint(display.TopCenterReferencePoint)

									btns[i].btn.y = photos[i].name.y - btns[i].btn.height/2 --sets the button above it
									photos[i].perpLine.y = photos[i].name.y + photos[i].name.height/2 --sets the perp Line at the right height
									--photos[i].line.height = photos[i].line.height - photos[i].name.height +2
									photos[i].line.y = photos[i].perpLine.y
									dateGroup[i].date.y = photos[i].perpLine.y - photos[i].name.height/2 - btns[i].btn.height - 10

									photos[i].lineDot.y = photos[i].perpLine.y
									group:insert(photos[i].line)
									group:insert(photos[i].perpLine)
									group:insert(photos[i].lineDot)

									--making sure the line does not go ontop of the img
									local w = i
									if (w > 1) then
										for i = 1, #photos do
											if i < w then
												photos[i].name:toFront()
											end
										end
									end

									photos[i].perpLine:toBack()
									photos[i].lineDot:toBack()
									--background:toBack()

									photos[i].perpLine:setReferencePoint(display.CenterLeftReferencePoint)
									lineLength = photos[i].perpLine.y - dotGroup[i].dot.y

									print(photos[i].perpLine.y.." Perp Line y location")
									print(dotGroup[i].dot.y.." :the dot on the timeline y location")
									local test = display.newCircle(photos[i].perpLine.x, photos[i].perpLine.y, 10)
									local test2 = display.newCircle(dotGroup[i].dot.x, dotGroup[i].dot.y, 10)

									print(test.y - test2.y.." Test to test2, aka. the length we want")
									test2:setFillColor(255,0,0)

									print("line length: "..lineLength)
									print("Dot line height, before: "..photos[i].line.height)

									photos[i].line.height = test.y - test2.y--photos[i].line.height

									print("Dot line height, after: "..photos[i].line.height)

									test.isVisible = false
									test2.isVisible = false

									group:insert(test)
									group:insert(test2)						
								end

								photos[i].line:setReferencePoint(display.TopCenterReferencePoint)
								photos[i].line.y = 244

								photos[i].xOrigin = photos[i].name.x
								photos[i].yOrigin = photos[i].name.y
								photos[i].ref.x, photos[i].ref.y = photos[i].name.x, photos[i].name.y
								btns[i].xOrigin = btns[i].btn.x
								btns[i].yOrigin = btns[i].btn.y
								btns[i].ref.x, btns[i].ref.y = btns[i].btn.x, btns[i].btn.y
								--print(btns[i].ref.y)
								print(btns[i].name, photos[i].ref.y)
							end
						end
					end	
				end
			end
		end
	end
end

calculatePos()



print("endgame counter = ",endgamecounter)
local function zoomPhotos(boolean)
	for i = 1 , #photos do
		if photos[i].hasPhoto == true then
		photo = photos[i].name

			function photo:touch(e)
				if e.phase == "began" then
					photos[i].name:toFront()
				elseif e.phase == "ended" then
					--background2:toFront()
					transition.to(photos[i].name, {x = photos[i].name.xSize * 1/2 + 10, y = photos[i].name.ySize * 1/2 + 10, width = photos[i].name.xSize, height = photos[i].name.ySize, time = 800})
					photo:toFront()
					photos[i].name:toFront()
					transition.to(background2, {alpha = 0.8, time = 800})
					photos[i].name.width = photos[i].name.xSize
					photos[i].name.height = photos[i].name.ySize
					photos[i].name:setReferencePoint(TopLeftReferencePoint)
					photos[i].caption = native.newTextBox(10, photos[i].name.y + photos[i].name.ySize/2 + 10, photos[i].name.xSize, 768 - 20 - 60) 

				end
			end
			if boolean == t then
				photo:addEventListener("touch", photo)
			elseif boolean == f then
				photo:removeEventListener("touch", photo)
			end
		end
	end
end
zoomPhotos(t)

function checkGameStatus()
	if endgamecounter == #photos + #btns or endgamecounter == 0 then
		print("the game is not active.")
		zoomPhotos(t)
	else
		print("game active!")


	end
end
checkGameStatus()
--Create a sprite to show a flashing purple arrow
function spriteInstance:touch(e)
		if e.phase == "ended" then
			storyboard.gotoScene("1776USA", "zoomOutInFade", 100)		--("1789USA", "slideLeft", 1000)
		print("spriteInstance:touch is finished")
		end
	return
end


spriteInstance:addEventListener( "touch", spriteInstance )


local function dragObjs()
	for i = 1, #photos do
		
		photos[i].PosX = 0
		photos[i].PosY = 0 
			--this sets the photo being moved. Later, it will be used to stop multitouch on that object.
		local photo = photos[i].name

		local function photosDrag(event)	
				if event.phase == "moved" then

					--makes object static so it won't drop while the user is moving it.
					photos[i].name.bodyType = "static"
					--namePosX, namePosY represent the distance between the photo's current location and its original location.
					photos[i].namePosX = photos[i].name.x - photos[i].ref.x
					photos[i].namePosY = photos[i].name.y - photos[i].ref.y
					
					--makes x value positive if already negative.
					if (photos[i].namePosX < 0) then
					photos[i].namePosX = photos[i].namePosX * -1
					end
					--makes y value positive if already negative.
					if (photos[i].namePosY < 0) then
						photos[i].namePosY = photos[i].namePosY * -1
					end
					if (photos[i].namePosX <= 50) and (photos[i].namePosY <= 50) then
						photos[i].name.x = photos[i].xOrigin
						photos[i].name.y = photos[i].yOrigin
						photos[i].name.isBodyActive = false
						local state = photos[i].name.isBodyActive
						physics.removeBody(photos[i].name)
						--photos[i].name.bodyType = "static"
						--makes the photo upright.
						transition.to( photo, { rotation = 0, time = 0 })
					end
				
				elseif event.phase == "ended" then
					print("photo "..i.." position: "..photos[i].namePosX)
					if (photos[i].namePosX <= 50) and (photos[i].namePosY <= 50) then
						photos[i].name.x = photos[i].xOrigin
						photos[i].name.y = photos[i].yOrigin
						MultiTouch.deactivate(photos[i].name)
						endgamecounter= endgamecounter + 1
						print("endgame counter = ",endgamecounter)
						checkGameStatus()
					else 
						--if object was dragged to wrong spot, keep the dynamic physics body on it.
						photos[i].name.bodyType = "dynamic"
						photos[i].name.isBodyActive = true
						local state = photos[i].name.isBodyActive	
					end	
					
				end
				return true
			end	
		
		photos[i].name:addEventListener(MultiTouch.MULTITOUCH_EVENT, photosDrag)

	end
	--For the btns...
	for i = 1, #btns do
		--sets coordinates of orginal location so that object can be returned to that location w/o using a frame

		btns[i].PosX = 0
		btns[i].PosY = 0 
		
		local btn = btns[i].btn

		local function btnsDrag(event)
			local t = event.target
		
			if event.phase == "moved" then
				--makes object static so it won't drop while the user is moving it.
				btns[i].btn.bodyType = "static"
				btns[i].btnPosX = btns[i].btn.x - btns[i].ref.x
				btns[i].btnPosY = btns[i].btn.y - btns[i].ref.y
				
				--makes x value positive if already negative.
				if (btns[i].btnPosX < 0) then
					btns[i].btnPosX = btns[i].btnPosX * -1
				end

				if (btns[i].btnPosX <= 50) and (btns[i].btnPosY <= 50) then
					btns[i].btn.x = btns[i].xOrigin
					btns[i].btn.y = btns[i].yOrigin
					--Tells object to become inactive.
					btns[i].btn.isBodyActive = false
					local state = btns[i].btn.isBodyActive
					physics.removeBody(btns[i].btn)
					--btns[i].btn.bodyType = "static"
					transition.to( btn, { rotation = 0, time = 0 }) 
				end
			elseif event.phase == "ended" then
				if (btns[i].btnPosX <= 50) and (btns[i].btnPosY <= 50) then
					btns[i].btn.x = btns[i].xOrigin
					btns[i].btn.y = btns[i].yOrigin
					MultiTouch.deactivate(btn)
					endgamecounter=endgamecounter+1
					checkGameStatus()
					print("endgame counter = ",endgamecounter)
				else
					btns[i].btn.bodyType = "dynamic"
					btns[i].btn.isBodyActive = true
					local state = btns[i].btn.isBodyActive
				end
					
			end
			return true
		end	
		
		btns[i].btn:addEventListener(MultiTouch.MULTITOUCH_EVENT, btnsDrag)

	end
end

dragObjs()
 
 

--memoryBTN:addEventListener("touch")
local lastGoalTime = 100
local gameIsActive



	--[[if event.time - lastGoalTime >= 1000 then
		for i = 1, #photos do
			if photos[i].hasPhoto == true then
				if photos[i].ref.x ~= photos[i].name.x or photos[i].ref.y ~= photos[i].name.y then
				gameIsActive = true
				lastGoalTime = event.time
				elseif photos[i].ref.x == photos[i].name.x or photos[i].ref.y == photos[i].name.y then
				gameIsActive = false	
				end
			end
		end
	end 
end
checkGameStatus()--]]

--Runtime:addEventListener("enterFrame",checkGameStatus)

if gameIsActive == false then
	print("game is not active")
elseif gameIsActive == true then
	print("game is active")
end
--[[ --moved to other page
for i = 1, #photos do 
	if photos[i].hasPhoto == true then
	--group:insert(photos[i].name)
	end
end
for i = 1, #btns do
	--group:insert(btns[i].btn)
end
for i = 1, #dotGroup do
	--group:insert(dotGroup[i].dot)
	--group:insert(dateGroup[i].date)
end

--this part can probably stay...
	for i = 1, #dotGroup do 
			if dotGroup[i].place ~= "nowhere" then --so all of the ones that link to somewhere else
				print("dot "..i.." has a place, which is: "..dotGroup[i].place)
				dotGroup[i].dot:setFillColor(0,155,0)
				dot = dotGroup[i].dot
				
				function dot:touch(e)
					if e.phase == "ended" then
						print("Dot Touch Ended")
						storyboard.gotoScene("gotoScene","slideDown", 100)	--(dotGroup[i].date1..dotGroup[i].place, "slideDown", 1000)
						print("Got to gotoScene")
					end
				end

				dot:addEventListener("touch")

				--display.remove(menubar)
				--menubar = nil


			end
		end
]]

function memoryBTN:touch(e)
	if e.phase == "ended" then
		zoomPhotos(f)
		physics.start( true )
		local function shoot_dynam_objs()

			for i = 1, #btns do
				----group:insert(dynam_objs[i].name)
				--btns[i].btn.bodyType = "dynamic"
				btns[i].btn:applyLinearImpulse(math.random (70, 800), math.random(70,800), btns[i].btn.x*math.random(1,20), btns[i].btn.y*math.random(1,20))
				--print("physics activated for btn " ..i)
			end
			for i = 1, #photos do
				if photos[i].hasPhoto == true then
					photos[i].name:applyLinearImpulse(math.random (70, 800), math.random(70,800), photos[i].name.x*math.random(1,20), photos[i].name.y*math.random(1,20))
				end
			end
		end
		shoot_dynam_objs()
		
		local function activate_dynam_objs()
			for i = 1, #photos do

				MultiTouch.activate(photos[i].name,"move","single")
			--	print("MultiTouch activated for photo " ..i)
			end
			for i =1, #btns do
				MultiTouch.activate(btns[i].btn,"move","single")
			--	print("MultiTouch activated for btn " ..i)
			end
		end
		activate_dynam_objs()
	end	
end

memoryBTN:addEventListener("touch", memoryBTN)

function globe:touch(event)
	--if  gameIsActive == false then
		if event.phase == "ended" then

			globePopUp.alpha = 1
			
			function globePopUp:touch(event)
				if event.phase == "ended" then
					storyboard.gotoScene("gotoScene")	--("1754France", "slideDown",1000)
					globePopUp.alpha = 0
					----group:insert(globePopUp)
				end
			end
			globePopUp:addEventListener("touch", globePopUp)
		end
	--end
end

globe:addEventListener("touch", globe)