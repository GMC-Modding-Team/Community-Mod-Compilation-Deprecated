local MOD = {}

mods["LootableMinutes"] = MOD

function MOD.on_turn_passed()
	local item = nil
	if (TimenetCast == false) then
		if (TimenetRelease == false) then
			return
		else
			item = GetInvItem("time_net_release")
			if (item == nil) then
				TimenetRelease = false
				game.add_msg("You have misplaced your Temporal Net but have not folded it, you will have to refold and recast it to capture more Time.")
				return
			end
			if (item.charges < 20) then
				Timenet = player:i_add(item("time_net",1))
				Timenet.charges = item.charges
				TimenetCast = false
				TimenetRelease = false
				player:i_rem(item)
				player:set_value("TimenetCast", "false")
				player:set_value("TimenetRelease", "false")
				game.add_msg("The net folds itself up, you have spent all of your spare Time.")
			else
				player:mod_moves(20)
				item.charges = item.charges - 50
			end
		end
		return
	end
			
	item = GetInvItem("time_net_capture")
	if (item == nil) then
		TimenetCast = false
		game.add_msg("You have misplaced your Temporal Net but have not folded it, you will have to refold and recast it to capture more Time.")
		return
	end
	if (item.charges >= 19500) then
		player:i_add(item("minute",1))
		item.charges = 0
		game.add_msg("A genuine Minute congeals from your Temporal Net, it will be invaluable if you happen to need more Time in a pinch.")
	else
		player:mod_moves(-20)
		item.charges = item.charges + 5
	end
end

function GetInvItem(itemid)
	local i = -1
	local item = player:i_at(i)
	while i == -1 or item:typeId() ~= "null" do
		if tostring(item:typeId()) == itemid then
			item = player:i_at(i)
			break
		end
		i = i + 1
		item = player:i_at(i)
	end
	return item
end

function MOD.on_new_player_created()
	if (player:get_value("TimeNet") == "true") then
	else
		player:i_add(item("time_net",1))
		player:set_value("TimeNet", "true")
		game.add_msg("A mysterious net appears before you, warping strangely in ways that seem impossible")
		player:set_value("TimenetCast", "false")
		player:set_value("TimenetRelease", "false")
	end
end

function MOD.on_day_passed()
	if (player:get_value("TimeNet") == "true") then
	else
		player:i_add(item("time_net",1))
		player:set_value("TimeNet", "true")
		game.add_msg("A mysterious net appears before you, warping strangely in ways that seem impossible")
	end
end

function MOD.on_savegame_loaded()
	if (player:get_value("TimeNet") == "true") then
		if (player:get_value("TimenetCast") == "true") then
			TimenetCast = true
		else
			TimenetCast = false
		end
		if (player:get_value("TimenetRelease") == "true") then
			TimenetRelease = true
		else
			TimenetRelease = false
		end
	else
		player:i_add(item("time_net",1))
		player:set_value("TimeNet", "true")
		game.add_msg("A mysterious net appears before you, warping strangely in ways that seem impossible")
		player:set_value("TimenetCast", "false")
		player:set_value("TimenetRelease", "false")
	end
end