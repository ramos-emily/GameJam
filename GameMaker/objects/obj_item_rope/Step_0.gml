var p = instance_find(obj_player, 0);

if (p != noone && distance_to_object(obj_player) < 16) {
    if (keyboard_check_pressed(vk_space)) {

        switch (item_type) {
            case "wood": p.inv_wood = 1; break;
            case "sail": p.inv_sail = 1; break;
            case "rope": p.inv_rope = 1; break;
        }

        instance_destroy();
    }
}
