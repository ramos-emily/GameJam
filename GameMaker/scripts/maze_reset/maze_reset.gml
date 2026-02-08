function maze_reset() {
    x = spawn_x;
    y = spawn_y;

    maze_state = 0;
    maze_last_flashlight = flashlight_on;

    maze_respawn_timer = 0;
    maze_respawn_pending = false;

    dialogue_start(["Desligue sua lanterna. Aperte a tecla [E]"]);

    alarm[1] = room_speed * 1.5;
}
