W,H = display.contentWidth, display.contentHeight
display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")
local scene = storyboard.newScene()

--local background, timeline, rightend, leftend


function scene:createScene(event)
	local group = self.view
	loadingtitle = display.newText("Loading...",0,0,native.systemFont, 40)
	loadingtitle:setReferencePoint(display.CenterReferencePoint)
	loadingtitle.x = W/2
	loadingtitle.y = H/2-200

	group:insert(loadingtitle)
end

function scene:enterScene(event)
	display.remove(loadingtitle)
	loadingtitle = nil

	print("This is Scene 2")

	local group = self.view

	background = display.newRect(0,0,1024,768)
	background:setFillColor(192,145,80)

	title = display.newText( "America's", 0, 0, native.systemFontBold, 60 )
	title:setReferencePoint(display.CenterReferencePoint)
	title.x = W/2
	title.y = H/2-250
	title:setTextColor ( 0,0,0 )

	title2 = display.newText( "Challenges and Successes", 0, 0, native.systemFontBold, 60 )
	title2:setReferencePoint(display.CenterReferencePoint)
	title2.x = W/2
	title2.y = H/2-200
	title2:setTextColor ( 0,0,0 )

	subtitle = display.newText("1789-1865",0,0, native.systemFont, 40)
	subtitle:setReferencePoint(display.CenterReferencePoint)
	subtitle.x = W/2
	subtitle.y = H/2-150
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



function back:touch(e)
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


back:addEventListener("touch")

end

function scene:exitScene(event)
	local group = self.view

	display.remove(group)
	group =nil

end

function scene:destroyScene( event )
	local group = self.view

end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener( "destroyScene", scene )

return scene
