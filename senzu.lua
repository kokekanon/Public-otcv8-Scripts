UI.Separator()
UI.Label("health & Mana potions/runes")

-- Configuración inicial de los ítems de salud y maná
if type(storage.hpitem1) ~= "table" then
    storage.hpitem1 = {
        title = "HP%",
        item = 11862,
        min = 0,
        max = 90,
        on = false
    }
end

if type(storage.hpitem2) ~= "table" then
    storage.hpitem2 = {
        title = "HP%",
        item = 11862,
        min = 0,
        max = 50,
        on = false
    }
end

if type(storage.manaitem1) ~= "table" then
    storage.manaitem1 = {
        title = "MP%",
        item = 11862,
        min = 0,
        max = 90,
        on = false
    }
end

if type(storage.manaitem2) ~= "table" then
    storage.manaitem2 = {
        title = "MP%",
        item = 11862,
        min = 0,
        max = 50,
        on = false
    }
end

-- Configuración inicial del ítem de 'power'
if type(storage.powerItem) ~= "table" then
    storage.powerItem = {
        title = "Power Item",
        item = 1111,  -- Reemplaza con el identificador real del ítem.
        min =1,  -- Establece el valor mínimo de 'power' para usar el ítem.
        max = 100,  -- Establece el valor máximo de 'power' para usar el ítem.
        on = false
    }
end

-- Macro para el uso de pociones de salud, maná y el ítem de 'power'
for i, healingInfo in ipairs({
    storage.hpitem1,
    storage.hpitem2,
    storage.manaitem1,
    storage.manaitem2
}) do
    local healingmacro = macro(20, function ()
        local hp = i <= 2 and player:getHealthPercent() or math.min(100, math.floor(100 * player:getMana() / player:getMaxMana()))

        if hp <= healingInfo.max and healingInfo.min <= hp then
           use(healingInfo.item, player, subType)
        end
    end)

    healingmacro.setOn(healingInfo.on)
    UI.DualScrollItemPanel(healingInfo, function (widget, newParams)
        healingInfo = newParams
        healingmacro.setOn(healingInfo.on and healingInfo.item > 100)
    end)
end

-- Macro específico para el ítem de 'power'
local powerMacro = macro(20, function()
    local power = soul()  -- Reemplaza con el método correcto para obtener el 'power'.
print(power, storage.powerItem.max,storage.powerItem.min)

    if power <= storage.powerItem.max and storage.powerItem.on then

        use(storage.powerItem.item, player, subType)
    end
end)

powerMacro.setOn(storage.powerItem.on)

-- Interfaz de usuario para el ítem de 'power'
UI.DualScrollItemPanel(storage.powerItem, function(widget, newParams)
    storage.powerItem = newParams
    powerMacro.setOn(storage.powerItem.on and storage.powerItem.item > 100)
end)
