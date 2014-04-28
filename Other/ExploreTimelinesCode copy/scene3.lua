W,H = display.contentWidth, display.contentHeight
display.setStatusBar(display.HiddenStatusBar)

----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local background, globe

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
local background,title,title2,subtitle
-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	print("This is Scene 3")
	local group = self.view	

	background = display.newRect(0,0,1024,768)
	background:setFillColor(140,50,240)

	title = display.newText("A Turbulent Time:",0,0,native.systemFont,60)
	title:setReferencePoint(display.CenterReferencePoint)
	title.x = W/2
	title.y = H/2-270
	title:setTextColor(25,25,25)

	title2 = display.newText("France in the Late 1800s",0,0, native.systemFont, 60)
	title2:setReferencePoint(display.CenterReferencePoint)
	title2.x = W/2
	title2.y = H/2-220
	title2:setTextColor(25,25,25)

	subtitle = display.newText("1754-1799",0,0,native.systemFont,40)
	subtitle:setReferencePoint(display.CenterReferencePoint)
	subtitle.x = W/2
	subtitle.y = H/2-170
	subtitle:setTextColor(25,25,25)

	timeline = display.newRect(0, 0, 800,6)
	timeline:setReferencePoint(display.centerReferencePoint)
	timeline.x = W/2
	timeline.y = H/2+60
	timeline:setFillColor(84,84,84)

	rightend = display.newRect(0,0, 6,100)
	rightend:setReferencePoint(display.centerReferencePoint)
	rightend.x = 915
	rightend.y = H/2+60
	rightend:setFillColor(84,84,84)

	leftend = display.newRect(0,0, 6, 100)
	leftend:setReferencePoint(display.centerReferencePoint)
	leftend.x = 115
	leftend.y = H/2+60
	leftend:setFillColor(84,84,84)

	menubar = display.newRect(0,0,1024,70)
	menubar:setFillColor(159,182,205)

	searchBar = display.newImage("images/SearchBar.png")
	searchBar:setReferencePoint(display.CenterReferencePoint)
	searchBar.x = 540
	searchBar.y = 35

	globe = display.newImage("images/EarthBW.png",0,0)
	globe:setReferencePoint(display.TopLeftReferencePoint)
	globe.x = 947
	globe.y = 10

	back = display.newRect(0,0, 80,40)
	back:setReferencePoint(display.CenterReferencePoint)
	back.x = 60
	back.y = 40

	backtext = display.newText("Back",0,0,native.systemFont, 24)
	backtext:setReferencePoint(display.CenterReferencePoint)
	backtext.x = back.x
	backtext.y = back.y
	backtext:setTextColor(25,25,25)

	memoryBTN = display.newImage("images/MemoryTest.png", 500,500)
	memoryBTN:setReferencePoint(display.CenterReferencePoint)
	memoryBTN.x = 830
	memoryBTN.y = 35

	dot1 = display.newCircle(0,0,10)
	dot1:setReferencePoint(display.CenterReferencePoint)
	dot1.x = 200
	dot1.y = H/2+60
	dot1.size =20
	dot1:setFillColor(25,25,25)
	dot1.radius = 20

	revoDot = display.newCircle(0,0,10)
	revoDot:setReferencePoint(display.CenterReferencePoint)
	revoDot.x = 540
	revoDot.y = H/2+60
	revoDot.size =20
	revoDot:setFillColor(25,180,25)
	revoDot.radius = 20

	dot3 = display.newCircle(0,0,10)
	dot3:setReferencePoint(display.CenterReferencePoint)
	dot3.x = 770
	dot3.y = timeline.y
	dot3:setFillColor(25,25,25)

	date1 = display.newText("1754-1763",0,0,native.systemFont, 12)
	date1:setReferencePoint(display.CenterReferencePoint)
	date1.x = dot1.x
	date1.y = 464
	date1:setTextColor(25,25,25)

	date2 = display.newText("1776-1783",0,0,native.systemFont, 12)
	date2:setReferencePoint(display.CenterReferencePoint)
	date2.x = revoDot.x
	date2.y = 424
	date2:setTextColor(25,25,25)

	date3 = display.newText("1779-1789",0,0,native.systemFont, 12)
	date3:setReferencePoint(display.CenterReferencePoint)
	date3.x = dot3.x
	date3.y = H/2+80
	date3:setTextColor(25,25,25)

	FIWar = display.newImage("images/FrenchIndianWar.jpg")
	FIWar:setReferencePoint(display.CenterReferencePoint)
	FIWar.x = dot1.x
	FIWar.y = 600

	amRevo = display.newImage("images/Boston.jpeg")
	amRevo.x = 540
	amRevo.y = 310

	frenchRevo = display.newImage("images/FrenchRev.jpeg")
	frenchRevo.x = dot3.x
	frenchRevo.y = 610

	FIWarBtn = display.newImage("images/FIWarBTN.jpg")
	FIWarBtn:setReferencePoint(display.CenterReferencePoint)
	FIWarBtn.x = dot1.x
	FIWarBtn.y = 490

	amRevoBtn = display.newImage("images/amRevoBtn.png")
	amRevoBtn:setReferencePoint(display.CenterReferencePoint)
	amRevoBtn.x = revoDot.x
	amRevoBtn.y = 400
	amRevoBtn.text = "The American Revolution"
	amRevoBtn.size = 9

	frenchRevoBtn = display.newImage("images/frenchRevoBtn.png")
	frenchRevoBtn:setReferencePoint(display.CenterReferencePoint)
	frenchRevoBtn.x = dot3.x
	frenchRevoBtn.y = H/2+105

	FIWarFrame = display.newImage("images/FrenchIndianWar.jpg")
	FIWarFrame:setReferencePoint(display.CenterReferencePoint)
	FIWarFrame.x = dot1.x
	FIWarFrame.y = 600
	FIWarFrame.alpha = 0

	amRevoFrame = display.newImage("images/Boston.jpeg")
	amRevoFrame.x = 540
	amRevoFrame.y = 310
	amRevoFrame.alpha = 0

	frenchRevoFrame = display.newImage("images/FrenchRev.jpeg")
	frenchRevoFrame.x = dot3.x
	frenchRevoFrame.y = 610
	frenchRevoFrame.alpha = 0

	FIWarBtnFrame = display.newImage("images/FIWarBTN.jpg")
	FIWarBtnFrame:setReferencePoint(display.CenterReferencePoint)
	FIWarBtnFrame.x = dot1.x
	FIWarBtnFrame.y = 490
	FIWarBtnFrame.alpha = 0

	amRevoBtnFrame = display.newImage("images/amRevoBtn.png")
	amRevoBtnFrame:setReferencePoint(display.CenterReferencePoint)
	amRevoBtnFrame.x = revoDot.x
	amRevoBtnFrame.y = 400
	amRevoBtnFrame.text = "The American Revolution"
	amRevoBtnFrame.size = 9
	amRevoBtnFrame.alpha = 0

	frenchRevoBtnFrame = display.newImage("images/frenchRevoBtn.png")
	frenchRevoBtnFrame:setReferencePoint(display.CenterReferencePoint)
	frenchRevoBtnFrame.x = dot3.x
	frenchRevoBtnFrame.y = H/2+105
	frenchRevoBtnFrame.alpha = 0

	helptext = display.newText("Drag images or titles to their original positions.",0,0,native.systemFont,20)
	helptext:setReferencePoint(display.CenterReferencePoint)
	helptext.x = W/2
	helptext.y = 250
	helptext:setTextColor(25,25,25)
	helptext.alpha = 0

	background2 = display.newRect(0,0,1024,768)
	background2:setFillColor(25,25,25)
	background2.alpha = 0

	doneBtn = display.newImage("images/doneBtn.png")
	doneBtn.x = 30
	doneBtn.y = 40
	doneBtn.alpha = 0

	picture = display.newImage("images/FranceRevo.png")
	picture:setReferencePoint(display.TopLeftReferencePoint)
	picture.x = 0
	picture.y = 0
	picture.yScale = 1.05
	picture.xScale = 1.01

	picture.alpha = 0
	
	group:insert(background)
	group:insert(title)
	group:insert(title2)
	group:insert(subtitle)
	group:insert(timeline)
	group:insert(rightend)
	group:insert(leftend)
	group:insert(menubar)
	group:insert(searchBar)
	group:insert(globe)
	group:insert(back)
	group:insert(backtext)
	group:insert(dot1)
	group:insert(revoDot)
	group:insert(dot3)
	group:insert(date1)
	group:insert(date2)
	group:insert(date3)
	group:insert(FIWar)
	group:insert(amRevo)
	group:insert(frenchRevo)
	group:insert(FIWarBtn)
	group:insert(amRevoBtn)
	group:insert(frenchRevoBtn)
	group:insert(revoDot)
	group:insert(FIWarFrame)
	group:insert(amRevoFrame)
	group:insert(frenchRevoFrame)
	group:insert(FIWarBtnFrame)
	group:insert(amRevoBtnFrame)
	group:insert(frenchRevoBtnFrame)
	group:insert(memoryBTN)
	group:insert(helptext)


--FIWar.x == dot1.x
--FIWar.y == 600
--FIWarBtn.x == dot1.x
--FIWarBtn.y == 490
--amRevo.x == revoDot.x
--amRevo.y == 310
--amRevoBtn.x == revoDot.x
--amRevoBtn.y == 400
--frenchRevo.x == dot3.x 
--frenchRevo.y == 610
--frenchRevoBtn.x == dot3.x
--frenchRevoBtn.y == H/2+105 


local lastGoalTime = 100

function monitorScore(event)
	if event.time - lastGoalTime >= 100 then
		if FIWar.x == dot1.x and FIWar.y == 600 and FIWarBtn.x == dot1.x and FIWarBtn.y == 490 and amRevo.x == revoDot.x and amRevo.y == 310 and amRevoBtn.x == revoDot.x and amRevoBtn.y == 400 and frenchRevo.x == dot3.x and frenchRevo.y == 610 and frenchRevoBtn.x == dot3.x and frenchRevoBtn.y == H/2+105 then

			gameIsActive = false

			lastGoalTime = event.time

		elseif FIWar.x ~= dot1.x or FIWar.y ~= 600 or FIWarBtn.x ~= dot1.x or FIWarBtn.y ~= 490 or amRevo.x ~= revoDot.x or amRevo.y ~= 310 or amRevoBtn.x ~= revoDot.x or amRevoBtn.y ~= 400 or frenchRevo.x ~= dot3.x or frenchRevo.y ~= 610 or frenchRevoBtn.x ~= dot3.x or frenchRevoBtn.y ~= H/2+105 then

			gameIsActive = true
		end
	end
end
Runtime:addEventListener("enterFrame",monitorScore)

	function memoryBTN:touch(e)

			if e.phase == "began" then
			display.getCurrentStage():setFocus ( e.target)
			e.target.isFocus = true
			print("BtnTouch is working")
		elseif e.target.isFocus then
			display.getCurrentStage():setFocus( nil )
			e.target.isFocus = false
			if e.phase == "ended" then
				print("game is active")
				physics = require("physics")
				physics.start()
				print("physics applied")

				transition.to(helptext,{alpha = 1, time = 800})

				physics.addBody(FIWar,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				FIWar:applyLinearImpulse(math.random (70, 800), math.random(70,800), FIWar.x*math.random(1,20),FIWar.y*math.random(1,20))
				
				physics.addBody(FIWarBtn,"dynamic")
				FIWarBtn:applyLinearImpulse(math.random(70,800),math.random(70,800),FIWarBtn.x*math.random(1,20),FIWarBtn.y*math.random(1,20))
				
				physics.addBody(amRevo,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				amRevo:applyLinearImpulse(math.random (70, 800), math.random(70,800), amRevo.x*math.random(1,20),amRevo.y*math.random(1,20))
				
				physics.addBody(amRevoBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				amRevoBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), amRevoBtn.x*math.random(1,20),amRevoBtn.y*math.random(1,20))
				
				physics.addBody(frenchRevo,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				frenchRevo:applyLinearImpulse(math.random (70, 800), math.random(70,800), frenchRevo.x*math.random(1,20),frenchRevo.y*math.random(1,20))
				
				physics.addBody(frenchRevoBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				frenchRevoBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), frenchRevoBtn.x*math.random(1,20),frenchRevoBtn.y*math.random(1,20))

				local MultiTouch = require("dmc_multitouch")
					
					MultiTouch.activate(FIWar,"move","single")
					local FIWarPosX = 0
					local FIWarPosY = 0

					local function FIWarDrag(event)
						local t = event.target
						if event.phase == "moved" then
							FIWarPosX = FIWar.x - FIWarFrame.x
							FIWarPosY = FIWar.y - FIWarFrame.y
							if (FIWarPosX < 0) then
								FIWarPosX = FIWarPosX * -1
							end
							if (FIWarPosX <= 50) and (FIWarPosY <= 50) then
								FIWar.x = FIWarFrame.x
								FIWar.y = FIWarFrame.y
							end
							elseif event.phase == "ended" then
								if (FIWarPosX <= 70) and (FIWarPosY <= 50) then
									FIWar.x = FIWarFrame.x;
									FIWar.y = FIWarFrame.y;
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(FIWar)
									physics.addBody(FIWar,"static")
									--Tells object to become inactive.
									FIWar.isBodyActive = false
									local state = FIWar.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(FIWar)
								
									transition.to( FIWar, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
										transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					FIWar:addEventListener(MultiTouch.MULTITOUCH_EVENT, FIWarDrag);
			
				MultiTouch.activate(FIWarBtn,"move","single")
					local FIWarBtnPosX = 0
					local FIWarBtnPosY = 0

					local function FIWarBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							FIWarBtnPosX = FIWarBtn.x - FIWarBtnFrame.x
							FIWarBtnPosY = FIWarBtn.y - FIWarBtnFrame.y
							if (FIWarBtnPosX < 0) then
								FIWarBtnPosX = FIWarBtnPosX * -1
							end
							if (FIWarBtnPosX <= 50) and (FIWarBtnPosY <= 50) then
								FIWarBtn.x = FIWarBtnFrame.x
								FIWarBtn.y = revoBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (FIWarBtnPosX <= 50) and (FIWarBtnPosY <= 50) then
									FIWarBtn.x = FIWarBtnFrame.x
									FIWarBtn.y = FIWarBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(FIWarBtn)
									physics.addBody(FIWarBtn,"static")
									--Tells object to become inactive.
									FIWarBtn.isBodyActive = false
									local statec = FIWarBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(FIWarBtn)	
									transition.to( FIWarBtn, { rotation = 0, time=10 })		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
								end
						end
						return true
					end

					FIWarBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, FIWarBtnDrag)
			
			MultiTouch.activate(amRevo,"move","single")
					local amRevoPosX = 0
					local amRevoPosY = 0

					local function amRevoDrag(event)
						local t = event.target
						if event.phase == "moved" then
							amRevoPosX = amRevo.x - amRevoFrame.x
							amRevoPosY = amRevo.y - amRevoFrame.y
							if (amRevoPosX < 0) then
								amRevoPosX = amRevoPosX * -1
							end
							if (amRevoPosX <= 50) and (amRevoPosY <= 50) then
								amRevo.x = amRevoFrame.x
								amRevo.y = amRevoFrame.y
							end
							elseif event.phase == "ended" then
								if (amRevoPosX <= 70) and (amRevoPosY <= 50) then
									amRevo.x = amRevoFrame.x
									amRevo.y = amRevoFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(amRevo)
									physics.addBody(amRevo,"static")
									--Tells object to become inactive.
									amRevo.isBodyActive = false
									local state = amRevo.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(amRevo)
								
									transition.to( amRevo, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
										transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					amRevo:addEventListener(MultiTouch.MULTITOUCH_EVENT, amRevoDrag)
				MultiTouch.activate(amRevoBtn,"move","single")
					local amRevoBtnPosX = 0
					local amRevoBtnPosY = 0

					local function amRevoBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							amRevoBtnPosX = amRevoBtn.x - amRevoBtnFrame.x
							amRevoBtnPosY = amRevoBtn.y - amRevoBtnFrame.y
							if (amRevoBtnPosX < 0) then
								amRevoBtnPosX = amRevoBtnPosX * -1
							end
							if (amRevoBtnPosX <= 50) and (amRevoBtnPosY <= 50) then
								amRevoBtn.x = amRevoBtnFrame.x
								amRevoBtn.y = amRevoBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (amRevoBtnPosX <= 70) and (amRevoBtnPosY <= 50) then
									amRevoBtn.x = amRevoBtnFrame.x
									amRevoBtn.y = amRevoBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(amRevoBtn)
									physics.addBody(amRevoBtn,"static")
									--Tells object to become inactive.
									amRevoBtn.isBodyActive = false
									local state = amRevoBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(amRevoBtn)
								
									transition.to( amRevoBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
										transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					amRevoBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, amRevoBtnDrag)
				
					MultiTouch.activate(frenchRevo,"move","single")
					local frenchRevoPosX = 0
					local frenchRevoPosY = 0

					local function frenchRevoDrag(event)
						local t = event.target
						if event.phase == "moved" then
							frenchRevoPosX = frenchRevo.x - frenchRevoFrame.x
							frenchRevoPosY = frenchRevo.y - frenchRevoFrame.y
							if (frenchRevoPosX < 0) then
								frenchRevoPosX = frenchRevoPosX * -1
							end
							if (frenchRevoPosX <= 50) and (frenchRevoPosY <= 50) then
								frenchRevo.x = frenchRevoFrame.x
								frenchRevo.y = frenchRevoFrame.y
							end
							elseif event.phase == "ended" then
								if (frenchRevoPosX <= 70) and (frenchRevoPosY <= 50) then
									frenchRevo.x = frenchRevoFrame.x
									frenchRevo.y = frenchRevoFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(frenchRevo)
									physics.addBody(frenchRevo,"static")
									--Tells object to become inactive.
									frenchRevo.isBodyActive = false
									local state = frenchRevo.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(frenchRevo)
								
									transition.to( frenchRevo, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
										transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					frenchRevo:addEventListener(MultiTouch.MULTITOUCH_EVENT, frenchRevoDrag)
				MultiTouch.activate(frenchRevoBtn,"move","single")
					local frenchRevoBtnPosX = 0
					local frenchRevoBtnPosY = 0

					local function frenchRevoBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							frenchRevoBtnPosX = frenchRevoBtn.x - frenchRevoBtnFrame.x
							frenchRevoBtnPosY = frenchRevoBtn.y - frenchRevoBtnFrame.y
							if (frenchRevoBtnPosX < 0) then
								frenchRevoBtnPosX = frenchRevoBtnPosX * -1
							end
							if (frenchRevoBtnPosX <= 50) and (frenchRevoBtnPosY <= 50) then
								frenchRevoBtn.x = frenchRevoBtnFrame.x
								frenchRevoBtn.y = frenchRevoBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (frenchRevoBtnPosX <= 70) and (frenchRevoBtnPosY <= 50) then
									frenchRevoBtn.x = frenchRevoBtnFrame.x
									frenchRevoBtn.y = frenchRevoBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(frenchRevoBtn)
									physics.addBody(frenchRevoBtn,"static")
									--Tells object to become inactive.
									frenchRevoBtn.isBodyActive = false
									local state = frenchRevoBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(frenchRevoBtn)
								
									transition.to( frenchRevoBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
										transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					frenchRevoBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, frenchRevoBtnDrag)

			end
							
				end
						return
					end


memoryBTN:addEventListener("touch")
	




function back:touch(e)
	if doneBtn.alpha == 0 then
		if e.phase == "began" then 
			display.getCurrentStage():setFocus (e.target)
			e.target.isFocus = true
			elseif e.target.isFocus then
				display.getCurrentStage():setFocus( nil )
				e.target.isFocus = false
			if e.phase == "ended" then
				storyboard.gotoScene("scene1","crossFade",1000)
				
			end
		end
	end
end


back:addEventListener("touch")


function revoDot:touch(event)
	if  gameIsActive == false then
		if event.phase =="began" then
		display.getCurrentStage():setFocus(event.target)
		event.target.isFocus = true
			elseif event.target.isFocus then
			display.getCurrentStage():setFocus(nil)
			event.target.isFocus = false
		if event.phase == "ended" then
		display.remove(amRevoBtn)
		amRevoBtn = nil

		transition.to(revoDot,{xScale =73.8, yScale =73.5,time = 2000})
		group:insert(revoDot)


			local function scene4Transitioner(event)

				storyboard.gotoScene("scene4")
				display.remove(revoDot)
				revoDot = nil

			
				end
			timer.performWithDelay(2500, scene4Transitioner)
			end
		return
	end
	elseif gameIsActive == true then

 end
end


revoDot:addEventListener("touch")


function amRevo:touch(event)
	if  gameIsActive == false then

	if event.phase == "began" then
		display.getCurrentStage():setFocus(self)
		self.isFocus = true
	elseif self.isFocus then
		if event.phase == "moved" then
			--will not do anything here
		elseif event.phase == "ended" then
		display.getCurrentStage():setFocus(nil)
		self.isFocus = nil
		transition.to(amRevo,{xScale =5.04,yScale =5, x = W/2, y = H/2, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(amRevo)
		group:insert(doneBtn)

		local function amRevoBigListener(event)
		amRevoBig = display.newImage("images/AmRevoBig3.png")
		amRevoBig:setReferencePoint(display.CenterReferencePoint)
		amRevoBig.x = W/2
		amRevoBig.y = H/2
		group:insert(amRevoBig)


		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then

					display.remove(amRevoBig)
					amRevoBig = nil

					transition.to (amRevo,{xScale = 1,yScale = 1, x = 540, y = 310, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})

					
				end
			end
		end
	end

	doneBtn:addEventListener("touch")
	end
		timer.performWithDelay(700,amRevoBigListener)

	end

	end
end
return true
end

amRevo:addEventListener("touch")

function FIWar:touch(event)
	if  gameIsActive == false then

	if event.phase == "began" then
		display.getCurrentStage():setFocus(self)
		self.isFocus = true
	elseif self.isFocus then
		if event.phase == "moved" then 
			--will not do anything here
		elseif event.phase == "ended" then
		display.getCurrentStage():setFocus(nil)
		self.isFocus = nil
		transition.to(FIWar,{xScale =2.857,yScale =3.1847, x = W/2, y = H/2-60, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(FIWar)
		group:insert(doneBtn)

		local function FIWarBigListener(event)
		FIWarBig = display.newImage("images/French_Indian_War_Big.jpeg")
		FIWarBig:setReferencePoint(display.CenterReferencePoint)
		FIWarBig.x = W/2
		FIWarBig.y = H/2-60
		group:insert(FIWarBig)

		FIWarTextBox = native.newTextBox(0,0,780,100)
		FIWarTextBox:setReferencePoint(display.CenterReferencePoint)
		FIWarTextBox.x = W/2
		FIWarTextBox.y = 700
		FIWarTextBox.text = "The French and Indian war was a conflict primarily between France and Britain. \n\ Also know as the Seven Year's war, the war became a world-wide problem. \n\ The war resulted in France and Britain having large amounts of debt, \n\ and territory change. "
		FIWarTextBox.size = 10

			
		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then

					display.remove(FIWarBig)
					FIWarBig = nil

					display.remove(FIWarTextBox)

					transition.to (FIWar,{xScale = 1,yScale = 1, x = dot1.x, y = 600, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})

					
				end
			end
		end
	end

	doneBtn:addEventListener("touch")
	end
		timer.performWithDelay(700,FIWarBigListener)

	end

end
end
return true
end

		
FIWar:addEventListener("touch")

function frenchRevo:touch(event)
	if  gameIsActive == false then

	if event.phase == "began" then
		display.getCurrentStage():setFocus(self)
		self.isFocus = true
	elseif self.isFocus then
		if event.phase == "moved" then 
			--will not do anything here
		elseif event.phase == "ended" then
		display.getCurrentStage():setFocus(nil)
		self.isFocus = nil
		transition.to(frenchRevo,{xScale =2.857,yScale =3.1847, x = W/2, y = H/2-60, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(frenchRevo)
		group:insert(doneBtn)

		local function frenchRevoBigListener(event)
		frenchRevoBig = display.newImage("images/FrenchRev_Big.png")
		frenchRevoBig:setReferencePoint(display.CenterReferencePoint)
		frenchRevoBig.x = W/2
		frenchRevoBig.y = H/2-60
		group:insert(frenchRevoBig)

		frenchRevoTextBox = native.newTextBox(0,0,780,100)
		frenchRevoTextBox:setReferencePoint(display.CenterReferencePoint)
		frenchRevoTextBox.x = W/2
		frenchRevoTextBox.y = 700
		frenchRevoTextBox.text = "Lorem Ipsum Dolor sit amet."
		frenchRevoTextBox.size = 10

			
		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then

					display.remove(frenchRevoBig)
					frenchRevoBig = nil

					display.remove(frenchRevoTextBox)

					transition.to (frenchRevo,{xScale = 1,yScale = 1, x = dot1.x, y = 600, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})

					
				end
			end
		end
	end

	doneBtn:addEventListener("touch")
	end
		timer.performWithDelay(700,frenchRevoBigListener)

	end

end
end
return true
end

		
frenchRevo:addEventListener("touch")


end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	display.remove(group)
	group = nil
	
	display.remove(picture)
	picture = nil

	back:removeEventListener("touch")

	revoDot:removeEventListener("touch")
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene
