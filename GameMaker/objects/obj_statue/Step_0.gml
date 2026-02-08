var p = instance_find(obj_player, 0);
if (p == noone) exit;

// ==========================
// CONFIG
// ==========================
var detect_dist = 140;   // alcance da lanterna
var kill_dist   = 14;    
var statue_speed = 0.35; 
var cone_angle  = 50;    // cone mais aberto (facilita)

// ==========================
// DISTÂNCIA PLAYER -> STATUE
// ==========================
var d = point_distance(p.x, p.y, x, y);

// ==========================
// CHECAR SE A LUZ PEGA NA STATUE
// ==========================
var in_light = false;

if (p.flashlight_on) {

    // bounding box da statue
    var left   = bbox_left;
    var right  = bbox_right;
    var top    = bbox_top;
    var bottom = bbox_bottom;

    // pontos da statue (centro + cantos)
    var pts = [
        [x, y],
        [left, top],
        [right, top],
        [left, bottom],
        [right, bottom]
    ];

    for (var i = 0; i < array_length(pts); i++) {
        var px = pts[i][0];
        var py = pts[i][1];

        var dir_to_point = point_direction(p.x, p.y, px, py);
        var angle_diff = angle_difference(p.smooth_dir, dir_to_point);

        if (abs(angle_diff) < cone_angle && point_distance(p.x, p.y, px, py) < detect_dist) {
            in_light = true;
            break;
        }
    }
}

// ==========================
// MOVIMENTO DA STATUE
// ==========================
if (!in_light) {
    var move_dir = point_direction(x, y, p.x, p.y);
    x += lengthdir_x(statue_speed, move_dir);
    y += lengthdir_y(statue_speed, move_dir);
}

// ==========================
// MORTE
// ==========================
if (d < kill_dist && !in_light) {
    with (p) {
        player_die();
    }
}
