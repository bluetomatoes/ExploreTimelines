--level 1
  local storyboard = require ("storyboard")
  local scene = storyboard.newScene()
module(..., package.seeall)
function loadLevel()
-- create a group for this level
local screenGroup = display.newGroup()
-- create some content for this level
local levelText = display.newText( "Level One", 20, 20, "Helvetica-Bold", 24 )


-- insert the text into this level's group
screenGroup:insert( levelText )
-- calling loadlevel will return the display group
return screenGroup
end

    local levelGroup = require( "level2" ).loadLevel2
    timer.performWithDelay(1000, loadLevel2, 1)
	--maketrans()