fx_version 'cerulean'
game 'gta5'
lua54 'on'

author 'Lion Development'
description 'Playerinfo Script'
version '1.3'


client_scripts{
	'config.lua',
	'client/client.lua',
	'@es_extended/locale.lua',
}

server_scripts {
	'config.lua',
	'server/server.lua',
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
}

file 'version.json'

escrow_ignore {
	'config.lua',
	'client/client.lua',
	'server/server.lua',
}