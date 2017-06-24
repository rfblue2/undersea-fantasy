-----------------------------------------------------------------------------------------
--
-- inventory.lua
-- Inventory view gui (will be an overlay)
-- Battle items: potions,
-- Equippable items: weapons, gear, misc (e.g. lamp)
-- Quest items: for later...
-----------------------------------------------------------------------------------------
require( "screen" )
local composer = require( "composer" )
local scene = composer.newScene()

local Widget = require( "widget" )
local Player = require( "player" )
local Item = require( "item" )

--------------------------------------------

local closeBtn

local function onCloseBtnRelease()
  composer.hideOverlay( "fade", 100 )
end

function scene:create( event )

	local sceneGroup = self.view

  local background = display.newRoundedRect( 5, 5, screen.width - 10, screen.height - 10, 10 )
  background:setFillColor( 0, 0.75)
  background.anchorX = 0
  background.anchorY = 0

  local title = display.newText({
    text="Inventory",
    x=screen.centerX,
    y=screen.top + 40,
    fontSize=36
  })

  local player = Player.Instance()

  closeBtn = Widget.newButton{
    defaultFile="assets/img/close_button.png",
    overFile="assets/img/close_button_over.png",
    width=42, height=42,
    onRelease=onCloseBtnRelease
  }
  closeBtn.x = screen.right - 40
  closeBtn.y = screen.top + 40

  sceneGroup:insert( background )
  sceneGroup:insert( title )
  sceneGroup:insert( closeBtn )

  -- add items
  for i,v in ipairs(player.inventory) do
    local item = Item:new({type=v})
    item.x = i % 3 * item.width
    item.y = math.floor(i / 3) * item.height + 20
    sceneGroup:insert(item)
  end

end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then

  elseif phase == "did" then

	end
end

function scene:hide( event )
	local sceneGroup = self.view

	local phase = event.phase

	if event.phase == "will" then

	elseif phase == "did" then

	end

end

function scene:destroy( event )

	local sceneGroup = self.view

  if closeBtn then
    closeBtn:removeSelf()
    closeBtn = nil
  end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
