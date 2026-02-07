if (!surface_exists(light_surface)) {
    light_surface = surface_create(room_width, room_height);
}

surface_set_target(light_surface);
draw_clear(c_black);

var p = instance_find(obj_player, 0);

if (p != noone && p.flashlight_on) {

    var length = 70;
    var spread = 30;
    var steps = 40;
    var ox = 0;
    var oy = 0;

    if (p.smooth_dir > 45 && p.smooth_dir < 135) { 
        oy = 8; 
    }
    else if (p.smooth_dir > 225 && p.smooth_dir < 315) { 
        oy = -8; 
    }
    else if (p.smooth_dir <= 45 || p.smooth_dir >= 315) { 
        ox = 6; 
        oy = -10; 
    }
    else if (p.smooth_dir >= 135 && p.smooth_dir <= 225) { 
        ox = -6; 
        oy = -10; 
    }

    for (var i = 0; i < steps; i++) {
        var t = i / steps;
        var dist = length * t;
        var width = spread * t;
        var alpha = 0.20 * (1 - t);

        var px = (p.x + ox) + lengthdir_x(dist, p.smooth_dir);
        var py = (p.y + oy) + lengthdir_y(dist, p.smooth_dir);

        draw_set_alpha(alpha);
        draw_set_color(c_white);
        draw_circle(px, py, width, false);
    }
}

draw_set_alpha(1);
surface_reset_target();

draw_surface(light_surface, 0, 0);
