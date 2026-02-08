var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _cx = _gw / 2;
var _cy = _gh / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu);
draw_set_color(c_white);

// head
draw_text_transformed(_cx, _gh * 0.15, "Thanks for playing", 2, 2, 0);

// main
var _credits_text = "Emily Ramos\n\nGabriel Deolindo";
draw_text(_cx, _cy, _credits_text);


// footer
draw_set_color(c_gray);
draw_text(_cx, _gh * 0.9, "PRESS ESC TO RETURN");
draw_set_color(c_white);