if not g_resources.directoryExists("/screenshots") then
    g_resources.makeDir("/screenshots")
end

onTextMessage(function(mode, text)
    if string.find(text, "You are dead.") then
        doScreenshot("/screenshots/"..player:getName().. " - Death " ..os.date('%Y-%m-%d, %H.%M.%S').. ".png")
        return
    end
    if string.find(text, "You advanced from Level.") then
        doScreenshot("/screenshots/"..player:getName().. "-" ..player:getLevel().. ".png")
        return
    end





end)