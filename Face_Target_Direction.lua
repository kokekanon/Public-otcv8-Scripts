macro(200, "Face Target", function()
    --Join Discord server for free scripts
    --https://discord.gg/RkQ9nyPMBH
    local target = g_game.getAttackingCreature()
    if target then
        local xDiff = target:getPosition().x > posx()
        local yDiff = target:getPosition().y > posy()
        local isXBigger = math.abs(target:getPosition().x - posx()) > math.abs(target:getPosition().y - posy())
    
        local dir = player:getDirection()
        if xDiff and isXBigger then  
            if dir ~= 1 then turn(1) end
            return
        elseif not xDiff and isXBigger then 
            if dir ~= 3 then turn(3) end
            return
        elseif yDiff and not isXBigger then  
            if dir ~= 2 then turn(2) end
            return
        elseif not yDiff and not isXBigger  then 
            if dir ~= 0 then turn(0) end
            return
        end

    end    
end)
