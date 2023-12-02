
macro(200, "Turn to Target", function ()
	if not g_game.isAttacking() then
		return
	end

	local tt = g_game.getAttackingCreature()
	local tx = tt:getPosition().x
	local ty = tt:getPosition().y
	local dir = player:getDirection()
	local tdx = math.abs(tx - pos().x)
	local tdy = math.abs(ty - pos().y)

	if tdy >= 2 and tdx >= 2 or tdx > 7 or tdy > 7 then
		return
	end

	if tdx <= tdy then
		if pos().y < ty then
			if dir ~= 2 then
				return turn(2)
			end
		elseif dir ~= 0 then
			return turn(0)
		end
	elseif pos().x < tx then
		if dir ~= 1 then
			return turn(1)
		end
	elseif dir ~= 3 then
		return turn(3)
	end
end)
UI.Separator()
