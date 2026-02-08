player = instance_find(obj_player, 0);

iniciar_fase = function() {
    
    if (player.inv_rope == 1) {
        state = "CLEARED";
        player.can_move = true;
        return;
    }

    if (variable_instance_exists(player, "spawn_x")) {
        player.x = player.spawn_x;
        player.y = player.spawn_y;
    }
    player.can_move = false;
    player.hsp = 0;
    player.vsp = 0;
    player.flashlight_on = true; 
    
    state = "INTRO";
    dialogue_start(["Turn off your flashlight. You dont need your eyes here. (E)"]);
}

iniciar_fase();