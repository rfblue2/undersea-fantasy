-----------------------------------------------------------------------------------------
--
-- nav.lua
-- Constructs navigation arrows to overlay screen
-----------------------------------------------------------------------------------------
require( "screen" )
local Widget = require( "widget" )
local composer = require( "composer" )

local M = {}

function M:new(opts)

  local opts = opts or {}

  local nav = display.newGroup()

  local leftBtn, rightBtn, upBtn, downBtn
  
  if opts.left then

    local function onLeftRelease()
    	composer.gotoScene( opts.left, "fade", 250 )
    	return true	-- indicates successful touch
    end

    leftBtn = Widget.newButton{
  		shape="polygon",
  		vertices={ -20, 0, 20, 40, 20, -40 },
  		fillColor={ default={1, 1, 1, 0.5}, over={1, 1, 1, 1}},
  		onRelease = onLeftRelease
  	}
  	leftBtn.x = 40 + screen.left
  	leftBtn.y = screen.centerY

    nav:insert(leftBtn)
  end

  if opts.right then

    local function onRightRelease()
      composer.gotoScene( opts.right, "fade", 250 )
      return true	-- indicates successful touch
    end

  	rightBtn = Widget.newButton{
  		shape="polygon",
  		vertices={ 20, 0, -20, 40, -20, -40 },
  		fillColor={ default={1, 1, 1, 0.5}, over={1, 1, 1, 1}},
  		onRelease = onRightRelease
  	}
  	rightBtn.x = screen.right - 40
  	rightBtn.y = screen.centerY

    nav:insert(rightBtn)
  end

  if opts.up then

    local function onUpRelease()
      composer.gotoScene( opts.up, "fade", 250 )
      return true	-- indicates successful touch
    end

  	upBtn = Widget.newButton{
  		shape="polygon",
  		vertices={ 0, -20, -40, 20, 40, 20 },
  		fillColor={ default={1, 1, 1, 0.5}, over={1, 1, 1, 1}},
  		onRelease = onUpRelease
  	}
  	upBtn.x = screen.centerX
  	upBtn.y = screen.top + 40

    nav:insert(upBtn)
  end

  if opts.down then

    local function onDownRelease()
      composer.gotoScene( opts.down, "fade", 250 )
      return true	-- indicates successful touch
    end

  	downBtn = Widget.newButton{
  		shape="polygon",
  		vertices={ 0, 20, 40, -20, -40, -20 },
  		fillColor={ default={1, 1, 1, 0.5}, over={1, 1, 1, 1}},
  		onRelease = onDownRelease
  	}
  	downBtn.x = screen.centerX
  	downBtn.y = screen.bottom - 40

    nav:insert(downBtn)
  end

  return nav
end

return M
