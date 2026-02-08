hsp = 0;
vsp = 0;

if (keyboard_check(ord("W")) || keyboard_check(vk_up))    vsp = -spd;
if (keyboard_check(ord("S")) || keyboard_check(vk_down))  vsp = spd;
if (keyboard_check(ord("A")) || keyboard_check(vk_left))  hsp = -spd;
if (keyboard_check(ord("D")) || keyboard_check(vk_right)) hsp = spd;

if (hsp != 0 && vsp != 0) {
    var diag_factor = sqrt(0.5);
    hsp *= diag_factor;
    vsp *= diag_factor;
}

x += hsp;
y += vsp;

if (hsp == 0 && vsp == 0) {
    switch(sprite_index) {
        case spr_player_walk_left:
            sprite_index = spr_player_idle_left;     
            break;
        case spr_player_walk_right:
            sprite_index = spr_player_idle_right; 
            break;
        case spr_player_walk_down:
            sprite_index = spr_player_idle_down;      
            break;
        case spr_player_walk_up:
            sprite_index = spr_player_idle_up;          
            break;
    }
} else {
    if (vsp > 0 && hsp < 0) sprite_index = spr_player_walk_left;
    else if (vsp > 0 && hsp > 0) sprite_index = spr_player_walk_right;
    else if (vsp > 0) sprite_index = spr_player_walk_down;
    else if (vsp < 0) sprite_index = spr_player_walk_up;
    else if (hsp < 0) sprite_index = spr_player_walk_left;
    else if (hsp > 0) sprite_index = spr_player_walk_right;
}

if (hsp != 0 || vsp != 0) {
    dir = point_direction(0, 0, hsp, vsp);
}

if (keyboard_check_pressed(ord("E"))) {
    flashlight_on = !flashlight_on;
}

var margin = 2;

// ===== BEACH =====
if (room == rm_Beach) {
    if (y <= margin) {
        global.spawn_dir = "down";
        room_goto(rm_Crossroad);
    }
}

// ===== CROSSROAD =====
if (room == rm_Crossroad) {

    if (y <= margin) {
        global.spawn_dir = "down";
        room_goto(rm_Statue);
    }

    if (y >= room_height - margin) {
        global.spawn_dir = "up";
        room_goto(rm_Beach);
    }

    if (x <= margin) {
        global.spawn_dir = "right";
        room_goto(rm_Maze);
    }

    if (x >= room_width - margin) {
        global.spawn_dir = "left";
        room_goto(rm_Flowers);
    }
}

// ===== MAZE =====
if (room == rm_Maze) {
    if (x >= room_width - margin) {
        global.spawn_dir = "left";
        room_goto(rm_Crossroad);
    }
}

// ===== FLOWERS =====
if (room == rm_Flowers) {
    if (x <= margin) {
        global.spawn_dir = "right";
        room_goto(rm_Crossroad);
    }
}

// ===== STATUE =====
if (room == rm_Statue) {
    if (y >= room_height - margin) {
        global.spawn_dir = "up";
        room_goto(rm_Crossroad);
    }
}

if (flowers_cooldown > 0) {
    flowers_cooldown--;
}



smooth_dir = lerp(smooth_dir, dir, 0.15);
