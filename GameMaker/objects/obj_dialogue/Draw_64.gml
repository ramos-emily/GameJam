if (!active) exit;


var margin = 30;
var line_height = 42; 

var box_w = 850;

var ui_x = display_get_gui_width() - box_w - margin;
var ui_y = margin;

var scale = 1.4;

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_dialogue);


for (var i = 0; i < array_length(visible_lines); i++) {
    draw_text_transformed(
        ui_x,
        ui_y + i * line_height,
        visible_lines[i],
        scale,
        scale,
        0
    );
}
