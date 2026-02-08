if (!flowers_kill_pending) exit;
global.flowers_dead = true;

flowers_dead = true;

// reset total do progresso
inv_wood = 0;
inv_sail = 0;
inv_rope = 0;

flashlight_on = true;
maze_punish_active = false;

// voltar pra Beach
global.spawn_dir = "up";
room_goto(rm_Beach);