ESX = exports['es_extended']:getSharedObject()
-- don't touch code above

ESX.RegisterServerCallback("tsDiscordRichPresence:getServerPlayers", function(source, cb)
    local players = GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(source)
    local name    = xPlayer.getName()

    cb(#players, name)
end)