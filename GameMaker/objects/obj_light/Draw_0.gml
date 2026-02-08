if (room != rm_Beach) {
    if (!surface_exists(light_surface)) {
        light_surface = surface_create(room_width, room_height);
    }
    surface_set_target(light_surface);
    draw_clear(c_black);
    var p = instance_find(obj_player, 0);
    if (p != noone) {
        if (p.flashlight_on) {
            var _lantern_angle = p.dir;
            var ox = 0;
            var oy = 0;
            if (_lantern_angle > 45 && _lantern_angle < 135) { 
                oy = 8;
            }
            else if (_lantern_angle > 225 && _lantern_angle < 315) { 
                oy = -8; 
            }
            else if (_lantern_angle >= 135 && _lantern_angle <= 225) { 
                ox = -6; 
                oy = -10; 
            }
            else { 
                ox = 6; 
                oy = -10; 
            }
            var length = 70;
            var spread = 30;
            var steps = 40;

            for (var i = 0; i < steps; i++) {
                var t = i / steps;
                var dist = length * t;
                var width = spread * t;
                var alpha = 0.60 * (1 - t);


                var px = (p.x + ox) + lengthdir_x(dist, _lantern_angle);
                var py = (p.y + oy) + lengthdir_y(dist, _lantern_angle);

                draw_set_alpha(alpha);
                draw_set_color(c_white);
                draw_circle(px, py, width, false);
            }
        }
        else {

            var radius = 20; 
            var steps = 20;
            for (var i = 0; i < steps; i++) {
                var t = i / steps;
                var r = radius * t;
                var alpha = 0.25 * (1 - t);
                draw_set_alpha(alpha);
                draw_set_color(c_white);
                draw_circle(p.x, p.y - 10, r, false);
            }
        }
    }

    draw_set_alpha(1);
    surface_reset_target();
    draw_surface(light_surface, 0, 0);
}