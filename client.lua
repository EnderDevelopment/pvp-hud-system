local ESX = nil
local isInPvpZone = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for _, zone in ipairs(Config.PvpZones) do
            local distance = #(playerCoords - zone.coords)
            if distance <= zone.radius then
                isInPvpZone = true
                break
            else
                isInPvpZone = false
            end
        end

        if isInPvpZone then
            local health = GetEntityHealth(playerPed) - 100
            local armor = GetPedArmour(playerPed)

            DrawRect(Config.HudPosition.x, Config.HudPosition.y, Config.HudSize.width, Config.HudSize.height, Config.HudColor.r, Config.HudColor.g, Config.HudColor.b, Config.HudColor.a)
            DrawText(('Health: %s'):format(health), Config.HudPosition.x, Config.HudPosition.y - 0.02, 0.3, 0.3, 255, 255, 255, 255, 'center')
            DrawText(('Armor: %s'):format(armor), Config.HudPosition.x, Config.HudPosition.y + 0.02, 0.3, 0.3, 255, 255, 255, 255, 'center')
        end
    end
end)

function DrawText(text, x, y, width, height, r, g, b, a, align)
    SetTextFont(4)
    SetTextScale(width, height)
    SetTextColour(r, g, b, a)
    SetTextEntry('STRING')
    AddTextComponentString(text)
    SetTextCentre(true)
    DrawText(x, y)
end