display.setStatusBar( display.HiddenStatusBar )

--[[
--local storyboard = require "storyboard"
--local scene = storyboard.newScene()
-- Set the widget theme
local widget = require "widget"
widget.setTheme( "theme_ios" )

local sbHeight = display.statusBarHeight
local tbHeight = 44
local top = sbHeight + tbHeight

-- create a gradient for the top-half of the toolbar
local toolbarGradient = graphics.newGradient( {168, 181, 198, 255 }, {139, 157, 180, 255}, "down" )

-- create toolbar to go at the top of the screen
local titleBar = widget.newTabBar{
	top = sbHeight,
	gradient = toolbarGradient,
	bottomFill = { 117, 139, 168, 255 },
	height = 44
}

-- create embossed text to go on toolbar
local titleText = display.newEmbossedText( "Widget Demo", 0, 0, native.systemFontBold, 20 )
titleText:setReferencePoint( display.CenterReferencePoint )
titleText:setTextColor( 255 )
titleText.x = 160
titleText.y = titleBar.y

-- create a shadow underneath the titlebar (for a nice touch)
local shadow = display.newImage( "assets/shadow.png" )
shadow:setReferencePoint( display.TopLeftReferencePoint )
shadow.x, shadow.y = 0, top
shadow.xScale = 320 / shadow.contentWidth
shadow.alpha = 0.45



---------------------------------------
-- TableView Scene
---------------------------------------
function scene:createScene(event)
	
	local group = self.view
end

function scene:enterScene( event )
	local group = self.view
	
	-- Tableview constructor
	local list = widget.newTableView{
		top = top,
		height = 366,
		maskFile = "assets/mask-320x366.png"
	}
	
	-- Handles individual row rendering
	local function onRowRender( event )
		local row = event.row
		local rowGroup = event.view
		local label = "("
		local color = 0
		
		if row.isCategory then
			label = "Category ("
			color = 255
		end
		print(row.height, rowGroup.height)
		row.textObj = display.newRetinaText( rowGroup, label .. row.index .. ")", 0, 0, native.systemFont, 16 )
		row.textObj:setTextColor( color )
		row.textObj:setReferencePoint( display.CenterLeftReferencePoint )
		row.textObj.x, row.textObj.y = 20, rowGroup.contentHeight * 0.5
	end

	
	-- insert rows into list (tableView widget)
	for i = 1, 100 do
		local isCategory = false
		local rowColor = { 255, 255, 255, 255}
		local rowHeight = 40
		local listener = rowListener
		
		
		if i == 25 or i == 50 or i == 75 then
			isCategory = true
			rowHeight = 24
			rowColor = { 150, 160, 180, 200 }
			listener = nil
		end
		
		list:insertRow
		{
			height = rowHeight,
			rowColor = rowColor,
			isCategory = isCategory,
			onRender = onRowRender,
			listener = listener
		}
	end

	-- Insert the tableView into the scene group
	group:insert( list )
end

function scene:exitScene(event)

	local group = self.view
end

function scene:destroyScene(event)

	local group = self.view
end


scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

]]
