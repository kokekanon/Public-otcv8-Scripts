local aura = 81

local getOutfits = function()
    local pOutfit = player:getOutfit()
    player:setOutfit({type = pOutfit.type, wings = 2, aura = storage.aura})
end

singlehotkey("Ctrl+x", "Get Outfits", function() getOutfits() end)

UI.Label("Aura:")
UI.TextEdit(tostring(storage.aura or 893), function(widget, text)
    storage.aura = tonumber(text)
end)

UI.Separator()
