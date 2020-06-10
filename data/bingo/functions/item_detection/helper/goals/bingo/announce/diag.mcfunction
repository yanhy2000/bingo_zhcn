execute if score $diag bingo_tmp matches 1 run tellraw @a {"translate":"bingo.got_bingo.diag.top_left", "with": [{"storage": "timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo_in_current_team]"}]}
execute if score $diag bingo_tmp matches 2 run tellraw @a {"translate":"bingo.got_bingo.diag.bottom_left", "with": [{"storage": "timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo_in_current_team]"}]}
execute if score $diag bingo_tmp matches 3 run tellraw @a {"translate":"bingo.got_bingo.double.diags", "with": [{"storage": "timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo_in_current_team]"}]}

data modify storage bingo:card teams[{selected: true}].hasBingo set value true