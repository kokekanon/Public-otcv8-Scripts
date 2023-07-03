--[AutoExplorer BETA]

--Este script é uma tentativa de fazer um AutoExplorer
--Facilmente entra em loop em hunts "apertadas"

--[Config]-----------------
local procedDist = 1
local maxWalkDist = 20
local pathMaxDist = 20
local maxStandTime = 2000
---------------------------

local nextPos = nil
local currentPos = nil
local lastPos = nil
local furdestDist = 0

local getOkTiles = function()
    local tiles = { }
    for _, tile in ipairs(g_map.getTiles(posz())) do
        if tile:isWalkable() and findPath(pos(), tile:getPosition(), pathMaxDist) then
            table.insert(tiles, tile)
        end
    end
    return tiles
end

local getFirstPos = function()
    return getOkTiles()[1]:getPosition()
end

local reset = function()
    nextPos = nil
    currentPos = nil
    lastPos = nil
    furdestDist = 0
end

local start = function()
    currentPos = getFirstPos()
    lastPos = table.copy(currentPos)
end

local restart = function()
    reset()
    start()
end

macro(2000, function()
    if standTime() > maxStandTime then
        restart()
    end
end)

local m_main = macro(500, "Auto Explorer", function(m)

    --Join Discord server for free scripts
    --https://discord.gg/RkQ9nyPMBH
    --Made By VivoDibra#1182
    --Tested on vBot 4.8 / OTCV8 3.1 rev 232
    
    if g_game.isAttacking() then return end

    if not currentPos then
        return start()
    end

    autoWalk(currentPos)

    if distanceFromPlayer(currentPos) <= procedDist and nextPos then
        local nextTile = g_map.getTile(nextPos)
        if nextTile then
            nextTile:setText("WALK","yellow")
        end
        lastPos = table.copy(currentPos)
        currentPos = table.copy(nextPos)
        furdestDist = 0
    end

    schedule(500, function()
        if m.isOff() then
            reset()
        end
    end)

end)

onAddThing(function(tile, thing)
    if m_main.isOff() then return end
    if not currentPos then return end
    if not tile or not tile:isWalkable() then return end
    local tPos = tile:getPosition()
    if tPos.z ~= posz() then return end
    schedule(100, function()
        if not findPath(pos(), tPos, pathMaxDist, {ignoreCreatures = true}) then return end
        local auxDist = getDistanceBetween(lastPos, tPos)
        if auxDist <= maxWalkDist and auxDist >= furdestDist then
            nextPos = table.copy(tPos)
            furdestDist = auxDist
        end
    end)
end)