local singleTargetSpell = 'Barrier'
local multiTargetSpell = 'Ki Repulsion'
local distance = 3
local amountOfMonsters = 2
local manaPercent = 20
local hpPercent = 20

local yv=macro(250, "multi target spell",  function()
    local specAmount = 0
    if not g_game.isAttacking() then
        return
    end
    for i,mob in ipairs(getSpectators()) do
        if (getDistanceBetween(player:getPosition(), mob:getPosition()) <= distance and mob:isMonster()) then
            specAmount = specAmount + 1
        end
    end
    if (specAmount >= amountOfMonsters) then
        if (manapercent() >= storage.manaPercent) and (hppercent() >= storage.hpPercent) then
            say(storage.multiTargetSpell)
        end
    else
        if (manapercent() >= storage.manaPercent) and (hppercent() >= storage.hpPercent) then
            say(storage.singleTargetSpell)
        end
    end
end)
local ICON_ID = 13414 -- id ikony
addIcon("nazwa ikony", {item={id = ICON_ID}, movable=true}, function(icon, isOn)
  yv.setOn(isOn) 
end)
UI.Label("Single Target Spell:")
UI.TextEdit(storage.singleTargetSpell or "Barrier", function(widget, text)
    storage.singleTargetSpell = text
end)

UI.Label("Multi Target Spell:")
UI.TextEdit(storage.multiTargetSpell or "Ki Repulsion", function(widget, text)
    storage.multiTargetSpell = text
end)

UI.Label("Mana Percent:")
UI.TextEdit(tostring(storage.manaPercent or 20), function(widget, text)
    storage.manaPercent = tonumber(text)
end)

UI.Label("HP Percent:")
UI.TextEdit(tostring(storage.hpPercent or 20), function(widget, text)
    storage.hpPercent = tonumber(text)
end)

UI.Separator()
