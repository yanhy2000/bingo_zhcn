#> bingo:game/start/generate_spawnpoint
#
# Moves players to the spawnpoint
#
# @internal

#>
# Spawnpoint x coordinate
# @within function bingo:game/start/**
#declare score_holder $game/start.spawnx
#>
# Spawnpoint z coordinate
# @within function bingo:game/start/**
#declare score_holder $game/start.spawnz
#>
# Tag used for the aec which is moved to the random spawn coordinates
# @private
#declare tag bingo.spawn_position

function random:next_int

tellraw @a {"score": {"objective": "random_main", "name": "$result"}}

# Spawn x: $result & 0xFFFF (signed)
scoreboard players operation $game/start.spawnx bingo.tmp = $result random_main
scoreboard players operation $game/start.spawnx bingo.tmp %= 65536 bingo.const
execute if score $game/start.spawnx bingo.tmp matches 32768.. run scoreboard players remove $game/start.spawnx bingo.tmp 65536

#Spawn z: $result >> 16
scoreboard players operation $game/start.spawnz bingo.tmp = $result random_main
scoreboard players operation $game/start.spawnz bingo.tmp /= 65536 bingo.const

execute in bingo:multi_noise run function bingo:game/start/move_x/0