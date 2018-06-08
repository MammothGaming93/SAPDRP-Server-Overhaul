--[[ R P   C O M M A N D S ]]--

-----------------------------------/ R A D I O \---------------------------------
AddEventHandler('chatMessage', function(source, name, msg)
  sm = stringsplit(msg, " ");
  if sm[1] == "/r" and enable_roleplay_commands == true then
    CancelEvent()
    TriggerClientEvent('chatMessage', -1,name .. " ^5<-<^7Radio^5>->", { 255, 255, 255 }, string.sub(msg,4))
  end
end)

--------------------/ R P   N A M E \------------------------------
AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/id" and enable_roleplay_commands == true then
		CancelEvent()
		if sm[2] == nil then
			TriggerClientEvent('chatMessage', -1, "/Id <Name_Surname/Name>", { 255, 255, 255 })
		else
		rpname = string.gsub(sm[2], "_", " ")
		rpmsg = string.sub(msg, #sm[1] + 1 + #sm[2] + 2, #msg)
		TriggerClientEvent('chatMessage', -1, "^5<-<^7SERVER^5>->^7: ID= ".. rpname .. " " .. rpmsg, { 255, 255, 255 })
		end
	end
end)


RegisterServerEvent('chatEvent')
AddEventHandler('chatEvent', function(string)
  TriggerClientEvent('chatMessage', -1, string)
end)

AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/p" and enable_police_commands == true then
		CancelEvent()
		--------------
		TriggerClientEvent('PanicLocation', s)
	end
end)


-- STRING SPLIT FUNCTION
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end