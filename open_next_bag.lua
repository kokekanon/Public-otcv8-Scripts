macro(500, "Open Next BP", function()
  local containers = getContainers()
  for i, container in pairs(containers) do
    if container:getItemsCount() == container:getCapacity() then
      local itemsContained = container:getItems()
      for i, item in ipairs(itemsContained) do
        if item.name == container:getName() then
          g_game.open(item, container)
          return
        end
      end
    end
  end
end)