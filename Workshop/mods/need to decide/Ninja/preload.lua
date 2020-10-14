function iuse_ninja_afterimage(item, active)

	local SCREEN_RADIUS = 2
	local CHARGES_PER_USE = 25

	if item.charges < CHARGES_PER_USE then
		game.add_msg("電力が足りない...")
		return
	end

	local num_of_image = 0
	for x = (-1 * SCREEN_RADIUS), SCREEN_RADIUS do
		for y = (-1 * SCREEN_RADIUS), SCREEN_RADIUS do
			local point = player:pos()
			point.x = point.x + x
			point.y = point.y + y

			if g:is_empty(point) and game.one_in(3) then
				game.create_monster(mtype_id("mon_ninja_afterimage"), point)
				num_of_image = num_of_image + 1
			end

			if num_of_image >= 7 then
				break;
			end
		end
	end

	if num_of_image > 0 then
		game.add_msg("霧のスクリーンに残像を写しました。")
	else
		game.add_msg("残像が写せませんでした。")
	end

	item.charges = math.max(item.charges - CHARGES_PER_USE, 0)

end

function iuse_ninja_typhoon(item, active)

	local CHARGES_PER_USE = 100
	local TYPHOON_RADIUS = 10
	local VORTEX_SPAWNRATE = 0.05		-- per a tile.
	local THRESHOLD_DESTRUCTION = 600	-- t_wall.bash_str = 210, t_wall_metal.bash_str = 600

	local RUBBLES = {}
	RUBBLES[0] = "瓦礫の山"
	RUBBLES[1] = "瓦礫の山(岩)"
	RUBBLES[2] = "残骸(金属)"
	RUBBLES[3] = "灰の山"

	if item.charges < CHARGES_PER_USE then
		game.add_msg("電力が足りない...")
		return
	end

	for x = (-1 * TYPHOON_RADIUS), TYPHOON_RADIUS do
		for y = (-1 * TYPHOON_RADIUS), TYPHOON_RADIUS do
			local point = player:pos()
			point.x = point.x + x
			point.y = point.y + y

			-- *Cleaning* ter & furn.
			local bash_str = map:bash_strength(point,true)

			if  bash_str < THRESHOLD_DESTRUCTION
			and game.one_in( math.floor( bash_str / THRESHOLD_DESTRUCTION * 10 ) )
			then
				map:destroy(point)
			end

			-- try remove rubbles.
			local fname = map:furnname(point)
				-- "furn_at" was removed.
				-- "furn" function returns "furn_id" but cant instanciate,
				-- therefore i have no idea to compare id & id. i want furn& :(

			if (
			   fname == RUBBLES[0]
			or fname == RUBBLES[1]
			or fname == RUBBLES[2]
			or fname == RUBBLES[3]
			) then
				map:furn_set(point, furn_str_id("f_null"))
			end

			-- spwan vortex.
			if g:is_empty(point) and game.one_in( math.floor((TYPHOON_RADIUS * 2)^2 / VORTEX_SPAWNRATE / 100) ) then
				game.create_monster(mtype_id("mon_vortex"), point)
			end
		end
	end

	item.charges = math.max(item.charges - CHARGES_PER_USE, 0)

end

game.register_iuse("IUSE_LUA_NINJA_AFTERIMAGE", iuse_ninja_afterimage)
game.register_iuse("IUSE_LUA_NINJA_TYPHOON"   , iuse_ninja_typhoon)
