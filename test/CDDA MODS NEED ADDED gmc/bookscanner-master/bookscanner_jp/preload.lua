local MOD = {
    id = "add_ebook",
    reading_book = nil
}

function parse_ebooks(str)
    return load("return {" .. str .. "}")()
end

function stringify_ebooks(t)
    local str = ""
    for _, v in pairs(t) do
        if str == "" then
            str = '"' .. v .. '"'
        else
            str = str .. ',"' .. v .. '"'
        end
    end

    return str
end

function iuse_ebook_scan_book(it, active)
    local cons = 10
    local time = -1000
    local ebooks = parse_ebooks(it:get_var("ebooks", ""))
    local books = {}
    local new_book = nil
    local um
    local menu_num = 0
    local item_num = 0
    local real_inv_num = player:get_item_position(it)
    if not player:has_amount("ebook_scanner", 1) then
        game.popup("本を電子化するには専用の装置が必要です！")
        return 0
    end
    if it:ammo_remaining() < cons then
        game.popup("充填量が足りません！")
        return 0
    end

    um = game.create_uimenu()
    um.title = "本を選択"
    local tmp = player:i_at(item_num)
    while tmp:is_null() ~= true do
        tmp = player:i_at(item_num)
        if tmp:is_book() then
            local new = true
            -- Check ebook is already scanned
            for _, v in pairs(ebooks) do
                if v == tmp:typeId() then
                    new = false
                end
            end
            if new then
                table.insert(books, tmp:typeId())
                um:addentry(tmp:display_name())
                menu_num = menu_num + 1
            end
        end
        item_num = item_num + 1
    end
    um:addentry("Cancel")
    um:query(true)
    if um.selected == menu_num or um.selected < 0 then
        return 0
    end
    new_book = books[um.selected + 1]
    table.insert(ebooks, new_book)
    player:i_at(real_inv_num):set_var("ebooks", stringify_ebooks(ebooks))
    game.add_msg("新たな本を電子化しました。")
    player:mod_moves(time)

    player:consume_charges(it, cons)
    return cons
end

function iuse_ebook_craft(it, active)
    local cons = 0
    local ebooks = parse_ebooks(it:get_var("ebooks"))
    local tmp_list = {}
    -- Check lastrecipe
    local lastrecipe = player.lastrecipe
    local last_batch = player.last_batch
    -- Add tmporary dummy books
    for _, v in pairs(ebooks) do
        local tmp = item(v, -1)
        tmp:set_var("volume", 0)
        tmp:set_var("weight", 0)
        tmp:set_var("ebook_dummy", "dummy")
        table.insert(tmp_list, player:i_add(tmp))
    end
    -- Show craft menu
    player:invalidate_crafting_inventory()
    player:craft()
    -- Remove tmporary dummy books
    --for _, v in pairs(tmp_list) do
    --    player:i_rem(v)
    --end
    -- Consume if lastrecipe differs
    if lastrecipe ~= player.lastrecipe and last_batch ~= player.last_batch then
        cons = it:ammo_required()
    end

    player:consume_charges(it, cons)
    return cons
end

function ebook_list_menu(it)
    local ebooks = parse_ebooks(it:get_var("ebooks", ""))
    local books = {}
    local um
    local menu_num = 0
    um = game.create_uimenu()
    um.title = "一覧"
    for _, v in pairs(ebooks) do
        local tmp = item(v, -1)
        table.insert(books, tmp:typeId())
        um:addentry(tmp:display_name())
        menu_num = menu_num + 1
    end
    um:addentry("Cancel")
    um:query(true)
    if um.selected == menu_num or um.selected < 0 then
        return nil
    end
    return books[um.selected + 1]
end

function iuse_ebook_list(it, active)
    local ret = ebook_list_menu(it)
    if ret then
        local dummy = item(ret, -1)
        local info = dummy:info(true)
        local um = game.create_uimenu()
        local str = ""
        local cnt = 0
        -- @todo: UI to be refined.
        for line in string.gmatch(info, "[^\n]+") do
            str = str .. line .. "\n"
            cnt = cnt + 1
            if cnt == 10 then
                game.popup(str)
                str = ""
                cnt = 0
            end
        end
        if str ~= "" then
            game.popup(str)
        end
    end
    return 0
end

function iuse_ebook_read(it, active)
	local dummy_itype = ebook_list_menu(it)
    if not dummy_itype then
		return 0
	end
    local reading_book = player:i_add(item(dummy_itype, -1))
    reading_book:set_var("volume", 0)
    reading_book:set_var("weight", 0)
    reading_book:set_var("ebook_dummy", "dummy")
    local ret = false
	local item_num = 0
    local tmp = player:i_at(item_num)
    while not tmp:is_null() do
		tmp = player:i_at(item_num)
		if tmp:typeId() == dummy_itype then
			ret = player:read(item_num)
			break
		end
		item_num = item_num + 1
    end
    if not ret then
        player:i_rem(item_num)
        return 0
    end
    player:consume_charges(it, it:ammo_required())
	return it:ammo_required()
end

function on_preload()
    game.register_iuse("IUSE_EBOOK_SCAN_BOOK", iuse_ebook_scan_book)
    game.register_iuse("IUSE_EBOOK_CRAFT", iuse_ebook_craft)
    game.register_iuse("IUSE_EBOOK_LIST", iuse_ebook_list)
    game.register_iuse("IUSE_EBOOK_READ", iuse_ebook_read)
end

on_preload()
