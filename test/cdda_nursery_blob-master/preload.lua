
function nursery_blob_milking(item, active)
  local turn_in_a_day = 14400
  local turn_in_a_minute = 10
  local max_milk_amount = 5
  local charges_per_use = 2
  local charges_use = 0

  local p = player:pos()
  local setx, sety = game.choose_adjacent("対象を選択", p.x, p.y)
  local tpoint = tripoint(setx, sety, p.z)

  local creature = g:critter_at(tpoint)
  local target_is_valid = false

  if creature then
    if creature:has_trait(trait_id("NURSERY_BLOB")) then
      target_is_valid = true
      local cool_down = creature:get_effect_int(efftype_id("milking_nursery_blob"))
      local milk_amount = max_milk_amount - cool_down
      if milk_amount > 0 then
        -- 充填の量から入手最大数を再計算
        milk_amount = math.min(math.floor(item.charges / charges_per_use), milk_amount)
        if milk_amount == 0 then
          game.add_msg("電力が足りない！")
          return
        end
        -- 牛乳を入手
        -- 現状(0.C-7467)生成ターンが上手く設定できないので、set_relative_rotで無理やり新鮮にする。
        local milk = item("milk", -1, milk_amount)
        milk:set_relative_rot(0)
        -- 牛乳の入手処理が終わるまで繰り返す
        while milk.charges > 0 do
          if g:handle_liquid(milk) then
            -- 飲む、容器、捨てるを選択した場合
            if milk.charges < milk_amount then
              -- 消費量
              local consumption = milk_amount - milk.charges
              -- 充填の消費量計算と加算
              charges_use = charges_use + (consumption * charges_per_use)
              -- 対象に effect付与 か 効果時間加算
              -- 現状(0.C-7467)time_durationが通常の方法では生成できないのでダミーアイテムから無理やり取得する
              local dummy = item("dummy_nursery_blob_unit_time_duration", -1, 1)
              for i = 1, consumption do
                creature:add_effect(efftype_id("milking_nursery_blob"), dummy:brewing_time()) 
              end
              milk_amount = milk.charges
            end
          else 
            -- キャンセル時
            break
          end
        end
      else
        game.add_msg(creature:disp_name() .. " からはまだ搾乳できない！")
        return
      end
    end
  end

  if target_is_valid == false then
    game.add_msg("対象となる生物がいない！")
    return
  end

  player:consume_charges(item, charges_use)
end

game.register_iuse("IUSE_NURSERY_BLOB_MILKING", nursery_blob_milking)
