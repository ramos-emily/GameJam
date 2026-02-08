light_surface = -1;
dir = 270;
smooth_dir = dir;
flashlight_on = true;
spd = 1; 
hsp = 0;   
vsp = 0; 
last_hsp = 0;
last_vsp = 0;
persistent = true;

inv_wood  = 0; 
inv_sail  = 0; 
inv_rope  = 0; 

spawn_x = x;
spawn_y = y;
global.spawn_dir = "down";

flowers_steps = 0;
flowers_dead = false;
flowers_kill_pending = false;
flowers_cooldown = 0;
global.flowers_dead = false;

global.dialogue_crossroad = false;
global.dialogue_maze = false;
global.dialogue_flowers = false;
global.dialogue_beach_after_death = false;
global.items_collected = false;
global.boat_fixed = false;
global.dialogue_beach_boat = false;
global.boat_delay_timer = 0;
global.all_items_collected = false;
global.dialogue_statue = false;

can_move = true;