execute store success score $success bingo_tmp run data modify storage bingo:tmp icon set from storage bingo:tmp slots[6]
execute if score $success bingo_tmp matches 0 run function bingo:item_detection/helper/goals/bingo/row/2/3