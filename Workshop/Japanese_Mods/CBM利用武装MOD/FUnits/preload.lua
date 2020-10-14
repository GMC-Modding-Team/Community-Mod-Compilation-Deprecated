local trait_list = { "FUNIT_MUT_PROT_BASH",
                     "FUNIT_MUT_PROT_CUT",
                     "FUNIT_MUT_PROT_ALL",
                     "FUNIT_MUT_ATK_BASH",
                     "FUNIT_MUT_ATK_CUT",
                     "FUNIT_MUT_ATK_ALL",
                     "FUNIT_MUT_HEAL",
                     "FUNIT_MUT_SHOCK",
                     "FUNIT_MUT_VATS",
                     "FUNIT_MUT_TEMP" }

function iuse_funit_get_trait(item, active)
    if player:has_trait(trait_id("FUNIT_MUT_TRAIT")) then
        game.add_msg("使う必要はなさそうだ。")
        return
    else
        game.add_msg("ナノマシンが体内に浸透していく…")
        player:set_mutation(trait_id("FUNIT_MUT_TRAIT"))
        player:i_rem(item)
    end
end

function iuse_funit_prot_bash(item, active)
    activate_unit("PROT_BASH", item, active)
end

function iuse_funit_prot_cut(item, active)
    activate_unit("PROT_CUT", item, active)
end

function iuse_funit_prot_all(item, active)
    activate_unit("PROT_ALL", item, active)
end

function iuse_funit_atk_bash(item, active)
    activate_unit("ATK_BASH", item, active)
end

function iuse_funit_atk_cut(item, active)
    activate_unit("ATK_CUT", item, active)
end

function iuse_funit_atk_all(item, active)
    activate_unit("ATK_ALL", item, active)
end

function iuse_funit_heal(item, active)
    if active then
        local init_charge = tonumber(player:get_value("FUNIT_INIT_CHARGE"))
        
        if (init_charge - item.charges) % 10 == 0 then --"起動時から10チャージ毎に"
            player:healall(1)
        end
        
        if item.charges > 50 then
            return
        elseif item.charges <= 50 and item.charges > 0 then
            if item.charges % 10 == 0 then
                game.add_msg(" ** 警告：電力低下 **")
                return
            end
        else
            item.active = false
            game.add_msg("治療型ユニットの電源が切れた。")
            player:unset_mutation(trait_id("FUNIT_MUT_HEAL"))
        end
    else
        if player:has_trait(trait_id("FUNIT_MUT_HEAL")) then
            item.active = false
            game.add_msg("治療型ユニットを収納した。")
            player:unset_mutation(trait_id("FUNIT_MUT_HEAL"))
            return
        end

        if check_trait() then
            return
        end
    
        if check_active() then
            return
        end
    
        game.add_msg("治療型ユニットを展開した。")
        player:set_mutation(trait_id("FUNIT_MUT_HEAL"))
        player:set_value("FUNIT_INIT_CHARGE", tostring(item.charges))
        item.active = true
    end
end

function iuse_funit_shock(item, active)
    if active then
        local discharge = tonumber(player:get_value("FUNIT_DISCHARGE"))
        local has_hostile = false
        
        if g:is_hostile_very_close() ~= nil then
            has_hostile = true
        else
            has_hostile = false
            if discharge ~= 0 then
                game.add_msg(" 敵性ユニット消失  ：充電中止")
                player:set_value("FUNIT_DISCHARGE", "0")
            end
        end
        
        if has_hostile then
            if discharge == 0 then
                game.add_msg(" 敵性ユニットを確認：充電開始")
                discharge = discharge + 1
            elseif discharge <= 3 then
                game.add_msg(" 敵性ユニット健在  ：充電継続")
                discharge = discharge + 1
            elseif discharge == 4 then
                if item.charges >= 50 then
                    game.add_msg("    ** ディスチャージ **")
                    g:shockwave(player:pos(), 3, 4, 2, 8, true)
                    discharge = 0
                    item.charges = item.charges - 50
                else
                    game.add_msg(" 衝撃波発生ユニットにエラー")
                    game.add_msg("  ：衝撃波発生の為の電力が不足")
                    game.add_msg("  ：回路保護の為充電電力を消散します")
                    discharge = 0
                end
            end
            
            player:set_value("FUNIT_DISCHARGE", tostring(discharge))
            
        end
        
        if item.charges > 50 then
            return
        elseif item.charges <= 50 and item.charges > 0 then
            if item.charges % 10 == 0 then
                game.add_msg(" ** 警告：電力低下 **")
                return
            end
        else
            item.active = false
            game.add_msg("衝撃波発生型ユニットの電源が切れた。")
            player:set_value("FUNIT_DISCHARGE", "0")
            player:unset_mutation(trait_id("FUNIT_MUT_SHOCK"))
        end
    else
        if player:has_trait(trait_id("FUNIT_MUT_SHOCK")) then
            item.active = false
            game.add_msg("衝撃波発生型ユニットを収納した。")
            player:unset_mutation(trait_id("FUNIT_MUT_SHOCK"))
            player:set_value("FUNIT_DISCHARGE", "0")
            return
        end

        if check_trait() then
            return
        end
    
        if check_active() then
            return
        end
    
        game.add_msg("衝撃波発生型ユニットを展開した。")
        player:set_mutation(trait_id("FUNIT_MUT_SHOCK"))
        player:set_value("FUNIT_DISCHARGE", "0")
        item.active = true
    end
end

function iuse_funit_vats(item, active)
    if active then
        if item.charges % 10 ~= 0 then
            item.charges = math.ceil(item.charges / 10) * 10
        end
        
        item.charges = item.charges - 50
        
        if item.charges > 200 then
            player.stamina = player:get_stamina_max()
            return
        elseif item.charges <= 200 and item.charges >= 100 then
            game.add_msg(" ** 警告：電力低下 **")
            player.stamina = player:get_stamina_max()
            return
        elseif item.charges == 50 then
            game.add_msg(" ** 警告：電力低下 **")
            game.add_msg(" **     ：使用者保護システム用電力危険域 **")
            player.stamina = player:get_stamina_max()
            return
        else
            item.active = false
            game.add_msg(" ** 警告：使用者保護システム用電力不足 **")
            game.add_msg(" **     ：システム強制シャットダウン   **")
            player:unset_mutation(trait_id("FUNIT_MUT_VATS"))
            player:set_speed_base(tonumber(player:get_value("FUNIT_BASE_SPEED")))
            add_bad_effect()
        end
    else
        if player:has_trait(trait_id("FUNIT_MUT_VATS")) then
            item.active = false
            game.add_msg("R.A.T.S.ユニットを収納した。")
            player:unset_mutation(trait_id("FUNIT_MUT_VATS"))
            player:set_speed_base(tonumber(player:get_value("FUNIT_BASE_SPEED")))
            player.stamina = player:get_stamina_max() / 2
            if item.charges >= 50 then
                item.charges = item.charges - 50
            else
                item.charges = 0
            end
            return
        end

        if check_trait() then
            return
        end
    
        if check_active() then
            return
        end
    
        if item.charges <= 50 then
            game.add_msg(" ** 警告：使用者保護システム用電力確保失敗 **")
            game.add_msg(" **     ：起動をキャンセルします           **")
        else
            game.add_msg("R.A.T.S.ユニットを展開した。")
            player:set_mutation(trait_id("FUNIT_MUT_VATS"))
            local sp_base = player:get_speed_base()
            player:set_value("FUNIT_BASE_SPEED", tostring(sp_base))
            player:set_speed_base(sp_base * 20)
            item.active = true
        end
    end
end

function iuse_funit_temp(item, active)
    if active then
        if item.charges > 50 then
            mut_temp_mod()
            return
        elseif item.charges <= 50 and item.charges > 0 then
            if item.charges % 10 == 0 then
                game.add_msg(" ** 警告：電力低下 **")
                mut_temp_mod()
                return
            end
        else
            item.active = false
            game.add_msg("環境調節ユニットの電源が切れた。")
            player:unset_mutation(trait_id("FUNIT_MUT_TEMP"))
            return
        end
    else
        if player:has_trait(trait_id("FUNIT_MUT_TEMP")) then
            item.active = false
            game.add_msg("環境調節ユニットを収納した。")
            player:unset_mutation(trait_id("FUNIT_MUT_TEMP"))
            return
        end

        if check_trait() then
            return
        end
    
        if check_active() then
            return
        end
    
        game.add_msg("環境調節ユニットを展開した。")
        mut_temp_mod()
        player:set_mutation(trait_id("FUNIT_MUT_TEMP"))
        item.active = true
    end
end

function activate_unit(type, item, active)
    
    local tar_trait = ""
    local tar_unit_name = ""
    
    if type == "PROT_BASH" then
        tar_trait = "FUNIT_MUT_PROT_BASH"
        tar_unit_name = "耐衝撃ユニット"
    elseif type == "PROT_CUT" then
        tar_trait = "FUNIT_MUT_PROT_CUT"
        tar_unit_name = "耐貫通ユニット"
    elseif type == "PROT_ALL" then
        tar_trait = "FUNIT_MUT_PROT_ALL"
        tar_unit_name = "防衛ユニット"
    elseif type == "ATK_BASH" then
        tar_trait = "FUNIT_MUT_ATK_BASH"
        tar_unit_name = "衝撃型攻勢ユニット"
    elseif type == "ATK_CUT" then
        tar_trait = "FUNIT_MUT_ATK_CUT"
        tar_unit_name = "貫通型攻勢ユニット"
    elseif type == "ATK_ALL" then
        tar_trait = "FUNIT_MUT_ATK_ALL"
        tar_unit_name = "マルチ攻撃ユニット"
    end

    if active then
        if item.charges > 50 then
            return
        elseif item.charges <= 50 and item.charges > 0 then
            if item.charges % 10 == 0 then
                game.add_msg(" ** 警告：電力低下 **")
                return
            end
        else
            item.active = false
            game.add_msg(tar_unit_name .. "の電源が切れた。")
            player:unset_mutation(trait_id(tar_trait))
        end
    else
        if player:has_trait(trait_id(tar_trait)) then
            item.active = false
            game.add_msg(tar_unit_name .. "を収納した。")
            player:unset_mutation(trait_id(tar_trait))
            return
        end

        if check_trait() then
            return
        end
    
        if check_active() then
            return
        end
    
        game.add_msg(tar_unit_name .. "を展開した。")
        player:set_mutation(trait_id(tar_trait))
        item.active = true
    end
end

function check_trait()
    local hastrait = player:has_trait(trait_id("FUNIT_MUT_TRAIT"))
    if ( not hastrait ) then
        game.add_msg("起動にはナノマシンを取り込む必要があります。")
        return true
    end
    return false
end

function check_active()
    for i = 1, #trait_list do
        if player:has_trait(trait_id(trait_list[i])) then
            game.add_msg("既に起動されているユニットが存在します。")
            return true
        end
    end
    return false
end

function add_bad_effect()
    game.add_msg("体内ナノマシンが暴走している!!")
    game.add_msg(" 恐ろしい程の倦怠感が全身を襲っている!!")
    player.stamina = 0

    if game.one_in(2) then
        game.add_msg(" 痛覚が暴走している!!")
        player:mod_pain(math.random(30,100))
    end
    
    if game.one_in(3) then
        game.add_msg(" 身体が引き裂かれるようだ!!")
        player:add_effect(efftype_id("bleed"), game.get_time_duration(50), player:get_random_body_part(true))
    end

    if game.one_in(4) then
        game.add_msg(" 平衡感覚が崩れている!!")
        player:add_effect(efftype_id("stunned"), game.get_time_duration(15))
    end

    if game.one_in(4) then
        game.add_msg(" 突然目の前が真っ暗になった!!")
        player:add_effect(efftype_id("blind"), game.get_time_duration(15))
    end

    if game.one_in(4) then
        game.add_msg(" 突如頭の中で爆音が響いた!!")
        player:add_effect(efftype_id("deaf"), game.get_time_duration(15))
        if game.one_in(2) then
            game.add_msg(" 爆音が鳴り止まない!!")
            player:add_effect(efftype_id("dazed"), game.get_time_duration(15))
        end
    end

    if game.one_in(10) then
        game.add_msg(" 感覚がおかしｈふぁｗぷｓじゅさｈｄｆ？")
        player:add_effect(efftype_id("visuals"), game.get_time_duration(100))
    end
end

function mut_temp_mod()
	local f_temp_unit = temp_to_celsius( g:get_temperature(player:pos()) ) * 100
	local avg_warmth = get_bodywarmth_avg()
	local temp_mod = math.floor( 1900 - ( avg_warmth * 60 ) - f_temp_unit )
	local m_branch = trait_id("FUNIT_MUT_TEMP"):obj()
	if temp_mod > 0 then
		m_branch.bodytemp_max = temp_mod
		m_branch.bodytemp_min = temp_mod - 500
	else
		m_branch.bodytemp_max = temp_mod
		m_branch.bodytemp_min = temp_mod
	end
end

function get_bodywarmth_avg()
	local b_warmth = 0
	for i = 1, ( #enums.body_part - 1 ) do
		if i ~= 3 then
			b_warmth = b_warmth + player:warmth(enums.body_part[i])
		end
	end
	return ( b_warmth / 11 )
end

function temp_to_celsius(temp_f)
	return ( ( temp_f - 32 ) * 5 / 9 )
end

game.register_iuse("IUSE_FUNIT_GET_TRAIT", iuse_funit_get_trait)
game.register_iuse("IUSE_FUNIT_PROT_BASH", iuse_funit_prot_bash)
game.register_iuse("IUSE_FUNIT_PROT_CUT", iuse_funit_prot_cut)
game.register_iuse("IUSE_FUNIT_PROT_ALL", iuse_funit_prot_all)
game.register_iuse("IUSE_FUNIT_ATK_BASH", iuse_funit_atk_bash)
game.register_iuse("IUSE_FUNIT_ATK_CUT", iuse_funit_atk_cut)
game.register_iuse("IUSE_FUNIT_ATK_ALL", iuse_funit_atk_all)
game.register_iuse("IUSE_FUNIT_HEAL", iuse_funit_heal)
game.register_iuse("IUSE_FUNIT_SHOCK", iuse_funit_shock)
game.register_iuse("IUSE_FUNIT_VATS", iuse_funit_vats)
game.register_iuse("IUSE_FUNIT_TEMP", iuse_funit_temp)
