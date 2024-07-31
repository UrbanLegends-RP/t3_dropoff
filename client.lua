local QBCore = exports['qb-core']:GetCoreObject()

-- Function to create target zones for drop-off locations
function createDropOffTargets()
    for i, location in ipairs(Config.DropOffLocations) do
        exports['qb-target']:AddBoxZone("dropoff_" .. i, location.coords, 2.0, 2.0, {
            name = "dropoff_" .. i,
            heading = 0,
            debugPoly = false,
            minZ = location.coords.z - 1,
            maxZ = location.coords.z + 1,
        }, {
            options = {
                {
                    type = "client",
                    event = "t3_dropoff:openMenu",
                    icon = "fas fa-box",
                    label = location.label,
                    items = location.items,
                    locationIndex = i,
                }
            },
            distance = 2.0
        })
    end
end

-- Event handler for opening the drop-off menu
RegisterNetEvent('t3_dropoff:openMenu')
AddEventHandler('t3_dropoff:openMenu', function(data)
    local dropOffLocation = Config.DropOffLocations[data.locationIndex]

    local menuItems = {}
    local requiredItemsText = "Required Items: "
    for _, item in ipairs(dropOffLocation.items) do
        requiredItemsText = requiredItemsText .. item.name .. " x" .. item.qty .. ", "
    end
    requiredItemsText = requiredItemsText:sub(1, -3)  -- Remove trailing comma and space

    table.insert(menuItems, {
        header = dropOffLocation.label,
        txt = requiredItemsText,
        isMenuHeader = true
    })

    table.insert(menuItems, {
        header = "Deliver Cargo",
        txt = requiredItemsText,
        params = {
            event = "t3_dropoff:attemptDropOff",
            args = {
                items = dropOffLocation.items,
                locationIndex = data.locationIndex,
            }
        }
    })

    table.insert(menuItems, {
        header = "Close",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    })

    exports['qb-menu']:openMenu(menuItems)
end)

-- Event handler to attempt item drop-off
RegisterNetEvent('t3_dropoff:attemptDropOff')
AddEventHandler('t3_dropoff:attemptDropOff', function(data)
    TriggerServerEvent('t3_dropoff:dropoffItems', data.items, data.locationIndex)
end)

-- Create target zones on script start
createDropOffTargets()
