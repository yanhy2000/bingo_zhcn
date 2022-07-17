#> fetchr:game/start/init_teams/black
#
# Initializes the black team
#
# @within function fetchr:game/start/init_teams

data modify block ~ ~ ~ Text1 set value '[{"storage": "tmp.fetchr:game/start", "nbt": "backgroundTemplate[0]", "interpret": true, "color": "black"}, {"translate": "space.-21", "font": "space:default"}]'
data modify storage fetchr:card teams[{id: "fetchr:black"}].background set from block ~ ~ ~ Text1
data modify block ~ ~ ~ Text1 set value '[{"storage": "tmp.fetchr:game/start", "nbt": "backgroundTemplate[0]", "interpret": true, "color": "#8b8b8b"}, {"translate": "space.-21", "font": "space:default"}]'
data modify storage tmp.fetchr:game/start defaultBackground append from block ~ ~ ~ Text1

data remove storage tmp.fetchr:game/start backgroundTemplate[0]