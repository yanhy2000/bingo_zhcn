#> bingo:custom_hud/tick
#
# Displays the bingo card for @s
#
# @within bingo:tick/tick
# @context entity Player for displaying the card
# @reads score @s bingo.card_pos

#>
# The y coordinate of the current player
#
# @private
#declare score_holder $custom_hud/display_card.y

#>
# @within function bingo:custom_hud/**
#declare storage temp:bingo.custom_hud

function bingo:util/find_player_team

scoreboard players enable @s bingo.card_pos

# text
data modify storage bingo:tmp y set value '{"score": {"name": "$custom_hud/display_card.y", "objective": "bingo.tmp"}}'
execute if entity @s[tag=bingo.emerald] run data modify storage bingo:tmp y set value '{"score": {"name": "$custom_hud/display_card.y", "objective": "bingo.tmp"}, "color": "green"}'

#data modify storage bingo:tmp ySpaces set value [""]

#Characters are \uF826. Has to be literal character in this case. Space width 6.
#execute if score $custom_hud/display_card.y bingo.tmp matches 0..99 run data modify storage bingo:tmp ySpaces append value ""
#execute if score $custom_hud/display_card.y bingo.tmp matches 0..9 run data modify storage bingo:tmp ySpaces append value ""
#execute if score $custom_hud/display_card.y bingo.tmp matches -9..-1 run data modify storage bingo:tmp ySpaces append value ""

function #bingo:tick_hud_components

execute if score $seed bingo.state matches -2147483648.. run function bingo:custom_hud/display_card

title @s actionbar [{"translate":"space.-90","font":"space:default"},{"storage":"bingo:custom_hud","nbt":"components[0].textComponent","interpret":true,"color":"black","font":"bingo:line5_shadow"},{"storage":"bingo:custom_hud","nbt":"components[0].iconSeperatorAlignLeft","interpret":true,"color":"black","font":"bingo:line5_shadow"},{"storage":"bingo:custom_hud","nbt":"components[0].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[0].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[6].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[6].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[6].iconSeperatorAlignRight","interpret":true,"color":"black","font":"bingo:line5_shadow"},{"storage":"bingo:custom_hud","nbt":"components[6].textComponent","interpret":true,"color":"black","font":"bingo:line5_shadow"},{"translate":"space.-183"},{"storage":"bingo:custom_hud","nbt":"components[0].textComponent","interpret":true,"font":"bingo:line5"},{"storage":"bingo:custom_hud","nbt":"components[0].iconSeperatorAlignLeft","interpret":true,"font":"bingo:line5"},{"storage":"bingo:custom_hud","nbt":"components[0].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[0].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[0].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[6].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[6].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[6].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[6].iconSeperatorAlignRight","interpret":true,"font":"bingo:line5"},{"storage":"bingo:custom_hud","nbt":"components[6].textComponent","interpret":true,"font":"bingo:line5"},{"translate":"space.-181"},{"storage":"bingo:custom_hud","nbt":"components[1].textComponent","interpret":true,"color":"black","font":"bingo:line6_shadow"},{"storage":"bingo:custom_hud","nbt":"components[1].iconSeperatorAlignLeft","interpret":true,"color":"black","font":"bingo:line6_shadow"},{"storage":"bingo:custom_hud","nbt":"components[1].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[1].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[7].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[7].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[7].iconSeperatorAlignRight","interpret":true,"color":"black","font":"bingo:line6_shadow"},{"storage":"bingo:custom_hud","nbt":"components[7].textComponent","interpret":true,"color":"black","font":"bingo:line6_shadow"},{"translate":"space.-183"},{"storage":"bingo:custom_hud","nbt":"components[1].textComponent","interpret":true,"font":"bingo:line6"},{"storage":"bingo:custom_hud","nbt":"components[1].iconSeperatorAlignLeft","interpret":true,"font":"bingo:line6"},{"storage":"bingo:custom_hud","nbt":"components[1].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[1].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[1].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[7].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[7].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[7].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[7].iconSeperatorAlignRight","interpret":true,"font":"bingo:line6"},{"storage":"bingo:custom_hud","nbt":"components[7].textComponent","interpret":true,"font":"bingo:line6"},{"translate":"space.-181"},{"storage":"bingo:custom_hud","nbt":"components[2].textComponent","interpret":true,"color":"black","font":"bingo:line7_shadow"},{"storage":"bingo:custom_hud","nbt":"components[2].iconSeperatorAlignLeft","interpret":true,"color":"black","font":"bingo:line7_shadow"},{"storage":"bingo:custom_hud","nbt":"components[2].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[2].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[8].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[8].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[8].iconSeperatorAlignRight","interpret":true,"color":"black","font":"bingo:line7_shadow"},{"storage":"bingo:custom_hud","nbt":"components[8].textComponent","interpret":true,"color":"black","font":"bingo:line7_shadow"},{"translate":"space.-183"},{"storage":"bingo:custom_hud","nbt":"components[2].textComponent","interpret":true,"font":"bingo:line7"},{"storage":"bingo:custom_hud","nbt":"components[2].iconSeperatorAlignLeft","interpret":true,"font":"bingo:line7"},{"storage":"bingo:custom_hud","nbt":"components[2].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[2].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[2].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[8].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[8].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[8].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[8].iconSeperatorAlignRight","interpret":true,"font":"bingo:line7"},{"storage":"bingo:custom_hud","nbt":"components[8].textComponent","interpret":true,"font":"bingo:line7"},{"translate":"space.-181"},{"storage":"bingo:custom_hud","nbt":"components[3].textComponent","interpret":true,"color":"black","font":"bingo:line8_shadow"},{"storage":"bingo:custom_hud","nbt":"components[3].iconSeperatorAlignLeft","interpret":true,"color":"black","font":"bingo:line8_shadow"},{"storage":"bingo:custom_hud","nbt":"components[3].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[3].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[9].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[9].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[9].iconSeperatorAlignRight","interpret":true,"color":"black","font":"bingo:line8_shadow"},{"storage":"bingo:custom_hud","nbt":"components[9].textComponent","interpret":true,"color":"black","font":"bingo:line8_shadow"},{"translate":"space.-183"},{"storage":"bingo:custom_hud","nbt":"components[3].textComponent","interpret":true,"font":"bingo:line8"},{"storage":"bingo:custom_hud","nbt":"components[3].iconSeperatorAlignLeft","interpret":true,"font":"bingo:line8"},{"storage":"bingo:custom_hud","nbt":"components[3].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[3].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[3].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[9].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[9].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[9].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[9].iconSeperatorAlignRight","interpret":true,"font":"bingo:line8"},{"storage":"bingo:custom_hud","nbt":"components[9].textComponent","interpret":true,"font":"bingo:line8"},{"translate":"space.-181"},{"storage":"bingo:custom_hud","nbt":"components[4].textComponent","interpret":true,"color":"black","font":"bingo:line9_shadow"},{"storage":"bingo:custom_hud","nbt":"components[4].iconSeperatorAlignLeft","interpret":true,"color":"black","font":"bingo:line9_shadow"},{"storage":"bingo:custom_hud","nbt":"components[4].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[4].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[10].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[10].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[10].iconSeperatorAlignRight","interpret":true,"color":"black","font":"bingo:line9_shadow"},{"storage":"bingo:custom_hud","nbt":"components[10].textComponent","interpret":true,"color":"black","font":"bingo:line9_shadow"},{"translate":"space.-183"},{"storage":"bingo:custom_hud","nbt":"components[4].textComponent","interpret":true,"font":"bingo:line9"},{"storage":"bingo:custom_hud","nbt":"components[4].iconSeperatorAlignLeft","interpret":true,"font":"bingo:line9"},{"storage":"bingo:custom_hud","nbt":"components[4].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[4].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[4].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[10].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[10].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[10].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[10].iconSeperatorAlignRight","interpret":true,"font":"bingo:line9"},{"storage":"bingo:custom_hud","nbt":"components[10].textComponent","interpret":true,"font":"bingo:line9"},{"translate":"space.-181"},{"storage":"bingo:custom_hud","nbt":"components[5].textComponent","interpret":true,"color":"black","font":"bingo:line10_shadow"},{"storage":"bingo:custom_hud","nbt":"components[5].iconSeperatorAlignLeft","interpret":true,"color":"black","font":"bingo:line10_shadow"},{"storage":"bingo:custom_hud","nbt":"components[5].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[5].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[11].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[11].iconWidth","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[11].iconSeperatorAlignRight","interpret":true,"color":"black","font":"bingo:line10_shadow"},{"storage":"bingo:custom_hud","nbt":"components[11].textComponent","interpret":true,"color":"black","font":"bingo:line10_shadow"},{"translate":"space.-183"},{"storage":"bingo:custom_hud","nbt":"components[5].textComponent","interpret":true,"font":"bingo:line10"},{"storage":"bingo:custom_hud","nbt":"components[5].iconSeperatorAlignLeft","interpret":true,"font":"bingo:line10"},{"storage":"bingo:custom_hud","nbt":"components[5].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[5].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[5].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[11].padding","interpret":true},{"storage":"bingo:custom_hud","nbt":"components[11].iconFont","interpret":true,"extra":[{"storage":"bingo:custom_hud","nbt":"components[11].icon","interpret":true}]},{"storage":"bingo:custom_hud","nbt":"components[11].iconSeperatorAlignRight","interpret":true,"font":"bingo:line10"},{"storage":"bingo:custom_hud","nbt":"components[11].textComponent","interpret":true,"font":"bingo:line10"},{"translate":"space.-91"},{"storage":"bingo:tmp","nbt":"card","interpret":true}]