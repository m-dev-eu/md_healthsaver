RegisterNetEvent('md_healthsaver:load', function (health, armour)
    if GetInvokingResource() then return end
    local playerPed = PlayerPedId()
    local maxHealth = GetEntityMaxHealth(playerPed)
    if health > maxHealth then
        health = maxHealth
    end

    SetEntityHealth(playerPed, health)
    SetPedArmour(playerPed, armour)
end)