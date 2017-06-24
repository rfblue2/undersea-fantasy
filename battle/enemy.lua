-----------------------------------------------------------------------------------------
--
-- enemy.lua
-- Renders the enemy and holds its data
-----------------------------------------------------------------------------------------

local M = {}

function M:new(opts)

  local opts = opts or {}

  local enemy = display.newGroup()
  local img
  enemy.hp = opts.hp or 100

  local defaultMoves = {}
  defaultMoves[1] = { name="move1", damage=10 }
  defaultMoves[2] = { name="move2", damage=5 }
  enemy.moves = opts.moves or defaultMoves

  local type = opts.type or "default"

  if type == "shark" then
    img = display.newImageRect("assets/img/shark.png", 111, 220)
    -- TODO moves should be specific to the enemy; specify them here
    -- also use some file to store this info
  else
    img = display.newRect(0, 0, 250, 250)
    img:setFillColor(0)
  end

  enemy:insert(img)

  -- damages the enemy by specified amount (default 10)
  -- and returns true if enemy still alive
  function enemy:damage(amnt)
    enemy.hp = math.max(0, enemy.hp - ( amnt or 10 ))
    return enemy.hp <= 0
  end

  return enemy
end

return M
