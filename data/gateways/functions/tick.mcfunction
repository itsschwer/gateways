schedule function gateways:tick 1

execute as @e[type=item,nbt={OnGround: 1b},nbt={Item: {id: "minecraft:dragon_breath", Count: 1b, tag: {display: {Name: '{"text":"Gateway Essence"}'}}}}] at @s unless data entity @s Item.tag.Placement if block ~ ~ ~ air run function gateways:bottle_gateway
execute as @e[type=item,nbt={OnGround: 1b},nbt={Item: {id: "minecraft:dragon_breath", Count: 1b, tag: {display: {Name: '{"text":"Exact Gateway Essence"}'}}}}] at @s unless data entity @s Item.tag.Placement if block ~ ~ ~ air run function gateways:bottle_gateway

execute as @e[type=item,nbt={OnGround: 1b},predicate=gateways:in_overworld,nbt={Item: {id: "minecraft:dragon_breath", Count: 1b, tag: {Dimension: "minecraft:overworld"}}}] at @s if data entity @s Item.tag.Placement if block ~ ~-1 ~ minecraft:lodestone run function gateways:place_gateway
execute as @e[type=item,nbt={OnGround: 1b},predicate=gateways:in_the_nether,nbt={Item: {id: "minecraft:dragon_breath", Count: 1b, tag: {Dimension: "minecraft:the_nether"}}}] at @s if data entity @s Item.tag.Placement if block ~ ~-1 ~ minecraft:lodestone run function gateways:place_gateway
execute as @e[type=item,nbt={OnGround: 1b},predicate=gateways:in_the_end,nbt={Item: {id: "minecraft:dragon_breath", Count: 1b, tag: {Dimension: "minecraft:the_end"}}}] at @s if data entity @s Item.tag.Placement if block ~ ~-1 ~ minecraft:lodestone run function gateways:place_gateway
# Experimental; for custom dimensions (untested ^^; )
execute as @e[type=item,nbt={OnGround: 1b},predicate=!gateways:in_overworld,predicate=!gateways:in_the_nether,predicate=!gateways:in_the_end,nbt={Item: {id: "minecraft:dragon_breath", Count: 1b}}] at @s if data entity @s Item.tag.Placement if block ~ ~-1 ~ minecraft:lodestone run function gateways:place_gateway
