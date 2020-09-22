function minute(item, active)
	local speed = player:get_speed()
	local moves = 10 * speed
	player:mod_moves(moves)
	player:i_rem(item)
	game.add_msg("You feel as if you suddenly have plenty of time to spare, an entire minute in fact, best make good use of it")
end

Timenet = nil
TimenetCast = false
TimenetRelease = false

function cast_timenet(item, active)
	local menu = game.create_uimenu()
	local choice = -1
	menu.title = "Which way do you cast your net?"
	menu:addentry("Forward")
	menu:addentry("Backwards")
	menu:addentry("Cancel")
	menu:query(true)
	choice = menu.selected
	
	if (choice == 0) then
		Timenet = player:i_add(item("time_net_capture",1))
		Timenet.charges = item.charges
		TimenetCast = true
		player:i_rem(item)
		game.add_msg("You cast the net ahead of you but it doesn't move, you feel sluggish.")
		player:set_value("TimenetCast", "true")
	elseif (choice == 1) then
		Timenet = player:i_add(item("time_net_release",1))
		Timenet.charges = item.charges
		TimenetRelease = true
		player:i_rem(item)
		game.add_msg("You cast the net sdrawkcab and it begins to writhe, you feel faster")
		player:set_value("TimenetRelease", "true")
	elseif (choice == 2) then
		return
	end
end

function fold_timenet(item, active)
	Timenet = player:i_add(item("time_net",1))
	Timenet.charges = item.charges
	TimenetCast = false
	TimenetRelease = false
	player:i_rem(item)
	game.add_msg("You fold up the net and feel normal again.")
	player:set_value("TimenetCast", "false")
	player:set_value("TimenetRelease", "false")
end

game.register_iuse("IUSE_MINUTE", minute)
game.register_iuse("IUSE_CAST_TIMENET", cast_timenet)
game.register_iuse("IUSE_FOLD_TIMENET", fold_timenet)