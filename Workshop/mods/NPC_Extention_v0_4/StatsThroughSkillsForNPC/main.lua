--Increasing stats by skill
local MOD = {}

local str_skills = {"mechanics", "swimming", "bashing", "cutting", "melee", "throw"}
local dex_skills = {"driving", "survival", "tailor", "traps", "dodge", "stabbing", "unarmed"}
local int_skills = {"barter", "computer", "cooking", "electronics", "fabrication", "firstaid", "speech"}
local per_skills = {"archery", "gun", "launcher", "pistol", "rifle", "shotgun", "smg"}

mods["StatsThroughSkillsForNPC"] = MOD

local stsfornpc = {}

function MOD.on_minute_passed()
    for delta_x = -10, 10 do
        for delta_y = -10, 10 do
            local point = player:pos()
            point.x = point.x + delta_x
            point.y = point.y + delta_y
            local npc = stsfornpc.convert_creature_to_npc(g:critter_at(point))
            if npc then
                stsfornpc.calculate_bonuses(npc)
            end
        end
    end
end

function stsfornpc.convert_creature_to_npc(creature)
    local npc
    if creature then
        if creature:is_npc() then
            npc = debug.setmetatable(creature, debug.getmetatable(player))
            return npc
        end
    end
    return nil
end

function stsfornpc.calculate_bonuses(npc)
    local prev_str = npc.str_max
    local prev_dex = npc.dex_max
    local prev_int = npc.int_max
    local prev_per = npc.per_max

    stsfornpc.remove_existing_bonuses(npc)

    local str_bonus = stsfornpc.calc_bonus(npc, str_skills)
    local dex_bonus = stsfornpc.calc_bonus(npc, dex_skills)
    local int_bonus = stsfornpc.calc_bonus(npc, int_skills)
    local per_bonus = stsfornpc.calc_bonus(npc, per_skills)

    npc:set_value("str_bonus", tostring(str_bonus))
    npc:set_value("dex_bonus", tostring(dex_bonus))
    npc:set_value("int_bonus", tostring(int_bonus))
    npc:set_value("per_bonus", tostring(per_bonus))

    npc.str_max = npc.str_max + str_bonus
    npc.dex_max = npc.dex_max + dex_bonus
    npc.int_max = npc.int_max + int_bonus
    npc.per_max = npc.per_max + per_bonus

    stsfornpc.print_results(npc.str_max, npc:disp_name() .. "'s Str", prev_str)
    stsfornpc.print_results(npc.dex_max, npc:disp_name() .. "'s Dex", prev_dex)
    stsfornpc.print_results(npc.int_max, npc:disp_name() .. "'s Int", prev_int)
    stsfornpc.print_results(npc.per_max, npc:disp_name() .. "'s Per", prev_per)

    local hp_prev = {}
    for k, v in pairs(enums.hp_part) do
        if string.match(v, "num_hp_parts") == nil then
            hp_prev[v] = npc:get_hp(v)
        end
    end

    npc:recalc_hp()

    local hp_new = {}
    for k, v in pairs(enums.hp_part) do
        if string.match(v, "num_hp_parts") == nil then
            hp_new[v] = npc:get_hp(v)
        end
    end

    for k, v in pairs(enums.hp_part) do
        if string.match(v, "num_hp_parts") == nil then
            if hp_prev[v] ~= hp_new[v] then
                npc:heal(v, math.abs(hp_prev[v] - hp_new[v]))
            end
        end
    end
end

function stsfornpc.remove_existing_bonuses(npc)
    local str_bonus = tonumber(npc:get_value("str_bonus"))
    local dex_bonus = tonumber(npc:get_value("dex_bonus"))
    local int_bonus = tonumber(npc:get_value("int_bonus"))
    local per_bonus = tonumber(npc:get_value("per_bonus"))

    if (str_bonus) then
        npc.str_max = npc.str_max - str_bonus
    end
    if (dex_bonus) then
        npc.dex_max = npc.dex_max - dex_bonus
    end
    if (int_bonus) then
        npc.int_max = npc.int_max - int_bonus
    end
    if (per_bonus) then
        npc.per_max = npc.per_max - per_bonus
    end
end

function stsfornpc.calc_bonus(npc, skills_set)
    local skill_total = 0
    for _, s in ipairs(skills_set) do
        skill_total = skill_total + npc:get_skill_level(skill_id(s))
    end

    return (skill_total > 3 and math.floor(math.pow((skill_total - 3), (1 / 2.46))) or 0)
end

function stsfornpc.print_results(cur_stat, stat, prev_stat)
    if (prev_stat < cur_stat) then
        game.add_msg("Raising " .. stat .. " to " .. tostring(cur_stat))
    elseif (prev_stat > cur_stat) then
        game.add_msg("Lowering " .. stat .. " to " .. tostring(cur_stat))
    end
end
