local paral = "ki paralize"
local ex = 5 -- seconds

local paralMacro = macro(100, "ki paralize", function()
    local target = g_game.getAttackingCreature()
    if not target then return end
    
    say(storage.paral) 
    delay(storage.ex * 1000)
end)

local ICON_ID = 13400 -- id ikony
addIcon("paral", {item={id = ICON_ID}, movable=true}, function(icon, isOn)
    paralMacro.setOn(isOn) 
end)

UI.Label("Paralyze Spell:")
UI.TextEdit(storage.paral or "ki paralize", function(widget, text)
    storage.paral = text
end)

UI.Label("Delay (seconds):")
UI.TextEdit(tostring(storage.ex or 5), function(widget, text)
    storage.ex = tonumber(text)
end)

UI.Separator()
