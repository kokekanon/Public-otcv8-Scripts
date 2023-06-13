UI.Separator()
UI.Label("MANA")
if type(storage.healing) ~= "table" then
    storage.healing = {on=false, title="MANA", item=11862, min=50, max=50}
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
UI.Separator()
UI.Label("HP")
  if type(storage.healing) ~= "table" then
    storage.healing = {on=false, title="HP", item=11862, min=50, max=50}
  end
  local healingmacro2 = macro(200, function()
    local hppc2 = hppercent()
    local mppc2 = hppercent()
  
    if hppc2 <= storage.healing.min or mppc2 <= storage.healing.max then
      use(storage.healing.item)
    end
  end)
  healingmacro2.setOn(storage.healing.on)
  UI.DualScrollItemPanel(storage.healing, function(widget, newParams) 
    storage.healing = newParams
    healingmacro2.setOn(storage.healing.on)
  end)
UI.Separator()
