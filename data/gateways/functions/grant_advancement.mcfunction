scoreboard players set 0 sgw_score 0

# Prep `Candidate`
data modify storage schwer:sgw_store Candidate set from storage schwer:sgw_store Thrower

# `match` becomes `1` if was able to set `Candidate` (i.e. player UUID ≠ Thrower UUID, ∴ player is *not* the thrower)
execute store result score match sgw_score run data modify storage schwer:sgw_store Candidate set from entity @s UUID

# `match` is `0`, ∴ *is* thrower and should get advancement
execute if score match sgw_score = 0 sgw_score run advancement grant @s only gateways:create
