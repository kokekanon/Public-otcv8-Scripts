if type(storage.healing) ~= "table" then
    storage.healing = {on=false, title="Heal", item=11862, min=50, max=50}
  end
  local healingmacro = macro(200, function()
    local hppc = manapercent()
    local mppc = manapercent()
  
    if hppc <= storage.healing.min or mppc <= storage.healing.max then
      use(storage.healing.item)
    end
  end)
  healingmacro.setOn(storage.healing.on)
  UI.DualScrollItemPanel(storage.healing, function(widget, newParams) 
    storage.healing = newParams
    healingmacro.setOn(storage.healing.on)
  end)