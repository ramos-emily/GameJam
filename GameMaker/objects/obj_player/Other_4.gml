switch (global.spawn_dir) {

    case "up":
        x = room_width / 2;
        y = 20;
        break;

    case "down":
        x = room_width / 2;
        if (room == rm_Beach) {
            y = room_height * 0.60; 
        } else {
            y = room_height - 20; 
        }
        break;

    case "left":
        x = 20;
        y = room_height / 2;
        break;

    case "right":
        x = room_width - 20;
        y = room_height / 2;
        break;
}

if (room == rm_Crossroad && !global.dialogue_crossroad) {
    dialogue_start([
        "...Daniel?",
        "What are you doing here?",
        "Sirens? What a stupid way to lose your boat.",
        "Whatever. Since you are here, we have plenty of time to talk.",
        "Mind the dark. You don't know what hides in it."
    ]);

    global.dialogue_crossroad = true;
}

if (room == rm_Maze) {
    spawn_x = x;
    spawn_y = y;

    maze_reset();
}


if (room == rm_Flowers) {
    flowers_steps = 0;
    flowers_dead = false;
    flowers_kill_pending = false;

    dialogue_start([
        "Don't move.",
        "Watch your step. The flowers. they are mine."
    ]);
	
	 global.dialogue_flowers = true;
}


