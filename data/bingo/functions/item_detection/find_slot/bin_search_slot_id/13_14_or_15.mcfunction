execute if entity @s[scores={bingo_slot_id=..14}] run function bingo:item_detection/find_slot/bin_search_slot_id/13_or_14
execute if entity @s[scores={bingo_slot_id=15}] as @e[type=minecraft:area_effect_cloud, tag=bingo_current_team, limit=1] unless entity @s[tag=bingo_got_slot15] run function bingo:item_detection/find_slot/bin_search_slot_id/15