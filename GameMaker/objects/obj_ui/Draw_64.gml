var p = instance_find(obj_player, 0);

if (p != noone) {

    var ui_x = display_get_gui_width() - 200;
    var ui_y = display_get_gui_height() - 140;

    // desenha a mochila (caixa)
    draw_sprite(spr_backpack, 0, ui_x, ui_y);

    // posições dos slots dentro da mochila
    var slot_x = ui_x + 30;
    var slot_y = ui_y + 25;
    var gap = 32; // espaço entre itens

    // madeira
    if (p.inv_wood == 1) {
        draw_sprite(spr_item_wood, 0, slot_x, slot_y);
    }

    // vela
    if (p.inv_sail == 1) {
        draw_sprite(spr_item_sail, 0, slot_x, slot_y + gap);
    }

    // corda
    if (p.inv_rope == 1) {
        draw_sprite(spr_item_rope, 0, slot_x, slot_y + gap * 2);
    }
}
