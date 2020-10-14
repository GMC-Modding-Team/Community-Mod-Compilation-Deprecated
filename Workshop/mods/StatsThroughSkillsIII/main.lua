--Increasing stats by skill
local MOD = {}

mods["StatsThoughSkills"] = MOD

function MOD.on_day_passed()
    str_bonus = 0
    int_bonus = 0
    per_bonus = 0
    dex_bonus = 0

    --Str based skills
    str_bonus = calc_bonus(str_bonus,"carpentry")
    str_bonus = calc_bonus(str_bonus,"mechanics")
    str_bonus = calc_bonus(str_bonus,"swimming")
    str_bonus = calc_bonus(str_bonus,"bashing")
    str_bonus = calc_bonus(str_bonus,"cutting")
    str_bonus = calc_bonus(str_bonus,"melee")
    str_bonus = calc_bonus(str_bonus,"throw")
    str_bonus = calc_normalized_bonus(str_bonus)

    --Dex based skills
    dex_bonus = calc_bonus(dex_bonus,"driving")
    dex_bonus = calc_bonus(dex_bonus,"survival")
    dex_bonus = calc_bonus(dex_bonus,"tailor")
    dex_bonus = calc_bonus(dex_bonus,"traps")
    dex_bonus = calc_bonus(dex_bonus,"dodge")
    dex_bonus = calc_bonus(dex_bonus,"stabbing")
    dex_bonus = calc_bonus(dex_bonus,"unarmed")
    dex_bonus = calc_normalized_bonus(dex_bonus)

    --Int based skills
    int_bonus = calc_bonus(int_bonus,"barter")
    int_bonus = calc_bonus(int_bonus,"computer")
    int_bonus = calc_bonus(int_bonus,"cooking")
    int_bonus = calc_bonus(int_bonus,"electronics")
    int_bonus = calc_bonus(int_bonus,"fabrication")
    int_bonus = calc_bonus(int_bonus,"firstaid")
    int_bonus = calc_bonus(int_bonus,"speech")
    int_bonus = calc_normalized_bonus(int_bonus)

    --Per based skills
    per_bonus = calc_bonus(per_bonus,"archery")
    per_bonus = calc_bonus(per_bonus,"gun")
    per_bonus = calc_bonus(per_bonus,"launcher")
    per_bonus = calc_bonus(per_bonus,"pistol")
    per_bonus = calc_bonus(per_bonus,"rifle")
    per_bonus = calc_bonus(per_bonus,"shotgun")
    per_bonus = calc_bonus(per_bonus,"smg")
    per_bonus = calc_normalized_bonus(per_bonus)

    game.add_msg("Updating stats based off skills...")

    old_str_bonus = calc_old_bonus("exp_str")
    update_player_skills("exp_str", str_bonus)
    print_results(str_bonus,"strength",old_str_bonus)

    old_dex_bonus = calc_old_bonus("exp_dex")
    update_player_skills("exp_dex", dex_bonus)
    print_results(dex_bonus,"dexterity",old_dex_bonus)

    old_int_bonus = calc_old_bonus("exp_int")
    update_player_skills("exp_int", int_bonus)
    print_results(int_bonus,"intelligence",old_int_bonus)

    old_per_bonus = calc_old_bonus("exp_per")
    update_player_skills("exp_per", per_bonus)
    print_results(per_bonus,"perception",old_per_bonus)
end

function calc_normalized_bonus(bonus_amount)
    if bonus_amount < 2 then
        return 0
    end

    if bonus_amount < 5 then
        return 1
    end

    return math.floor(math.sqrt(bonus_amount))
end

function update_player_skills(bonus_effect,bonus_amount)
	player:remove_effect(bonus_effect)
    if bonus_amount > 0 then
        player:add_effect(bonus_effect, 1, "num_bp", true, bonus_amount)
    end
end

function calc_old_bonus(stat)
    return player:get_effect_int(stat, "num_bp")
end

function calc_bonus(stat_bonus,skill)
    skill_level = player:get_skill_level(skill_id(skill))

    if skill_level < 2 then
        return stat_bonus
    end

    return stat_bonus + skill_level
end

function print_results(stat_bonus,stat,old_bonus)
    if (old_bonus < stat_bonus) then
        game.add_msg("Raising "..stat.." bonus from "..tostring(old_bonus).." to "..tostring(stat_bonus))
    elseif (old_bonus > stat_bonus) then
        game.add_msg("Lowering "..stat.." bonus from "..tostring(old_bonus).." to "..tostring(stat_bonus))
    end
end
