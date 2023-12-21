-- Auto Levitate
--[[

--test
Description: Script will automatically use correct exani hur spell by running into the walls where you can exani hur

How to use: Run into walls. If it doesn't levitate right away click the same walking key again to levitate

Author: Frosty
]]--

-- config
local usingWASD = modules.game_walking.wsadWalking

-- script
local walkDir
onKeyDown(function(keys)
  usingWASD = modules.game_walking.wsadWalking
  if usingWASD then
    if keys == "D" or keys == "A" or keys == "S" or keys == "W" then
      walkDir = keys
    end
  else
    if keys == "Up" or keys == "Right" or keys == "Down" or keys == "Left" then
      walkDir = keys
    end
  end
end)

macro(200, "Auto JUMP", function()
  local playerPos = pos()
  local levitateTile
  if walkDir == "W" or walkDir == "Up" then -- north
    playerPos.y = playerPos.y - 1
    turn(0)
    levitateTile = g_map.getTile(playerPos)
  elseif walkDir == "D" or walkDir == "Right" then -- east
    playerPos.x = playerPos.x + 1
    turn(1)
    levitateTile = g_map.getTile(playerPos)
  elseif walkDir == "S" or walkDir == "Down" then -- south
    playerPos.y = playerPos.y + 1
    turn(2)
    levitateTile = g_map.getTile(playerPos)
  elseif walkDir == "A" or walkDir == "Left" then -- west
    playerPos.x = playerPos.x - 1
    turn(3)
    levitateTile = g_map.getTile(playerPos)
  end

  if levitateTile and not levitateTile:isWalkable() then
    if levitateTile:getGround() then
      say('Jump "up')
      walkDir = nil
    else
      say('Jump "down')
      walkDir = nil
    end
  end
  walkDir = nil
end, toolsTab)
