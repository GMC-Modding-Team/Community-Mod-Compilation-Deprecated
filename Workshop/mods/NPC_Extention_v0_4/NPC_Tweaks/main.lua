local MOD = {}

mods["NPC_Tweaks"] = MOD

function MOD.on_game_loaded()
    MOD.npctw_main()
end

function MOD.on_minute_passed()
    MOD.npctw_main()
end

function MOD.convert_creature_to_npc(creature)
    local npc
    if creature then
        if creature:is_npc() then
            npc = debug.setmetatable(creature, debug.getmetatable(player))
            return npc
        end
    end
    return nil
end

function MOD.npctw_main()
    for delta_x = -10, 10 do
        for delta_y = -10, 10 do
            local point = player:pos()
            point.x = point.x + delta_x
            point.y = point.y + delta_y
            local npc = MOD.convert_creature_to_npc(g:critter_at(point))
            if npc then
                -- NPCの戦闘スタイルを復元する
                MOD.restore_style_selected(npc)
                -- NPCの戦闘スタイルを保存する
                MOD.save_style_selected(npc)
            end
        end
    end
end

function MOD.restore_style_selected(npc)
    local ma_id = npc:get_value("npc_extention_current_ma_style")
    if ma_id and ma_id ~= "" then
        ma = matype_id(ma_id)
        npc.style_selected = ma
    end
end

function MOD.save_style_selected(npc)
    local ma_id = npc:get_value("npc_extention_current_ma_style")
    if not ma_id or ma_id ~= npc.style_selected:str() then
        npc:set_value("npc_extention_current_ma_style", npc.style_selected:str())
    end
end
