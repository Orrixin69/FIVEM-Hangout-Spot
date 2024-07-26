local currentBlip
local currentZone
local zoneRadius = 90.0  -- Radius of the zone
local zoneColor = 26     -- Color of the zone blip

RegisterNetEvent('rotational-hangout:updateBlip')
AddEventHandler('rotational-hangout:updateBlip', function(coords)
    -- Remove existing blips if they exist
    if currentBlip then
        RemoveBlip(currentBlip)
    end
    if currentZone then
        RemoveBlip(currentZone)
    end

    -- Create the blip for the hangout spot
    currentBlip = AddBlipForCoord(coords)
    SetBlipSprite(currentBlip, 268) -- Set blip sprite
    SetBlipDisplay(currentBlip, 4)
    SetBlipScale(currentBlip, 0.9) -- Scale of the blip
    SetBlipColour(currentBlip, 46)  -- Color of the blip
    SetBlipAsShortRange(currentBlip, true) -- Show blip only when close
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Hangout Spot") -- Name displayed on the blip
    EndTextCommandSetBlipName(currentBlip)

    -- Create the zone blip around the hangout spot
    currentZone = AddBlipForRadius(coords, zoneRadius)
    SetBlipHighDetail(currentZone, true)
    SetBlipColour(currentZone, zoneColor)
    SetBlipAlpha(currentZone, 128)  -- Transparency of the zone blip
end)

AddEventHandler('onClientMapStart', function()
    TriggerServerEvent('rotational-hangout:requestBlip')
end)