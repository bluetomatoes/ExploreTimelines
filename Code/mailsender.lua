display.setStatusBar( display.HiddenStatusBar )

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require "widget"
widget.setTheme( "theme_ios" )
MultiTouch = require("dmc_multitouch")
function scene:createScene( event )
	local group = self.view

local path = system.pathForFile( "images/1846 USA/info.txt", system.ResourceDirectory)
local file = io.open(path)
local contents = file:read("*a")
--print(contents)

for line in io.lines(path) do
	print(line)
end

local btn_submit = native.newTextField( 200, 30, 180, 30, fieldHandler)
btn_submit.size = 10
local toolbar = display.newRect(0, 0,100, 600)
toolbar:setFillColor(100, 140, 240)
toolbar.alpha = 0.8
toolbar.x = toolbar.width * -1


transition.to(toolbar, {x = 0, time = 800})

local rect

local function createRect()
	rect = display.newRect(10, 10, 30, 30)
end
createRect()

local function fieldHandler( event )
    print( event.phase )
    if "began" == event.phase then
    	
        -- do something
    elseif "editing" == event.phase then
        -- do something

        
        
    elseif "submitted" == event.phase then
        -- do something
       
        display.remove(btn_submit)
        btn_submit = nil


    end
end

local path = system.pathForFile("monkey.txt", system.DocumentsDirectory)
local monkey_file = io.open(path, "r")

local data = monkey_file:read("*a")
--print(data)

io.close(monkey_file)
monkey_file = nil
btn_submit:addEventListener("userInput", fieldHandler)

local r = display.newRect( 0, 0, 320, 480 )
r:setFillColor( 255, 0, 0 )

-- Text with transparent background
local t = native.newTextBox( 300, 140, 260, 100 )
t.font = native.newFont( "Helvetica-Bold", 16 )
t:setTextColor( 200, 200, 200, 255 )
t.hasBackground = false
--t.text = text
t.isEditable = true

local rectField
local function activateRect()
	MultiTouch.activate(rect, "move", "single")	

end
activateRect()

local function dragRect(event)
	print(event.x, event.y)
	--if event.x > toolbar.x + toolbar.width* 0.5 and event.x < toolbar.x - toolbar.width * 0.5 and event.x > toolbar.y + toolbar.height *0.5 and event.x < toolbar.y - toolbar.height *0.5 then	
	if event.phase == "moved" then

		transition.to( rect, {width = 180, height = 30, time = 50})
	elseif event.phase == "ended" then
		if rect.width < 180 then
			rect.width = 180
		end
		rectField = native.newTextField(0, 0, 180, rect.height)
		rectField:setReferencePoint(display.CenterReferencePoint)
		rectField.x, rectField.y = rect.x, rect.y
		rectField.text = "Enter a label"
		rectField:setTextColor(130, 130, 130)
		rectField.align = "center"
		local function fieldEnter( event )
	print( event.phase )
    if "began" == event.phase then
    	rectField.text = ""
        -- do something
    elseif "editing" == event.phase then
        -- do something
 
    elseif "submitted" == event.phase then
        -- do something
       
        display.remove(btn_submit)
        btn_submit = nil


    end
end


rectField:addEventListener("userInput", fieldEnter)

		display.remove(rect)
		rect = nil
		createRect()
		rect.alpha = 0
		transition.to(rect, {alpha = 1, time = 200})
		activateRect()
		rect:addEventListener(MultiTouch.MULTITOUCH_EVENT, dragRect)
	end
end
rect:addEventListener(MultiTouch.MULTITOUCH_EVENT, dragRect)



-- Create our Text Field
field = native.newTextField( 500, 30, 180, 30 )
field.size = 10
local function textListener( event )
    if event.phase == "editing" then
       
        text = display.newText(event.text, 0,0, native.systemFont, field.size)
        
        if text.width > 180 then
        	
        	local num = text.width
        	field.width = num
        end 
       field:setReferencePoint(display.TopLeftReferencePoint)


    elseif event.phase == "submitted" or event.phase == "ended" then


     end

end
field:addEventListener( "userInput", textListener )

button = widget.newButton
{
	left = field.x + field.width * 0.5,
	top = field.y + field.height * 0.5 + 6,
	width = 70,
	default = "assets/blue1Small/default3.png",
	over = "assets/blue1Small/over.png",
	label = "Save",
	emboss = true,
	onRelease = onDoneRelease
}

toolbar:toFront()
rect:toFront()
end








-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
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
