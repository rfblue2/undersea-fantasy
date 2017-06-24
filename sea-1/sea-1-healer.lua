-----------------------------------------------------------------------------------------
--
-- sea-1-healer.lua
--
-----------------------------------------------------------------------------------------
require( "screen" )
local composer = require( "composer" )
local scene = composer.newScene()

local Widget = require( "widget" )
local PlayerGui = require( "gui.playergui" )

--------------------------------------------

local healBtn
local playergui

local function onHealRelease()
	-- TODO implement heal functionality
	return true
end

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
			right="sea-1.sea-1-spawn"
		}
	})

	healBtn = Widget.newButton{
		label="Heal Me",
		labelColor = { default={255}, over={128} },
		defaultFile="assets/img/button.png",
		overFile="assets/img/button-over.png",
		width=154, height=40,
		onRelease = onHealRelease	-- event listener function
	}
	healBtn.x = screen.centerX
	healBtn.y = screen.centerY

	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( playergui )
	sceneGroup:insert( healBtn )
end

function scene:destroy( event )
	local sceneGroup = self.view
	if playergui then
		playergui:removeSelf()
		playergui = nil
	end
	if healBtn then
		healBtn:removeSelf()
		healBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
