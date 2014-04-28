display.setStatusBar( display.HiddenStatusBar )
local widget = require "widget"
widget.setTheme( "theme_ios" )

local sbHeight = 0
local tbHeight = 44
local top = sbHeight + tbHeight

local toolbarGradient = graphics.newGradient( {168, 181, 198, 255 }, {139, 157, 180, 255}, "down" )

local divider = display.newLine(320, 0, 320, 768)
divider:setColor(0)

divider.width = 0

local overlay = display.newImage("assets/popoveroverlay.png",0,0, 1024,768)
overlay.alpha = 0

local left_middlebar = display.newImage("assets/tabbargrey.png")
local left_leftbar = display.newImage("assets/tab_bar_left.png")
local left_rightbar = display.newImage("assets/tab_bar_right.png")

left_middlebar.width = 320 - left_leftbar.width - left_rightbar.width

left_leftbar.x = left_middlebar.x - left_middlebar.width/2 - left_leftbar.width/2
left_rightbar.x = left_middlebar.x + left_middlebar.width/2 + left_rightbar.width/2

local leftTitleText = display.newEmbossedText( "Beginning Date", 0, 0, native.systemFontBold, 20 )
leftTitleText:setReferencePoint( display.CenterReferencePoint )
leftTitleText:setTextColor( 113, 120, 128, 255 )
leftTitleText.x = left_middlebar.x
leftTitleText.y = left_middlebar.y

local main_middlebar = display.newImage("assets/tabbargrey.png")
local main_leftbar = display.newImage("assets/tab_bar_left.png")
local main_rightbar = display.newImage("assets/tab_bar_right.png")

main_middlebar.width = 704 - main_leftbar.width - main_rightbar.width

main_leftbar.x = main_middlebar.x - main_middlebar.width/2 - main_leftbar.width/2
main_rightbar.x = main_middlebar.x + main_middlebar.width/2 + main_rightbar.width/2

-- create embossed text to go on toolbar
local titleText = display.newEmbossedText( "Your Timeline Library", 0, 0, native.systemFontBold, 20 )
titleText:setReferencePoint( display.CenterReferencePoint )
titleText:setTextColor( 113, 120, 128, 255 )
titleText.x = main_middlebar.x
titleText.y = main_middlebar.y

-- create a shadow underneath the bar (for a nice touch)
local shadow = display.newImage( "assets/shadow.png" )
shadow:setReferencePoint( display.TopLeftReferencePoint )
shadow.x, shadow.y = 0, top
shadow.xScale = display.contentWidth / shadow.contentWidth
shadow.alpha = 0.45
local beginDate, endDate
local selectionViewGradient = graphics.newGradient ( { 1, 94, 230, 255}, { 5, 140, 245, 255}, "up")
--------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()



-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	local popoverGroup = display.newGroup()
	local left_barGroup = display.newGroup()
	left_barGroup:insert(left_rightbar)
	left_barGroup:insert(left_leftbar)
	left_barGroup:insert(left_middlebar)
	left_barGroup:insert(leftTitleText)
	left_barGroup:setReferencePoint(display.TopLeftReferencePoint)
	left_barGroup.x = 0
	local main_barGroup = display.newGroup()
	main_barGroup:insert(main_rightbar)
	main_barGroup:insert(main_leftbar)
	main_barGroup:insert(main_middlebar)
	main_barGroup:insert(titleText)
	
	--Creates the actual widget that goes on the left side of the split view controller.
	local leftTableView = widget.newTableView
	{
		top = top,
		width = 320,
		height = 724,
		maskFile = "assets/mask-320x724.png"
		
	}
	--When the rows are rendered, sets the text for each row.
	local function onRowRenderLeft( event )
		local row = event.row
		local rowGroup = event.view
		beginDate = 1500 + row.index * 100
		endDate = beginDate + 99

		row.textObj = display.newText( rowGroup, beginDate.."-"..endDate, 0, 0, native.systemFontBold, 24)
		row.textObj:setTextColor( 54 )
		row.textObj:setReferencePoint( display.CenterLeftReferencePoint )
		row.textObj.x, row.textObj.y = 20, rowGroup.contentHeight * 0.5
	end
	--Listens for the rows to be created and then determines what happens when rows are pressed.
	local run_no = 0
	local chosenRowColor
	local function rowListenerLeft( event )
		local row = event.row
		local background = event.background
		local rowGroup = event.view
		if event.phase == "press" then
			if previousRow then
				previousBkg = (255)
				print("here")
			end
			print( "Pressed row: " .. row.index )
			 print( rowGroup.y)
			
			background:setFillColor(selectionViewGradient)
			
			row.textObj:toFront()

		elseif event.phase == "release" or event.phase == "tap" then
			
			background:setFillColor( selectionViewGradient )
			row.reRender = false
			
			-- set chosen row index to this row's index
			chosenRowText = row.textObj.text
			print(chosenRowText)
			chosenRowColor = selectionViewGradient
			previousRow = event.row
			previousBkg = event.background
			-- go to row scene
			--storyboard.gotoScene( "1754USA", "slideLeft", 350 )
			
		elseif event.phase == "swipeLeft" then
			print( "Swiped Left row: " .. row.index )
		
		elseif event.phase == "swipeRight" then
			print( "Swiped Right row: " .. row.index )
		end
	end
	--Creates the actual rows. In for i = 1, x do, x is the number of rows.
	for i = 1, 4 do
		local isCategory = false
		local rowColor = { 255, 255, 255, 255}
		local rowHeight = 60
		local listener = rowListener
		local lineColor = { 212, 212, 212}

		--inserts the rows into the tableView. the table below
		--reflects variables used to create the tableView,
		--and how they equal the TableView's properties.
		leftTableView:insertRow
		{
			height = rowHeight,
			rowColor = rowColor,
			isCategory = isCategory,
			onRender = onRowRenderLeft,
			listener = rowListenerLeft,
			lineColor = lineColor

		}

	end

	local tableView = widget.newTableView
{
    top = top,
    left = 321,
    width = 704, 
    height = 724,
    maskFile = "assets/mask-704x724.png",
    listener = tableViewListener,
}
	main_barGroup:setReferencePoint(display.TopLeftReferencePoint)
	main_barGroup.x = 321
	local function onRowRender( event )
		local row = event.row
		local rowGroup = event.view

			local var = tostring(row.index)
			local var_1 = var.."/name.txt"
			print(var_1)
			local path = system.pathForFile( var_1, system.ResourcesDirectory)
			local nameFile, reason = io.open(path, "r")
			local timelineName = nameFile:read("*a")

		local label = "("
		local color = 0
		
		if row.isCategory then
			label = "Category ("
			color = 255
		end
	
		row.textObj = display.newRetinaText( rowGroup, label .. row.index .. ")"..timelineName, 0, 0, native.systemFont, 16 )
		row.textObj:setTextColor( color )
		row.textObj:setReferencePoint( display.CenterLeftReferencePoint )
		row.textObj.x, row.textObj.y = 20, rowGroup.contentHeight * 0.5
	end



	local function rowListener( event )
		local row = event.row
		local background = event.background
		local rowGroup = event.view
		if event.phase == "press" then
			print( "Pressed row: " .. row.index )
			 print( rowGroup.y)
			local selectionViewGradient = graphics.newGradient ( { 1, 94, 230, 255}, { 5, 140, 245, 255}, "up")
			background:setFillColor(selectionViewGradient)
			
			row.textObj:toFront()
			if row.textObj then
				row.textObj:setText( "Row pressed..." )
				row.textObj:setReferencePoint( display.TopLeftReferencePoint )
				row.textObj.x = 20
				row.textObj:toFront()
			end
			print("GOT THIS FAR")
		elseif event.phase == "release" or event.phase == "tap" then
			print( "Tapped and/or Released row: " .. row.index )
			background:setFillColor( 0, 110, 233, 255 )
			row.reRender = true
			
			-- set chosen row index to this row's index
			chosenRowIndex = row.index
			
			-- go to row scene
			storyboard.gotoScene( "1754USA", "slideLeft", 350 )
			
		elseif event.phase == "swipeLeft" then
			print( "Swiped Left row: " .. row.index )
		
		elseif event.phase == "swipeRight" then
			print( "Swiped Right row: " .. row.index )
		end
	end

	for i = 1, 2 do

		local isCategory = false
		local rowColor = { 255, 255, 255, 255}
		local lineColor = { 212, 212, 212}
		local rowHeight = 30
		local listener = rowListener
		
		
		if i == 25 or i == 50 or i == 75 then
			isCategory = true
			rowHeight = 24
			rowColor = { 150, 160, 180, 200 }
			listener = nil
		end

		tableView:insertRow
		{
			height = rowHeight,
			rowColor = rowColor,
			isCategory = isCategory,
			onRender = onRowRender,
			listener = listener,
			lineColor = lineColor
		}

	end
	group:insert(tableView)






local run_number = 0


local globeBtnSheetOptions =
{
	width = 51,
	height = 50,
	numFrames = 2,
	sheetContentWidth = 102,
	sheetContentHeight = 50,
}

local globeBtnSheet = graphics.newImageSheet( "assets/globebtns.png", globeBtnSheetOptions)

local function onButtonRelease ( event )
	local globeBtn = event.target
	if run_number == 0 then
		local popovertop = display.newImage("assets/uipopovertop.png")
		popovertop.x, popovertop.y = 0, 0
		popovertop.alpha = 0.97

		local popoverbottom = display.newImage("assets/uipopoverbottom.png")
		popoverbottom:setReferencePoint(display.CenterReferencePoint)
		popoverbottom.x, popoverbottom.y = popovertop.x, popovertop.y

		local popoverText = display.newEmbossedText( "Popover", 0, 0, native.systemFontBold, 20)
		popoverText.x, popoverText.y = popoverbottom.x, popoverbottom.y
		popoverText:setTextColor(255)


		popoverbottom.height = popoverText.height/2 + 18 + 366 + 8
		popoverbottom.y = popovertop.y + popoverbottom.height/2 + 3

		
		popoverGroup:insert(popoverbottom)
		popoverGroup:insert(popovertop)
		popoverGroup:insert(popoverText)
		-- Create a tableView
		print(popovertop.y, popoverText.y)
		local popoverTable = widget.newTableView
		{
		    top = popoverText.y + 22,
		    width = 320, 
		    height = 366,
		    maskFile = "assets/mask-320x366.png",
		    listener = tableViewListener,
		    onRowRender = onRowRender,
		    onRowTouch = onRowTouch,
		}
		popoverTable:setReferencePoint(display.CenterReferencePoint)
		popoverTable.x = popoverbottom.x
		popoverGroup:insert( popoverTable )
		group:insert(popoverGroup)

		popoverbottom.width = popoverTable.width + 14
		popovertop.width = popoverbottom.width
		popoverbottom.height = 22 + popoverTable.height + 7
		popoverbottom.y = popovertop.y + popoverbottom.height * 0.5 + 2

		popoverGroup.x = globeBtn.x - popoverGroup.width * 0.5 + globeBtn.width * 0.5 + 2
		popoverGroup.y = top + popovertop.height * 0.5 - 6


		-- Create 100 rows
		for i = 1, 100 do
		    local isCategory = false
		    local rowHeight = 40
		    local rowColor = 
		    { 
		        default = { 255, 255, 255 },
		    }
		    local lineColor = { 212, 212, 212 }

		    -- Make some rows categories
		    if i == 25 or i == 50 or i == 75 then
		        isCategory = true
		        rowHeight = 24
		        rowColor = 
		        { 
		            default = { 150, 160, 180, 200 },
		        }
		    end

		    -- Insert the row into the tableView
		    popoverTable:insertRow
		    {
		        isCategory = isCategory,
		        rowHeight = rowHeight,
		        rowColor = rowColor,
		        lineColor = lineColor,
		    }
		end 
		print(popoverGroup.contentBounds.yMax)
		

		
	elseif run_number > 0 then
		popoverGroup.alpha = 1
	end

	run_number = run_number + 1
end

local function removePopover(event)
			print("started")
		if event.phase == "ended" then
				display.remove(popoverGroup)
				popoverGroup = nil
				print("ended")
			end
		end
--[[
local globeBtn = widget.newButton
{
	left = 970,
--	top = bar.y - bar.height * 0.5,
	sheet = globeBtnSheet,
	defaultIndex = 2,
	overIndex = 1,
	width = 38.25,
	height = 37.5,
	onRelease = onButtonRelease
}
]]
group:insert(left_barGroup)
group:insert(main_barGroup)
group:insert(divider)
group:insert(shadow)
leftTableView:toBack()
overlay:toFront()
overlay:addEventListener("touch", removePopover)

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	

-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	display.remove(group)
	group = nil
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