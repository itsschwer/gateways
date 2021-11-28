# gateways
[![Datapacks](https://img.shields.io/badge/See_more-datapacks-C7A978.svg)](https://github.com/itsschwer?tab=repositories&q=&type=&language=mcfunction&sort=)

A small datapack implementing the ability to place custom End Gateway blocks in any dimension for teleportation.

## Intention

This datapack aims to provide a balanced, survival-friendly way of placing custom End Gateway blocks that can be used to teleport large distances within the same dimension.

### Balancing
Each Gateway is one-way only, and requires that the player first travels to the desired location to capture the destination then travel to where they wish to place the Gateway.

Furthermore, each Gateway requires a Dragon's Breath and a Lodestone (which requires Netherite), meaning that creating custom Gateways is:
1. A late-game quality-of-life feature
2. Relatively expensive
    - An Ender Dragon needs to be spawned to obtain Dragon's Breath.
    - Nether mining needs to occur to obtain Netherite for Lodestones.
3. Non-renewable *(as per the non-renewable nature of Lodestones)*

Additionally, Gateways are dimension-locked, meaning that, for example, players can't abuse the Nether distance scaling to travel incredibly far by using Overworld positions for Nether Gateways.

## Guide
*This datapack was developed in 1.17 (`"pack_format": 7`) but should be compatible with versions using an equivalent or greater `pack_format`, barring major changes to commands/datapacks.*

1. Download:
    - [Repository as a `.zip`](https://github.com/itsschwer/gateways/archive/refs/heads/master.zip) *(Code > Download ZIP)*
    - [Release](https://github.com/itsschwer/gateways/releases) *(will need to unzip before installing into a save)*
2. Install into a save like any other datapack.
3. Open the advancement menu to the *Schwer* tab to view the intended hints.

## Mechanics

### Bottled Gateways

Dropping a Dragon's Breath named either *Gateway Essence* or *Gateway Extract* on any ground with an air block above it will convert it into a Bottled Gateway.

A Bottled Gateway will remember the coordinates it was dropped at and the dimension it was dropped in. This information can be viewed by hovering over the item when in an inventory. Additionally, the colour of a Bottled Gateway's name corresponds with the dimension it was created in.

Another bit of information remembered by Bottled Gateways is whether it was formed from a *Gateway Essence* or a *Gateway Extract*. This controls how the Gateway will teleport an entity travelling through it.
- A *Gateway Essence* will create a Gateway that uses the [default End Gateway teleportation logic](https://minecraft.fandom.com/wiki/End_gateway#Behavior), which searches for the highest full block starting from the north-west corner of an 11 by 11 vertical column centred on the Gateway to place entities *(north to south, west to east)*.
- A *Gateway Extract* will create a Gateway that positions entities that travel through it exactly to the set destination.

A Bottled Gateway can be reverted back into its previous form by disenchanting it *(through a Grindstone)* and dropping it from an inventory.

### Custom Gateways

Dropping a Bottled Gateway on top of a Lodestone in the same dimension the Bottled Gateway was created in will create a Gateway block, replacing the Lodestone.

This Gateway then functions like a regular End Gateway block, teleporting entities that enter it to the set destination.

A Gateway can be reverted back into a Lodestone by igniting a block of TNT directly above the Gateway *(the explosion will be nullified)*.

## Functions
*Split between 'Available' (i.e. fine to call using `/function`) and 'Internal' (not intended to be called by `/function`).*

*Ordered alphabetically.*

### Available

#### `clean`
- Resets scoreboard variables (`0`, `match`) for objective `sgw_score`
- Removes contents `Dimension`, `Placement`, `X`, `Y`, `Z`, `Thrower`, `Candidate` from storage `sgw_store`

Also run internally when a Bottled Gateway is created or consumed.

#### `clear`
Removes the presence of this datapack by:
- Clearing the scheduled `tick` function
- Running `clean`
- Removing the `sgw_score` scoreboard objective

All existing Gateways will remain and continue to be functional.
<br/>
All existing Bottled Gateways will remain but cease to be functional (until the datapack is reloaded).

### Internal
*Note: Bottled Gateways are defined by the existence of `Item.tag.Placement`.*

#### `bottle_gateway`
Handles the conversion of *Gateway Essences* and *Gateway Extracts* into Bottled Gateways.

Run from `tick` when a single (i.e. non-stacked) Dragon's Breath named either *Gateway Essence* or *Gateway Extract* lands on ground with an air block above it.

#### `grant_advancement`
Handles the logic for granting an advancement to the player who dropped the Bottled Gateway in creating a Gateway.

Run from `place_gateway`.

#### `load`
Sets up this datapack by adding the `sgw_score` scoreboard objective and starting the `tick` loop.

Called through Minecraft's *`load.json`*.

#### `place_gateway`
Handles the creation of Gateways, consuming a Bottled Gateway, and granting an advancement to the player responsible (if applicable).

Run from `tick` when a single (i.e. non-stacked) Bottled Gateway lands on a Lodestone in the same dimension it was created in.

#### `tick`
The main update loop. Handles the conversion of *Gateway Essences* and *Gateway Extracts* into Bottled Gateways, as well as the creation of custom Gateways.

Initialises from `load`.

#### `tnt_gateway`
Handles the reversion of Gateways to Lodestones when TNT is lit directly above a Gateway, consuming the TNT (no explosion).

Run from `tick` on lit TNT.

#### `unbottle_gateway`
Reverts dropped, disechanted Bottled Gateways back into *Gateway Essences* and *Gateway Extracts*.

This will remove all existing lore on the item, which may cause loss of such data.

Run from `tick` on any Bottled Gateway item entities.

## References
*(Roughly in personal use order)*
- [tradesteal](https://github.com/itsschwer/tradesteal)
    - *Used as a base. Also contains further, indirect references.*
- [Minecraft Wiki](https://minecraft.fandom.com/wiki/Minecraft_Wiki)
    - *Used as a reference for various NBT data and commands*
- [Papi's Potions](https://www.planetminecraft.com/data-pack/papi-s-potions/)
    - *Used as a reference for predicates and dynamic item lore*
- [MCStacker](https://mcstacker.net/)
    - *Used to get basic syntax for `/setblock` with sign text*
- [u/TinyBreadBigMouth — Compare NBT strings](https://old.reddit.com/r/MinecraftCommands/comments/a3kg1x/most_efficient_way_to_compare_strings_in_114/)
    - *Provided a method of conditionally executing commands depending on NBT comparison*
