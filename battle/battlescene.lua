-----------------------------------------------------------------------------------------
--
-- battlescene.lua
-- Scene for a battle between user and monster
-----------------------------------------------------------------------------------------

require( "screen" )
local composer = require( "composer" )
local scene = composer.newScene()

local Widget = require( "widget" )
local PlayerGui = require( "gui.playergui" )
local Enemy = require( "battle.enemy" )
local Player = require( "player" )

--------------------------------------------

local attackBtn
local runBtn
local playergui
local prevScene
local enemy
local hero -- just the image of the player
local player
local playerTurn -- bool

-- shakes obj left and right count times
local function shake(obj, count)

  local back, forth

  back = function()
    if count ~= 0 then
      count = count - 1
      transition.moveTo(obj, {
        x=obj.x + 10,
        y=obj.y,
        time=100,
        onComplete=forth
      })
    end
  end

  forth = function()
    if count ~= 0 then
      count = count - 1
      transition.moveTo(obj, {
        x=obj.x - 10,
        y=obj.y,
        time=100,
        onComplete=back
      })
    end
  end

  back()
end

-- enemy attack sequence
local function enemyTurn()
  shake(hero, 6)
  if player:damage(10) then
    print( "Player defeated" )
    composer.gotoScene( prevScene, "fade", 250 )
  end
  playerTurn = true
  attackBtn:setEnabled(true)
  -- player's turn, do nothing.
end

local function onAttackRelease()
  shake(enemy, 6) -- TODO deal with fact that this is async
  if enemy:damage(10) then
    print( "Enemy defeated" )
    composer.gotoScene( prevScene, "fade", 250 )
  end
  playerTurn = false
  attackBtn:setEnabled(false) -- player cannot attack
  enemyTurn()
	return true
end

local function onRunRelease()
	composer.gotoScene( prevScene, "fade", 250 )
	return true
end

function scene:create( event )

	local sceneGroup = self.view

  playerTurn = true -- player attacks first

	local background = display.newImageRect( "assets/img/bg-default.png", screen.actualWidth, screen.actualHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + screen.left
	background.y = 0 + screen.top

  prevScene = event.params.prevScene

  hero = display.newImageRect(  "assets/img/triton.png", 250, 259 )
  hero.anchorX = 0
  hero.x = screen.left + 10
  hero.y = screen.centerY

  player = Player.Instance()

  enemy = Enemy:new({
    type="shark"
  })
  enemy.anchorX = 0
  enemy.x = screen.right - enemy.width - 10
  enemy.y = screen.centerY

	-- construct the player gui overlay
	playergui = PlayerGui:new({
    -- setup attack controls?
    enemy=enemy
	})

	attackBtn = Widget.newButton{
		label="Attack",
		labelColor = { default={255}, over={128} },
		defaultFile="assets/img/button.png",
		overFile="assets/img/button-over.png",
		width=154, height=40,
		onRelease = onAttackRelease	-- event listener function
	}
  attackBtn.anchorY = 1
  attackBtn.x = screen.centerX - attackBtn.width
  attackBtn.y = screen.bottom - 10

  runBtn = Widget.newButton{
		label="Run",
		labelColor = { default={255}, over={128} },
		defaultFile="assets/img/button.png",
		overFile="assets/img/button-over.png",
		width=154, height=40,
		onRelease = onRunRelease	-- event listener function
	}
  runBtn.anchorY = 1
  runBtn.x = screen.centerX + runBtn.width
  runBtn.y = screen.bottom - 10

	sceneGroup:insert( background )
  sceneGroup:insert( hero )
  sceneGroup:insert( enemy )
  sceneGroup:insert( attackBtn )
  sceneGroup:insert( runBtn )
	sceneGroup:insert( playergui )
end

function scene:destroy( event )

	local sceneGroup = self.view
	if playergui then
		playergui:removeSelf()
		playergui = nil
	end
	if attackBtn then
		attackBtn:removeSelf()
		attackBtn = nil
	end

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
