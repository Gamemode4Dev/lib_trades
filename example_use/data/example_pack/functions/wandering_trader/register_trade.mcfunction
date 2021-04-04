# Adds trades to be added to wandering traders. The base randomly will select one trade from each trade pool to be added to a wandering trader.
# @s = a wandering trader
# at @s
# called via function tag #gm4_trades:register_trades

# a trade option with hardcoded buy, buyB, sell and options. The 'pool' tag is omitted, resulting in an unnamed pool. Therefore this trade will always be listed as its own option, and other packs can not add items to this trade pool.
# HandItems[0] is used for the item being sold (by the wandering trader), HandItems[1] for the item being bought (by the wandering trader) and ArmorItems[3] for the secondary buy item.
summon armor_stand ~ ~ ~ {Small:1b,Invulnerable:1b,Invisible:1b,Silent:1b,Tags:["gm4_trade_option"],NoGravity:1b,HandItems:[{id:"minecraft:grass_block",Count:1b},{id:"minecraft:emerald",Count:1b}],ArmorItems:[{id:"minecraft:paper",Count:1b,tag:{gm4_trades:{options:{maxUses:8,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}},{},{},{id:"minecraft:wheat_seeds",Count:1b}]}

# another hardcoded trade as in line 7, but this one only appears for traders in the end
execute if predicate example_pack:the_end run summon armor_stand ~ ~ ~ {Small:1b,Invulnerable:1b,Invisible:1b,Silent:1b,Tags:["gm4_trade_option"],NoGravity:1b,HandItems:[{id:"minecraft:end_stone",Count:1b},{id:"minecraft:emerald",Count:1b}],ArmorItems:[{id:"minecraft:paper",Count:1b,tag:{gm4_trades:{pool:"example_pack:foo_trades",options:{maxUses:8,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}},{},{},{}]}

# a trade in the trade pool "example_pack:foo_trades"
summon armor_stand ~ ~ ~ {Small:1b,Invulnerable:1b,Invisible:1b,Silent:1b,Tags:["gm4_trade_option"],NoGravity:1b,HandItems:[{id:"minecraft:spawner",Count:1b},{id:"minecraft:emerald",Count:64b}],ArmorItems:[{id:"minecraft:paper",Count:1b,tag:{gm4_trades:{pool:"example_pack:foo_trades",options:{maxUses:1,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}},{},{},{}]}

# a trade that uses a loot table for the sell and the buy option
summon armor_stand ~ ~ ~ {Small:1b,Invulnerable:1b,Invisible:1b,Silent:1b,Tags:["gm4_trade_option","gm4_new_trade_option"],NoGravity:1b,HandItems:[{},{}],ArmorItems:[{id:"minecraft:paper",Count:1b,tag:{gm4_trades:{options:{maxUses:24,rewardXp:0b}}}},{},{},{}]}
loot replace entity @e[type=minecraft:armor_stand,limit=1,tag=gm4_new_trade_option] weapon.mainhand loot example_pack:blocks
loot replace entity @e[type=minecraft:armor_stand,limit=1,tag=gm4_new_trade_option] weapon.offhand loot example_pack:shinies
tag @e[type=minecraft:armor_stand,distance=..2] remove gm4_new_trade_option

# another trade in the trade pool "example_pack:foo_trades"
summon armor_stand ~ ~ ~ {Small:1b,Invulnerable:1b,Invisible:1b,Silent:1b,Tags:["gm4_trade_option","gm4_new_trade_option"],NoGravity:1b,HandItems:[{},{}],ArmorItems:[{id:"minecraft:paper",Count:1b,tag:{gm4_trades:{pool:"example_pack:foo_trades",options:{maxUses:1,rewardXp:1b,xp:24,priceMultiplier:0.1f}}}},{},{},{id:"minecraft:rotten_flesh",Count:1b}]}
loot replace entity @e[type=minecraft:armor_stand,limit=1,tag=gm4_new_trade_option] weapon.mainhand loot example_pack:spawn_eggs
loot replace entity @e[type=minecraft:armor_stand,limit=1,tag=gm4_new_trade_option] weapon.offhand loot example_pack:shinies
tag @e[type=minecraft:armor_stand,distance=..2] remove gm4_new_trade_option

# a trade in the trade pool "example_pack:bar_trades"
summon armor_stand ~ ~ ~ {Small:1b,Invulnerable:1b,Invisible:1b,Silent:1b,Tags:["gm4_trade_option"],NoGravity:1b,HandItems:[{id:"minecraft:slime_block",Count:1b},{id:"minecraft:emerald",Count:1b}],ArmorItems:[{id:"minecraft:paper",Count:1b,tag:{gm4_trades:{pool:"example_pack:bar_trades",options:{maxUses:1,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}},{},{},{}]}

# a trade in the trade pool "example_pack:bar_trades", that uses one loot table to populate the entire trade
summon armor_stand ~ ~ ~ {Small:1b,Invulnerable:1b,Invisible:1b,Silent:1b,Tags:["gm4_trade_option","gm4_new_trade_option"],NoGravity:1b,HandItems:[{},{}],ArmorItems:[{id:"minecraft:paper",Count:1b,tag:{gm4_trades:{options:{maxUses:2,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}},{},{},{}]}
loot replace entity @e[type=minecraft:armor_stand,limit=1,tag=gm4_new_trade_option] weapon.mainhand loot example_pack:pickaxe_trade
tag @e[type=minecraft:armor_stand,distance=..2] remove gm4_new_trade_option
