var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _cx = _gw / 2;
var _cy = _gh / 2;
var _spr_w = sprite_get_width(spr_modal);
var _target_width = _gw * 0.7; 
var _scale = _target_width / _spr_w;

draw_sprite_ext(spr_modal, 0, _cx, _cy, _scale, _scale, 0, c_white, 1);


draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_dialogue); 
draw_set_color(c_black);

var _text_x = (_cx - (_target_width / 2)) + 40;


// Intro
draw_text(_text_x, _cy - 120, text_intro);

// Controles
draw_text(_text_x, _cy - 20, text_controls);

// Regras
draw_text(_text_x, _cy + 40, text_rules_title);
var _bad_text_y = _cy + 70;
draw_text(_text_x, _bad_text_y, text_rule_bad);
var _str_w = string_width(text_rule_bad);
draw_line_width(
    _text_x - 5, 
    _bad_text_y, 
    _text_x + _str_w + 5, 
    _bad_text_y, 
    3
);


draw_text(_text_x, _cy + 110, text_rule_good);


draw_text_transformed(_text_x, _cy + 170, text_footer, 1, 1, 0); 
draw_set_color(c_white);
draw_set_halign(fa_center);