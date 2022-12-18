ESX = exports['es_extended']:getSharedObject()
-- don't touch code above

CreateThread(function()
    while true do
        local ID = GetPlayerServerId(PlayerPedId()) -- Get ID from Player
        local maxPlayers = GetConvarInt('sv_maxclients', Config.MaxPlayers) -- If console variable (sv_maxclients) is set else it will take the maximum amount of players in the config.lua (Config.MaxPlayers)

        ESX.TriggerServerCallback("tsDiscordRichPresence:getServerPlayers", function(playerCount, playername)
            SetDiscordAppId(Config.AppID)
            SetDiscordRichPresenceAsset(Config.Image)
            SetDiscordRichPresenceAssetText('ExampleServer')
            SetDiscordRichPresenceAssetSmall(Config.SmallImage)
            SetDiscordRichPresenceAssetSmallText('ExampleServer')

            SetRichPresence(playerCount .. "/" .. maxPlayers .. " - ID: " .. ID .. " | Name: " .. playername)

            SetDiscordRichPresenceAction(0, "Join Discord", "Your Discord Link")
            SetDiscordRichPresenceAction(1, "Join FiveM Server", "fivem://connect/your-server-ip")
        end)
        Wait(Config.RefreshTime)
    end
end)
