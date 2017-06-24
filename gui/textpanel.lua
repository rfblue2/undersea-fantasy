-----------------------------------------------------------------------------------------
--
-- textpanel.lua
-- the bar on bottom of screen with narrative/info text
-----------------------------------------------------------------------------------------
require( "screen" )
local Widget = require( "widget" )

local M = {}

function M:new(opts)
  local opts = opts or {}

  local textpanel = display.newGroup()

  local background = display.newRect(0, 0, screen.width, 120)
  background:setFillColor(150, 75, 0)

  local text = display.newText({
    text=opts.text
  })
  text.anchorX = 0
  text.anchorY = 0
  text.x = 0
  text.y = 0

  textpanel:insert(background)
  textpanel:insert(text)

  return textpanel
end

return M
