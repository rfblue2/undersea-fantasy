-----------------------------------------------------------------------------------------
--
-- player.lua
-- holds the player data and items
-----------------------------------------------------------------------------------------
local Item = require( "item" )

local M = {}

local _instance = nil

function M:initialize()

    self.xp = 0
    self.hp = 100
    self.mp = 100
    self.shells = 100
    self.maxHp = 100
    self.maxMp = 100

    -- Save strings, don't save actual images; generate
    -- items on the spot for display so they are destroyed
    -- with scene
    self.inventory = {}

    -- TODO this is a test, later add quantity
    table.insert(self.inventory, "potion1")
    table.insert(self.inventory, "potion2")

    -- damages the enemy by specified amount (default 10)
    -- and returns true if enemy still alive
    function self:damage(amnt)
      self.hp = math.max(0, self.hp - ( amnt or 10 ))
      return self.hp <= 0
    end
end

function M.Instance()
  if not _instance then
    _instance = M
    _instance:initialize()
  end
  return _instance
end

function M:new(opts)
  print ('Cannot initialize instance of player class')
end

return M
