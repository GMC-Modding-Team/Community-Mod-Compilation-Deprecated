monster_types = game.get_monster_types()

for _, monster_type in ipairs(monster_types) do
    local mtype = monster_type:obj()
    if mtype:in_species(species_id("ZOMBIE")) then
        mtype.vision_day = mtype.vision_day / 2
    end
end
