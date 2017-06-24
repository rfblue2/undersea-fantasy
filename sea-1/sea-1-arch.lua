-----------------------------------------------------------------------------------------
--
-- sea-1-arch.lua
--
-----------------------------------------------------------------------------------------

require( "screen" )
local composer = require( "composer" )
local scene = composer.newScene()

local Widget = require( "widget" )
local PlayerGui = require( "gui.playergui" )

--------------------------------------------

local fightBtn
local playergui

local function onFightRelease()
	composer.gotoScene("battle.battlescene",
		{
			effect="fade",
			time=250,
			params={
				prevScene=composer.getSceneName( "current" )
			}
		})
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
			down="sea-1.sea-1-spawn"
		}
	})

	-- for testing, use this to go to fighting monster screen
	fightBtn = Widget.newButton{
		label="Fight",
		labelColor = { default={255}, over={128} },
		defaultFile="assets/img/button.png",
		overFile="assets/img/button-over.png",
		width=154, height=40,
		onRelease = onFightRelease	-- event listener function
	}
	fightBtn.x = screen.centerX
	fightBtn.y = screen.centerY

	sceneGroup:insert( background )
	sceneGroup:insert( playergui )
	sceneGroup:insert( fightBtn )
end

function scene:destroy( event )

	local sceneGroup = self.view
	if playergui then
		playergui:removeSelf()
		playergui = nil
	end
	if fightBtn then
		fightBtn:removeSelf()
		fightBtn = nil
	end

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
