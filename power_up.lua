
local bloodrage = macro(1000, "Power UP", function()
    if player:getSkillLevel(4) <= storage.skill then
        saySpell("Power Up", 200)
    end
end)

UI.Label("Skill Level:")
UI.TextEdit(tostring(storage.skill or 159), function(widget, text)
    storage.skill = tonumber(text)
end)

UI.Separator()
