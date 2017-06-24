-----------------------------------------------------------------------------------------
--
-- items.lua
-- Represents an item (returns a group object)
-- Pass in a constant telling it what kind of item it is
-----------------------------------------------------------------------------------------

local M = {}

function M:new(opts)

  local opts = opts or {}
  local item = display.newGroup()
  local img

  for i,v in pairs(opts) do
    print(i, v)
  end

  if opts.type == "potion1" then
    img = display.newImageRect("assets/img/potion_red.png", 377, 377)
  elseif opts.type == "potion2" then
    img = display.newImageRect("assets/img/potion_blue.png", 377, 377)
  else
    img = display.newRect(0,0,377,377)
    img:setFillColor(0)
  end

  img.anchorX = 0
  img.anchorY = 0
  -- TODO temporary; make image actual size and then get rid of scaling
  img.xScale = 0.1
  img.yScale = 0.1

  item:insert(img)

  return item
end

return M
