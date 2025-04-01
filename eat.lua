-- Eat Apple
minetest.override_item("default:apple", {
    on_use = function(itemstack, user, pointed_thing)
        local hp = user:get_hp()
        local max_hp = user:get_properties().hp_max
        if hp < max_hp then
            user:set_hp(math.min(hp + 1, max_hp))
            itemstack:take_item()
            minetest.sound_play("eat_apple", {
                pos = user:get_pos(),
                gain = 1.0,
                pitch = 1.0,
            })
        end

        return itemstack
    end
})

-- Eat Onion
if minetest.get_modpath("ethereal") then
    minetest.override_item("ethereal:wild_onion_plant", {
        on_use = function(itemstack, user, pointed_thing)
            local hp = user:get_hp()
            local max_hp = user:get_properties().hp_max
            if hp < max_hp then
                user:set_hp(math.min(hp + 1, max_hp))
                itemstack:take_item()
                minetest.sound_play("eat_onion", {
                    pos = user:get_pos(),
                    gain = 1.0,
                    pitch = 1.0,
                })
        end   

        return itemstack
    end
    })
end