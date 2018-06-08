RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
		TriggerClientEvent('chatMessage', -1, "<-OOC-> " .. author,  { 255, 255, 255  
	}, message)
		end

    print(author .. ' : ' .. message)
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
    end

    CancelEvent()
end)

-- player join messages
AddEventHandler('playerConnecting', function()
    TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^5<-<' .. GetPlayerName(source) .. ' ^5| ^7Joined ^5>->')
end)

AddEventHandler('playerDropped', function(reason)
    TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^5<-<' .. GetPlayerName(source) ..' ^8| ^7' .. reason .. ' ^5>->')
end)

RegisterCommand('say', function(source, args, rawCommand)
    TriggerClientEvent('chatMessage', -1, (source == 0) and '^5<-<^7SERVER^5>->' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
end)