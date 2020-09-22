function inv_dump(owner)
	local pos = -1
	return function()
		pos = pos + 1
		if owner:i_at(pos):typeId() == "null" then
			return  nill
		else
			return owner:i_at(pos)
		end
	end
end

function iuse_cashcard_transfer(item, active)

-- TODO:create_uimenu causes game crash??
--[[
	local menu = game.create_uimenu()

	menu:addentry("残高を1枚のキャッシュカードにまとめる")
	menu:addentry("...やめた")
	menu:query(true)
	if menu.selected > 0 then
		return
	end
]]--

	local my_card
	local max_charges = 0
	local charges = 0

	for itm in inv_dump(player) do
		if itm:typeId() == "cash_card" then

			if max_charges <= itm.charges then
				max_charges = itm.charges
				my_card = itm
			end

			charges = charges + itm.charges
			itm.charges = 0
		end
	end

	if my_card and charges > 0 then
		my_card.charges = charges
	end

end

function iuse_season_info(item, active)
	local calendar = game:get_calendar_turn()
	local sunrise = calendar:sunrise()
	local sunset  = calendar:sunset()
	game.add_msg( string.format("Year %s %s", tostring(calendar:years() +1), string.lower(calendar:get_season())) )
	game.add_msg( string.format("Today's sunrise: %02d:%02d", tostring(sunrise:hours()), tostring(sunrise:minutes())) )
	game.add_msg( string.format("Today's sunset: %02d:%02d", tostring(sunset:hours()), tostring(sunset:minutes())) )
end

game.register_iuse("IUSE_CASHCARD_TRANSFER", iuse_cashcard_transfer)
game.register_iuse("IUSE_SEASON_INFO"      , iuse_season_info)
