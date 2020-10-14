-- MOD Nightmare.
local MOD = {}
mods["Nightmare"] = MOD

-- origianl status.
mons_org_hp          = {}
mons_org_armor_bash  = {}
mons_org_armor_cut   = {}
mons_org_melee_skill = {}
mons_org_melee_dice  = {}
mons_org_melee_sides = {}


local monster_types = game.get_monster_types()
for i, monster_type in ipairs(monster_types) do
	local mtype = monster_type:obj()
	if mtype:in_species(species_id("ZOMBIE")) then
		local nname = mtype:nname(1)
		mons_org_hp         [nname] = mtype.hp
		mons_org_armor_bash [nname] = mtype.armor_bash
		mons_org_armor_cut  [nname] = mtype.armor_cut
		mons_org_melee_skill[nname] = mtype.melee_skill
		mons_org_melee_dice [nname] = mtype.melee_dice
		mons_org_melee_sides[nname] = mtype.melee_sides
	end
end

function get_total_days()
	return math.ceil( game:get_calendar_turn():get_turn() / 14400 )
	-- 14400 is turns of per a day.
end

function calc_new_monster_status(mtype,total_days)

	if not( mtype:in_species(species_id("ZOMBIE")) ) then
		return
	end

	local nname = mtype:nname(1)
	local SCALE = 56				-- 14(days)x4(seasons) = 56

	if total_days > SCALE then
		return
	end

	--[[
	Balance Examples
	               |     | armor      | melee
	Monster        | HP  | bash / cut | skill / dice
	---------------+-----+------------+-----------------
	zombie         |  80 |    0 / 0   |     4 / 2D3 ( 6)
	zombie brute   | 120 |    4 / 6   |     4 / 3D8 (24)
	survivor zombie| 120 |    7 / 7   |     6 / 4D6 (24)
	zombie hulk    | 480 |    8 / 12  |     5 / 4D8 (32)
	armored zombie | 120 |   64 / 64  |     5 / 3D6 (18)
	]]--

	if mons_org_hp[nname] < 10000 then	-- exclude MJ.
		mtype.hp = math.min( 960, math.floor( mons_org_hp[nname] * math.min( 1.5, ( 1 + total_days / SCALE ) ) ) )
	end

	if mons_org_armor_bash[nname] < 7 then
		mtype.armor_bash = math.min( 7, mons_org_armor_bash[nname] + math.floor( 7 * total_days / SCALE ) )
	end

	if mons_org_armor_cut[nname] < 7 then
		mtype.armor_cut = math.min( 7, mons_org_armor_cut[nname] + math.floor( 7 * total_days / SCALE ) )
	end

	if mons_org_melee_skill[nname] < 7 then
		mtype.melee_skill = math.min( 7, mons_org_melee_skill[nname] + math.floor( 7 * total_days / SCALE ) )
	end

	if mons_org_melee_dice[nname] * mons_org_melee_sides[nname] < 40 then
		if mons_org_melee_dice[nname] < 5 then
			mtype.melee_dice  = math.min( 5, mons_org_melee_dice[nname]  + math.floor( 5 * total_days / SCALE ) )
		end

		if mons_org_melee_sides[nname] < 8 then
			mtype.melee_sides = math.min( 8, mons_org_melee_sides[nname] + math.floor( 8 * total_days / SCALE ) )
		end
	end
end

function dream_a_nightmare()
	local monster_types = game.get_monster_types()
	local total_days = get_total_days()
	for i, monster_type in ipairs(monster_types) do
		calc_new_monster_status(monster_type:obj(),total_days)
	end
end

function MOD.on_day_passed()
	dream_a_nightmare()
end

function MOD.debug()
	local total_days = get_total_days()
	game.add_msg( tostring(total_days).."day"..(total_days == 1 and "" or "s" ) )
	for i, monster_type in ipairs(monster_types) do
		local mtype = monster_type:obj()
		if mtype:in_species(species_id("ZOMBIE")) then
			local nname = mtype:nname(1)
			game.add_msg(nname..":"
			.. "[hp]"..tostring(mons_org_hp         [nname]).."->"..tostring(mtype.hp         )
			.."/[bs]"..tostring(mons_org_armor_bash [nname]).."->"..tostring(mtype.armor_bash )
			.."/[ct]"..tostring(mons_org_armor_cut  [nname]).."->"..tostring(mtype.armor_cut  )
			.."/[ml]"..tostring(mons_org_melee_skill[nname]).."->"..tostring(mtype.melee_skill)
			.."/[dc]"..tostring(mons_org_melee_dice [nname]).."D"
			         ..tostring(mons_org_melee_sides[nname]).."->"
			         ..tostring(mtype.melee_dice).."D"
			         ..tostring(mtype.melee_sides)
			)
		end
	end
end
