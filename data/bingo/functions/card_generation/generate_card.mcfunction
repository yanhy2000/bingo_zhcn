scoreboard players operation Seed bingo.stats = $seed random_main

data modify storage bingo:tmp categories set from storage bingo:items categories
data remove storage bingo:card_generation usedItems
data remove storage bingo:card_generation forbiddenItems
data remove storage bingo:card slots

scoreboard players set $i bingo.tmp 0
function bingo:card_generation/generate_slot