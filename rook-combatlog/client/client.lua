QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        Wait(1000)
        if HasPedBeenDamagedByWeapon(PlayerPedId(), 0, 2) then
            TriggerServerEvent('hasar-yeduk')
            Wait((1000 * 60) * 2)
            TriggerServerEvent('hasar-sil')
        end
    end
end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
TriggerServerEvent('hasar-kontrol')
end)