local MOD = {}

mods["nursery_blob"] = MOD

function MOD.on_minute_passed()
  -- 発生頻度は2回/1日くらい
  
  if math.random(1, 60 * 24) <= 2 then
    nursery_blob_main()
  end
end

function nursery_blob_main()
  if not player:has_trait(trait_id("NURSERY_BLOB")) then
    return
  end

  local locs = {}
  for delta_x = -1, 1 do
    for delta_y = -1, 1 do
      local point = player:pos()
      point.x = point.x + delta_x
      point.y = point.y + delta_y
      if g:is_empty(point) then
        table.insert(locs, point )
      end
    end
  end

  if #locs > 0 then
    local loc = pick_from_list(locs)
    local monster = game.create_monster(mtype_id("mon_blob_small"), loc)
    player:mod_pain(10)
    game.add_msg(player:disp_name().."は"..monster:name().."を出産した！")
  end
end

function pick_from_list(list)
  local rand = math.random(1, #list)
  return list[rand]
end
