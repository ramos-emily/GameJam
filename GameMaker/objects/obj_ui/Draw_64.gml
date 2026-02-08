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

        draw_sprite_ext(
            _spr, 0,
            _sx - iw * 0.5,
            _sy - ih * 0.5,
            _scale, _scale,
            0, c_white, 1
        );
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
