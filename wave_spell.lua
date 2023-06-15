local wave=macro(250, "Wave Spells",  function()
  if g_game.isAttacking() then
      local target = g_game.getAttackingCreature() 
      if  target:isMonster() then
        if (manapercent() >= storage.manaPercent2) and (hppercent() >= storage.hpPercent2) then
            say(storage.wave)

        end
      else
        if (manapercent() >= storage.manaPercent2) and (hppercent() >= storage.hpPercent2) then
            say(storage.pvp)

        end
      end
  end
  end)
  local ICON_ID = 13415 -- id ikony
  addIcon("wave", {item={id = ICON_ID}, movable=true}, function(icon, isOn)
      wave.setOn(isOn) 
  end)
  UI.Label("Wave Spell:")
  UI.TextEdit(storage.wave or "Ki Repulsion", function(widget, text)
      storage.wave = text
  end)
    UI.Label("Pvp:")
  UI.TextEdit(storage.pvp or "hell granade", function(widget, text)
      storage.pvp = text
  end)
  UI.Label("Mana Percent:")
  UI.TextEdit(tostring(storage.manaPercent2 or 20), function(widget, text)
      storage.manaPercent2 = tonumber(text)
  end)
  
  UI.Label("HP Percent:")
  UI.TextEdit(tostring(storage.hpPercent2 or 20), function(widget, text)
      storage.hpPercent2 = tonumber(text)
  end)
