-----------------------------------------------------------------------------------------
--
-- enemystats.lua
-- visually shows the enemy stats given a enemy
-----------------------------------------------------------------------------------------

local M = {}

function M:new(opts)

  local opts = opts or {}

  local stats = display.newGroup()
  stats.enemy = opts.enemy

  local hp = display.newText({
    text="HP: " .. stats.enemy.hp
  })
  hp.anchorX = 0
  hp.anchorY = 0
  hp.x = 0
  hp.y = 0

  stats:insert(hp)

  function stats:update()
    hp.text = "HP: " .. stats.enemy.hp
  end

  return stats
end

return M
