# Store data into storage (use storage rather than directly to item in order to access from sign)
# @p can reach across dimensions, but is intended to be overwritten unless in a custom dimension (experimental)
data modify storage schwer:sgw_store Dimension set from entity @p Dimension
execute as @s[predicate=gateways:in_overworld] run data modify storage schwer:sgw_store Dimension set value "minecraft:overworld"
execute as @s[predicate=gateways:in_the_nether] run data modify storage schwer:sgw_store Dimension set value "minecraft:the_nether"
execute as @s[predicate=gateways:in_the_end] run data modify storage schwer:sgw_store Dimension set value "minecraft:the_end"
data modify storage schwer:sgw_store Placement set value "Default"
execute if data entity @s {Item: {tag: {display: {Name: '{"text":"Exact Gateway Essence"}'}}}} run data modify storage schwer:sgw_store Placement set value "Exact"
execute store result storage schwer:sgw_store X int 1 run data get entity @s Pos[0]
execute store result storage schwer:sgw_store Y int 1 run data get entity @s Pos[1]
execute store result storage schwer:sgw_store Z int 1 run data get entity @s Pos[2]

# Store data into item
data modify entity @s Item.tag.Dimension set from storage schwer:sgw_store Dimension
data modify entity @s Item.tag.Placement set from storage schwer:sgw_store Placement
data modify entity @s Item.tag.X set from storage schwer:sgw_store X
data modify entity @s Item.tag.Y set from storage schwer:sgw_store Y
data modify entity @s Item.tag.Z set from storage schwer:sgw_store Z

# Need to use a sign for dynamic lore
setblock ~ ~ ~ oak_sign{Text1:'[{"text":"Dimension: ","color":"gray","italic":false}, {"nbt":"Dimension","storage":"schwer:sgw_store","color":"gray","italic":false}]', Text2:'[{"text":"Destination: ","color":"gray","italic":false}, {"nbt":"X","storage":"schwer:sgw_store","color":"gray","italic":false}, {"text":" / ","color":"gray","italic":false}, {"nbt":"Y","storage":"schwer:sgw_store","color":"gray","italic":false}, {"text":" / ","color":"gray","italic":false}, {"nbt":"Z","storage":"schwer:sgw_store","color":"gray","italic":false}]', Text3:'[{"text":"Placement: ","color":"gray","italic":false}, {"nbt":"Placement","storage":"schwer:sgw_store","color":"gray","italic":false}]'}

# Append lore for Dimension, Destination, and Placement
data modify entity @s Item.tag.display.Lore append from block ~ ~ ~ Text1
data modify entity @s Item.tag.display.Lore append from block ~ ~ ~ Text2
data modify entity @s Item.tag.display.Lore append from block ~ ~ ~ Text3

# Remove dynamic lore sign
setblock ~ ~ ~ air

# Change name and color based on dimension
data modify entity @s Item.tag.display.Name set value '{"text":"Bottled Gateway","color":"#C77AFF","italic":false}'
execute if data entity @s {Item: {tag: {Dimension: "minecraft:overworld"}}} run data modify entity @s Item.tag.display.Name set value '{"text":"Bottled Gateway","color":"green","italic":false}'
execute if data entity @s {Item: {tag: {Dimension: "minecraft:the_nether"}}} run data modify entity @s Item.tag.display.Name set value '{"text":"Bottled Gateway","color":"red","italic":false}'
execute if data entity @s {Item: {tag: {Dimension: "minecraft:the_end"}}} run data modify entity @s Item.tag.display.Name set value '{"text":"Bottled Gateway","color":"dark_purple","italic":false}'

# Add enchantment glint
data modify entity @s Item.tag.Enchantments append value {}

# Play sound for feedback
playsound minecraft:block.amethyst_cluster.place master @a ~ ~ ~


function gateways:clean
