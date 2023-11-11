local keyminigame

RegisterNuiCallback('keyminigameExit', function(_, cb)
    SetNuiFocus(false, false)
    keyminigame:resolve({ quit = true, faults = 0 })
    keyminigame = nil
    cb('ok')
end)

RegisterNuiCallback('keyminigameFinish', function(data, cb)
    SetNuiFocus(false, false)
    keyminigame:resolve({ quit = false, faults = data.faults })
    keyminigame = nil
    cb('ok')
end)

local function KeyMinigame(amount)
    keyminigame = promise.new()
    SetNuiFocus(true, false)
    SendNUIMessage({
        action = 'startKeygame',
        amount = amount
    })
    return Citizen.Await(keyminigame)
end
exports('KeyMinigame', KeyMinigame)
