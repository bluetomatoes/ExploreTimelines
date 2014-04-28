W,H = display.contentWidth, display.contentHeight
display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")
local scene = storyboard.newScene()

local location = "nowhere"

local MultiTouch = require("dmc_multitouch")


--Options for the arrowSprite
local options = 
{
	frames = require("ArrowSprites").frames
}

local background, title, subtitle, timeline, rightend,leftend, arrowText, arrowText2, ArrowSpritesSheet,spriteOptions, spriteInstance, menubar, memoryBTN, searchBar,constitution, constitutionFrame, FIWar, FIWarFrame, revoWar,revoFrame,globePopUp



function scene:createScene(event)

	local group = self.view
	local physicsGroup = self.view
end

function scene:enterScene(event) 

	-- create object

 
-- touch listener function



	
	local group = self.view

	print("This is Scene 1")    -- Print messages should show up in the terminal when you run the simulator.


	-- These are the new objects you are creating.  Make sure to declare each of the objects above.

	background = display.newImage("images/Background.png")

	title = display.newText( "The Beginning of a Nation", 0, 0, native.systemFontBold, 60 )
	title:setReferencePoint(display.CenterReferencePoint)
	title.x = W/2
	--set original location.x
	title.y = H/2-250
	--set original location.y
	title:setTextColor ( 0,0,0 )

	subtitle = display.newText("1754-1788",0,0, native.systemFont, 40)
	subtitle:setReferencePoint(display.CenterReferencePoint)
	subtitle.x = W/2
	subtitle.y = H/2-190
	subtitle:setTextColor (0,0,0)
	
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

	globe = display.newImage("images/EarthBW.png",0,0)
	globe:setReferencePoint(display.TopLeftReferencePoint)
	globe.x = 947
	globe.y = 10

	arrowText = display.newText("Tap for the next", 970, H/2, native.systemFont, 12)
	arrowText:setReferencePoint(display.CenterReferencePoint)
	arrowText.x = 970
	arrowText.y=H/2+86
	arrowText:setTextColor(25,25,25)

	arrowText2 = display.newText("time period.", 0, 0, native.systemFont, 12 )
	arrowText2:setReferencePoint(display.CenterReferencePoint)
	arrowText2.x = 970
	arrowText2.y = H/2+98
	arrowText2:setTextColor(25,25,25)

	menubar = display.newRect(0,0,1024,70)
	menubar:setFillColor(159,182,205)

	memoryBTN = display.newImage("images/MemoryTest.png", 500,500)
	memoryBTN:setReferencePoint(display.CenterReferencePoint)
	memoryBTN.x = 830
	memoryBTN.y = 35

	searchBar = display.newImage("images/SearchBar.png")
	searchBar:setReferencePoint(display.CenterReferencePoint)
	searchBar.x = 540
	searchBar.y = 35

	constitutionFrame = display.newImageRect("images/Constitution_Frame.png", 200, 245); 
	constitutionFrame:setReferencePoint(display.CenterReferencePoint)
	constitutionFrame.x = 780
	constitutionFrame.y = 625
	constitutionFrame.alpha = 0

	FIWarFrame = display.newImage("images/FI_Frame.jpg",0,0)
	FIWarFrame:setReferencePoint(display.CenterReferencePoint)
	FIWarFrame.x = 174
	FIWarFrame.y = 286
	FIWarFrame.alpha = 0

	revoFrame = display.newImage("images/Boston_Frame.jpg",0,0)
	revoFrame:setReferencePoint(display.CenterReferencePoint)
	revoFrame.x = 575
	revoFrame.y = 310
	revoFrame.alpha = 0

	massacreFrame = display.newImage("images/BM_Frame.jpg")
	massacreFrame:setReferencePoint(display.CenterReferencePoint)
	massacreFrame.x = 399
	massacreFrame.y = 575
	massacreFrame.alpha = 0

	constitutionBtnFrame = display.newImage("images/ConstitutionBTN_Frame.jpg")
	constitutionBtnFrame:setReferencePoint(display.CenterReferencePoint)
	constitutionBtnFrame.x = 780
	constitutionBtnFrame.y = 480
	constitutionBtnFrame.alpha = 0

	revoBtnFrame = display.newImage("images/revoBTN_Frame.jpg")
	revoBtnFrame:setReferencePoint(display.CenterReferencePoint)
	revoBtnFrame.x = 575
	revoBtnFrame.y = 400
	revoBtnFrame.alpha = 0

	massacreBtnFrame = display.newImage("images/massacreBTN_Frame.jpg")
	massacreBtnFrame:setReferencePoint(display.CenterReferencePoint)
	massacreBtnFrame.x = 399
	massacreBtnFrame.y = 487
	massacreBtnFrame.alpha = 0

	FIWarBtnFrame = display.newImage("images/FIWarBTN_Frame.jpg")
	FIWarBtnFrame:setReferencePoint(display.CenterReferencePoint)
	FIWarBtnFrame.x =174
	FIWarBtnFrame.y = 400
	FIWarBtnFrame.alpha = 0


	dot1 = display.newCircle(0,0,10)
	dot1:setReferencePoint(display.CenterReferencePoint)
	dot1.x = 174
	dot1.y = H/2+60
	dot1.size =20
	dot1:setFillColor(25,25,25)
	dot1.radius = 20

	dot2 = display.newCircle(0,0,10)
	dot2:setReferencePoint(display.CenterReferencePoint)
	dot2.x = 399
	dot2.y = H/2+60
	dot2:setFillColor(25,25,25)

	revoDot = display.newCircle(0,0,10)
	revoDot:setReferencePoint(display.CenterReferencePoint)
	revoDot.x = 575
	revoDot.y = H/2+60
	revoDot.size =20
	revoDot:setFillColor(25,180,25)
	revoDot.radius = 20

	dot4 = display.newCircle(0,0,10)
	dot4:setReferencePoint(display.CenterReferencePoint)
	dot4.x = 780
	dot4.y = H/2+60
	dot4:setFillColor(25,25,25)

	date1 = display.newText("1754-1763",0,0,native.systemFont, 12)
	date1:setReferencePoint(display.CenterReferencePoint)
	date1.x = 174
	date1.y = 423
	date1:setTextColor(25,25,25)

	date2 = display.newText("1770",0,0,native.systemFont, 12)
	date2:setReferencePoint(display.CenterReferencePoint)
	date2.x = 399
	date2.y = 465
	date2:setTextColor(25,25,25)

	date3 = display.newText("1776-1783",0,0,native.systemFont, 12)
	date3:setReferencePoint(display.CenterReferencePoint)
	date3.x = 575
	date3.y = 423
	date3:setTextColor(25,25,25)

	date4 = display.newText("1776-1783",0,0,native.systemFont, 12)
	date4:setReferencePoint(display.CenterReferencePoint)
	date4.x = 780
	date4.y = 460
	date4:setTextColor(25,25,25)

	globePopUp = display.newImage("images/globePopUp.png",820,62)
	globePopUp.alpha = 0

	background2 = display.newRect(0,0,1024,768)
	background2:setFillColor(25,25,25)
	background2.alpha = 0

	doneBtn = display.newImage("images/doneBtn.png")
	doneBtn.x = 30
	doneBtn.y = 40
	doneBtn.alpha = 0

	helptext = display.newText("Drag images or titles to their original positions.",0,0,native.systemFont,20)
	helptext:setReferencePoint(display.CenterReferencePoint)
	helptext.x = W/2
	helptext.y = 250
	helptext:setTextColor(25,25,25)
	helptext.alpha = 0

	answersBtn = display.newRect(20,20,80,40)
	answersBtn:setReferencePoint(display.CenterReferencePoint)
	answersBtn.x = 80
	answersBtn.y = menubar.y
	answersBtn.alpha = 0

	answersBtnText = display.newText("Show",0,0,native.systemFont,14)
	answersBtnText:setReferencePoint(display.CenterReferencePoint)
	answersBtnText.x = answersBtn.x
	answersBtnText.y = menubar.y-8
	answersBtnText:setTextColor(25,25,25)
	answersBtnText.alpha = 0 

	answersBtnText2 = display.newText("Answers",0,0,native.systemFont,14)
	answersBtnText2:setReferencePoint(display.CenterReferencePoint)
	answersBtnText2.x = answersBtn.x
	answersBtnText2.y = menubar.y+6
	answersBtnText2:setTextColor(25,25,25)
	answersBtnText2.alpha = 0

	--Image displayed when the globe pops up (commented out below)

	-- End of the objects you created

	--  You are adding all of the objects you created above into the group called "group".  
	--  Objects you insert last will show up on top of objects you inserted earlier.
	group:insert(background)
	group:insert(title)
	group:insert(subtitle)
	group:insert(timeline)
	group:insert(rightend)
	group:insert(leftend)
	group:insert(arrowText)
	group:insert(arrowText2)
	group:insert(menubar)
	group:insert(answersBtn)
	group:insert(answersBtnText)
	group:insert(answersBtnText2)
	group:insert(memoryBTN)
	group:insert(searchBar)
	group:insert(constitutionFrame)
	group:insert(globe)
	group:insert(FIWarFrame)
	group:insert(revoFrame)
	group:insert(constitutionBtnFrame)
	group:insert(revoBtnFrame)
	group:insert(massacreFrame)
	group:insert(massacreBtnFrame)
	group:insert(FIWarBtnFrame)
	group:insert(dot1)
	group:insert(dot2)
	group:insert(dot4)
	group:insert(date1)
	group:insert(date2)
	group:insert(date3)
	group:insert(date4)
	group:insert(revoDot)
	group:insert(globePopUp)
	group:insert(background2)
	group:insert(helptext)

	local physicsGroup = display.newGroup()
	--Declaration of Independence Image
	constitution = display.newImage("images/Constitution.jpeg",680,450)
	constitution:setReferencePoint(display.CenterReferencePoint)
	constitution.x = 780
	constitution.y = 625
	--French And Indian War Image
	FIWar = display.newImage("images/FrenchIndianWar.jpg",0,0)
	FIWar:setReferencePoint(display.CenterReferencePoint)
	FIWar.x = 174
	FIWar.y = 286
	
	--Revolutionary War Image
	revoWar = display.newImage("images/Boston.jpeg",0,0)
	revoWar:setReferencePoint(display.CenterReferencePoint)
	revoWar.x = 575
	revoWar.y = 310

	massacre = display.newImage("images/boston-massacre.jpg")
	massacre:setReferencePoint(display.CenterReferencePoint)
	massacre.x = 399
	massacre.y = 575

	constitutionBtn = display.newImage("images/ConstitutionBTN.jpg")
	constitutionBtn:setReferencePoint(display.CenterReferencePoint)
	constitutionBtn.x = 780
	constitutionBtn.y = 480


	revoWarBtn = display.newImage("images/revoBTN.jpg")
	revoWarBtn:setReferencePoint(display.CenterReferencePoint)
	revoWarBtn.x = 575
	revoWarBtn.y = 400
	massacreBtn = display.newImage("images/massacreBTN.jpg")
	massacreBtn:setReferencePoint(display.CenterReferencePoint)
	massacreBtn.x = 399
	massacreBtn.y = 487

	FIWarBtn = display.newImage("images/FIWarBTN.jpg")
	FIWarBtn:setReferencePoint(display.CenterReferencePoint)
	FIWarBtn.x = 174
	FIWarBtn.y = 400

	physicsGroup:insert(constitution)
	physicsGroup:insert(FIWar)
	physicsGroup:insert(revoWar)
	physicsGroup:insert(constitutionBtn)
	physicsGroup:insert(revoWarBtn)
	physicsGroup:insert(massacre)
	physicsGroup:insert(massacreBtn)
	physicsGroup:insert(FIWarBtn)

	group:insert(physicsGroup)



	ArrowSpritesSheet = graphics.newImageSheet("images/ArrowSprites.png",options)
	spriteOptions = {name ="ArrowSprites", start=1, count=16,time=1800}
	spriteInstance = display.newSprite( ArrowSpritesSheet, spriteOptions )
	spriteInstance:setReferencePoint(display.CenterReferencePoint)
	spriteInstance.x = 970
	spriteInstance.y = H/2+60
	spriteInstance:play()

	group:insert(spriteInstance)

	local linearImpulseGroup = {}

	linearImpulseGroup[1] =	constitution
	linearImpulseGroup[2] = FIWar
	linearImpulseGroup[3] = revoWar
	linearImpulseGroup[4] = massacre
	linearImpulseGroup[5] = constitutionBtn
	linearImpulseGroup[6] = revoWarBtn
	linearImpulseGroup[7] = massacreBtn
	linearImpulseGroup[8] = FIWarBtn

	--print(linearImpulseGroup[1], linearImpulseGroup[2])




--Create a sprite to show a flashing purple arrow
	function spriteInstance:touch(e)
		if e.phase == "began" then
			display.getCurrentStage():setFocus( e.target )
			e.target.isFocus = true
		elseif e.target.isFocus then
			display.getCurrentStage():setFocus( nil )
			e.target.isFocus = false
			if e.phase == "ended" then
				storyboard.gotoScene("scene2", "slideLeft", 1000)
				display.remove(globePopUp)
				globePopUp = nil
			print("spriteInstance:touch is finished")
			end
		end
		return
	end


	spriteInstance:addEventListener( "touch", spriteInstance )


	local function linearImpulse()
		for i = 1, 8 do
			physics.addBody(linearImpulseGroup[i]);
			linearImpulseGroup[i]:applyLinearImpulse(math.random (70, 800), math.random(70,800), linearImpulseGroup[i].x*math.random(1,20),linearImpulseGroup[i].y*math.random(1,20));
		end
	end


	local function MultiTouchActivate()
		for i = 1, 8 do
			MultiTouch.activate(linearImpulseGroup[i],"move","single")
			print("MultiTouch activated for " ..i)
		end
	end

	Runtime:addEventListener("touch", MultiTouchActivate)

		--Applies physics to set objects when button is pressed.
	function memoryBTN:touch(e)
			if e.phase == "began" then
			display.getCurrentStage():setFocus ( e.target)
			e.target.isFocus = true
			print("BtnTouch is working")
		elseif e.target.isFocus then
			display.getCurrentStage():setFocus( nil )
			e.target.isFocus = false
			if e.phase == "ended" then
				gameIsActive = true
				print("game is active")
				physics = require("physics")
				physics.start()
				print("physics applied")

				transition.to(helptext,{alpha = 1, time = 800})
				transition.to(answersBtn,{alpha = 1, time = 800})
				transition.to(answersBtnText,{alpha = 1, time = 800})
				transition.to(answersBtnText2,{alpha = 1, time = 800})

				linearImpulse()

				function answersBtn:touch(e)
					if e.phase == "began" then
						display.getCurrentStage():setFocus(e.target)
						e.target.isFocus = true
						elseif e.target.isFocus then
						display.getCurrentStage():setFocus( nil )
						e.target.isFocus = false
					if e.phase == "ended" then 
					--create a variable that is the original location
						FIWar.x = 174 
						FIWar.y = 286 
						revoWar.x = 575
						revoWar.y = 310 
						constitution.x = 780 
						constitution.y = 625 
						massacre.x = 399 
						massacre.y = 575 
						constitutionBtn.x = 780 
						constitutionBtn.y = 480 
						revoWarBtn.x = 575 
						revoWarBtn.y = 400 
						massacreBtn.x = 399 
						massacreBtn.y = 487 
						FIWarBtn.x = 174 
						FIWarBtn.y = 400
						FIWar.rotation =  0
						revoWar.rotation = 0  
						constitution.rotation = 0 
						massacre.rotation = 0 
						constitutionBtn.rotation = 0 
						revoWarBtn.rotation = 0 
						massacreBtn.rotation = 0 
						FIWarBtn.rotation = 0 
						physics.pause()
						transition.to(helptext,{alpha = 0, time = 800})
						transition.to(answersBtn,{alpha = 0, time = 800})
						transition.to(answersBtnText,{alpha = 0, time = 800})
						transition.to(answersBtnText2,{alpha = 0, time = 800})
						gameIsActive = false
					end
				end
				return true
			end

			answersBtn:addEventListener("touch",answersBtn)
		



				
					
					
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

					
					local constitutionPosX = 0
					local constitutionPosY = 0

					local function constitutionDrag(event)
						local t = event.target
						if event.phase == "moved" then
							constitutionPosX = constitution.x - constitutionFrame.x
							constitutionPosY = constitution.y - constitutionFrame.y
							print(constitution.x..constitution.y)
							if (constitutionPosX < 0) then
								constitutionPosX = constitutionPosX * -1
							end
							if (constitutionPosX <= 50) and (constitutionPosY <= 50) then
								constitution.x = constitutionFrame.x
								constitution.y = constitutionFrame.y
							end
							elseif event.phase == "ended" then
								if (constitutionPosX <= 50) and (constitutionPosY <= 50) then
									constitution.x = constitutionFrame.x
									constitution.y = constitutionFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(constitution)
									physics.addBody(constitution,"static")
									--Tells object to become inactive.
									constitution.isBodyActive = false
									local state = constitution.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(constitution)		
									transition.to( constitution, { rotation = 0, time=10 }) 
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					constitution:addEventListener(MultiTouch.MULTITOUCH_EVENT, constitutionDrag);

					
					local revoWarPosX = 0
					local revoWarPosY = 0

					local function revoWarDrag(event)
						local t = event.target
						if event.phase == "moved" then
							revoWarPosX = revoWar.x - revoFrame.x
							revoWarPosY = revoWar.y - revoFrame.y
							if (revoWarPosX < 0) then
								revoWarPosX = revoWarPosX * -1
							end
							if (revoWarPosX <= 50) and (revoWarPosY <= 50) then
								revoWar.x = revoFrame.x
								revoWar.y = revoFrame.y
							end
							elseif event.phase == "ended" then
								if (revoWarPosX <= 50) and (revoWarPosY <= 50) then
									revoWar.x = revoFrame.x;
									revoWar.y = revoFrame.y;
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(revoWar)
									physics.addBody(revoWar,"static")
									--Tells object to become inactive.
									revoWar.isBodyActive = false
									local state = revoWar.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(revoWar)	
									transition.to( revoWar, { rotation = 0, time=10 }) 
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					revoWar:addEventListener(MultiTouch.MULTITOUCH_EVENT, revoWarDrag);

					
					local massacrePosX = 0
					local massacrePosY = 0

					local function massacreDrag(event)
						local t = event.target
						if event.phase == "moved" then
							masssacrePosX = massacre.x - massacreFrame.x
							massacrePosY = massacre.y - massacreFrame.y
							if (massacrePosX < 0) then
								massacrePosX = massacrePosX * -1
							end
							if (massacrePosX <= 50) and (massacrePosY <= 50) then
								massacre.x = massacreFrame.x
								massacre.y = massacreFrame.y
							end
							elseif event.phase == "ended" then
								if (massacrePosX <= 50) and (massacrePosY <= 50) then
									massacre.x = massacreFrame.x;
									massacre.y = massacreFrame.y;
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(massacre)
									physics.addBody(massacre,"static")
									--Tells object to become inactive.
									massacre.isBodyActive = false
									local state = massacre.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(massacre)	
									transition.to( massacre, { rotation = 0, time=10 })		end
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
						end
						return true
					end
					massacre:addEventListener(MultiTouch.MULTITOUCH_EVENT, massacreDrag);

					
					local constitutionBtnPosX = 0
					local constitutionBtnPosY = 0

					local function constitutionBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							constitutionBtnPosX = constitutionBtn.x - constitutionBtnFrame.x
							constitutionBtnPosY = constitutionBtn.y - constitutionBtnFrame.y
							if (constitutionBtnPosX < 0) then
								constitutionBtnPosX = constitutionBtnPosX * -1
							end
							if (constitutionBtnPosX <= 50) and (constitutionBtnPosY <= 50) then
								constitutionBtn.x = constitutionFrame.x
								constitutionBtn.y = constitutionBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (constitutionBtnPosX <= 50) and (constitutionBtnPosY <= 50) then
									constitutionBtn.x = constitutionBtnFrame.x;
									constitutionBtn.y = constitutionBtnFrame.y;
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(constitutionBtn)
									physics.addBody(constitutionBtn,"static")
									--Tells object to become inactive.
									constitutionBtn.isBodyActive = false
									local state = constitutionBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(constitutionBtn)	
									transition.to( constitutionBtn, { rotation = 0, time=10 })		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end

							end
						end
						return true
					end
					constitutionBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, constitutionBtnDrag);

					
					local revoWarBtnPosX = 0
					local revoWarBtnPosY = 0

					local function revoWarBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							revoWarBtnPosX = revoWarBtn.x - revoBtnFrame.x
							revoWarBtnPosY = revoWarBtn.y - revoBtnFrame.y
							if (revoWarBtnPosX < 0) then
								revoWarBtnPosX = revoWarBtnPosX * -1
							end
							if (revoWarBtnPosX <= 50) and (revoWarBtnPosY <= 50) then
								revoWarBtn.x = revoBtnFrame.x
								revoWarBtn.y = revoBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (revoWarBtnPosX <= 50) and (revoWarBtnPosY <= 50) then
									revoWarBtn.x = revoBtnFrame.x
									revoWarBtn.y = revoBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(revoWarBtn)
									physics.addBody(revoWarBtn,"static")

									--Tells object to become inactive.
									revoWarBtn.isBodyActive = false
									local state = revoWarBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(revoWarBtn)	
									transition.to( revoWarBtn, { rotation = 0, time=10 })	
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					revoWarBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, revoWarBtnDrag)

					
					local massacreBtnPosX = 0
					local massacreBtnPosY = 0

					local function massacreBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							massacreBtnPosX = massacreBtn.x - massacreBtnFrame.x
							massacreBtnPosY = massacreBtn.y - massacreBtnFrame.y
							if (massacreBtnPosX < 0) then
								massacreBtnPosX = massacreBtnPosX * -1
							end
							if (massacreBtnPosX <= 50) and (massacreBtnPosY <= 50) then
								massacreBtn.x = massacreBtnFrame.x
								massacreBtn.y = revoBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (massacreBtnPosX <= 50) and (massacreBtnPosY <= 50) then
									massacreBtn.x = massacreBtnFrame.x
									massacreBtn.y = massacreBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(massacreBtn)
									physics.addBody(massacreBtn,"static")
									--Tells object to become inactive.
									massacreBtn.isBodyActive = false
									local state = massacreBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(massacreBtn)	
									transition.to( massacreBtn, { rotation = 0, time=10 })		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					massacreBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, massacreBtnDrag)

					
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
									local state = FIWarBtn.isBodyActive
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
								end
							end
						return
					end


memoryBTN:addEventListener("touch")
local lastGoalTime = 100

function monitorScore(event)
	if event.time - lastGoalTime >= 100 then
		if FIWar.x == 174 and FIWar.y == 286 and revoWar.x == 575 and revoWar.y == 310 and 	constitution.x == 780 and constitution.y == 625 and massacre.x == 399 and massacre.y == 575 and constitutionBtn.x == 780 and constitutionBtn.y == 480 and revoWarBtn.x == 575 and revoWarBtn.y == 400 and massacreBtn.x == 399 and massacreBtn.y == 487 and FIWarBtn.x == 174 and FIWarBtn.y == 400 then
			gameIsActive = false

			lastGoalTime = event.time

		elseif FIWar.x ~= 174 or FIWar.y ~= 286 or revoWar.x ~= 575 or revoWar.y ~= 310 or 	constitution.x ~= 780 or constitution.y ~= 625 or massacre.x ~= 399 or massacre.y ~= 575 or constitutionBtn.x ~= 780 or constitutionBtn.y ~= 480 or revoWarBtn.x ~= 575 or revoWarBtn.y ~= 400 or massacreBtn.x ~= 399 or massacreBtn.y ~= 487 or FIWarBtn.x ~= 174 or FIWarBtn.y ~= 400 then
			gameIsActive = true
		end
	end
end
Runtime:addEventListener("enterFrame",monitorScore)


function revoDot:touch(event)
	if  gameIsActive == false then
		if event.phase =="began" then
		display.getCurrentStage():setFocus(event.target)
		event.target.isFocus = true
			elseif event.target.isFocus then
			display.getCurrentStage():setFocus(nil)
			event.target.isFocus = false
		if event.phase == "ended" then
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


function globe:touch(event)
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
			globePopUp.alpha = 1
			function globePopUp:touch(event)
				if event.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
					elseif self.isFocus then
						if event.phase == "moved" then
						elseif event.phase == "ended" then
						display.getCurrentStage():setFocus(nil)
						storyboard.gotoScene("scene3", "slideDown",1000)
						globePopUp.alpha = 0
					end
				end
				return true
			end
		end

globePopUp:addEventListener("touch")

	end
	end
return true
end

globe:addEventListener("touch")

function constitution:touch(event)

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
		transition.to(constitution,{xScale =2.91,yScale =2.906, x = W/2-140, y = H/2, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(constitution)
		group:insert(doneBtn)
		local function constitutionBigListener(event)
		constitutionBig = display.newImage("images/Constitution_Big.gif")
		constitutionBig:setReferencePoint(display.CenterReferencePoint)
		constitutionBig.x = W/2-140
		constitutionBig.y = H/2
		group:insert(constitutionBig)

		local widget = require( "widget" )

--Function to listen for scrollView events
local function scrollListener( event )
	print( "ScrollView Event:", event.type )
	return true
end
	
--Create a scrollView
local scrollView = widget.newScrollView{
	top = 0, left = 690,
	width = 310, height = 768,
	--bgColor = { 255, 0, 255, 255 }, 	--Un-Comment this to set the background color of the scrollView.
	--scrollBarColor = { 255, 0, 128 }, --Un-Comment this to set the scrollBar to a custom color.
	--hideScrollBar = true, 			--Un-Comment this to hide the scrollBar
	listener = scrollListener

}

scrollView.content.horizontalScrollDisabled = true

--Create a text object for the scrollViews title
local titleText = display.newText("Read the Constitution", 0, 0, native.systemFontBold, 16)
titleText:setTextColor(0, 0, 0)
titleText.x = display.contentCenterX-350
titleText.y = 48
scrollView:insert( titleText )

--Create a large text string
local lotsOfText = "IN CONGRESS, July 4, 1776.\n\nThe unanimous Declaration of the thirteen united States of America,\n\nWhen in the Course of human events, it becomes necessary for one people to dissolve the political bands which have connected them with another, and to assume among the powers of the earth, the separate and equal station to which the Laws of Nature and of Nature's God entitle them, a decent respect to the opinions of mankind requires that they should declare the causes which impel them to the separation.\n\nWe hold these truths to be self-evident, that all men are created equal, that they are endowed by their Creator with certain unalienable Rights, that among these are Life, Liberty and the pursuit of Happiness.--That to secure these rights, Governments are instituted among Men, deriving their just powers from the consent of the governed, --That whenever any Form of Government becomes destructive of these ends, it is the Right of the People to alter or to abolish it, and to institute new Government, laying its foundation on such principles and organizing its powers in such form, as to them shall seem most likely to effect their Safety and Happiness. Prudence, indeed, will dictate that Governments long established should not be changed for light and transient causes; and accordingly all experience hath shewn, that mankind are more disposed to suffer, while evils are sufferable, than to right themselves by abolishing the forms to which they are accustomed. But when a long train of abuses and usurpations, pursuing invariably the same Object evinces a design to reduce them under absolute Despotism, it is their right, it is their duty, to throw off such Government, and to provide new Guards for their future security.--Such has been the patient sufferance of these Colonies; and such is now the necessity which constrains them to alter their former Systems of Government. The history of the present King of Great Britain is a history of repeated injuries and usurpations, all having in direct object the establishment of an absolute Tyranny over these States. To prove this, let Facts be submitted to a candid world.\n\nHe has refused his Assent to Laws, the most wholesome and necessary for the public good.\n\nHe has forbidden his Governors to pass Laws of immediate and pressing importance, unless suspended in their operation till his Assent should be obtained; and when so suspended, he has utterly neglected to attend to them.\n\nHe has refused to pass other Laws for the accommodation of large districts of people, unless those people would relinquish the right of Representation in the Legislature, a right inestimable to them and formidable to tyrants only.\n\nHe has called together legislative bodies at places unusual, uncomfortable, and distant from the depository of their public Records, for the sole purpose of fatiguing them into compliance with his measures.\n\nHe has dissolved Representative Houses repeatedly, for opposing with manly firmness his invasions on the rights of the people.\n\nHe has refused for a long time, after such dissolutions, to cause others to be elected; whereby the Legislative powers, incapable of Annihilation, have returned to the People at large for their exercise; the State remaining in the mean time exposed to all the dangers of invasion from without, and convulsions within.\n\nHe has endeavoured to prevent the population of these States; for that purpose obstructing the Laws for Naturalization of Foreigners; refusing to pass others to encourage their migrations hither, and raising the conditions of new Appropriations of Lands.\n\nHe has obstructed the Administration of Justice, by refusing his Assent to Laws for establishing Judiciary powers.\n\nHe has made Judges dependent on his Will alone, for the tenure of their offices, and the amount and payment of their salaries.\n\nHe has erected a multitude of New Offices, and sent hither swarms of Officers to harrass our people, and eat out their substance.\n\nHe has kept among us, in times of peace, Standing Armies without the Consent of our legislatures.\n\nHe has affected to render the Military independent of and superior to the Civil power.\n\nHe has combined with others to subject us to a jurisdiction foreign to our constitution, and unacknowledged by our laws; giving his Assent to their Acts of pretended Legislation:\n\nFor Quartering large bodies of armed troops among us:\n\nFor protecting them, by a mock Trial, from punishment for any Murders which they should commit on the Inhabitants of these States:\n\nFor cutting off our Trade with all parts of the world:\n\nFor imposing Taxes on us without our Consent:\n\nFor depriving us in many cases, of the benefits of Trial by Jury:\n\nFor transporting us beyond Seas to be tried for pretended offences\n\nFor abolishing the free System of English Laws in a neighbouring Province, establishing therein an Arbitrary government, and enlarging its Boundaries so as to render it at once an example and fit instrument for introducing the same absolute rule into these Colonies:\n\nFor taking away our Charters, abolishing our most valuable Laws, and altering fundamentally the Forms of our Governments:\n\nFor suspending our own Legislatures, and declaring themselves invested with power to legislate for us in all cases whatsoever.\n\nHe has abdicated Government here, by declaring us out of his Protection and waging War against us.\n\nHe has plundered our seas, ravaged our Coasts, burnt our towns, and destroyed the lives of our people.\n\nHe is at this time transporting large Armies of foreign Mercenaries to compleat the works of death, desolation and tyranny, already begun with circumstances of Cruelty & perfidy scarcely paralleled in the most barbarous ages, and totally unworthy the Head of a civilized nation.\n\nHe has constrained our fellow Citizens taken Captive on the high Seas to bear Arms against their Country, to become the executioners of their friends and Brethren, or to fall themselves by their Hands.\n\nHe has excited domestic insurrections amongst us, and has endeavoured to bring on the inhabitants of our frontiers, the merciless Indian Savages, whose known rule of warfare, is an undistinguished destruction of all ages, sexes and conditions.\n\nIn every stage of these Oppressions We have Petitioned for Redress in the most humble terms: Our repeated Petitions have been answered only by repeated injury. A Prince whose character is thus marked by every act which may define a Tyrant, is unfit to be the ruler of a free people.\n\nNor have We been wanting in attentions to our Brittish brethren. We have warned them from time to time of attempts by their legislature to extend an unwarrantable jurisdiction over us. We have reminded them of the circumstances of our emigration and settlement here. We have appealed to their native justice and magnanimity, and we have conjured them by the ties of our common kindred to disavow these usurpations, which, would inevitably interrupt our connections and correspondence. They too have been deaf to the voice of justice and of consanguinity. We must, therefore, acquiesce in the necessity, which denounces our Separation, and hold them, as we hold the rest of mankind, Enemies in War, in Peace Friends.\n\nWe, therefore, the Representatives of the united States of America, in General Congress, Assembled, appealing to the Supreme Judge of the world for the rectitude of our intentions, do, in the Name, and by Authority of the good People of these Colonies, solemnly publish and declare, That these United Colonies are, and of Right ought to be Free and Independent States; that they are Absolved from all Allegiance to the British Crown, and that all political connection between them and the State of Great Britain, is and ought to be totally dissolved; and that as Free and Independent States, they have full Power to levy War, conclude Peace, contract Alliances, establish Commerce, and to do all other Acts and Things which Independent States may of right do. And for the support of this Declaration, with a firm reliance on the protection of divine Providence, we mutually pledge to each other our Lives, our Fortunes and our sacred Honor.\n\nThe 56 signatures on the Declaration appear in the positions indicated:\n\nColumn 1\n\nGeorgia:\n\nButton Gwinnett\n\nLyman Hall\n\nGeorge Walton\n\nColumn 2\n\nNorth Carolina:\n\nWilliam Hooper\n\nJoseph Hewes\n\nJohn Penn\n\nSouth Carolina:\n\nEdward Rutledge\n\nThomas Heyward, Jr.\n\nThomas Lynch, Jr.\n\nArthur Middleton\n\nColumn 3\n\nMassachusetts:\n\nJohn Hancock\n\nMaryland:\n\nSamuel Chase\n\nWilliam Paca\n\nThomas Stone\n\nCharles Carroll of Carrollton\n\nVirginia:\n\nGeorge Wythe\n\nRichard Henry Lee\n\nThomas Jefferson\n\nBenjamin Harrison\n\nThomas Nelson, Jr.\n\nFrancis Lightfoot Lee\n\nCarter Braxton\n\nColumn 4\n\nPennsylvania:\n\nRobert Morris\n\nBenjamin Rush\n\nBenjamin Franklin\n\nJohn Morton\n\nGeorge Clymer\n\nJames Smith\n\nGeorge Taylor\n\nJames Wilson\n\nGeorge Ross\n\nDelaware:\n\nCaesar Rodney\n\nGeorge Read\n\nThomas McKean\n\nColumn 5\n\nNew York:\n\nWilliam Floyd\n\nPhilip Livingston\n\nFrancis Lewis\n\nLewis Morris\n\nNew Jersey:\n\nRichard Stockton\n\nJohn Witherspoon\n\nFrancis Hopkinson\n\nJohn Hart\n\nAbraham Clark\n\nColumn 6\n\nNew Hampshire:\n\nJosiah Bartlett\n\nWilliam Whipple\n\nMassachusetts:\n\nSamuel Adams\n\nJohn Adams\n\nRobert Treat Paine\n\nElbridge Gerry\n\nRhode Island:\n\nStephen Hopkins\n\nWilliam Ellery\n\nConnecticut:\n\nRoger Sherman\n\nSamuel Huntington\n\nWilliam Williams\n\nOliver Wolcott\n\nNew Hampshire:\n\nMatthew Thornton"

--Create a text object containing the large text string and insert it into the scrollView
local lotsOfTextObject = display.newText( lotsOfText, 0, 0, 272, 7452, "Helvetica", 14)
lotsOfTextObject:setTextColor( 0 ) 
lotsOfTextObject:setReferencePoint( display.TopCenterReferencePoint )
lotsOfTextObject.x = display.contentCenterX-350
lotsOfTextObject.y = titleText.y + titleText.contentHeight + 10
scrollView:insert(lotsOfTextObject)


		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then

					display.remove(constitutionBig)
					constitutionBig = nil

					transition.to (constitution,{xScale = 1,yScale = 1, x = 780, y = 625, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})
					transition.to(scrollView,{alpha = 0, time= 400})

				end
			end
		end
	end

	doneBtn:addEventListener("touch")


display.setStatusBar( display.HiddenStatusBar ) 


	end
		timer.performWithDelay(700,constitutionBigListener)


			end
		end
	end
return true
end

constitution:addEventListener("touch")


function massacre:touch(event)
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
		transition.to(massacre,{xScale =4.5,yScale =4.507, x = W/2, y = H/2-70, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(massacre)
		group:insert(doneBtn)

		local function massacreBigListener(event)
		massacreBig = display.newImage("images/boston-massacre_Big2.png")
		massacreBig:setReferencePoint(display.CenterReferencePoint)
		massacreBig.x = W/2
		massacreBig.y = H/2-70


		massacreTextBox = display.newRect(0,0,960,60)
		massacreTextBox:setReferencePoint(display.CenterReferencePoint)
		massacreTextBox.x = W/2
		massacreTextBox.y = 692.5

		massacreText = display.newText("The Boston Massacre was a key point in the colonies growing anger towards the British Colonies.",0,0,native.systemFont,20)
		massacreText:setReferencePoint(display.CenterReferencePoint)
		massacreText.x = W/2
		massacreText.y = 680
		massacreText:setTextColor(25,25,25)

		massacreText2 = display.newText("Paul Revere, a patriot, created this engraving to stir up anti-British sentiment.",0,0,native.systemFont,20)
		massacreText2:setReferencePoint(display.CenterReferencePoint)
		massacreText2.x = W/2
		massacreText2.y = 705
		massacreText2:setTextColor(25,25,25)



		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then

					display.remove(massacreBig)
					massacreBig = nil
					display.remove(massacreText)
					massacreText = nil
					display.remove(massacreText2)
					massacreText2 = nil
					display.remove(massacreTextBox)
					massacreTextBox = nil

					transition.to (massacre,{xScale = 1,yScale = 1, x = 399, y = 575, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})

					
				end
			end
		end
	end

	doneBtn:addEventListener("touch")

	end
		timer.performWithDelay(700,massacreBigListener)
end
	end
end
return true
end

massacre:addEventListener("touch")

function revoWar:touch(event)
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
		transition.to(revoWar,{xScale =5.04,yScale =5, x = W/2, y = H/2, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(revoWar)
		group:insert(doneBtn)

		local function revoWarBigListener(event)
		revoWarBig = display.newImage("images/AmRevoBig3.png")
		revoWarBig:setReferencePoint(display.CenterReferencePoint)
		revoWarBig.x = W/2
		revoWarBig.y = H/2
		group:insert(revoWarBig)


		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then

					display.remove(revoWarBig)
					revoWarBig = nil

					transition.to (revoWar,{xScale = 1,yScale = 1, x = 575, y = 310, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})

					
				end
			end
		end
	end

	doneBtn:addEventListener("touch")
	end
		timer.performWithDelay(700,revoWarBigListener)

	end

	end
end
return true
end

revoWar:addEventListener("touch")



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
		transition.to(FIWar,{xScale = 2.857,yScale =3.1847, x = W/2, y = H/2-60, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(FIWar)
		group:insert(doneBtn)

		location = "FIWar:"

		local function FIWarBigListener(event)
		FIWarBig = display.newImage("images/French_Indian_War_Big.jpeg")
		FIWarBig:setReferencePoint(display.CenterReferencePoint)
		FIWarBig.x = W/2
		FIWarBig.y = H/2-60
		group:insert(FIWarBig)



		SubmitBtn = display.newText("Submit",900,730,native.systemFont,16)
			inputField = native.newTextField( 60, 640, FIWarBig.width, 80, test)
			inputField.font = native.newFont( native.systemFont, 10 )
			function SubmitBtn:touch (event)
				if event.phase == "ended" then
			                print (location..inputField.text)


			end
			 
			end

			SubmitBtn:addEventListener("touch")
			
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

					SubmitBtn.alpha = 0

					display.remove(inputField)
					inputField = nil

					transition.to (FIWar,{xScale = 1,yScale = 1, x = 174, y = 286, time = 800})
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




--Final end

end

function scene:exitScene(event)
	local group = self.view

	-- any objects you created in EnterScene need to be removed here.  So you will remove EventListeners and display objects here.  Example code below.
	display.remove(group)
	group = nil

	helptext.alpha = 0

	-- this is how you remove an event listener
	spriteInstance:removeEventListener( "touch", spriteInstance )	


	memoryBTN:removeEventListener("touch",memoryBTN)

	globe:removeEventListener("touch")

	Runtime:removeEventListener("enterFrame",monitorScore)

	revoDot:removeEventListener("touch")
	
	

	FIWar:removeEventListener("touch")
	revoWar:removeEventListener("touch")
	constitution:removeEventListener("touch")
	massacre:removeEventListener("touch")



end

function scene:destroyScene(event)


	local group = self.view

end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener( "destroyScene", scene )

return scene
