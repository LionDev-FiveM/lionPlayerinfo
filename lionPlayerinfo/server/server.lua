ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local function checkAdmin(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "admin" then
		return true
	end
	return false
end

RegisterServerEvent('zvPlayerinfo:sendWebhook')
AddEventHandler('zvPlayerinfo:sendWebhook', function(webhookUrl, message, playerName, playerIp)
	local name = GetPlayerName(source)
	local steam = GetPlayerIdentifier(source)
	local ip = GetPlayerEndpoint(source)
	local identifiers = ExtractIdentifiers(source)
	local license = identifiers.license
	local discord ="<@" ..identifiers.discord:gsub("discord:", "")..">" 
	if Config.WebhookToggle then
		connect = {
			{
				["color"] = Config.EmbedColor,
				["title"] = Config.Title,
				["description"] = "**•** " ..Config.Steam.. ": **" ..playerName.. "**\n**•** " ..Config.CommandUsed.. ": **/" ..Config.Command.. "**\n**•** " ..Config.Status.. ": **" ..Config.OnText.. "**\n\n Discord: **" ..discord.. "**\n " ..Config.PlayerIp.. ": **" ..playerIp.. "**\n " ..license.. "",
				["thumbnail"] = {
					["url"] = Config.ThumbnailImage,
				},
				["footer"] = {
					["text"] = Config.FooterText.. " | by Lion Development",
				}
			}
		}

		PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({username = Config.WebhookName, embeds = connect}), { ['Content-Type'] = 'application/json' })
	end
end)

RegisterServerEvent('zvPlayerinfo:sendWebhook2')
AddEventHandler('zvPlayerinfo:sendWebhook2', function(webhookUrl, message, playerName, playerIp)
	local name = GetPlayerName(source)
	local steam = GetPlayerIdentifier(source)
	local ip = GetPlayerEndpoint(source)
	local identifiers = ExtractIdentifiers(source)
	local license = identifiers.license
	local discord ="<@" ..identifiers.discord:gsub("discord:", "")..">" 
	if Config.WebhookToggle then
		connect = {
			{
				["color"] = Config.EmbedColor,
				["title"] = Config.Title,
				["description"] = "**•** " ..Config.Steam.. ": **" ..playerName.. "**\n **•** " ..Config.CommandUsed.. ": **/" ..Config.Command.. "**\n**•** " ..Config.Status.. ": **" ..Config.OffText.. "**\n\n Discord: **" ..discord.. "**\n " ..Config.PlayerIp.. ": **" ..playerIp.. "**\n " ..license.. "",
				["thumbnail"] = {
					["url"] = Config.ThumbnailImage,
				},
				["footer"] = {
					["text"] = Config.FooterText.. " | by Lion Development",
				}
			}
		}

		PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({username = Config.WebhookName, embeds = connect}), { ['Content-Type'] = 'application/json' })
	end
end)

RegisterServerEvent('getPlayerIP')
AddEventHandler('getPlayerIP', function(playerId)
    local playerIP = GetPlayerEndpoint(playerId)
    TriggerClientEvent('playerIP', source, playerIP)
end)

RegisterServerEvent('getPlayerIP2')
AddEventHandler('getPlayerIP2', function(playerId)
    local playerIP = GetPlayerEndpoint(playerId)
    TriggerClientEvent('playerIP2', source, playerIP)
end)

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local id = GetPlayerIdentifier(source, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end

-- function sendDiscordMessage(webhookUrl, message, playerName, playerIp)
-- 	if Config.WebhookToggle then
-- 		connect = {
-- 			{
-- 				["color"] = Config.EmbedColor,
-- 				["title"] = Config.Title,
-- 				["description"] = "**" ..Config.Steam.. ":** " ..playerName.. "\n **" ..Config.CommandUsed.. ":** /" ..Config.Command.. "\n\n **" ..Config.PlayerIp.. ":** " ..playerIp.. "",
-- 				["thumbnail"] = {
-- 					["url"] = Config.ThumbnailImage,
-- 				},
-- 				["footer"] = {
-- 					["text"] = Config.FooterText.. " | by ZV Coding",
-- 				}
-- 			}
-- 		}

-- 		PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({username = Config.WebhookName, embeds = connect}), { ['Content-Type'] = 'application/json' })
-- 	end
-- end

RegisterCommand(Config.Command, function(source, args, rawCommand)
	if source == 0 then
		return
	end
	
	if checkAdmin(source) then
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('togglePlayerInfo', source)
		-- sendDiscordMessage(Config.Webhook, 'test', GetPlayerName(source), GetPlayerEndpoint(source))
	else
		TriggerClientEvent('chat:addMessage', source, { args = { Config.ServerName.. ' ^0• ' ..Config.ErrorText }, color = { 156, 89, 182 } })
		-- TriggerClientEvent('okokNotify:Alert', source, "Server", Config.ErrorText, Config.notifyTimeout, 'warning')
	end
	
end, false)



Citizen.CreateThread(function()
    local vRaw = LoadResourceFile(GetCurrentResourceName(), 'version.json')
    if vRaw and Config.VersionCheck then
        local v = json.decode(vRaw)
        local url = 'https://raw.githubusercontent.com/LionDev-FiveM/lionPlayerinfo/main/lionPlayerinfo/version.json'
        PerformHttpRequest(url, function(code, res)
            if code == 200 then
                local rv = json.decode(res)
                if rv.version ~= v.version then
                    print(([[
 _      _               _____                 _                                  _   
| |    (_)             |  __ \               | |                                | |  
| |     _  ___  _ __   | |  | | _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_ 
| |    | |/ _ \| '_ \  | |  | |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
| |____| | (_) | | | | | |__| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_ 
|______|_|\___/|_| |_| |_____/ \___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|
                                                     | |                             
                                                     |_|                             
Script: lionPlayerinfo
UPDATE: %s AVAILABLE
CHANGELOG: %s
Download: https://github.com/LionDev-FiveM/lionPlayerinfo
If you need help, join our Discord: https://dsc.gg/lion-dev
]]):format(rv.version, rv.changelog))
                end
            else
                print('Error in versioncheck')
            end
        end, 'GET')
    end
end)