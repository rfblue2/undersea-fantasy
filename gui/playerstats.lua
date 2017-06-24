-----------------------------------------------------------------------------------------
--
-- playerstats.lua
-- visually shows the player stats given a player
-----------------------------------------------------------------------------------------
local Player = require( "player" )
local M = {}

function M:new(opts)

  local opts = opts or {}

  local stats = display.newGroup()
  stats.player = Player.Instance()

  local hp = display.newText({
    text="HP: " .. stats.player.hp
  })
  hp.anchorX = 0
  hp.anchorY = 0
  hp.x = 0
  hp.y = 0

  local mp = display.newText({
    text="MP: " .. stats.player.mp
  })
  mp.anchorX = 0
  mp.anchorY = 0
  mp.x = 0
  mp.y = hp.height

  local xp = display.newText({
    text="XP: " .. stats.player.xp
  })
  xp.anchorX = 0
  xp.anchorY = 0
  xp.x = 0
  xp.y = hp.height + mp.height

  local shells = display.newText({
    text="shells: " .. stats.player.shells
  })
  shells.anchorX = 0
  shells.anchorY = 0
  shells.x = 0
  shells.y = hp.height + mp.height + xp.height

  stats:insert(hp)
  stats:insert(mp)
  stats:insert(xp)
  stats:insert(shells)

  function stats:update()
    hp.text = "HP: " .. stats.player.hp
    mp.text = "MP: " .. stats.player.mp
    xp.text = "XP: " .. stats.player.xp
    shells.text = "shells: " .. stats.player.shells
  end

  return stats
end

return M
