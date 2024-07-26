local blipCoords = {
    vector3(-1492.89, -1299.64, 2.42), -- Beach near south side / Del Pero Pier
    vector3(-1919.31, -711.1, 6.03),   -- North Side Beach
    vector3(-564.78, 273.76, 83.02),   -- Tequi-La-La
    vector3(1778.76, 3272.6, 41.72),   -- Drag Strip Sandy Shores
    vector3(387.15, 3575.5, 33.32),    -- Secret Cool gamer room [Link: https://www.gta5-mods.com/maps/mlo-cyberqg-2023-add-on-sp-fivem]
    vector3(1989.29, 3047.68, 47.21),  -- Yellow Jack
    vector3(1135.15, 109.49, 80.72),   -- Casino Race Track
    vector3(-1265.69, -1533.61, 4.31), -- Boxing Ring - Beach [ I use brutal boxing so feel free to remove this coord as nothing will be there]
    vector3(-153.62, -2149.19, 16.71), -- Go Karting - Near Maze Bank Arena
    vector3(194.99, -933.56, 30.69),   -- Legion Square
    -- Add more coordinates as needed currently there is 10.
}

local currentBlipIndex = 1

local function updateBlipForAll()
    TriggerClientEvent('FIVEM-Hangout-Spot:updateBlip', -1, blipCoords[currentBlipIndex])
end

local function setNextBlip()
    currentBlipIndex = (currentBlipIndex % #blipCoords) + 1
    updateBlipForAll()
end

CreateThread(function()
    while true do
        Wait(900000) -- 15 minutes in milliseconds / time it takes to change to new spot
        setNextBlip()
    end
end)

RegisterServerEvent('FIVEM-Hangout-Spot:requestBlip')
AddEventHandler('FIVEM-Hangout-Spot:requestBlip', function()
    local src = source
    TriggerClientEvent('FIVEM-Hangout-Spot:updateBlip', src, blipCoords[currentBlipIndex])
end)
