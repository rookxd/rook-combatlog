
QBCore = exports['qb-core']:GetCoreObject()
local hasar = {}
local hasarlioyuncu = {}

RegisterNetEvent('hasar-yeduk')
AddEventHandler('hasar-yeduk', function()
    local src = source
    hasar[src] = true
end)


RegisterNetEvent('hasar-sil')
AddEventHandler('hasar-sil', function()
    local src = source
    if hasar[src] then
        hasar[src] = nil
    end
end)

RegisterNetEvent('hasar-kontrol')
AddEventHandler('hasar-kontrol', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
    local citizenid = Player.PlayerData.citizenid


    if hasarlioyuncu[citizenid] then
        TriggerClientEvent('hospital:client:RespawnAtHospital', Player.PlayerData.source)
        hasarlioyuncu[citizenid] = nil
    end
end
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    if hasar[src] then
        local identifier = ""
        identifier = GetPlayerIdentifier(source, 0)
        local xPlayer = QBCore.Functions.GetPlayer(source)
            local Player = QBCore.Functions.GetPlayer(source)
            local citizenid = Player.PlayerData.citizenid
            local discord = "Bilinmiyor"
                                for k, v in ipairs(GetPlayerIdentifiers(source)) do
                                    if string.match(v, "discord:") then
                                        discord = v
                                        break
                                    end
                                end
            embed = {{
                ["color"] = 373247,
        
                ["fields"] = {
                    [1] = {
                        ["name"] = "Quit Attu",
                        ["value"] = "",
                        ["inline"] = false
                    },
                    [2] = {
                        ["name"] = "Steam İsmi",
                        ["value"] = "".. GetPlayerName(source) .."",
                        ["inline"] = true
                    },
                    [3] = {
                        ["name"] = "Steam Hex",
                        ["value"] = "".. identifier .."",
                        ["inline"] = true
                    },
                    [4] = {
                        ["name"] = "Discord",
                        ["value"] = "<@"..discord:gsub('discord:', '') .. ">",
                        ["inline"] = true
                    },
                    [5] = {
                        ["name"] = "Citizen ID",
                        ["value"] = ""..citizenid,
                        ["inline"] = true
                    },
                    [6] = {
                        ["name"] = "Oyun İçi ID",
                        ["value"] = "".. source .."",
                        ["inline"] = true
                    },
                    [7] = {
                        ["name"] = "Ad Soyad",
                        ["value"] = "".. xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname,
                        ["inline"] = true
                    },
                },
                ["footer"] = {
                    ['text'] = "Hasar aldiktan sonra Quitledu" .." ".. os.date('%c').. "",
                }
            }}
            PerformHttpRequest(Config.Webhook, function() end, 'POST', json.encode({ username = 'ROOK LOGS', embeds = embed}), { ['Content-Type'] = 'application/json' })

        hasar[src] = nil
        hasarlioyuncu[citizenid] = true
    end
end)




