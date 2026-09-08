-- Repairs upstream-generated display names on this client only.
-- Uses item:setName only; custom names, IDs and crafting metadata are preserved.
-- No explicit network synchronization or direct save-file writes.

local moldKinds = {
    ["damnCraft.genericMold"] = {" Plaster Mold", "IGUI_KI5CN_PlasterMold"},
    ["damnCraft.genericNegativeMold"] = {" Negative Mold", "IGUI_KI5CN_NegativeMold"},
    ["damnCraft.genericFilledMold"] = {" in Negative Filled Mold", "IGUI_KI5CN_FilledMold"},
}

local function isChinese()
    local language = Translator.getLanguage():name()
    return language == "CN" or language == "CH"
end

local function vehicleNameForAlias(oldName)
    local candidates = KI5CN_KeyNameAliases and KI5CN_KeyNameAliases[oldName]
    if not candidates then return nil end
    local name
    for _, key in ipairs(candidates) do
        local translated = getTextOrNull(key)
        -- Never choose arbitrarily between vehicles with the same English name.
        if not translated or translated == "" or translated == key or (name and name ~= translated) then
            return nil
        end
        name = translated
    end
    return name
end

local function migrateKey(item)
    if not item or item:getFullType() ~= "Base.CarKey" or item:isCustomName() then
        return
    end
    local oldName = item:getName()
    if not oldName then return end

    local translationKey = string.match(oldName, "(IGUI_VehicleName[%w%._%-]+)%s*$")
    local vehicleName
    local newName
    if translationKey then
        vehicleName = getTextOrNull(translationKey)
        if not vehicleName or vehicleName == translationKey then return end
        -- Preserve the original compatibility path for unresolved old translation keys.
        newName = getText("IGUI_CarKey", vehicleName)
    else
        vehicleName = vehicleNameForAlias(oldName)
        if not vehicleName then return end
        -- Use the current native B42.20 naming layout.
        newName = getItemName("Base.CarKey") .. " - " .. vehicleName
    end
    if newName ~= oldName then item:setName(newName) end
end

local function migrateMold(item, kind)
    if not item or item:isCustomName() then return end
    local oldName = item:getName()
    if not oldName or string.sub(oldName, -#kind[1]) ~= kind[1] then return end

    local md = item:hasModData() and item:getModData()
    local fullType = md and md.damnOriginalItemType
    local newName
    if item:getFullType() == "damnCraft.genericFilledMold"
            and oldName == "Failed mess in Negative Filled Mold" then
        newName = getText("IGUI_KI5CN_FailedFilledMold")
    elseif type(fullType) == "string" and fullType ~= "" then
        local originalName = getItemName(fullType)
        if not originalName or originalName == fullType then return end
        newName = getText(kind[2], originalName)
    end
    if newName and newName ~= oldName then item:setName(newName) end
end

local function migrateContainer(container)
    if not container then return end
    local keys = container:getAllTypeRecurse("Base.CarKey")
    if keys then
        for index = 0, keys:size() - 1 do migrateKey(keys:get(index)) end
    end
    for fullType, kind in pairs(moldKinds) do
        local items = container:getAllTypeRecurse(fullType)
        if items then
            for index = 0, items:size() - 1 do migrateMold(items:get(index), kind) end
        end
    end
end

local function onCreatePlayer(playerIndex, player)
    if isChinese() and player then migrateContainer(player:getInventory()) end
end

local function onRefreshInventoryWindowContainers(page, state)
    if state ~= "buttonsAdded" or not page or not page.backpacks or not isChinese() then return end
    local seen = {}
    for _, backpack in ipairs(page.backpacks) do
        local inventory = backpack.inventory
        if inventory and not seen[inventory] then
            seen[inventory] = true
            migrateContainer(inventory)
        end
    end
end

Events.OnCreatePlayer.Add(onCreatePlayer)
Events.OnRefreshInventoryWindowContainers.Add(onRefreshInventoryWindowContainers)
