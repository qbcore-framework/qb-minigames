local wordGuess

local function CloseGame()
    SendNUIMessage({
        action = 'closeWordGuess',
    })
end

RegisterNUICallback('wordGuessedCorrectly', function(_, cb)
    TriggerEvent('QBCore:Notify', 'Guessed correctly!', 'success', 2500)
    SetNuiFocus(false, false)
    wordGuess:resolve(true)
    wordGuess = nil
    CloseGame()
    cb('ok')
end)

RegisterNUICallback('tooManyGuesses', function(_, cb)
    TriggerEvent('QBCore:Notify', 'Too many guesses!', 'error', 2500)
    SetNuiFocus(false, false)
    wordGuess:resolve(false)
    wordGuess = nil
    CloseGame()
    cb('ok')
end)

RegisterNUICallback('closeWordGuess', function(_, cb)
    SetNuiFocus(false, false)
    if wordGuess then
        wordGuess:resolve(false)
        wordGuess = nil
    end
    cb('ok')
end)

local function WordGuess(word, hint, guesses)
    wordGuess = promise.new()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'wordGuess',
        word = word,
        hint = hint,
        maxGuesses = guesses
    })
    return Citizen.Await(wordGuess)
end
exports('WordGuess', WordGuess)
