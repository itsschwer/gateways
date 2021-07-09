# Remove lore
#! Would also remove lore from other sources, not sure how to address.
data remove entity @s Item.tag.display.Lore

# Rename
data modify entity @s Item.tag.display.Name set value '{"text":"Gateway Essence"}'
execute if data entity @s {Item: {tag: {Placement: "Exact"}}} run data modify entity @s Item.tag.display.Name set value '{"text":"Gateway Extract"}'

# Remove custom tags
data remove entity @s Item.tag.Dimension
data remove entity @s Item.tag.X
data remove entity @s Item.tag.Y
data remove entity @s Item.tag.Z
data remove entity @s Item.tag.Placement

# Allow immediate pickup
data modify entity @s PickupDelay set value 0

# Play sound for feedback
playsound minecraft:block.amethyst_cluster.break master @a ~ ~ ~
