local hpSpell2 = "small regeneration"
local hpThreshold = 80

macro(1, hpSpell2, function()
    if player:getHealthPercent() <= storage.hpThreshold then
        say(storage.hpSpell)
    end
end)

UI.Label("HP Spell 2:")

UI.TextEdit(storage.hpSpell or "small regeneration", function(widget, text)
    storage.hpSpell = text
end)

UI.Label("HP %:")

UI.TextEdit(tostring(storage.hpThreshold or 80), function(widget, text)
    storage.hpThreshold = tonumber(text)
end)

UI.Separator()