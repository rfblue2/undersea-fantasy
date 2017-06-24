-----------------------------------------------------------------------------------------
--
-- sea-1-shop.lua
-- Buy things (shelves for each type of item)
-- Potions: HP Potion (+20), MP Potion (+20), Full Heal
-- Weapons: Dagger, Driftwood sword
-- Gear:
-- Misc: Lamp to see in the dark
-----------------------------------------------------------------------------------------
require( "screen" )
local composer = require( "composer" )
local scene = composer.newScene()

local Widget = require( "widget" )
local PlayerGui = require( "gui.playergui" )
--------------------------------------------

local leftBtn
local playergui

function scene:create( event )

	local sceneGroup = self.view

	local background = display.newImageRect( "assets/img/bg-default.png", screen.actualWidth, screen.actualHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + screen.left
	background.y = 0 + screen.top

	-- construct the player gui overlay
	playergui = PlayerGui:new({
		nav={
			left="sea-1.sea-1-spawn"
		}
	})

	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( playergui )
end

function scene:destroy( event )
	local sceneGroup = self.view
	if playergui then
		playergui:removeSelf()
		playergui = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
