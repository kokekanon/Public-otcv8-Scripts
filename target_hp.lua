macro(500, "Target HP%", function()
  local target = g_game.getAttackingCreature()
  for i, spec in ipairs(getSpectators()) do
    if spec == target then
      spec:setText(spec:getHealthPercent().."%")
    else
      spec:clearText()
    end
  end
end)

macro(500, "Target MP%", function()
  local target = g_game.getAttackingCreature()
  for i, spec in ipairs(getSpectators()) do
    if spec == target then
      spec:setText(spec:getManaPercent().."%")
    else
      spec:clearText()
    end
  end
end)