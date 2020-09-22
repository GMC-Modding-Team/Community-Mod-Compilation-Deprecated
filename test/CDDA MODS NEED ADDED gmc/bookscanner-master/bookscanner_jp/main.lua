local MOD = {}

mods["add_ebook"] = MOD

function MOD.on_turn_passed()
    if not (player:has_activity(activity_id("ACT_READ")) or player:has_activity(activity_id("ACT_CRAFT"))) then
        local item_num = 0
        local tmp = player:i_at(item_num)
        while not tmp:is_null() do
            tmp = player:i_at(item_num)
            if tmp:get_var("ebook_dummy", "") == "dummy" then
                player:i_rem(item_num)
            end
            item_num = item_num + 1
        end
    end
end
