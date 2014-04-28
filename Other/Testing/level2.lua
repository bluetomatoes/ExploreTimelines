
module(..., package.seeall)
function loadLevel2()
-- create a group for this level
local screenGroup = display.newGroup()
-- create some content for this level
local levelText = display.newText( "Level Two", 20, 40, "Helvetica-Bold", 24 )

-- insert the text into this level's group
screenGroup:insert( levelText )
-- calling loadlevel will return the display group
return screenGroup
end