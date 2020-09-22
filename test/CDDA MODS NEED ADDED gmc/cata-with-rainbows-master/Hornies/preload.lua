




function iuse_remove_horns(item )


    local item_name = tostring(item:display_name())

    if ( player:has_trait(trait_id("HORNS")) ) then
        player:mutate_towards(trait_id("HEADBUMPS"))
        player:add_effect(efftype_id("horns_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 2))
        game.add_msg("You have suscessfully removed your horns fur with your "..item_name)
        
    elseif ( player:has_trait(trait_id("HORNS_CURLED")) ) then
        player:mutate_towards(trait_id("HEADBUMPS"))
        player:mutate_towards(trait_id("HEADBUMPS"))
        player:add_effect(efftype_id("horns_curled_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 4))
        game.add_msg("You have suscessfully removed your curled horns fur with your "..item_name)
         
    elseif ( player:has_trait(trait_id("HORNS_POINTED")) ) then
        player:mutate_towards(trait_id("HEADBUMPS"))
        player:mutate_towards(trait_id("HEADBUMPS"))
        player:add_effect(efftype_id("horns_pointed_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 8))
        game.add_msg("You have suscessfully removed your pointes horns with your "..item_name)
          
    elseif ( player:has_trait(trait_id("ANTLERS")) ) then
        player:mutate_towards(trait_id("HEADBUMPS"))
        player:mutate_towards(trait_id("HEADBUMPS"))
        player:add_effect(efftype_id("antlers_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 6))
        game.add_msg("You have suscessfully removed your antlers with your "..item_name)

    elseif ( player:has_trait(trait_id("ANTENNAE")) ) then
        player:mutate_towards(trait_id("HEADBUMPS"))
        player:add_effect(efftype_id("antennae_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 4))
        game.add_msg("You have suscessfully removed your antennae with your "..item_name)

     
    else
        game.add_msg("You dont have horns.")
    end



 
end


function iuse_trim_fur(item )


    local item_name = tostring(item:display_name())

    if ( player:has_trait(trait_id("LIGHTFUR")) ) then


        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:add_effect(efftype_id("lightfur_grow"),1,"num_bp",true)
        player:i_add(item("wool_staple", 2))
        game.add_msg("You have suscessfully removed your light fur with your "..item_name)
        
    elseif ( player:has_trait(trait_id("FUR")) ) then
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:add_effect(efftype_id("fur_grow"),1)
        player:i_add(item("wool_staple", 4))
        game.add_msg("You have suscessfully removed your fur with your "..item_name)
         
    elseif ( player:has_trait(trait_id("URSINE_FUR")) ) then
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:add_effect(efftype_id("ursinefur_grow"),1,"num_bp",true)
        player:i_add(item("wool_staple", 8))
        game.add_msg("You have suscessfully removed your ursine fur with your "..item_name)
          
    elseif ( player:has_trait(trait_id("LUPINE_FUR")) ) then
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:add_effect(efftype_id("lupinefur_grow"),1,"num_bp",true)
        player:i_add(item("wool_staple", 6))
        game.add_msg("You have suscessfully removed your lupine fur with your "..item_name)

    elseif ( player:has_trait(trait_id("FELINE_FUR")) ) then
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:add_effect(efftype_id("felinefur_grow"),1,"num_bp",true)
        player:i_add(item("wool_staple", 4))
        game.add_msg("You have suscessfully removed your feline fur with your "..item_name)

    elseif ( player:has_trait(trait_id("LYNX_FUR")) ) then
        player:remove_mutation(trait_id("LYNX_FUR"))
        player:mutate_towards(trait_id("SKIN_ROUGH"))
        player:add_effect(efftype_id("lynxfur_grow"),1,"num_bp",true)
        player:i_add(item("wool_staple", 6))
        game.add_msg("You have suscessfully removed your lynx fur with your "..item_name)
        
    elseif ( player:has_trait(trait_id("CHITIN_FUR")) ) then
        player:mutate_towards(trait_id("CHITIN"))
        player:add_effect(efftype_id("chitinfur_grow"),1,"num_bp",true)
        game.add_msg("You have suscessfully removed your chitin fur with your "..item_name)
        
    elseif ( player:has_trait(trait_id("CHITIN_FUR2")) ) then
        player:mutate_towards(trait_id("CHITIN"))
        player:mutate_towards(trait_id("CHITIN"))
        player:add_effect(efftype_id("chitinfur_grow2"),1,"num_bp",true)
        game.add_msg("You have suscessfully removed your chitin fur2 with your "..item_name)

    elseif ( player:has_trait(trait_id("CHITIN_FUR3")) ) then
        player:mutate_towards(trait_id("CHITIN"))
        player:mutate_towards(trait_id("CHITIN"))
        player:mutate_towards(trait_id("CHITIN"))
        player:add_effect(efftype_id("chitinfur_grow3"),1,"num_bp",true)
        game.add_msg("You have suscessfully removed your chitin fur3 with your "..item_name)
        
    elseif ( player:has_trait(trait_id("CF_HAIR")) ) then
        player:mutate_towards(trait_id("CHITIN"))
        player:mutate_towards(trait_id("CHITIN"))
        player:mutate_towards(trait_id("CHITIN"))
        player:mutate_towards(trait_id("CHITIN"))
        player:add_effect(efftype_id("cf_hair_grow"),1,"num_bp",true)
         game.add_msg("You have suscessfully removed your urticating hairs with your "..item_name)  
     
    else
        game.add_msg("You dont have fur.")
    end

 
end





function iuse_remove_toe_talons(item )


    local item_name = tostring(item:display_name())

    if ( player:has_trait(trait_id("RAP_TALONS")) ) then
        player:remove_mutation(trait_id("RAP_TALONS"))
        player:add_effect(efftype_id("toe_talons_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 2))
        game.add_msg("You have suscessfully removed your toe talons fur with your "..item_name)
    else
        game.add_msg("You dont have toe talons.")
    end
end


function iuse_remove_claws(item )


    local item_name = tostring(item:display_name())

    if ( player:has_trait(trait_id("NAILS")) ) then
        player:remove_mutation(trait_id("NAILS"))
        player:add_effect(efftype_id("nails_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 2))
        game.add_msg("You have suscessfully removed your nails with your "..item_name)

    elseif ( player:has_trait(trait_id("CLAWS")) ) then
        player:remove_mutation(trait_id("CLAWS"))
        player:remove_mutation(trait_id("NAILS"))
        player:add_effect(efftype_id("claw_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 2))
        game.add_msg("You have suscessfully removed your claws with your "..item_name)

    elseif ( player:has_trait(trait_id("CLAWS_RAT")) ) then
        player:remove_mutation(trait_id("CLAWS_RAT"))
        player:remove_mutation(trait_id("CLAWS"))
        player:remove_mutation(trait_id("NAILS"))
        player:add_effect(efftype_id("claw_rat_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 2))
        game.add_msg("You have suscessfully removed your claws with your "..item_name)
        



    elseif ( player:has_trait(trait_id("CLAWS_ST")) ) then
        player:remove_mutation(trait_id("CLAWS_ST"))
        player:remove_mutation(trait_id("CLAWS_RAT"))
        player:remove_mutation(trait_id("CLAWS"))
        player:remove_mutation(trait_id("NAILS"))
        player:add_effect(efftype_id("claw_st_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 2))
        game.add_msg("You have suscessfully removed your claws with your "..item_name)

    elseif ( player:has_trait(trait_id("CLAWS_RETRACT")) ) then
        player:remove_mutation(trait_id("CLAWS_RETRACT"))
        player:remove_mutation(trait_id("CLAWS"))
        player:remove_mutation(trait_id("NAILS"))
        player:add_effect(efftype_id("claw_retract_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 2))
        game.add_msg("You have suscessfully removed your claws with your "..item_name)


    elseif ( player:has_trait(trait_id("TALONS")) ) then
        player:remove_mutation(trait_id("TALONS"))
        player:remove_mutation(trait_id("NAILS"))
        player:add_effect(efftype_id("talons_grow"),1,"num_bp",true)
        --player:i_add(item("wool_staple", 2))
        game.add_msg("You have suscessfully removed your claws with your "..item_name)
        
        
        
        
    else
        game.add_msg("You dont have claws.")
    end
end




    





game.register_iuse("IUSE_LUA_TRIM_FUR", iuse_trim_fur)
game.register_iuse("IUSE_LUA_REMOVE_HORNS", iuse_remove_horns)
game.register_iuse("IUSE_LUA_REMOVE_RAP_TALONS", iuse_remove_toe_talons)
game.register_iuse("IUSE_LUA_REMOVE_CLAWS", iuse_remove_claws)



