schedule function gateways:tick 1

execute as @e[type=item,limit=1,nbt={OnGround: 1b},nbt={Item: {id: "minecraft:dragon_breath", Count: 1b, tag: {display: {Name: '{"text":"Gateway Essence"}'}}}}] at @s unless data entity @s Item.tag.Placement if block ~ ~ ~ air run function gateways:bottle_gateway
execute as @e[type=item,limit=1,nbt={OnGround: 1b},nbt={Item: {id: "minecraft:dragon_breath", Count: 1b, tag: {display: {Name: '{"text":"Exact Gateway Essence"}'}}}}] at @s unless data entity @s Item.tag.Placement if block ~ ~ ~ air run function gateways:bottle_gateway

execute as @e[type=item,limit=1,nbt={OnGround: 1b},nbt={Item: {id: "minecraft:dragon_breath", Count: 1b}}] at @s
