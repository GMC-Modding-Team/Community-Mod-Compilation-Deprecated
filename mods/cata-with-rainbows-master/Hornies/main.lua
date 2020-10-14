






local MOD = {

 id = "Test"

}

local roga = ""

mods[MOD.id] = MOD





function MOD.on_day_passed()
   
    --game.add_msg("+1 minute")
    
    
    
    if (player:has_effect(efftype_id("horns_grow"))) then
        player:add_effect(efftype_id("horns_grow"),10)
        if ( player:get_effect_int(efftype_id("horns_grow")) >= 5  ) then
            player:mutate_towards(trait_id("HORNS"))
            player:remove_effect(efftype_id("horns_grow"))
            game.add_msg("Your horns are back.")
        end
    end


    if (player:has_effect(efftype_id("horns_curled_grow"))) then
        player:add_effect(efftype_id("horns_curled_grow"),10)
        if ( player:get_effect_int(efftype_id("horns_curled_grow")) == 5  ) then
            player:mutate_towards(trait_id("HORNS"))
            game.add_msg("Your horns are back.")
        end
        if ( player:get_effect_int(efftype_id("horns_curled_grow")) >= 10  ) then
            player:mutate_towards(trait_id("HORNS_CURLED"))
            player:remove_effect(efftype_id("horns_curled_grow"))
            game.add_msg("Your horns are back.")
        end
    end


    if (player:has_effect(efftype_id("horns_pointed_grow"))) then
        player:add_effect(efftype_id("horns_pointed_grow"),10)
        if ( player:get_effect_int(efftype_id("horns_pointed_grow")) == 5  ) then
            player:mutate_towards(trait_id("HORNS"))
            game.add_msg("Your horns are back.")
        end
        if ( player:get_effect_int(efftype_id("horns_pointed_grow")) >= 10  ) then
            player:mutate_towards(trait_id("HORNS_POINTED"))
            player:remove_effect(efftype_id("horns_pointed_grow"))
            game.add_msg("Your horns are back.")
        end
    end
    
    
    if (player:has_effect(efftype_id("antlers_grow"))) then
        player:add_effect(efftype_id("antlers_grow"),10)
        if ( player:get_effect_int(efftype_id("antlers_grow")) >= 5  ) then
            player:mutate_towards(trait_id("ANTLERS"))
            player:remove_effect(efftype_id("antlers_grow"))
            game.add_msg("Your horns are back.")
        end
    end


    if (player:has_effect(efftype_id("antennae_grow"))) then
        player:add_effect(efftype_id("antennae_grow"),10)
        if ( player:get_effect_int(efftype_id("antennae_grow")) >= 5  ) then
            player:mutate_towards(trait_id("ANTENNAE"))
            player:remove_effect(efftype_id("antennae_grow"))
            game.add_msg("Your antennae are back.")
        end
    end







    if (player:has_effect(efftype_id("lightfur_grow"))) then
        player:add_effect(efftype_id("lightfur_grow"),10)
        if ( player:get_effect_int(efftype_id("lightfur_grow")) >= 5  ) then
            player:mutate_towards(trait_id("LIGHTFUR"))
            player:remove_effect(efftype_id("lightfur_grow"))
            game.add_msg("Your lightfur is back.")
        end
    end
    
    if (player:has_effect(efftype_id("fur_grow"))) then
        player:add_effect(efftype_id("fur_grow"),10)
        if ( player:get_effect_int(efftype_id("fur_grow")) == 5  ) then
            player:mutate_towards(trait_id("LIGHTFUR"))
            game.add_msg("Your lightfur is back.")
        end
        if ( player:get_effect_int(efftype_id("fur_grow")) >= 10  ) then
            player:mutate_towards(trait_id("FUR"))
            player:remove_effect(efftype_id("fur_grow"))
            game.add_msg("Your fur is back.")
        end
    end
    
    if (player:has_effect(efftype_id("ursinefur_grow"))) then
        player:add_effect(efftype_id("ursinefur_grow"),10)
        if ( player:get_effect_int(efftype_id("ursinefur_grow")) == 5  ) then
            player:mutate_towards(trait_id("LIGHTFUR"))
            game.add_msg("Your lightfur is back.")
        end
        if ( player:get_effect_int(efftype_id("ursinefur_grow")) == 10  ) then
            player:mutate_towards(trait_id("FUR"))
            game.add_msg("Your fur is back.")
        end
        if ( player:get_effect_int(efftype_id("ursinefur_grow")) >= 15  ) then
            player:mutate_towards(trait_id("URSINE_FUR"))
            player:remove_effect(efftype_id("ursinefur_grow"))
            game.add_msg("Your fur is back.")
        end
    end
    
    if (player:has_effect(efftype_id("lupinefur_grow"))) then
        player:add_effect(efftype_id("lupinefur_grow"),10)
        if ( player:get_effect_int(efftype_id("lupinefur_grow")) == 5  ) then
            player:mutate_towards(trait_id("LIGHTFUR"))
            game.add_msg("Your lightfur is back.")
        end
        if ( player:get_effect_int(efftype_id("lupinefur_grow")) == 10  ) then
            player:mutate_towards(trait_id("FUR"))
            game.add_msg("Your fur is back.")
        end
        if ( player:get_effect_int(efftype_id("lupinefur_grow")) >= 15  ) then
            player:mutate_towards(trait_id("LUPINE_FUR"))
            player:remove_effect(efftype_id("lupinefur_grow"))
            game.add_msg("Your fur is back.")
        end
    end
    
    if (player:has_effect(efftype_id("felinefur_grow"))) then
        player:add_effect(efftype_id("felinefur_grow"),10)
        if ( player:get_effect_int(efftype_id("felinefur_grow")) == 5  ) then
            player:mutate_towards(trait_id("LIGHTFUR"))
            game.add_msg("Your lightfur is back.")
        end
        if ( player:get_effect_int(efftype_id("felinefur_grow")) >= 10  ) then
            player:mutate_towards(trait_id("FELINE_FUR"))
            player:remove_effect(efftype_id("felinefur_grow"))
            game.add_msg("Your fur is back.")
        end
    end
    
    if (player:has_effect(efftype_id("lynxfur_grow"))) then
        player:add_effect(efftype_id("lynxfur_grow"),10)
        if ( player:get_effect_int(efftype_id("lynxfur_grow")) == 5  ) then
            player:mutate_towards(trait_id("LIGHTFUR"))
            game.add_msg("Your lightfur is back.")
        end
        if ( player:get_effect_int(efftype_id("lynxfur_grow")) == 10  ) then
            player:mutate_towards(trait_id("FELINE_FUR"))
            game.add_msg("Your fur is back.")
        end
        if ( player:get_effect_int(efftype_id("lynxfur_grow")) >= 15  ) then
            player:mutate_towards(trait_id("LYNX_FUR"))
            player:remove_effect(efftype_id("lynxfur_grow"))
            game.add_msg("Your fur is back.")
        end
    end
    
    
    if (player:has_effect(efftype_id("chitinfur_grow"))) then
        player:add_effect(efftype_id("chitinfur_grow"),10)
        if ( player:get_effect_int(efftype_id("lightfur_grow")) >= 5  ) then
            player:mutate_towards(trait_id("CHITIN_FUR"))
            player:remove_effect(efftype_id("chitinfur_grow"))
            game.add_msg("Your fur is back.")
        end
    end
    
    if (player:has_effect(efftype_id("chitinfur_grow2"))) then
        player:add_effect(efftype_id("chitinfur_grow2"),10)
        if ( player:get_effect_int(efftype_id("chitinfur_grow2")) == 5  ) then
            player:mutate_towards(trait_id("CHITIN_FUR"))
            game.add_msg("Your fur is back.")
        end
        if ( player:get_effect_int(efftype_id("chitinfur_grow2")) >= 10  ) then
            player:mutate_towards(trait_id("CHITIN_FUR2"))
            player:remove_effect(efftype_id("chitinfur_grow2"))
            game.add_msg("Your fur is back.")
        end
    end

    if (player:has_effect(efftype_id("chitinfur_grow3"))) then
        player:add_effect(efftype_id("chitinfur_grow3"),10)
        if ( player:get_effect_int(efftype_id("chitinfur_grow3")) == 5  ) then
            player:mutate_towards(trait_id("CHITIN_FUR"))
            game.add_msg("Your fur is back.")
        end
        if ( player:get_effect_int(efftype_id("chitinfur_grow3")) == 10  ) then
            player:mutate_towards(trait_id("CHITIN_FUR2"))
            game.add_msg("Your fur is back.")
        end
        if ( player:get_effect_int(efftype_id("chitinfur_grow3")) >= 15  ) then
            player:mutate_towards(trait_id("CHITIN_FUR3"))
            player:remove_effect(efftype_id("chitinfur_grow3"))
            game.add_msg("Your fur is back.")
        end
    end

    if (player:has_effect(efftype_id("cf_hair_grow"))) then
        player:add_effect(efftype_id("cf_hair_grow"),10)
        if ( player:get_effect_int(efftype_id("cf_hair_grow")) == 5  ) then
            player:mutate_towards(trait_id("CHITIN_FUR"))
            game.add_msg("Your fur is back.")
        end
        if ( player:get_effect_int(efftype_id("cf_hair_grow")) == 10  ) then
            player:mutate_towards(trait_id("CHITIN_FUR2"))
            game.add_msg("Your fur is back.")
        end
        if ( player:get_effect_int(efftype_id("cf_hair_grow")) == 15  ) then
            player:mutate_towards(trait_id("CHITIN_FUR3"))
            game.add_msg("Your fur is back.")
        end
        if ( player:get_effect_int(efftype_id("cf_hair_grow")) >= 20  ) then
            player:mutate_towards(trait_id("CF_HAIR"))
            player:remove_effect(efftype_id("cf_hair_grow"))
            game.add_msg("Your fur is back.")
        end
    end

    
    
    
    
    
    if (player:has_effect(efftype_id("toe_talons_grow"))) then
        player:add_effect(efftype_id("toe_talons_grow"),10)
        if ( player:get_effect_int(efftype_id("toe_talons_grow")) >= 5  ) then
            player:mutate_towards(trait_id("RAP_TALONS"))
            player:remove_effect(efftype_id("toe_talons_grow"))
            game.add_msg("Your toe talons are back.")
        end
    end



    if (player:has_effect(efftype_id("nails_grow"))) then
        player:add_effect(efftype_id("nails_grow"),10)
        if ( player:get_effect_int(efftype_id("nails_grow")) >= 5  ) then
            player:mutate_towards(trait_id("NAILS"))
            player:remove_effect(efftype_id("nails_grow"))
            game.add_msg("Your long nails are back.")
        end
    end

    if (player:has_effect(efftype_id("claw_grow"))) then
        player:add_effect(efftype_id("claw_grow"),10)
        if ( player:get_effect_int(efftype_id("claw_grow")) >= 5  ) then
            player:mutate_towards(trait_id("CLAWS"))
            player:remove_effect(efftype_id("claw_grow"))
            game.add_msg("Your claws are back.")
        end
    end
    
    if (player:has_effect(efftype_id("claw_rat_grow"))) then
        player:add_effect(efftype_id("claw_rat_grow"),10)
        if ( player:get_effect_int(efftype_id("claw_rat_grow")) == 5  ) then
            player:mutate_towards(trait_id("CLAWS"))
            game.add_msg("Your claws are back.")
        end
        if ( player:get_effect_int(efftype_id("claw_rat_grow")) >= 10  ) then
            player:mutate_towards(trait_id("CLAWS_RAT"))
            player:remove_effect(efftype_id("claw_rat_grow"))
            game.add_msg("Your claws are back.")
        end
    end


    if (player:has_effect(efftype_id("claw_rat_grow"))) then
        player:add_effect(efftype_id("claw_rat_grow"),10)
        if ( player:get_effect_int(efftype_id("claw_rat_grow")) == 5  ) then
            player:mutate_towards(trait_id("CLAWS"))
            game.add_msg("Your claws are back.")
        end
        if ( player:get_effect_int(efftype_id("claw_rat_grow")) >= 10  ) then
            player:mutate_towards(trait_id("CLAWS_RAT"))
            player:remove_effect(efftype_id("claw_rat_grow"))
            game.add_msg("Your claws are back.")
        end
    end


    if (player:has_effect(efftype_id("claw_st_grow"))) then
        player:add_effect(efftype_id("claw_st_grow"),10)
        if ( player:get_effect_int(efftype_id("claw_st_grow")) == 5  ) then
            player:mutate_towards(trait_id("CLAWS"))
            game.add_msg("Your claws are back.")
        end
        if ( player:get_effect_int(efftype_id("claw_st_grow")) == 10  ) then
            player:mutate_towards(trait_id("CLAWS_RAT"))
            player:remove_effect(efftype_id("claw_st_grow"))
            game.add_msg("Your claws are back.")
        end
        if ( player:get_effect_int(efftype_id("claw_st_grow")) >= 15  ) then
            player:mutate_towards(trait_id("CLAWS_ST"))
            player:remove_effect(efftype_id("claw_st_grow"))
            game.add_msg("Your claws are back.")
        end
    end
    
    if (player:has_effect(efftype_id("claw_retract_grow"))) then
        player:add_effect(efftype_id("claw_retract_grow"),10)
        if ( player:get_effect_int(efftype_id("claw_retract_grow")) >= 5  ) then
            player:mutate_towards(trait_id("CLAWS_RETRACT"))
            player:remove_effect(efftype_id("claw_retract_grow"))
            game.add_msg("Your claws are back.")
        end
    end
    
    if (player:has_effect(efftype_id("talons_grow"))) then
        player:add_effect(efftype_id("talons_grow"),10)
        if ( player:get_effect_int(efftype_id("talons_grow")) >= 5  ) then
            player:mutate_towards(trait_id("TALONS"))
            player:remove_effect(efftype_id("talons_grow"))
            game.add_msg("Your talons are back.")
        end
    end
    
    
    
end

















