setblock ~ ~-1 ~ end_gateway

data modify block ~ ~-1 ~ ExitPortal.X set from entity @s Item.tag.X
data modify block ~ ~-1 ~ ExitPortal.Y set from entity @s Item.tag.Y
data modify block ~ ~-1 ~ ExitPortal.Z set from entity @s Item.tag.Z

execute if data entity @s {Item: {tag: {Placement: "Exact"}}} run data modify block ~ ~-1 ~ ExactTeleport set value 1b

playsound minecraft:item.bottle.fill_dragonbreath master @a ~ ~ ~
playsound minecraft:block.respawn_anchor.set_spawn master @a ~ ~ ~
playsound minecraft:block.beacon.activate master @a ~ ~ ~

advancement grant @p[distance=..8] only gateways:create

kill @s[type=item]
