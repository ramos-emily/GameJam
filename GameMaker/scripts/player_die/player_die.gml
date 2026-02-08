function player_die() {

    // reset inventário
    inv_wood = 0;
    inv_sail = 0;
    inv_rope = 0;

    // reset flags importantes
    flowers_dead = false;
    flowers_steps = 0;
    maze_state = -1;
    maze_respawn_pending = false;
    maze_respawn_timer = 0;

    // voltar pra beach
    global.spawn_dir = "down";
    room_goto(rm_Beach);
}
