Config = {
    logout = 'esx:playerDropped',
    login = 'esx:playerLoaded',
    getIdentifier = function (playerId)
        if not IsDuplicityVersion() then return end

        local ESX = exports['es_extended']:getSharedObject()
        local xPlayer = ESX.GetPlayerFromId(playerId)
        return xPlayer?.getIdentifier()
    end
}