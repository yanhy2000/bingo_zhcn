#> fetchr:item_detection/announce
#
# This function is called to announce the item get of the current item.
#
# It also announces reaching a goal, when applicable
#
# @within function fetchr:item_detection/check_and_announce

#>
# Storage that holds information about the currently selected slot
#
# @internal
#declare storage tmp.fetchr:item_detection

#>
# @private
#declare score_holder $item_detect/announce.has_bingo
#>
# @within
# 	function fetchr:item_detection/**
#declare score_holder $item_detect/announce.items

execute in fetchr:lobby run function neun_einser.timer:store_current_time
scoreboard players reset @s fetchr.has_item
tag @s add fetchr.clear

# Update item count
execute store result score $item_detect/announce.items fetchr.tmp run data get storage fetchr:card teams[-1].itemCount
scoreboard players add $item_detect/announce.items fetchr.tmp 1
execute store result storage fetchr:card teams[-1].itemCount int 1 run scoreboard players get $item_detect/announce.items fetchr.tmp

execute as @a[tag=fetchr.in_current_team] at @s run playsound minecraft:block.end_portal_frame.fill voice @s ~ ~ ~ 1 2
tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.got_item", "with": [{"score": {"name": "$item_detect/announce.items", "objective": "fetchr.tmp"}}, {"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@s"}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.item.textComponent", "interpret": true}]}]

execute store result score $item_detect/announce.has_bingo fetchr.tmp run data get storage fetchr:card teams[-1].hasBingo

# Update completed indicator
execute store result score $item_detect/announce.background_index fetchr.tmp run data get storage fetchr:card teams[-1].backgroundIndex
data modify storage tmp.fetchr:item_detection skippedBackgrounds set value []
function fetchr:item_detection/find_background
data modify storage tmp.fetchr:item_detection slot.background prepend from storage fetchr:card teams[-1].background
data modify storage tmp.fetchr:item_detection slot.background prepend from storage tmp.fetchr:item_detection skippedBackgrounds[]

execute in fetchr:lobby run setblock 0 0 0 minecraft:oak_sign{Text1:'["", {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[0]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[1]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[2]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[3]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[4]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[5]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[6]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[7]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[8]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[9]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[10]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[11]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[12]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[13]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[14]", "interpret": true}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[15]", "interpret": true}, {"translate": "space.2", "font": "space:default"}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.item.icon", "interpret": true}, {"translate": "space.2", "font": "space:default"}]'}
execute in fetchr:lobby run data modify storage tmp.fetchr:item_detection slot.display set from block 0 0 0 Text1
execute in fetchr:lobby run setblock 0 0 0 minecraft:barrier

# detect goals
execute if score $item_detect/announce.has_bingo fetchr.tmp matches 0 run function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo
execute if score $item_detect/announce.items fetchr.tmp matches 25 run function fetchr:item_detection/goals/announce_blackout

scoreboard players set $update_card fetchr.state 1