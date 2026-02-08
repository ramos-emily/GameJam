var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _cx = _gui_w / 2;
var _cy = _gui_h / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu); 


draw_set_color(c_white);
draw_text(_cx, _gui_h * 0.2, "DANIEL"); 

for (var i = 0; i < array_length(options); i++) {
    var _color = c_gray;
    var _text = options[i];

    if (i == selected_index) {
        _color = c_white;
        _text = "o  " + _text + "  o"; 
    }

    draw_set_color(_color);
    draw_text(_cx, _cy + (i * 120), _text);
}