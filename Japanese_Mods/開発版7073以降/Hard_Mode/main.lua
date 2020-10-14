monster_types = game.get_monster_types()

for _, monster_type in ipairs(monster_types) do
    local mtype = monster_type:obj()
    if mtype:in_species(species_id("ZOMBIE")) then
		mtype:set_flag("KEENNOSE", true)
	end
    local mtype = monster_type:obj()
    if mtype:in_species(species_id("ZOMBIE")) then
		mtype:set_flag("GOODHEARING", true)
	end
    local mtype = monster_type:obj()
    if mtype:in_species(species_id("ZOMBIE")) then
		mtype.hp = mtype.hp * 1.5
	end
    local mtype = monster_type:obj()
    if not mtype:in_species(species_id("HALLUCINATION")) then
		mtype.melee_dice = mtype.melee_dice * 1.35
	end
    local mtype = monster_type:obj()
    if not mtype:in_species(species_id("HALLUCINATION")) then
		mtype.melee_sides = mtype.melee_sides * 1.5
	end
    local mtype = monster_type:obj()
    if not mtype:in_species(species_id("HALLUCINATION")) then
		mtype.melee_skill = mtype.melee_skill * 1.25
	end
    local mtype = monster_type:obj()
    if mtype:in_species(species_id("MAMMAL")) then
		mtype.sk_dodge = mtype.sk_dodge + 1
	end
    local mtype = monster_type:obj()
    if not mtype:in_species(species_id("ZOMBIE")) then
		mtype.sk_dodge = mtype.sk_dodge * 1.25
	end
    local mtype = monster_type:obj()
    if mtype:in_species(species_id("PLANT")) then
		mtype.armor_bash = mtype.armor_bash + 6
	end
    local mtype = monster_type:obj()
    if not mtype:in_species(species_id("ZOMBIE")) then
		mtype.armor_bash = (mtype.armor_bash + 2) * 1.5
	end
    local mtype = monster_type:obj()
    if mtype:in_species(species_id("INSECT")) then
		mtype.armor_cut = mtype.armor_cut + 5
	end
    local mtype = monster_type:obj()
    if not mtype:in_species(species_id("ZOMBIE")) then
		mtype.armor_cut = (mtype.armor_cut + 1) * 2
	end
    local mtype = monster_type:obj()
    if not mtype:in_species(species_id("ZOMBIE")) then
		mtype.hp = mtype.hp * 1.25
	end
    local mtype = monster_type:obj()
    if not mtype:in_species(species_id("ZOMBIE")) then
		mtype.speed = mtype.speed * 1.15
	end
end
