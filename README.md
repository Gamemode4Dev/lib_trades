# lib_trades

lib_trades is a mcfunction library that allows other datapacks to easily add trades to wandering traders. The main focus of this library was to make it easy to use but still powerful enough to provide a satisfying interface.

# Terminology
A trade inside a Villager is called a "trade option".
A virtual collection of trade options is called a "trade pool". For each Villager a random member of a trade pool is selected and shown in the trade interface.

## How to use
To utilize this library any implementing datapack must provide one or more function(s) in the function tag `#gm4_trades:register_trades`. These functions should summon an `armor_stand` with the following item layout:
- `HandItems[0]` || `weapon.mainhand`: Contents of the `sell` tag of the trade option.
- `HandItems[1]` || `weapon.offhand`: Contents of the `buy` tag of the trade option.
- `ArmorItems[0].tag.gm4_trades.options`: Trade option meta NBT, e.g. `maxUses`, `rewardXp`. All vanilla trade option meta tags are supported.
- `ArmorItems[3`] || `armor.head`: Contents of the `buyB` tag of the trade option.

These slots must not be filled explicitly in the summon command, and may therefore be populated by loot tables. The item contained in `ArmorItems[0]` has two special tags that are used to store trade option meta NBT:
- `ArmorItems[0].tag.gm4_trades.options` holds vanilla metadata, as explained above.
- `ArmorItems[0].tag.gm4_trades.pool` holds a string known as the trade option's "trade pool name". This should be a namespaced string, which identifies that multiple trade options that should be shown as one trade option on the wandering trader. Trade options with an omitted `pool` tag are considered to be in unnamed trade pools and are always displayed as their own, standalone trade option in the wandering trader.

## Technical Details
Any adapted implementations of this library should make sure that:
- For trade pools, ALL trades with a matching trade pool name should be collected and then one of the members should be drawn uniform-randomly to be displayed as a single trade option in the Villager//Wandering Trader.
- Trade options with omitted trade pool names should always be placed in their own standalone trade option.
- Not summoning an Armor Stand for a trade option should result in that trade option not appearring. 
