fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'RexshackGaming : Canoe'

client_scripts {
	'client/client.lua',
}

server_scripts {
	'server/server.lua',
}

dependency 'qbr-core' -- https://github.com/qbcore-redm-framework/qbr-core

lua54 'yes'