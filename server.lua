local QBCore = exports['qb-core']:GetCoreObject()

-- Event handler for dropping off items
RegisterNetEvent('t3_dropoff:dropoffItems')
AddEventHandler('t3_dropoff:dropoffItems', function(items, locationIndex)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasAllItems = true
    local dropOffLocation = Config.DropOffLocations[locationIndex]

    for _, item in ipairs(items) do
        local playerItem = Player.Functions.GetItemByName(item.name)
        if playerItem == nil or playerItem.amount < item.qty then
            hasAllItems = false
            break
        end
    end

    if hasAllItems then
        for _, item in ipairs(items) do
            Player.Functions.RemoveItem(item.name, item.qty)
        end
        if dropOffLocation.rewardType == "item" then
            Player.Functions.AddItem(dropOffLocation.rewardItem, dropOffLocation.rewardAmount)
        elseif dropOffLocation.rewardType == "cash" then
            Player.Functions.AddMoney('cash', dropOffLocation.rewardAmount)
        end
        TriggerClientEvent('QBCore:Notify', src, "Cargo delivered successfully!")
    else
        TriggerClientEvent('QBCore:Notify', src, "You do not have all the required items!", "error")
    end
end)
