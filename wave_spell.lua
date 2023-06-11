local wave=macro(250, "Wave Spells",  function()
  if g_game.isAttacking() then
      if (manapercent() >= storage.manaPercent2) and (hppercent() >= storage.hpPercent2) then
          say(storage.wave)
      end
  end
  end)
  local ICON_ID = 13415 -- id ikony
  addIcon("wave", {item={id = ICON_ID}, movable=true}, function(icon, isOn)
      wave.setOn(isOn) 
  end)
  UI.Label("Multi Target Spell:")
  UI.TextEdit(storage.wave or "Ki Repulsion", function(widget, text)
      storage.wave = text
  end)
  
  UI.Label("Mana Percent:")
  UI.TextEdit(tostring(storage.manaPercent2 or 20), function(widget, text)
      storage.manaPercent2 = tonumber(text)
  end)
  
  UI.Label("HP Percent:")
  UI.TextEdit(tostring(storage.hpPercent2 or 20), function(widget, text)
      storage.hpPercent2 = tonumber(text)
  end)