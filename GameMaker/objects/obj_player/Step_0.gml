hsp = 0;
vsp = 0;

if (can_move) {
    if (keyboard_check(ord("W")) || keyboard_check(vk_up))    vsp = -spd;
    if (keyboard_check(ord("S")) || keyboard_check(vk_down))  vsp = spd;
    if (keyboard_check(ord("A")) || keyboard_check(vk_left))  hsp = -spd;
    if (keyboard_check(ord("D")) || keyboard_check(vk_right)) hsp = spd;
}

if (hsp != 0 && vsp != 0) {
    var diag_factor = sqrt(0.5);
    hsp *= diag_factor;
    vsp *= diag_factor;
}

smooth_dir = lerp(smooth_dir, dir, 0.15);

x += hsp;
y += vsp;

// ===== ANIMAÇÃO DO PLAYER =====
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

// ===== FLASHLIGHT =====
if (keyboard_check_pressed(ord("E"))) {
    flashlight_on = !flashlight_on;
	audio_play_sound(snd_flashlight, 5, false);
}

var margin = 2;

// ===== TRANSIÇÃO DE SALAS =====
if (room == rm_Beach) {
    if (y <= margin) {
        global.spawn_dir = "down";
        room_goto(rm_Crossroad);
		audio_stop_sound(snd_beach);
    }
}

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

if (room == rm_Maze) {
    if (x >= room_width - margin) {
        global.spawn_dir = "left";
        room_goto(rm_Crossroad);
    }
}

if (room == rm_Flowers) {
    if (x <= margin) {
        global.spawn_dir = "right";
        room_goto(rm_Crossroad);
    }
}

if (room == rm_Statue) {
    if (y >= room_height - margin) {
        global.spawn_dir = "up";
        room_goto(rm_Crossroad);
    }
}



// ===== ITENS COLETADOS =====
if (inv_wood == 1 && inv_sail == 1 && inv_rope == 1 && !global.items_collected) {
    global.items_collected = true;
    dialogue_start([
        "You did it! You collected all the items.",
        "Now go back to the beach and fix your boat."
    ]);
}

// ===== DIÁLOGO DE BEACH SOBRE O BARCO =====
if (room == rm_Beach && global.items_collected && !global.boat_fixed && !global.dialogue_beach_boat) {
    dialogue_start([
        "Go to your boat and press Enter."
    ]);
    global.dialogue_beach_boat = true;
}

// ===== INTERAÇÃO COM O BARCO =====
var boat = instance_nearest(x, y, obj_boat);
if (boat != noone && global.dialogue_beach_boat && keyboard_check_pressed(vk_enter)) {
    boat.sprite_index = spr_boat; 
    boat.image_index = 0;
    boat.image_speed = 0.2;
    global.boat_fixed = true;
    global.boat_delay_timer = 0;
}

// ===== DELAY PARA MUDAR DE CENA =====
if (global.boat_fixed) {
    global.boat_delay_timer++;
    if (global.boat_delay_timer >= room_speed * 3) {
        room_goto(rm_credits);
    }
}

// ===== INVENTÁRIO =====
var p = instance_find(obj_player, 0);
if (p != noone) {
    var ui_x = display_get_gui_width() - 320;
    var ui_y = display_get_gui_height() - 300;
    var backpack_scale = 5;
    var item_scale = backpack_scale * 1;

    draw_sprite_ext(spr_backpack, 0, ui_x, ui_y, backpack_scale, backpack_scale, 0, c_white, 1);

    var bw = sprite_get_width(spr_backpack) * backpack_scale;
    var bh = sprite_get_height(spr_backpack) * backpack_scale;

    var slot_margin_x = bw * 0.30;
    var slot_margin_y = bh * 0.30;
    var slot_gap_x = bw * 0.42;
    var slot_gap_y = bh * 0.40;

    function draw_item(_spr, _sx, _sy, _scale) {
        var iw = sprite_get_width(_spr) * _scale;
        var ih = sprite_get_height(_spr) * _scale;
        draw_sprite_ext(_spr, 0, _sx - iw*0.5, _sy - ih*0.5, _scale, _scale, 0, c_white, 1);
    }

    var s1x = ui_x + slot_margin_x;
    var s1y = ui_y + slot_margin_y;
    var s2x = ui_x + slot_margin_x + slot_gap_x;
    var s2y = ui_y + slot_margin_y;
    var s3x = ui_x + slot_margin_x;
    var s3y = ui_y + slot_margin_y + slot_gap_y;

    if (p.inv_wood == 1) draw_item(spr_item_wood, s1x, s1y, item_scale);
    if (p.inv_sail == 1) draw_item(spr_item_sail, s2x, s2y, item_scale);
    if (p.inv_rope == 1) draw_item(spr_item_rope, s3x, s3y, item_scale);
}
