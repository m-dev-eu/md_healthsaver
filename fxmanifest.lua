fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

author 'm-development.eu'
name 'Healthsaver'
description 'Saving Health and Armour to DB.'
license 'GNU General Public License v3.0'
version '0.0.0'

dependencies {
    'oxmysql'
}

client_script 'client.lua'

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}