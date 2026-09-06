-- Repairs the display name of pre-localization KI5 vehicle keys without
-- modifying key IDs, ownership, custom names, or server inventory state.

local function migrateKey(item)
    if not item or item:getFullType() ~= "Base.CarKey" or item:isCustomName() then
        return
    end

    local oldName = item:getName()
    if not oldName then return end

    local translationKey = string.match(oldName, "(IGUI_VehicleName[%w%._%-]+)%s*$")
    if not translationKey then return end

    local vehicleName = getTextOrNull(translationKey)
    if not vehicleName or vehicleName == translationKey then return end

    item:setName(getText("IGUI_CarKey", vehicleName))
end

local function migrateContainer(container)
    if not container then return end
    local keys = container:getAllTypeRecurse("Base.CarKey")
    if not keys then return end
    for index = 0, keys:size() - 1 do
        migrateKey(keys:get(index))
    end
end

local function onCreatePlayer(playerIndex, player)
    if player then migrateContainer(player:getInventory()) end
end

local function onRefreshInventoryWindowContainers(page, state)
    if state ~= "buttonsAdded" or not page or not page.backpacks then return end
    for _, backpack in ipairs(page.backpacks) do
        migrateContainer(backpack.inventory)
    end
end

Events.OnCreatePlayer.Add(onCreatePlayer)
Events.OnRefreshInventoryWindowContainers.Add(onRefreshInventoryWindowContainers)
