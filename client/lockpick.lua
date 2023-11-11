local lockpick

RegisterNuiCallback('lockpickExit', function(_, cb)
    if not lockpick then return cb('ok') end
    SetNuiFocus(false, false)
    lockpick:resolve(false)
    lockpick = nil
    cb('ok')
end)

RegisterNuiCallback('lockpickFinish', function(data, cb)
    if not lockpick then return cb('ok') end
    SetNuiFocus(false, false)
    lockpick:resolve(data.success)
    lockpick = nil
    cb('ok')
end)

local function Lockpick(pins)
    lockpick = promise.new()
    SetNuiFocus(true, true)
    SetCursorLocation(0.5, 0.5)
    SendNUIMessage({
        action = 'startLockpick',
        pins = pins
    })
    return Citizen.Await(lockpick)
end
exports('Lockpick', Lockpick)

RegisterCommand('lockpick', function()
    local success = Lockpick(5)
    print('Lockpick success:', success)
end, false)
