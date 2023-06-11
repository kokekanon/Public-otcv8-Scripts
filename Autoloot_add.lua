local doAutoLootLook = macro(5000, "Auto Loot ADD on Look", function() end)
onTextMessage(function(mode, text)
    if mode == 20 and text:find("You see") and doAutoLootLook:isOn() then
        local regex = [[(?:an|a)([a-z A-Z]*).]]
        local data = regexMatch(text, regex)[1]
        if data and data[2] then
            say('!autoloot add, ' ..data[2]:trim())
        end
    end
end)


local doAutoLootLook = macro(5000, "Auto Loot REMOVE on Look", function() end)
onTextMessage(function(mode, text)
    if mode == 20 and text:find("You see") and doAutoLootLook:isOn() then
        local regex = [[(?:an|a)([a-z A-Z]*).]]
        local data = regexMatch(text, regex)[1]
        if data and data[2] then
            say('!autoloot remove, ' ..data[2]:trim())
        end
    end
end)
