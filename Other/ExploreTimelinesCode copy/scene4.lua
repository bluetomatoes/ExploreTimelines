W,H = display.contentWidth,display.contentHeight
display.setStatusBar(display.HiddenStatusBar)
----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

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
local background,title,subtitle, memoryBTN, globe, searchBar, back, doi
-- Called when the scene's view does not exist:
function scene:createScene( event )
	print("this is scene 4")
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )

	local group = self.view


	background = display.newRect(0,0,1024,768)
	background:setFillColor(40,120,200)

	title = display.newText("The Revolutionary War",0,0,native.systemFont,60)
	title:setReferencePoint(display.CenterReferencePoint)
	title.x = W/2
	title.y = H/2-250
	title:setTextColor(25,25,25)

	subtitle = display.newText("1776-1783",0,0,native.systemFont,40)
	subtitle:setReferencePoint(display.CenterReferencePoint)
	subtitle.x = W/2
	subtitle.y = H/2-200
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

	memoryBTN = display.newImage("images/MemoryTest.png", 500,500)
	memoryBTN:setReferencePoint(display.CenterReferencePoint)
	memoryBTN.x = 830
	memoryBTN.y = 35

	dot1 = display.newCircle(0,0,10)
	dot1:setReferencePoint(display.CenterReferencePoint)
	dot1.x = 155
	dot1.y = H/2+60
	dot1:setFillColor(25,25,25)

	dot2 = display.newCircle(0,0,10)
	dot2:setReferencePoint(display.CenterReferencePoint)
	dot2.x = 260
	dot2.y = H/2+60
	dot2:setFillColor(25,25,25)

	dot3 = display.newCircle(0,0,10)
	dot3:setReferencePoint(display.CenterReferencePoint)
	dot3.x = 310
	dot3.y = H/2+60
	dot3.size =20
	dot3:setFillColor(25,25,25)
	dot3.radius = 20

	dot4 = display.newCircle(0,0,10)
	dot4:setReferencePoint(display.CenterReferencePoint)
	dot4.x = 350
	dot4.y = H/2+60
	dot4:setFillColor(25,25,25)

	dot5 = display.newCircle(0,0,10)
	dot5:setReferencePoint(display.CenterReferencePoint)
	dot5.x = dot4.x+70
	dot5.y = H/2+60
	dot5:setFillColor(25,25,25)

	dot6 = display.newCircle(0,0,10)
	dot6:setReferencePoint(display.CenterReferencePoint)
	dot6.x = dot5.x+105
	dot6.y = H/2+60
	dot6:setFillColor(25,25,25)

	dot7 = display.newCircle(0,0,10)
	dot7:setReferencePoint(display.CenterReferencePoint)
	dot7.x = dot6.x+90
	dot7.y = H/2+60
	dot7:setFillColor(25,25,25)

	dot8 = display.newCircle(0,0,10)
	dot8:setReferencePoint(display.CenterReferencePoint)
	dot8.x = 760
	dot8.y = H/2+60
	dot8:setFillColor(25,25,25)

	dot9 = display.newCircle(0,0,10)
	dot9:setReferencePoint(display.CenterReferencePoint)
	dot9.x = rightend.x
	dot9.y = H/2+60
	dot9:setFillColor(25,25,25)

	date1 = display.newText("April 1775",0,0,native.systemFont, 12)
	date1:setReferencePoint(display.CenterReferencePoint)
	date1.x = dot1.x
	date1.y = dot1.y+22
	date1:setTextColor(25,25,25)

	date2 = display.newText("March 1776",0,0,native.systemFont, 12)
	date2:setReferencePoint(display.CenterReferencePoint)
	date2.x = dot2.x
	date2.y = dot2.y+22
	date2:setTextColor(25,25,25)

	date3 = display.newText("July 1776",0,0,native.systemFont, 12)
	date3:setReferencePoint(display.CenterReferencePoint)
	date3.x = dot3.x
	date3.y = dot3.y-22
	date3:setTextColor(25,25,25)

	date4 = display.newText("August 1776",0,0,native.systemFont, 12)
	date4:setReferencePoint(display.CenterReferencePoint)
	date4.x = dot4.x
	date4.y = dot4.y+22
	date4:setTextColor(25,25,25)

	date5 = display.newText("December 1776",0,0,native.systemFont, 12)
	date5:setReferencePoint(display.CenterReferencePoint)
	date5.x = dot5.x
	date5.y = dot5.y-22
	date5:setTextColor(25,25,25)

	date6 = display.newText("October 1777",0,0,native.systemFont, 12)
	date6:setReferencePoint(display.CenterReferencePoint)
	date6.x = dot6.x
	date6.y = dot6.y+22
	date6:setTextColor(25,25,25)

	date7 = display.newText("February 1778",0,0,native.systemFont, 12)
	date7:setReferencePoint(display.CenterReferencePoint)
	date7.x = dot7.x
	date7.y = dot7.y-22
	date7:setTextColor(25,25,25)

	date8 = display.newText("October 1781",0,0,native.systemFont, 12)
	date8:setReferencePoint(display.CenterReferencePoint)
	date8.x = dot8.x
	date8.y = dot8.y-22
	date8:setTextColor(25,25,25)

	date9 = display.newText("October 1783",0,0,native.systemFont, 12)
	date9:setReferencePoint(display.CenterReferencePoint)
	date9.x = dot9.x
	date9.y = dot9.y-22
	date9:setTextColor(25,25,25)

	lexington = display.newImage("images/Lexington_Concord.png")
	lexington:setReferencePoint(display.CenterReferencePoint)
	lexington.x = 110
	lexington.y = 625

	boston = display.newImage("images/BostonBritishRetreat.jpeg")
	boston:setReferencePoint(display.CenterReferencePoint)
	boston.x = 340
	boston.y = 655

	doi = display.newImage("images/DOI.jpeg")
	doi:setReferencePoint(display.CenterReferencePoint)
	doi.x = 150
	doi.y=280

	saratoga = display.newImage("images/FrenchAmericanRevo3.jpeg")
	saratoga:setReferencePoint(display.CenterReferencePoint)
	saratoga.x = 635
	saratoga.y = 645

	trenton = display.newImage("images/Trenton.jpg")
	trenton:setReferencePoint(display.CenterReferencePoint)
	trenton.x = 580
	trenton.y = 285

	yorktown = display.newImage("images/British_surrender.jpg")
	yorktown:setReferencePoint(display.CenterReferencePoint)
	yorktown.x = 870
	yorktown.y = 300

	treatParis = display.newImage("images/TreatParis.jpeg")
	treatParis:setReferencePoint(display.CenterReferencePoint)
	treatParis.x = dot9.x
	treatParis.y = H/2+200

	lexingtonFrame = display.newImage("images/Lexington_Concord.png")
	lexingtonFrame:setReferencePoint(display.CenterReferencePoint)
	lexingtonFrame.x = 110
	lexingtonFrame.y = 625
	lexingtonFrame.alpha = 0

	bostonFrame = display.newImage("images/BostonBritishRetreat.jpeg")
	bostonFrame:setReferencePoint(display.CenterReferencePoint)
	bostonFrame.x = 340
	bostonFrame.y = 655
	bostonFrame.alpha = 0

	doiFrame = display.newImage("images/DOI.jpeg")
	doiFrame:setReferencePoint(display.CenterReferencePoint)
	doiFrame.x = 150
	doiFrame.y=280
	doiFrame.alpha = 0

	saratogaFrame = display.newImage("images/FrenchAmericanRevo3.jpeg")
	saratogaFrame:setReferencePoint(display.CenterReferencePoint)
	saratogaFrame.x = 635
	saratogaFrame.y = 645
	saratogaFrame.alpha = 0

	trentonFrame = display.newImage("images/Trenton.jpg")
	trentonFrame:setReferencePoint(display.CenterReferencePoint)
	trentonFrame.x = 580
	trentonFrame.y = 285
	trentonFrame.alpha = 0

	yorktownFrame = display.newImage("images/British_surrender.jpg")
	yorktownFrame:setReferencePoint(display.CenterReferencePoint)
	yorktownFrame.x = 870
	yorktownFrame.y = 300
	yorktownFrame.alpha = 0

	treatParisFrame = display.newImage("images/TreatParis.jpeg")
	treatParisFrame:setReferencePoint(display.CenterReferencePoint)
	treatParisFrame.x = dot9.x
	treatParisFrame.y = H/2+200
	treatParisFrame.alpha = 0

	lexingtonArrow = display.newImage("images/Arrow6.png")
	lexingtonArrow:setReferencePoint(display.CenterReferencePoint)
	lexingtonArrow.x = dot1.x
	lexingtonArrow.y = H/2+165

	bostonArrow = display.newImage("images/Arrow5.png")
	bostonArrow:setReferencePoint(display.TopLeftReferencePoint)
	bostonArrow.x = dot2.x
	bostonArrow.y = H/2+145
	bostonArrow.rotation = 10

	saratogaArrow = display.newImage("images/Arrow4.png",510,510)
	saratogaArrow:setReferencePoint(display.TopLeftReferencePoint)
	saratogaArrow.x = dot6.x+40
	saratogaArrow.y = H/2+120

	doiArrow = 	display.newImage("images/Arrow1.png",200,50)
	doiArrow:setReferencePoint(display.BottomRightReferencePoint)
	doiArrow.x = dot3.x
	doiArrow.y = 365

	trentonArrow = display.newImage("images/Arrow2.png")
	trentonArrow.x = 460
	trentonArrow.y = 370
	trentonArrow.rotation = 320

	lexingtonBtn = display.newImage("images/lexingtonBtn.jpeg")
	lexingtonBtn:setReferencePoint(display.CenterReferencePoint)
	lexingtonBtn.x = dot1.x
	lexingtonBtn.y = H/2 + 120

	bostonBtn = display.newImage("images/bostonBtn.jpeg")
	bostonBtn:setReferencePoint(display.CenterReferencePoint)
	bostonBtn.x = dot2.x
	bostonBtn.y = H/2+115

	doiBtn = display.newImage("images/doiButton.png")
	doiBtn:setReferencePoint(display.CenterReferencePoint)
	doiBtn.x = dot3.x
	doiBtn.y = H/2+10

	nyBtn = display.newImage("images/newYorkBtn.jpeg")
	nyBtn.x = dot4.x
	nyBtn.y = H/2+113

	saratogaBtn = display.newImage("images/saratogaBtn.jpeg")
	saratogaBtn.x = dot6.x
	saratogaBtn.y = H/2+110

	trentonBtn = display.newImage("images/trentonBtn.jpeg")
	trentonBtn.x = dot5.x
	trentonBtn.y = H/2+15

	franceBtn = display.newImage("images/FranceAmRevoBtn.jpeg")
	franceBtn:setReferencePoint(display.CenterReferencePoint)
	franceBtn.x = dot7.x
	franceBtn.y = H/2+3

	yorktownBtn = display.newImage("images/surrenderBtn.jpeg")
	yorktownBtn:setReferencePoint(display.CenterReferencePoint)
	yorktownBtn.x = dot8.x
	yorktownBtn.y = H/2+3

	treatParisBtn = display.newImage("images/treatParisBtn.jpeg")
	treatParisBtn:setReferencePoint(display.CenterReferencePoint)
	treatParisBtn.x = dot9.x
	treatParisBtn.y = H/2+14

	lexingtonBtnFrame = display.newImage("images/lexingtonBtn.jpeg")
	lexingtonBtnFrame:setReferencePoint(display.CenterReferencePoint)
	lexingtonBtnFrame.x = dot1.x
	lexingtonBtnFrame.y = H/2 + 120
	lexingtonBtnFrame.alpha = 0

	bostonBtnFrame = display.newImage("images/bostonBtn.jpeg")
	bostonBtnFrame:setReferencePoint(display.CenterReferencePoint)
	bostonBtnFrame.x = dot2.x
	bostonBtnFrame.y = H/2+115
	bostonBtnFrame.alpha = 0

	doiBtnFrame = display.newImage("images/doiButton.png")
	doiBtnFrame:setReferencePoint(display.CenterReferencePoint)
	doiBtnFrame.x = dot3.x
	doiBtnFrame.y = H/2+10
	doiBtnFrame.alpha = 0

	nyBtnFrame = display.newImage("images/newYorkBtn.jpeg")
	nyBtnFrame.x = dot4.x
	nyBtnFrame.y = H/2+113
	nyBtnFrame.alpha = 0

	saratogaBtnFrame = display.newImage("images/saratogaBtn.jpeg")
	saratogaBtnFrame.x = dot6.x
	saratogaBtnFrame.y = H/2+110
	saratogaBtnFrame.alpha = 0

	trentonBtnFrame = display.newImage("images/trentonBtn.jpeg")
	trentonBtnFrame.x = dot5.x
	trentonBtnFrame.y = H/2+15
	trentonBtnFrame.alpha = 0

	franceBtnFrame = display.newImage("images/FranceAmRevoBtn.jpeg")
	franceBtnFrame:setReferencePoint(display.CenterReferencePoint)
	franceBtnFrame.x = dot7.x
	franceBtnFrame.y = H/2+3
	franceBtnFrame.alpha = 0

	yorktownBtnFrame = display.newImage("images/surrenderBtn.jpeg")
	yorktownBtnFrame:setReferencePoint(display.CenterReferencePoint)
	yorktownBtnFrame.x = dot8.x
	yorktownBtnFrame.y = H/2+3
	yorktownBtnFrame.alpha = 0

	treatParisBtnFrame = display.newImage("images/treatParisBtn.jpeg")
	treatParisBtnFrame:setReferencePoint(display.CenterReferencePoint)
	treatParisBtnFrame.x = dot9.x
	treatParisBtnFrame.y = H/2+14
	treatParisBtnFrame.alpha = 0

	background2 = display.newRect(0,0,1024,768)
	background2:setFillColor(25,25,25)
	background2.alpha = 0

	back = display.newRect(0,0, 80,40)
	back:setReferencePoint(display.CenterReferencePoint)
	back.x = 60
	back.y = menubar.y

	backtext = display.newText("Back",0,0,native.systemFont, 24)
	backtext:setReferencePoint(display.CenterReferencePoint)
	backtext.x = back.x
	backtext.y = back.y
	backtext:setTextColor(25,25,25)

	doneBtn = display.newImage("images/doneBtn.png")
	doneBtn.x = 30
	doneBtn.y = 40
	doneBtn.alpha = 0

	answersBtn = display.newRect(80,20,80,40)
	answersBtn:setReferencePoint(display.CenterReferencePoint)
	answersBtn.x = 160
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


	group:insert(background)
	group:insert(title)
	group:insert(subtitle)
	group:insert(timeline)
	group:insert(rightend)
	group:insert(leftend)
	group:insert(menubar)
	group:insert(searchBar)
	group:insert(globe)
	group:insert(memoryBTN)
	group:insert(back)
	group:insert(backtext)
	group:insert(dot1)
	group:insert(dot2)
	group:insert(dot3)
	group:insert(dot4)
	group:insert(dot5)
	group:insert(dot6)
	group:insert(dot7)
	group:insert(dot8)
	group:insert(dot9)
	group:insert(date1)
	group:insert(date2)
	group:insert(date3)
	group:insert(date4)
	group:insert(date5)
	group:insert(date6)
	group:insert(date7)
	group:insert(date8)
	group:insert(date9)
	group:insert(lexingtonArrow)
	group:insert(bostonArrow)
	group:insert(doiArrow)
	group:insert(saratogaArrow)
	group:insert(trentonArrow)
	group:insert(lexington)
	group:insert(boston)
	group:insert(saratoga)
	group:insert(doi)
	group:insert(trenton)
	group:insert(yorktown)
	group:insert(treatParis)
	group:insert(lexingtonFrame)
	group:insert(bostonFrame)
	group:insert(saratogaFrame)
	group:insert(doiFrame)
	group:insert(trentonFrame)
	group:insert(yorktownFrame)
	group:insert(treatParisFrame)
	group:insert(lexingtonBtn)
	group:insert(bostonBtn)
	group:insert(doiBtn)
	group:insert(nyBtn)
	group:insert(trentonBtn)
	group:insert(yorktownBtn)
	group:insert(saratogaBtn)
	group:insert(treatParisBtn)
	group:insert(franceBtn)
	group:insert(lexingtonBtnFrame)
	group:insert(bostonBtnFrame)
	group:insert(doiBtnFrame)
	group:insert(nyBtnFrame)
	group:insert(trentonBtnFrame)
	group:insert(yorktownBtnFrame)
	group:insert(saratogaBtnFrame)
	group:insert(treatParisBtnFrame)
	group:insert(franceBtnFrame)
	group:insert(doneBtn)
	group:insert(background2)

	function back:touch(e)
		if background2.alpha == 0 then
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

back:addEventListener("touch",back)
	


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
				physics = require("physics")
				physics.start()
				print("physics applied")
				
				print("Game is active")


				helptext = display.newText("Drag images or titles to their original positions.",0,0,native.systemFont,20)
				helptext:setReferencePoint(display.CenterReferencePoint)
				helptext.x = W/2
				helptext.y = 250
				helptext:setTextColor(25,25,25)
				helptext.alpha = 0
				group:insert(helptext)
			if gameIsActive == true then
				transition.to(helptext,{alpha = 1, time = 10}) 
				elseif gameIsActive == false then
				end
				--lexington
				physics.addBody(lexington,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				lexington:applyLinearImpulse(math.random (70, 800), math.random(70,800), lexington.x*math.random(1,20),lexington.y*math.random(1,20))
				--doi
				physics.addBody(doi,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				doi:applyLinearImpulse(math.random (70, 800), math.random(70,800), doi.x*math.random(1,20),doi.y*math.random(1,20))
				--boston
				physics.addBody(boston,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				boston:applyLinearImpulse(math.random (70, 800), math.random(70,800), boston.x*math.random(1,20),boston.y*math.random(1,20))
				--trenton
				physics.addBody(trenton,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				trenton:applyLinearImpulse(math.random (70, 800), math.random(70,800), trenton.x*math.random(1,20),trenton.y*math.random(1,20))
				--saratoga
				physics.addBody(saratoga,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				saratoga:applyLinearImpulse(math.random (70, 800), math.random(70,800), saratoga.x*math.random(1,20),saratoga.y*math.random(1,20))
				--yorktown
				physics.addBody(yorktown,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				yorktown:applyLinearImpulse(math.random (70, 800), math.random(70,800), yorktown.x*math.random(1,20),yorktown.y*math.random(1,20))
				--treatParis
				physics.addBody(treatParis,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				treatParis:applyLinearImpulse(math.random (70, 800), math.random(70,800), treatParis.x*math.random(1,20),treatParis.y*math.random(1,20))
				--lexingtonBtn
				physics.addBody(lexingtonBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				lexingtonBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), lexingtonBtn.x*math.random(1,20),lexingtonBtn.y*math.random(1,20))
				--bostonBtn
				physics.addBody(bostonBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				bostonBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), bostonBtn.x*math.random(1,20),bostonBtn.y*math.random(1,20))
				--doiBtn
				physics.addBody(doiBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				doiBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), doiBtn.x*math.random(1,20),doiBtn.y*math.random(1,20))
				--nyBtn
				physics.addBody(nyBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				nyBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), nyBtn.x*math.random(1,20),nyBtn.y*math.random(1,20))
				--trentonBtn
				physics.addBody(trentonBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				trentonBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), trentonBtn.x*math.random(1,20),trentonBtn.y*math.random(1,20))
				--saratogaBtn
				physics.addBody(saratogaBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				saratogaBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), saratogaBtn.x*math.random(1,20),saratogaBtn.y*math.random(1,20))
				--franceBtn
				physics.addBody(franceBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				franceBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), franceBtn.x*math.random(1,20),franceBtn.y*math.random(1,20))
				--yorktownBtn
				physics.addBody(yorktownBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				yorktownBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), yorktownBtn.x*math.random(1,20),yorktownBtn.y*math.random(1,20))
				--treatParisBtn
				physics.addBody(treatParisBtn,"dynamic",{density = 0.1,friction = 0.5, bounce = 0.3})
				treatParisBtn:applyLinearImpulse(math.random (70, 800), math.random(70,800), treatParisBtn.x*math.random(1,20),treatParisBtn.y*math.random(1,20))
				
				function answersBtn:touch(e)

					if e.phase == "ended" then 

						lexington.x =110 
						lexington.y = 625 
						boston.x = 340 
						boston.y = 655 
						doi.x = 150 
						doi.y=280 
						saratoga.x = 635 
						saratoga.y = 645 
						trenton.x = 580 
						trenton.y = 285 
						yorktown.x = 870 
						yorktown.y = 300 
						treatParis.x = dot9.x 
						treatParis.y = H/2+200 
						lexingtonBtn.x = dot1.x 
						lexingtonBtn.y = H/2 + 120 
						bostonBtn.x = dot2.x 
						bostonBtn.y = H/2+115 
						doiBtn.x = dot3.x 
						doiBtn.y = H/2+10 
						nyBtn.x = dot4.x 
						nyBtn.y = H/2+113 
						saratogaBtn.x = dot6.x 
						saratogaBtn.y = H/2+110 
						trentonBtn.x = dot5.x 
						trentonBtn.y = H/2+15 
						franceBtn.x = dot7.x 
						franceBtn.y = H/2+3 
						yorktownBtn.x = dot8.x 
						yorktownBtn.y = H/2+3 
						treatParisBtn.x = dot9.x 
						treatParisBtn.y = H/2+14

						lexington.rotation = 0
						boston.rotation = 0 
						doi.rotation = 0 
						saratoga.rotation = 0  
						trenton.rotation = 0  
						yorktown.rotation = 0 
						treatParis.rotation = 0 			
						lexingtonBtn.rotation = 0  
						bostonBtn.rotation = 0  
						doiBtn.rotation = 0  
						nyBtn.rotation = 0 
						saratogaBtn.rotation = 0  
						trentonBtn.rotation = 0 
						franceBtn.rotation = 0 
						yorktownBtn.rotation = 0 
						treatParisBtn.rotation = 0 
						

						physics.pause()
						transition.to(helptext,{alpha = 0, time = 800})
						transition.to(answersBtn,{alpha = 0, time = 800})
						transition.to(answersBtnText,{alpha = 0, time = 800})
						transition.to(answersBtnText2,{alpha = 0, time = 800})
						gameIsActive = false
					end
				
				
			end

			answersBtn:addEventListener("touch",answersBtn)

				local MultiTouch = require("dmc_multitouch")
					
					MultiTouch.activate(lexington,"move","single")
					local lexingtonPosX = 0
					local lexingtonPosY = 0

					local function lexingtonDrag(event)
						local t = event.target
						if event.phase == "moved" then
							lexingtonPosX = lexington.x - lexingtonFrame.x
							lexingtonPosY = lexington.y - lexingtonFrame.y
							if (lexingtonPosX < 0) then
								lexingtonPosX = lexingtonPosX * -1
							end
							if (lexingtonPosX <= 50) and (lexingtonPosY <= 50) then
								lexington.x = lexingtonFrame.x
								lexington.y = lexingtonFrame.y
							end
							elseif event.phase == "ended" then
								if (lexingtonPosX <= 70) and (lexingtonPosY <= 50) then
									lexington.x = lexingtonFrame.x;
									lexington.y = lexingtonFrame.y;
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(lexington)
									physics.addBody(lexington,"static")
									--Tells object to become inactive.
									lexington.isBodyActive = false
									local state = lexington.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(lexington)
								
									transition.to( lexington, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					lexington:addEventListener(MultiTouch.MULTITOUCH_EVENT, lexingtonDrag);
					

					MultiTouch.activate(boston,"move","single")
					local bostonPosX = 0
					local bostonPosY = 0

					local function bostonDrag(event)
						local t = event.target
						if event.phase == "moved" then
							bostonPosX = boston.x - bostonFrame.x
							bostonPosY = boston.y - bostonFrame.y
							if (bostonPosX < 0) then
								bostonPosX = bostonPosX * -1
							end
							if (bostonPosX <= 50) and (bostonPosY <= 50) then
								boston.x = bostonFrame.x
								boston.y = bostonFrame.y
							end
							elseif event.phase == "ended" then
								if (bostonPosX <= 70) and (bostonPosY <= 50) then
									boston.x = bostonFrame.x;
									boston.y = bostonFrame.y;
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(boston)
									physics.addBody(boston,"static")
									--Tells object to become inactive.
									boston.isBodyActive = false
									local state = boston.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(boston)
									transition.to( boston, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					boston:addEventListener(MultiTouch.MULTITOUCH_EVENT, bostonDrag);


					MultiTouch.activate(doi,"move","single")
					local doiPosX = 0
					local doiPosY = 0

					local function doiDrag(event)
						local t = event.target
						if event.phase == "moved" then
							doiPosX = doi.x - doiFrame.x
							doiPosY = doi.y - doiFrame.y
							if (doiPosX < 0) then
								doiPosX = doiPosX * -1
							end
							if (doiPosX <= 50) and (doiPosY <= 50) then
								doi.x = doiFrame.x
								doi.y = doiFrame.y
							end
							elseif event.phase == "ended" then
								if (doiPosX <= 70) and (doiPosY <= 50) then
									doi.x = doiFrame.x;
									doi.y = doiFrame.y;
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(doi)
									physics.addBody(doi,"static")
									--Tells object to become inactive.
									doi.isBodyActive = false
									local state = doi.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(doi)
								
									transition.to( doi, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					doi:addEventListener(MultiTouch.MULTITOUCH_EVENT, doiDrag); 


					MultiTouch.activate(saratoga,"move","single")
					local saratogaPosX = 0
					local saratogaPosY = 0

					local function saratogaDrag(event)
						local t = event.target
						if event.phase == "moved" then
							saratogaPosX = saratoga.x - saratogaFrame.x
							saratogaPosY = saratoga.y - saratogaFrame.y
							if (saratogaPosX < 0) then
								saratogaPosX = saratogaPosX * -1
							end
							if (saratogaPosX <= 50) and (saratogaPosY <= 50) then
								saratoga.x = saratogaFrame.x
								saratoga.y = saratogaFrame.y
							end
							elseif event.phase == "ended" then
								if (saratogaPosX <= 70) and (saratogaPosY <= 50) then
									saratoga.x = saratogaFrame.x
									saratoga.y = saratogaFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(saratoga)
									physics.addBody(saratoga,"static")
									--Tells object to become inactive.
									saratoga.isBodyActive = false
									local state = saratoga.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(saratoga)
								
									transition.to( saratoga, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					saratoga:addEventListener(MultiTouch.MULTITOUCH_EVENT, saratogaDrag)
					

					MultiTouch.activate(trenton,"move","single")
					local trentonPosX = 0
					local trentonPosY = 0

					local function trentonDrag(event)
						local t = event.target
						if event.phase == "moved" then
							trentonPosX = trenton.x - trentonFrame.x
							trentonPosY = trenton.y - trentonFrame.y
							if (trentonPosX < 0) then
								trentonPosX = trentonPosX * -1
							end
							if (trentonPosX <= 50) and (trentonPosY <= 50) then
								trenton.x = trentonFrame.x
								trenton.y = trentonFrame.y
							end
							elseif event.phase == "ended" then
								if (trentonPosX <= 70) and (trentonPosY <= 50) then
									trenton.x = trentonFrame.x
									trenton.y = trentonFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(trenton)
									physics.addBody(trenton,"static")
									--Tells object to become inactive.
									trenton.isBodyActive = false
									local state = trenton.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(trenton)
								
									transition.to( trenton, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					trenton:addEventListener(MultiTouch.MULTITOUCH_EVENT, trentonDrag)


					MultiTouch.activate(yorktown,"move","single")
					local yorktownPosX = 0
					local yorktownPosY = 0

					local function yorktownDrag(event)
						local t = event.target
						if event.phase == "moved" then
							yorktownPosX = yorktown.x - yorktownFrame.x
							yorktownPosY = yorktown.y - yorktownFrame.y
							if (yorktownPosX < 0) then
								yorktownPosX = yorktownPosX * -1
							end
							if (yorktownPosX <= 50) and (yorktownPosY <= 50) then
								yorktown.x = yorktownFrame.x
								yorktown.y = yorktownFrame.y
							end
							elseif event.phase == "ended" then
								if (yorktownPosX <= 70) and (yorktownPosY <= 50) then
									yorktown.x = yorktownFrame.x
									yorktown.y = yorktownFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(yorktown)
									physics.addBody(yorktown,"static")
									--Tells object to become inactive.
									yorktown.isBodyActive = false
									local state = yorktown.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(yorktown)
								
									transition.to( yorktown, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					yorktown:addEventListener(MultiTouch.MULTITOUCH_EVENT, yorktownDrag)


					MultiTouch.activate(treatParis,"move","single")
					local treatParisPosX = 0
					local treatParisPosY = 0

					local function treatParisDrag(event)
						local t = event.target
						if event.phase == "moved" then
							treatParisPosX = treatParis.x - treatParisFrame.x
							treatParisPosY = treatParis.y - treatParisFrame.y
							if (treatParisPosX < 0) then
								treatParisPosX = treatParisPosX * -1
							end
							if (treatParisPosX <= 50) and (treatParisPosY <= 50) then
								treatParis.x = treatParisFrame.x
								treatParis.y = treatParisFrame.y
							end
							elseif event.phase == "ended" then
								if (treatParisPosX <= 70) and (treatParisPosY <= 50) then
									treatParis.x = treatParisFrame.x
									treatParis.y = treatParisFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(treatParis)
									physics.addBody(treatParis,"static")
									--Tells object to become inactive.
									treatParis.isBodyActive = false
									local state = treatParis.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(treatParis)
								
									transition.to( treatParis, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					treatParis:addEventListener(MultiTouch.MULTITOUCH_EVENT, treatParisDrag)
					

					MultiTouch.activate(lexingtonBtn,"move","single")
					local lexingtonBtnPosX = 0
					local lexingtonBtnPosY = 0

					local function lexingtonBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							lexingtonBtnPosX = lexingtonBtn.x - lexingtonBtnFrame.x
							lexingtonBtnPosY = lexingtonBtn.y - lexingtonBtnFrame.y
							if (lexingtonBtnPosX < 0) then
								lexingtonBtnPosX = lexingtonBtnPosX * -1
							end
							if (lexingtonBtnPosX <= 50) and (lexingtonBtnPosY <= 50) then
								lexingtonBtn.x = lexingtonBtnFrame.x
								lexingtonBtn.y = lexingtonBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (lexingtonBtnPosX <= 70) and (lexingtonBtnPosY <= 50) then
									lexingtonBtn.x = lexingtonBtnFrame.x
									lexingtonBtn.y = lexingtonBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(lexingtonBtn)
									physics.addBody(lexingtonBtn,"static")
									--Tells object to become inactive.
									lexingtonBtn.isBodyActive = false
									local state = lexingtonBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(lexingtonBtn)
								
									transition.to( lexingtonBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					lexingtonBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, lexingtonBtnDrag)


					MultiTouch.activate(bostonBtn,"move","single")
					local bostonBtnPosX = 0
					local bostonBtnPosY = 0

					local function bostonBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							bostonBtnPosX = bostonBtn.x - bostonBtnFrame.x
							bostonBtnPosY = bostonBtn.y - bostonBtnFrame.y
							if (bostonBtnPosX < 0) then
								bostonBtnPosX = bostonBtnPosX * -1
							end
							if (bostonBtnPosX <= 50) and (bostonBtnPosY <= 50) then
								bostonBtn.x = bostonBtnFrame.x
								bostonBtn.y = bostonBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (bostonBtnPosX <= 70) and (bostonBtnPosY <= 50) then
									bostonBtn.x = bostonBtnFrame.x
									bostonBtn.y = bostonBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(bostonBtn)
									physics.addBody(bostonBtn,"static")
									--Tells object to become inactive.
									bostonBtn.isBodyActive = false
									local state = bostonBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(bostonBtn)
								
									transition.to( bostonBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					bostonBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, bostonBtnDrag)
					

					MultiTouch.activate(doiBtn,"move","single")
					local doiBtnPosX = 0
					local doiBtnPosY = 0

					local function doiBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							doiBtnPosX = doiBtn.x - doiBtnFrame.x
							doiBtnPosY = doiBtn.y - doiBtnFrame.y
							if (doiBtnPosX < 0) then
								doiBtnPosX = doiBtnPosX * -1
							end
							if (doiBtnPosX <= 50) and (doiBtnPosY <= 50) then
								doiBtn.x = doiBtnFrame.x
								doiBtn.y = doiBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (doiBtnPosX <= 70) and (doiBtnPosY <= 50) then
									doiBtn.x = doiBtnFrame.x
									doiBtn.y = doiBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(doiBtn)
									physics.addBody(doiBtn,"static")
									--Tells object to become inactive.
									doiBtn.isBodyActive = false
									local state = doiBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(doiBtn)
								
									transition.to( doiBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end

							end
						end
						return true
					end
					doiBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, doiBtnDrag)


					MultiTouch.activate(nyBtn,"move","single")
					local nyBtnPosX = 0
					local nyBtnPosY = 0

					local function nyBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							nyBtnPosX = nyBtn.x - nyBtnFrame.x
							nyBtnPosY = nyBtn.y - nyBtnFrame.y
							if (nyBtnPosX < 0) then
								nyBtnPosX = nyBtnPosX * -1
							end
							if (nyBtnPosX <= 50) and (nyBtnPosY <= 50) then
								nyBtn.x = nyBtnFrame.x
								nyBtn.y = nyBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (nyBtnPosX <= 70) and (nyBtnPosY <= 50) then
									nyBtn.x = nyBtnFrame.x
									nyBtn.y = nyBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(nyBtn)
									physics.addBody(nyBtn,"static")
									--Tells object to become inactive.
									nyBtn.isBodyActive = false
									local state = nyBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(nyBtn)
								
									transition.to( nyBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					nyBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, nyBtnDrag)


					MultiTouch.activate(trentonBtn,"move","single")
					local trentonBtnPosX = 0
					local trentonBtnPosY = 0

					local function trentonBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							trentonBtnPosX = trentonBtn.x - trentonBtnFrame.x
							trentonBtnPosY = trentonBtn.y - trentonBtnFrame.y
							if (trentonBtnPosX < 0) then
								trentonBtnPosX = trentonBtnPosX * -1
							end
							if (trentonBtnPosX <= 50) and (trentonBtnPosY <= 50) then
								trentonBtn.x = trentonBtnFrame.x
								trentonBtn.y = trentonBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (trentonBtnPosX <= 70) and (trentonBtnPosY <= 50) then
									trentonBtn.x = trentonBtnFrame.x
									trentonBtn.y = trentonBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(trentonBtn)
									physics.addBody(trentonBtn,"static")
									--Tells object to become inactive.
									trentonBtn.isBodyActive = false
									local state = trentonBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(trentonBtn)
								
									transition.to( trentonBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					trentonBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, trentonBtnDrag)


					MultiTouch.activate(saratogaBtn,"move","single")
					local saratogaBtnPosX = 0
					local saratogaBtnPosY = 0

					local function saratogaBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							saratogaBtnPosX = saratogaBtn.x - saratogaBtnFrame.x
							saratogaBtnPosY = saratogaBtn.y - saratogaBtnFrame.y
							if (saratogaBtnPosX < 0) then
								saratogaBtnPosX = saratogaBtnPosX * -1
							end
							if (saratogaBtnPosX <= 50) and (saratogaBtnPosY <= 50) then
								saratogaBtn.x = saratogaBtnFrame.x
								saratogaBtn.y = saratogaBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (saratogaBtnPosX <= 70) and (saratogaBtnPosY <= 50) then
									saratogaBtn.x = saratogaBtnFrame.x
									saratogaBtn.y = saratogaBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(saratogaBtn)
									physics.addBody(saratogaBtn,"static")
									--Tells object to become inactive.
									saratogaBtn.isBodyActive = false
									local state = saratogaBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(saratogaBtn)
								
									transition.to( saratogaBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					saratogaBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, saratogaBtnDrag)


					MultiTouch.activate(franceBtn,"move","single")
					local franceBtnPosX = 0
					local franceBtnPosY = 0

					local function franceBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							franceBtnPosX = franceBtn.x - franceBtnFrame.x
							franceBtnPosY = franceBtn.y - franceBtnFrame.y
							if (franceBtnPosX < 0) then
								franceBtnPosX = franceBtnPosX * -1
							end
							if (franceBtnPosX <= 50) and (franceBtnPosY <= 50) then
								franceBtn.x = franceBtnFrame.x
								franceBtn.y = franceBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (franceBtnPosX <= 70) and (franceBtnPosY <= 50) then
									franceBtn.x = franceBtnFrame.x
									franceBtn.y = franceBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(franceBtn)
									physics.addBody(franceBtn,"static")
									--Tells object to become inactive.
									franceBtn.isBodyActive = false
									local state = franceBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(franceBtn)
								
									transition.to( franceBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					franceBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, franceBtnDrag)
					

					MultiTouch.activate(yorktownBtn,"move","single")
					local yorktownBtnPosX = 0
					local yorktownBtnPosY = 0

					local function yorktownBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							yorktownBtnPosX = yorktownBtn.x - yorktownBtnFrame.x
							yorktownBtnPosY = yorktownBtn.y - yorktownBtnFrame.y
							if (yorktownBtnPosX < 0) then
								yorktownBtnPosX = yorktownBtnPosX * -1
							end
							if (yorktownBtnPosX <= 50) and (yorktownBtnPosY <= 50) then
								yorktownBtn.x = yorktownBtnFrame.x
								yorktownBtn.y = yorktownBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (yorktownBtnPosX <= 70) and (yorktownBtnPosY <= 50) then
									yorktownBtn.x = yorktownBtnFrame.x
									yorktownBtn.y = yorktownBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(yorktownBtn)
									physics.addBody(yorktownBtn,"static")
									--Tells object to become inactive.
									yorktownBtn.isBodyActive = false
									local state = yorktownBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(yorktownBtn)
								
									transition.to( yorktownBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					yorktownBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, yorktownBtnDrag)


					MultiTouch.activate(treatParisBtn,"move","single")
					local treatParisBtnPosX = 0
					local treatParisBtnPosY = 0

					local function treatParisBtnDrag(event)
						local t = event.target
						if event.phase == "moved" then
							treatParisBtnPosX = treatParisBtn.x - treatParisBtnFrame.x
							treatParisBtnPosY = treatParisBtn.y - treatParisBtnFrame.y
							if (treatParisBtnPosX < 0) then
								treatParisBtnPosX = treatParisBtnPosX * -1
							end
							if (treatParisBtnPosX <= 50) and (treatParisBtnPosY <= 50) then
								treatParisBtn.x = treatParisBtnFrame.x
								treatParisBtn.y = treatParisBtnFrame.y
							end
							elseif event.phase == "ended" then
								if (treatParisBtnPosX <= 70) and (treatParisBtnPosY <= 50) then
									treatParisBtn.x = treatParisBtnFrame.x
									treatParisBtn.y = treatParisBtnFrame.y
									--Replaces dynamic body with static body.
									physics = require ("physics")
									physics.removeBody(treatParisBtn)
									physics.addBody(treatParisBtn,"static")
									--Tells object to become inactive.
									treatParisBtn.isBodyActive = false
									local state = treatParisBtn.isBodyActive
									--Deactivates multi-touch for the object.
									MultiTouch.deactivate(treatParisBtn)
								
									transition.to( treatParisBtn, { rotation = 0, time=10 }) 		
								if helptext.alpha == 1 then
									transition.to(helptext,{alpha = 0, time = 800})
								end
							end
						end
						return true
					end
					treatParisBtn:addEventListener(MultiTouch.MULTITOUCH_EVENT, treatParisBtnDrag)
			end
		end

	end
memoryBTN:addEventListener("touch")


	local lastGoalTime = 100

	function monitorScore(event)
		if event.time - lastGoalTime >= 100 then
			if lexington.x == 110 and lexington.y == 625 and boston.x == 340 and boston.y == 655 and doi.x == 150 and doi.y==280 and saratoga.x == 635 and saratoga.y == 645 and trenton.x == 580 and trenton.y == 285 and yorktown.x == 870 and yorktown.y == 300 and treatParis.x == dot9.x and treatParis.y == H/2+200 and lexingtonBtn.x == dot1.x and lexingtonBtn.y == H/2 + 120 and bostonBtn.x == dot2.x and bostonBtn.y == H/2+115 and doiBtn.x == dot3.x and doiBtn.y == H/2+10 and nyBtn.x == dot4.x and nyBtn.y == H/2+113 and saratogaBtn.x == dot6.x and saratogaBtn.y == H/2+110 and trentonBtn.x == dot5.x and trentonBtn.y == H/2+15 and franceBtn.x == dot7.x and franceBtn.y == H/2+3 and yorktownBtn.x == dot8.x and yorktownBtn.y == H/2+3 and treatParisBtn.x == dot9.x and treatParisBtn.y == H/2+14 then
				gameIsActive = false
				lastGoalTime = event.time
			end
		end
	end
	Runtime:addEventListener("enterFrame",monitorScore)

	function boston:touch(event)
		if gameIsActive == false then
	if event.phase == "began" then
		display.getCurrentStage():setFocus(self)
		self.isFocus = true
	elseif self.isFocus then
		if event.phase == "moved" then
			--will not do anything here
		elseif event.phase == "ended" then
		display.getCurrentStage():setFocus(nil)
		self.isFocus = nil
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(boston,{xScale =4.5,yScale =4.51, x = W/2, y = H/2-60, rotation = 0, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 800})
		physics.removeBody(boston,"dynamic")
		group:insert(background2)
		group:insert(boston)
		group:insert(doneBtn)
		local function bostonBigListener(event)
		bostonBig = display.newImage("images/BostonBritishRetreat_Big.jpeg")
		bostonBig:setReferencePoint(display.CenterReferencePoint)
		bostonBig.x = W/2
		bostonBig.y = H/2-60
		group:insert(bostonBig)

		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then

					display.remove(bostonBig)
					bostonBig = nil

					transition.to (boston,{xScale = 1,yScale = 1, x = 340, y = 655, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})
					
				end
			end
		end
	end

	doneBtn:addEventListener("touch")


	end
		timer.performWithDelay(700,bostonBigListener)
	end
end
return true
end
end


boston:addEventListener("touch")


function doi:touch(event)

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
		transition.to(doi,{xScale =2.5,yScale =2.906, x = W/2-180, y = H/2, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(doi)
		group:insert(doneBtn)
		local function doiBigListener(event)
		doiBig = display.newImage("images/DOI_Big.png")
		doiBig:setReferencePoint(display.CenterReferencePoint)
		doiBig.x = W/2-140
		doiBig.y = H/2
		doiBig.alpha = 0
		group:insert(doiBig)
	end


		local widget = require( "widget" )

--Function to listen for scrollView events
local function scrollListener( event )
	print( "ScrollView Event:", event.type )
	return true
end
	
--Create a scrollView
local scrollView = widget.newScrollView{
	top = 0, left = 650,
	width = 340, height = 768,
	--bgColor = { 255, 0, 255, 255 }, 	--Un-Comment this to set the background color of the scrollView.
	--scrollBarColor = { 255, 0, 128 }, --Un-Comment this to set the scrollBar to a custom color.
	--hideScrollBar = true, 			--Un-Comment this to hide the scrollBar
	listener = scrollListener

}

timer.performWithDelay(800,scrollListener)

scrollView.content.horizontalScrollDisabled = true

--Create a text object for the scrollViews title
local titleText = display.newText("Read the Declaration of Independence", 0, 0, native.systemFontBold, 16)
titleText:setTextColor(0, 0, 0)
titleText.x = display.contentCenterX-335
titleText.y = 48
scrollView:insert( titleText )

--Create a large text string
local lotsOfText = "IN CONGRESS, July 4, 1776.\n\nThe unanimous Declaration of the thirteen united States of America,\n\nWhen in the Course of human events, it becomes necessary for one people to dissolve the political bands which have connected them with another, and to assume among the powers of the earth, the separate and equal station to which the Laws of Nature and of Nature's God entitle them, a decent respect to the opinions of mankind requires that they should declare the causes which impel them to the separation.\n\nWe hold these truths to be self-evident, that all men are created equal, that they are endowed by their Creator with certain unalienable Rights, that among these are Life, Liberty and the pursuit of Happiness.--That to secure these rights, Governments are instituted among Men, deriving their just powers from the consent of the governed, --That whenever any Form of Government becomes destructive of these ends, it is the Right of the People to alter or to abolish it, and to institute new Government, laying its foundation on such principles and organizing its powers in such form, as to them shall seem most likely to effect their Safety and Happiness. Prudence, indeed, will dictate that Governments long established should not be changed for light and transient causes; and accordingly all experience hath shewn, that mankind are more disposed to suffer, while evils are sufferable, than to right themselves by abolishing the forms to which they are accustomed. But when a long train of abuses and usurpations, pursuing invariably the same Object evinces a design to reduce them under absolute Despotism, it is their right, it is their duty, to throw off such Government, and to provide new Guards for their future security.--Such has been the patient sufferance of these Colonies; and such is now the necessity which constrains them to alter their former Systems of Government. The history of the present King of Great Britain is a history of repeated injuries and usurpations, all having in direct object the establishment of an absolute Tyranny over these States. To prove this, let Facts be submitted to a candid world.\n\nHe has refused his Assent to Laws, the most wholesome and necessary for the public good.\n\nHe has forbidden his Governors to pass Laws of immediate and pressing importance, unless suspended in their operation till his Assent should be obtained; and when so suspended, he has utterly neglected to attend to them.\n\nHe has refused to pass other Laws for the accommodation of large districts of people, unless those people would relinquish the right of Representation in the Legislature, a right inestimable to them and formidable to tyrants only.\n\nHe has called together legislative bodies at places unusual, uncomfortable, and distant from the depository of their public Records, for the sole purpose of fatiguing them into compliance with his measures.\n\nHe has dissolved Representative Houses repeatedly, for opposing with manly firmness his invasions on the rights of the people.\n\nHe has refused for a long time, after such dissolutions, to cause others to be elected; whereby the Legislative powers, incapable of Annihilation, have returned to the People at large for their exercise; the State remaining in the mean time exposed to all the dangers of invasion from without, and convulsions within.\n\nHe has endeavoured to prevent the population of these States; for that purpose obstructing the Laws for Naturalization of Foreigners; refusing to pass others to encourage their migrations hither, and raising the conditions of new Appropriations of Lands.\n\nHe has obstructed the Administration of Justice, by refusing his Assent to Laws for establishing Judiciary powers.\n\nHe has made Judges dependent on his Will alone, for the tenure of their offices, and the amount and payment of their salaries.\n\nHe has erected a multitude of New Offices, and sent hither swarms of Officers to harrass our people, and eat out their substance.\n\nHe has kept among us, in times of peace, Standing Armies without the Consent of our legislatures.\n\nHe has affected to render the Military independent of and superior to the Civil power.\n\nHe has combined with others to subject us to a jurisdiction foreign to our doi, and unacknowledged by our laws; giving his Assent to their Acts of pretended Legislation:\n\nFor Quartering large bodies of armed troops among us:\n\nFor protecting them, by a mock Trial, from punishment for any Murders which they should commit on the Inhabitants of these States:\n\nFor cutting off our Trade with all parts of the world:\n\nFor imposing Taxes on us without our Consent:\n\nFor depriving us in many cases, of the benefits of Trial by Jury:\n\nFor transporting us beyond Seas to be tried for pretended offences\n\nFor abolishing the free System of English Laws in a neighbouring Province, establishing therein an Arbitrary government, and enlarging its Boundaries so as to render it at once an example and fit instrument for introducing the same absolute rule into these Colonies:\n\nFor taking away our Charters, abolishing our most valuable Laws, and altering fundamentally the Forms of our Governments:\n\nFor suspending our own Legislatures, and declaring themselves invested with power to legislate for us in all cases whatsoever.\n\nHe has abdicated Government here, by declaring us out of his Protection and waging War against us.\n\nHe has plundered our seas, ravaged our Coasts, burnt our towns, and destroyed the lives of our people.\n\nHe is at this time transporting large Armies of foreign Mercenaries to compleat the works of death, desolation and tyranny, already begun with circumstances of Cruelty & perfidy scarcely paralleled in the most barbarous ages, and totally unworthy the Head of a civilized nation.\n\nHe has constrained our fellow Citizens taken Captive on the high Seas to bear Arms against their Country, to become the executioners of their friends and Brethren, or to fall themselves by their Hands.\n\nHe has excited domestic insurrections amongst us, and has endeavoured to bring on the inhabitants of our frontiers, the merciless Indian Savages, whose known rule of warfare, is an undistinguished destruction of all ages, sexes and conditions.\n\nIn every stage of these Oppressions We have Petitioned for Redress in the most humble terms: Our repeated Petitions have been answered only by repeated injury. A Prince whose character is thus marked by every act which may define a Tyrant, is unfit to be the ruler of a free people.\n\nNor have We been wanting in attentions to our Brittish brethren. We have warned them from time to time of attempts by their legislature to extend an unwarrantable jurisdiction over us. We have reminded them of the circumstances of our emigration and settlement here. We have appealed to their native justice and magnanimity, and we have conjured them by the ties of our common kindred to disavow these usurpations, which, would inevitably interrupt our connections and correspondence. They too have been deaf to the voice of justice and of consanguinity. We must, therefore, acquiesce in the necessity, which denounces our Separation, and hold them, as we hold the rest of mankind, Enemies in War, in Peace Friends.\n\nWe, therefore, the Representatives of the united States of America, in General Congress, Assembled, appealing to the Supreme Judge of the world for the rectitude of our intentions, do, in the Name, and by Authority of the good People of these Colonies, solemnly publish and declare, That these United Colonies are, and of Right ought to be Free and Independent States; that they are Absolved from all Allegiance to the British Crown, and that all political connection between them and the State of Great Britain, is and ought to be totally dissolved; and that as Free and Independent States, they have full Power to levy War, conclude Peace, contract Alliances, establish Commerce, and to do all other Acts and Things which Independent States may of right do. And for the support of this Declaration, with a firm reliance on the protection of divine Providence, we mutually pledge to each other our Lives, our Fortunes and our sacred Honor.\n\nThe 56 signatures on the Declaration appear in the positions indicated:\n\nColumn 1\n\nGeorgia:\n\nButton Gwinnett\n\nLyman Hall\n\nGeorge Walton\n\nColumn 2\n\nNorth Carolina:\n\nWilliam Hooper\n\nJoseph Hewes\n\nJohn Penn\n\nSouth Carolina:\n\nEdward Rutledge\n\nThomas Heyward, Jr.\n\nThomas Lynch, Jr.\n\nArthur Middleton\n\nColumn 3\n\nMassachusetts:\n\nJohn Hancock\n\nMaryland:\n\nSamuel Chase\n\nWilliam Paca\n\nThomas Stone\n\nCharles Carroll of Carrollton\n\nVirginia:\n\nGeorge Wythe\n\nRichard Henry Lee\n\nThomas Jefferson\n\nBenjamin Harrison\n\nThomas Nelson, Jr.\n\nFrancis Lightfoot Lee\n\nCarter Braxton\n\nColumn 4\n\nPennsylvania:\n\nRobert Morris\n\nBenjamin Rush\n\nBenjamin Franklin\n\nJohn Morton\n\nGeorge Clymer\n\nJames Smith\n\nGeorge Taylor\n\nJames Wilson\n\nGeorge Ross\n\nDelaware:\n\nCaesar Rodney\n\nGeorge Read\n\nThomas McKean\n\nColumn 5\n\nNew York:\n\nWilliam Floyd\n\nPhilip Livingston\n\nFrancis Lewis\n\nLewis Morris\n\nNew Jersey:\n\nRichard Stockton\n\nJohn Witherspoon\n\nFrancis Hopkinson\n\nJohn Hart\n\nAbraham Clark\n\nColumn 6\n\nNew Hampshire:\n\nJosiah Bartlett\n\nWilliam Whipple\n\nMassachusetts:\n\nSamuel Adams\n\nJohn Adams\n\nRobert Treat Paine\n\nElbridge Gerry\n\nRhode Island:\n\nStephen Hopkins\n\nWilliam Ellery\n\nConnecticut:\n\nRoger Sherman\n\nSamuel Huntington\n\nWilliam Williams\n\nOliver Wolcott\n\nNew Hampshire:\n\nMatthew Thornton"

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

					display.remove(doiBig)
					doiBig = nil

					transition.to (doi,{xScale = 1,yScale = 1, x = 150, y = 280, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})
					transition.to(scrollView,{alpha = 0, time = 800})
					
					if event.type == nil then 
						scrollView.alpha = 0
					end		
				end
			end
		end
	end

	doneBtn:addEventListener("touch")





	end
		timer.performWithDelay(800,doiBigListener)


			--end
		end
	end
return true
end

doi:addEventListener("touch")


function lexington:touch(event)
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
		transition.to(lexington,{xScale =4.32,yScale =4.31, x = W/2, y = H/2, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(lexington)
		group:insert(doneBtn)

		local function lexingtonBigListener(event)
		lexingtonBig = display.newImage("images/Lexington_Concord_Big.jpg")
		lexingtonBig:setReferencePoint(display.CenterReferencePoint)
		lexingtonBig.x = W/2
		lexingtonBig.y = H/2
		group:insert(lexingtonBig)
		lexingtonBig.alpha = 1

	

		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then
					display.remove(lexingtonBig)
					lexingtonBig = nil

					transition.to (lexington,{xScale = 1,yScale = 1, x = 110, y = 625, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})

					
				end
			end
		end
	end

	doneBtn:addEventListener("touch")

	end
		timer.performWithDelay(700,lexingtonBigListener)
end
	end
end
return true
end

lexington:addEventListener("touch")

function trenton:touch(event)
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
		transition.to(trenton,{xScale =4.06,yScale =4.13, x = W/2, y = H/2-60, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(trenton)
		group:insert(doneBtn)

		local function trentonBigListener(event)
		trentonBig = display.newImage("images/Trenton_Big.png")
		trentonBig:setReferencePoint(display.CenterReferencePoint)
		trentonBig.x = W/2
		trentonBig.y = H/2-60
		group:insert(trentonBig)

		trentonTextBox = native.newTextBox(0,0,780,100)
		trentonTextBox:setReferencePoint(display.CenterReferencePoint)
		trentonTextBox.x = W/2
		trentonTextBox.y = 700
		trentonTextBox.text = "Trenton was a major victory for the United States Army..."
		trentonTextBox.size = 10

			
		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then

					display.remove(trentonBig)
					trentonBig = nil

					display.remove(trentonTextBox)

					transition.to (trenton,{xScale = 1,yScale = 1, x = 580, y = 285, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})

					
				end
			end
		end
	end

	doneBtn:addEventListener("touch")
	end
		timer.performWithDelay(700,trentonBigListener)

	end

end
end
return true
end

		
trenton:addEventListener("touch")

	function saratoga:touch(event)
		if gameIsActive == false then
	if event.phase == "began" then
		display.getCurrentStage():setFocus(self)
		self.isFocus = true
	elseif self.isFocus then
		if event.phase == "moved" then
			--will not do anything here
		elseif event.phase == "ended" then
		display.getCurrentStage():setFocus(nil)
		self.isFocus = nil
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(saratoga,{xScale =3.2,yScale =2.69, x = W/2, y = H/2-60, rotation = 0, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 800})
		physics.removeBody(saratoga,"dynamic")
		group:insert(background2)
		group:insert(saratoga)
		group:insert(doneBtn)
		local function saratogaBigListener(event)
		saratogaBig = display.newImage("images/FrenchAmericanRevoBig.jpeg")
		saratogaBig:setReferencePoint(display.CenterReferencePoint)
		saratogaBig.x = W/2
		saratogaBig.y = H/2-60
		group:insert(saratogaBig)

		saratogaTextBox = native.newTextBox(0,0,780,100)
		saratogaTextBox:setReferencePoint(display.CenterReferencePoint)
		saratogaTextBox.x = W/2
		saratogaTextBox.y = 665
		saratogaTextBox.text = "lorem ipsum dolor sit amet, consectur..... "
		saratogaTextBox.size = 10

		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then

					display.remove(saratogaBig)
					saratogaBig = nil

					display.remove(saratogaTextBox)

					transition.to (saratoga,{xScale = 1,yScale = 1, x = 635, y = 645, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})
					
				end
			end
		end
	end

	doneBtn:addEventListener("touch")


	end
		timer.performWithDelay(700,saratogaBigListener)
	end
end
return true
end
end


saratoga:addEventListener("touch")


function treatParis:touch(event)
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
		transition.to(treatParis,{xScale =2.94,yScale =2.9407, x = W/2-160, y = H/2, time =600})
		transition.to(background2,{alpha = 0.8, time = 800})
		transition.to(doneBtn,{alpha = 1, time = 1000})
		group:insert(background2)
		group:insert(treatParis)
		group:insert(doneBtn)

		local function treatParisBigListener(event)
		treatParisBig = display.newImage("images/Treat_Paris_Big.png")
		treatParisBig:setReferencePoint(display.CenterReferencePoint)
		treatParisBig.x = W/2-160
		treatParisBig.y = H/2
		group:insert(treatParisBig)

		treatParisTextBox = native.newTextBox(0,0,330,744)
		treatParisTextBox:setReferencePoint(display.CenterReferencePoint)
		treatParisTextBox.x = 820
		treatParisTextBox.y = H/2+30
		treatParisTextBox.text = "The Definitive Treaty of Peace 1783\n\nIn the Name of the most Holy & undivided Trinity.\n\nIt having pleased the \n\Divine Providence to dispose the Hearts of the most Serene \n\aand most Potent Prince George the Third, \n\bby the Grace of God, King of Great Britain, \n\France, and Ireland, Defender of the Faith, \n\Duke of Brunswick and Lunebourg, \n\aArch- Treasurer and Prince Elector of the Holy Roman Empire etc.. \n\aand of the United States of America, to forget all past Misunderstandings and Differences that have unhappily interrupted the good Correspondence and Friendship which they mutually wish to restore; and to establish such a beneficial and satisfactory Intercourse between the two countries upon the ground of reciprocal Advantages and mutual Convenience as may promote and secure to both perpetual Peace and Harmony; and having for this desirable End already laid the Foundation of Peace & Reconciliation by the Provisional Articles signed at Paris on the 30th of November 1782, by the Commissioners empowered on each Part, which Articles were agreed to be inserted in and constitute the Treaty of Peace proposed to be concluded between the Crown of Great Britain and the said United States, but which Treaty was not to be concluded until Terms of Peace should be agreed upon between Great Britain & France, and his Britannic Majesty should be ready to conclude such Treaty accordingly: and the treaty between Great Britain & France having since been concluded, his Britannic Majesty & the United States of America, in Order to carry into full Effect the Provisional Articles above mentioned, according to the Tenor thereof, have constituted & appointed, that is to say his Britannic Majesty on his Part, David Hartley, Esqr., Member of the Parliament of Great Britain, and the said United States on their Part, - stop point - John Adams, Esqr., late a Commissioner of the United States of America at the Court of Versailles, late Delegate in Congress from the State of Massachusetts, and Chief Justice of the said State, and Minister Plenipotentiary of the said United States to their High Mightinesses the States General of the United Netherlands; - stop point - Benjamin Franklin, Esqr., late Delegate in Congress from the State of Pennsylvania, President of the Convention of the said State, and Minister Plenipotentiary from the United States of America at the Court of Versailles; John Jay, Esqr., late President of Congress and Chief Justice of the state of New York, and Minister Plenipotentiary from the said United States at the Court of Madrid; to be Plenipotentiaries for the concluding and signing the Present Definitive Treaty; who after having reciprocally communicated their respective full Powers have agreed upon and confirmed the following Articles.\n\nArticle 1st:\n\ His Brittanic Majesty acknowledges the said United States, viz., New Hampshire, Massachusetts Bay, Rhode Island and Providence Plantations, Connecticut, New York, New Jersey, Pennsylvania, Delaware, Maryland, Virginia, North Carolina, South Carolina and Georgia, to be free sovereign and Independent States; that he treats with them as such, and for himself his Heirs & Successors, relinquishes all claims to the Government, Propriety, and Territorial Rights of the same and every Part thereof.\n\nArticle 2d:\n\ And that all Disputes which might arise in future on the subject of the Boundaries of the said United States may be prevented, it is hereby agreed and declared, that the following are and shall be their Boundaries, viz.; from the Northwest Angle of Nova Scotia, viz., that Angle which is formed by a Line drawn due North from the Source of St. Croix River to the Highlands; along the said Highlands which divide those Rivers that empty themselves into the river St. Lawrence, from those which fall into the Atlantic Ocean, to the northwesternmost Head of Connecticut River; Thence down along the middle of that River to the forty-fifth Degree of North Latitude; From thence by a Line due West on said Latitude until it strikes the River Iroquois or Cataraquy; Thence along the middle of said River into Lake Ontario; through the Middle of said Lake until it strikes the Communication by Water between that Lake & Lake Erie; Thence along the middle of said Communication into Lake Erie, through the middle of said Lake until it arrives at the Water Communication between that lake & Lake Huron; Thence along the middle of said Water Communication into the Lake Huron, thence through the middle of said Lake to the Water Communication between that Lake and Lake Superior; thence through Lake Superior Northward of the Isles Royal & Phelipeaux to the Long Lake; Thence through the middle of said Long Lake and the Water Communication between it & the Lake of the Woods, to the said Lake of the Woods; Thence through the said Lake to the most Northwestern Point thereof, and from thence on a due West Course to the river Mississippi; Thence by a Line to be drawn along the Middle of the said river Mississippi until it shall intersect the Northernmost Part of the thirty-first Degree of North Latitude, South, by a Line to be drawn due East from the Determination of the Line last mentioned in the Latitude of thirty-one Degrees of the Equator to the middle of the River Apalachicola or Catahouche; Thence along the middle thereof to its junction with the Flint River; Thence straight to the Head of Saint Mary's River, and thence down along the middle of Saint Mary's River to the Atlantic Ocean.  East, by a Line to be drawn along the Middle of the river Saint Croix, from its Mouth in the Bay of Fundy to its Source, and from its Source directly North to the aforesaid Highlands, which divide the Rivers that fall into the Atlantic Ocean from those which fall into the river Saint Lawrence; comprehending all Islands within twenty Leagues of any Part of the Shores of the United States, and lying between Lines to be drawn due East from the Points where the aforesaid Boundaries between Nova Scotia on the one Part and East Florida on the other shall, respectively, touch the Bay of Fundy and the Atlantic Ocean, excepting such Islands as now are or heretofore have been within the limits of the said Province of Nova Scotia.\n\nArticle 3d:\n\ It is agreed that the People of the United States shall continue to enjoy unmolested the Right to take Fish of every kind on the Grand Bank and on all the other Banks of Newfoundland, also in the Gulf of Saint Lawrence and at all other Places in the Sea, where the Inhabitants of both Countries used at any time heretofore to fish. And also that the Inhabitants of the United States shall have Liberty to take Fish of every Kind on such Part of the Coast of Newfoundland as British Fishermen shall use, (but not to dry or cure the same on that Island) And also on the Coasts, Bays & Creeks of all other of his Brittanic Majesty's Dominions in America; and that the American Fishermen shall have Liberty to dry and cure Fish in any of the unsettled Bays, Harbors, and Creeks of Nova Scotia, Magdalen Islands, and Labrador, so long as the same shall remain unsettled, but so soon as the same or either of them shall be settled, it shall not be lawful for the said Fishermen to dry or cure Fish at such Settlement without a previous Agreement for that purpose with the Inhabitants, Proprietors, or Possessors of the Ground.\n\nArticle 4th:\n\ It is agreed that Creditors on either Side shall meet with no lawful Impediment to the Recovery of the full Value in Sterling Money of all bona fide Debts heretofore contracted.\n\nArticle 5th:\n\ It is agreed that Congress shall earnestly recommend it to the Legislatures of the respective States to provide for the Restitution of all Estates, Rights, and Properties, which have been confiscated belonging to real British Subjects; and also of the Estates, Rights, and Properties of Persons resident in Districts in the Possession on his Majesty's Arms and who have not borne Arms against the said United States. And that Persons of any other Description shall have free Liberty to go to any Part or Parts of any of the thirteen United States and therein to remain twelve Months unmolested in their Endeavors to obtain the Restitution of such of their Estates – Rights & Properties as may have been confiscated. And that Congress shall also earnestly recommend to the several States a Reconsideration and Revision of all Acts or Laws regarding the Premises, so as to render the said Laws or Acts perfectly consistent not only with Justice and Equity but with that Spirit of Conciliation which on the Return of the Blessings of Peace should universally prevail. And that Congress shall also earnestly recommend to the several States that the Estates, Rights, and Properties of such last mentioned Persons shall be restored to them, they refunding to any Persons who may be now in Possession the Bona fide Price (where any has been given) which such Persons may have paid on purchasing any of the said Lands, Rights, or Properties since the Confiscation.\n\nAnd it is agreed that all Persons who have any Interest in confiscated Lands, either by Debts, Marriage Settlements, or otherwise, shall meet with no lawful Impediment in the Prosecution of their just Rights.\n\nArticle 6th:\n\ That there shall be no future Confiscations made nor any Prosecutions commenced against any Person or Persons for, or by Reason of the Part, which he or they may have taken in the present War, and that no Person shall on that Account suffer any future Loss or Damage, either in his Person, Liberty, or Property; and that those who may be in Confinement on such Charges at the Time of the Ratification of the Treaty in America shall be immediately set at Liberty, and the Prosecutions so commenced be discontinued.\n\nArticle 7th:\n\ There shall be a firm and perpetual Peace between his Britanic Majesty and the said States, and between the Subjects of the one and the Citizens of the other, wherefore all Hostilities both by Sea and Land shall from henceforth cease:  All prisoners on both Sides shall be set at Liberty, and his Britanic Majesty shall with all convenient speed, and without causing any Destruction, or carrying away any Negroes or other Property of the American inhabitants, withdraw all his Armies, Garrisons & Fleets from the said United States, and from every Post, Place and Harbour within the same; leaving in all Fortifications, the American Artillery that may be therein: And shall also Order & cause all Archives, Records, Deeds & Papers belonging to any of the said States, or their Citizens, which in the Course of the War may have fallen into the hands of his Officers, to be forthwith restored and delivered to the proper States and Persons to whom they belong.\n\nArticle 8th:\n\ The Navigation of the river Mississippi, from its source to the Ocean, shall forever remain free and open to the Subjects of Great Britain and the Citizens of the United States.\n\nArticle 9th:\n\ In case it should so happen that any Place or Territory belonging to great Britain or to the United States should have been conquered by the Arms of either from the other before the Arrival of the said Provisional Articles in America, it is agreed that the same shall be restored without Difficulty and without requiring any Compensation.\n\nArticle 10th:\n\ The solemn Ratifications of the present Treaty expedited in good & due Form shall be exchanged between the contracting Parties in the Space of Six Months or sooner if possible to be computed from the Day of the Signature of the present Treaty.  In witness whereof we the undersigned their Ministers Plenipotentiary have in their Name and in Virtue of our Full Powers, signed with our Hands the present Definitive Treaty, and caused the Seals of our Arms to be affixed thereto.\n\nDone at Paris, this third day of September in the year of our Lord, one thousand seven hundred and eighty-three.\n\n D HARTLEY (SEAL)\n\ JOHN ADAMS (SEAL) \n\ B FRANKLIN (SEAL)\n\JOHN JAY (SEAL) "
		treatParisTextBox.font = native.newFont(Helvetica,10)

		textBoxTitle = native.newTextBox(0,0,330,30)
		textBoxTitle:setReferencePoint(display.CenterReferencePoint)
		textBoxTitle.x = treatParisTextBox.x
		textBoxTitle.y = 15
		textBoxTitle.text = "Read the Treaty of Paris:"
		textBoxTitle.font = native.newFont( native.systemFontBold, 12 )



		function doneBtn:touch (e)
			if doneBtn.alpha == 1 then
				if e.phase == "began" then
					display.getCurrentStage():setFocus(self)
					self.isFocus = true
				elseif self.isFocus then
					display.getCurrentStage():setFocus(nil)
					self.isFocus = false
				if e.phase == "ended" then

					display.remove(treatParisBig)
					treatParisBig = nil

					transition.to (treatParis,{xScale = 1,yScale = 1, x = dot9.x, y = H/2+200, time = 800})
					transition.to(background2,{alpha = 0, time = 800})
					transition.to(doneBtn,{alpha = 0, time = 800})
					transition.to(textBoxTitle,{alpha = 0,time = 800})
					transition.to(treatParisTextBox,{alpha = 0, time = 800})
					
				end
			end
		end
	end

	doneBtn:addEventListener("touch")
	end
		timer.performWithDelay(700,treatParisBigListener)

	end

	end
end
return true
end

treatParis:addEventListener("touch")
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	display.remove(group)
	group = nil

	memoryBTN:removeEventListener("touch")

	boston:removeEventListener("touch")


	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view

	---------------------------------------------------------------------------
	
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

--MULTIPLE GROUPS?