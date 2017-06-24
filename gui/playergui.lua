-----------------------------------------------------------------------------------------
--
-- playergui.lua
-- All gui components shown over screen; can choose what to show
-----------------------------------------------------------------------------------------
require( "screen" )
local composer = require( "composer" )
local Nav = require( "gui.nav" )
local PlayerStats = require( "gui.playerstats" )
local EnemyStats = require( "gui.enemystats" )
local Widget = require( "widget" )

local M = {}

-- options: player, nav.left/right/up/down, navHidden, playerstatsHidden
function M:new(opts)

  local opts = opts or {}
  local playergui = display.newGroup()
  local nav
  local enemystats

  if opts.nav then
    nav = Nav:new({
      left=opts.nav.left,
      right=opts.nav.right,
      up=opts.nav.up,
      down=opts.nav.down
    })
    playergui:insert(nav)
  end

  local playerstats = PlayerStats:new()
	playerstats.anchorX = 0
	playerstats.anchorY = 0
	playerstats.x = 10 + screen.left
	playerstats.y = 0 + screen.top

  if opts.enemy then
    enemystats = EnemyStats:new({
      enemy=opts.enemy
    })
  	enemystats.anchorY = 0
    enemystats.anchorX = 0 -- not sure why 1 doesn't work
  	enemystats.x = screen.right - enemystats.width - 10
  	enemystats.y = 0 + screen.top
    playergui:insert(enemystats)
  end

  local function onInvBtnRelease()
  	composer.showOverlay( "gui.inventory" , {
  		isModal = true,
  		effect = "fade",
  		time=100
  	})
  	return true
  end

  local invBtn = Widget.newButton{
		defaultFile="assets/img/inventory_button.png",
		overFile="assets/img/inventory_button_over.png",
		width=42, height=42,
		onRelease=onInvBtnRelease
	}
	invBtn.x = screen.right - 40
	invBtn.y = screen.bottom - 40

  playergui:insert(playerstats)
  playergui:insert(invBtn)

  return playergui
end

return M
