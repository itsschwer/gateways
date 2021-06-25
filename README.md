# gateways

A small datapack implementing the ability to place custom End Gateway blocks in any dimension for teleportation.

## Intention

This datapack aims to provide a balanced, survival-friendly way of placing custom End Gateway blocks that can be used to teleport large distances within the same dimension.

### Balancing
Each Gateway is one-way only, and requires that the player first travels to the desired location to capture the destination then travel to where they wish to place the Gateway.

Furthermore, custom Gateway requires a Dragon's Breath and a Lodestone (which require Netherite), meaning that creating a custom Gateway is:
1. A late-game quality-of-life feature
2. Relatively expensive
    - An Ender Dragon needs to be spawned to obtain Dragon's Breath.
    - Nether mining needs to occur to obtain Netherite for Lodestones.
3. Non-renewable *(as per the non-renewable nature of Lodestones)*

Additionally, Gateways are dimension-locked, meaning that, for example, players can't abuse the Nether distance scaling to travel incredibly far by using Overworld positions for Nether Gateways.

## Guide
*This datapack was developed in 1.17 (`"pack_format": 7`) but should be compatible with versions using an equivalent or greater `pack_format`, barring major changes to commands/datapacks.*

1. Download:
    - [Repository as a `.zip`](https://github.com/itsschwer/tradesteal/archive/refs/heads/master.zip) *(Code > Download ZIP)*
    - [Release](https://github.com/itsschwer/tradesteal/releases) *(will need to unzip before installing into a save)*
2. Install into a save like any other datapack.
3. Open the advancement menu to the *Schwer* tab to view the intended hints.

## Mechanics
TBA

## Functions
TBA

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
