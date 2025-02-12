
#>
# @private
#declare tag fetchr.new
#>
# @private
#declare tag fetchr.potion_applier

effect clear @s
clear @s

scoreboard players set $allow_fixed fetchr.tmp 1
scoreboard players set $first fetchr.tmp 14
function fetchr:lobby/player_settings/find_config

setblock 0 63 0 minecraft:shulker_box{Items:[{Slot:0b, id: "minecraft:barrier",  Count:1b}]}
execute if data storage fetchr:tmp playerConfigs[0].inventory[0] run function fetchr:lobby/player_settings/load/copy_inventory
setblock 0 63 0 minecraft:barrier

execute if data storage fetchr:tmp playerConfigs[0].effects[0] at @s run summon minecraft:potion ~ ~2.1 ~ {Tags:["fetchr.potion_applier", "fetchr.new"], Item:{id: "minecraft:splash_potion", Count: 1b, tag:{CustomPotionEffects: []}}}
data modify entity @e[type=minecraft:potion, tag=fetchr.potion_applier, tag=fetchr.potion_applier, limit=1] Item.tag.CustomPotionEffects set from storage fetchr:tmp playerConfigs[0].effects

tag @e[type=minecraft:potion, tag=fetchr.potion_applier, tag=fetchr.potion_applier, limit=1] remove fetchr.new