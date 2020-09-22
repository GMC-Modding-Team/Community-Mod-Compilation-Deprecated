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

	local menu = game.create_uimenu()

	menu:addentry("transfer all balances to one card")
	menu:addentry("do nothing")
	menu:query(true)
	if menu.selected > 0 then
		return
	end

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
    
    game.add_msg("Balances transferred!")
    
end

game.register_iuse("iuse_cashcard_transfer", iuse_cashcard_transfer)
