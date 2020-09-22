function convert_creature_to_npc(creature)
    local npc
    if creature then
        if creature:is_npc() then
            npc = debug.setmetatable(creature, debug.getmetatable(player))
            return npc
        end
    end
    return nil
end

function name_tag(item, active)
    local p = player:pos()
    local delta_x
    local delta_y
    local menu_num = 0
    local um
    local npcs = {}
    local npc
    local newname

    menu_num = 0
    um = game.create_uimenu()
    um.title = "使う対象を選択"

    um:addentry(player:get_name())
    table.insert(npcs, player)
    menu_num = menu_num + 1
    for delta_x = -1, 1 do
        for delta_y = -1, 1 do
            local tpoint = tripoint(p.x + delta_x, p.y + delta_y, p.z)
            npc = convert_creature_to_npc(g:critter_at(tpoint))
            if npc then
                um:addentry(npc:get_name())
                table.insert(npcs, npc)
                menu_num = menu_num + 1
            end
        end
    end
    um:addentry("Cancel")
    um:query(true)

    if um.selected == menu_num then
        return
    end
    npc = npcs[um.selected + 1]

    newname = game.string_input_popup("新しい名前を入力してください。", 30, "")
    if newname == "" then
        return
    end

    npc.name = newname
    player:i_rem(item)
end

function ma_lerning_machine(item, active)
    local p = player:pos()
    local delta_x
    local delta_y
    local item_num = 0
    local ma_num = 0
    local menu_num = 0
    local um
    local npcs = {}
    local npc
    local ma_ids = {}
    local ma_id
    local ma

    if item:ammo_remaining() < item:ammo_required() then
        game.popup("充填量が足りません！")
        return
    end

    um = game.create_uimenu()
    um.title = "本を選択"
    local temp_item = player:i_at(item_num)
    while temp_item:is_null() ~= true do
        temp_item = player:i_at(item_num)
        local item_id = temp_item:typeId()
        ma_id = string.match(item_id, "manual_(.+)")
        if ma_id then
            table.insert(ma_ids, ma_id)
            um:addentry(temp_item:display_name())
            ma_num = ma_num + 1
        end
        item_num = item_num + 1
    end
    um:addentry("Cancel")
    um:query(true)
    if um.selected == ma_num then
        return
    end
    ma_id = ma_ids[um.selected + 1]

    menu_num = 0
    um = game.create_uimenu()
    um.title = "使う対象を選択"
    for delta_x = -1, 1 do
        for delta_y = -1, 1 do
            local tpoint = tripoint(p.x + delta_x, p.y + delta_y, p.z)
            npc = convert_creature_to_npc(g:critter_at(tpoint))
            if npc then
                um:addentry(npc:get_name())
                table.insert(npcs, npc)
                menu_num = menu_num + 1
            end
        end
    end
    um:addentry("Cancel")
    um:query(true)

    if um.selected == menu_num then
        return
    end
    npc = npcs[um.selected + 1]

    ma_id = "style_" .. ma_id
    ma = matype_id(ma_id)
    if npc:has_martialart(ma) then
        game.add_msg(npc:get_name() .. " は既にその戦闘スタイルを習得しています。")
    else
        npc:add_martialart(ma)
        game.add_msg(npc:get_name() .. " は新たに戦闘スタイルを獲得しました！")
    end
    npc.style_selected = ma
    game.add_msg("戦闘スタイルを切り替えます。")
    -- NPCの現在の戦闘スタイルはどうやらセーブデータに保存されないらしいので覚えておくようにする
    --（取得スタイルは記録されてるのに…）
    npc:set_value("npc_extention_current_ma_style", ma_id)

    player:consume_charges(item, item:ammo_required())
end

function baton(item, active)
    local p = player:pos()
    local delta_x
    local delta_y
    local menu_num = 0
    local um
    local npcs = {}
    local npc

    if g:is_hostile_nearby() then
        game.popup("近くに敵がいるときは使用できません！")
        return
    end

    menu_num = 0
    um = game.create_uimenu()
    um.title = "使う対象を選択"
    for delta_x = -1, 1 do
        for delta_y = -1, 1 do
            local tpoint = tripoint(p.x + delta_x, p.y + delta_y, p.z)
            npc = convert_creature_to_npc(g:critter_at(tpoint))
            if npc then
                um:addentry(npc:get_name())
                table.insert(npcs, npc)
                menu_num = menu_num + 1
            end
        end
    end
    um:addentry("Cancel")
    um:query(true)

    if um.selected == menu_num then
        return
    end
    npc = npcs[um.selected + 1]

    menu_num = 0
    um = game.create_uimenu()
    um.title = "指示を選択"
    um:addentry("戦闘スタイルの変更")
    um:addentry("生体部品の変更")
    um:addentry("Cancel")
    um:query(true)

    if um.selected == 0 then
        npc:pick_style()
        return
    elseif um.selected == 1 then
        npc:power_bionics()
        return
    end
end

game.register_iuse("IUSE_NPCTW_BATON", baton)
game.register_iuse("IUSE_NPCTW_MA_LERNING_MACHINE", ma_lerning_machine)
game.register_iuse("IUSE_NPCTW_NAME_TAG", name_tag)
