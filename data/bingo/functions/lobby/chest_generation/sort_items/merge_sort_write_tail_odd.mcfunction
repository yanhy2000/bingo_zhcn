#> bingo:lobby/chest_generation/sort_items/merge_sort_write_tail_odd
#
# This function sorts the next 2 lists into the current output list
#
# @writes storage temp:bingo.chest_generation categories
# @within
# 	function bingo:lobby/chest_generation/sort_items/merge_sort_odd
# 	function bingo:lobby/chest_generation/sort_items/merge_sort_write_tail_odd

data modify storage temp:bingo.chest_generation mergeSort.odd[-1] append from storage temp:bingo.chest_generation mergeSort.even[-1][-1]
data remove storage temp:bingo.chest_generation mergeSort.even[-1][-1]

execute if data storage temp:bingo.chest_generation mergeSort.even[-1][0] run function bingo:lobby/chest_generation/sort_items/merge_sort_write_tail_odd