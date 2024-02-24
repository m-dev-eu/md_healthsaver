Citizen.CreateThreadNow(function ()
    local success, _ = pcall(MySQL.scalar.await, 'SELECT saved_health FROM users;')
    if not success then
        MySQL.query.await("ALTER TABLE users ADD COLUMN saved_health LONGTEXT NOT NULL DEFAULT 'NaN';")
    end
end)

AddEventHandler(Config.logout, function (source)
    local playerId = source
    local playerIdentifier = Config.getIdentifier(playerId)
    if not playerIdentifier then return end

    local playerPed = GetPlayerPed(playerId)
    local health, armour = GetEntityHealth(playerPed), GetPedArmour(playerPed)
    MySQL.update.await('UPDATE users SET saved_health = ? WHERE identifier = ?', {
        json.encode({health = health, armour = armour}),
        playerIdentifier
    })
end)

AddEventHandler(Config.login, function (source)
    local playerId = source
    local playerIdentifier = Config.getIdentifier(playerId)
    if not playerIdentifier then return end

    local savedHealth = MySQL.scalar.await('SELECT saved_health FROM users WHERE identifier = ?', {playerIdentifier})
    if not savedHealth or savedHealth == 'NaN' then return end

    local playerPed = GetPlayerPed(playerId)
    savedHealth = json.decode(savedHealth)
end)