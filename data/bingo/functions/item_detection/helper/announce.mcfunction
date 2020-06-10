execute in minecraft:overworld run function timer:store_current_time

tellraw @a {"translate": "bingo.got_item", "with": [{"storage": "timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@s"}, {"storage": "bingo:card", "nbt": "slots[{selected: true}].item.textComponent", "interpret": true}]}

data modify storage bingo:tmp slots append from storage bingo:tmp previousSlots[]
data modify storage bingo:card teams[{selected: true}].slots set from storage bingo:tmp slots

execute store result score $has_bingo bingo_tmp run data get storage bingo:card teams[{selected: true}].hasBingo
execute store result score $items bingo_tmp run data get storage bingo:card teams[{selected: true}].itemCount
scoreboard players add $items bingo_tmp 1
execute store result storage bingo:card teams[{selected: true}].itemCount int 1 run scoreboard players get $items bingo_tmp

execute if score $has_bingo bingo_tmp matches 0 run function bingo:item_detection/helper/goals/detect_bingo
execute if score $items bingo_tmp matches 25 run tellraw @a {"translate": "bingo.got_blackout", "with": [{"storage": "timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo_in_current_team]"}]}