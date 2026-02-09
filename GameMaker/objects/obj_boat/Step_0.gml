var p = instance_nearest(x, y, obj_player);

// Ativa animação apenas quando o player tiver todos os itens
if (!boat_active && p != noone && global.items_collected && distance_to_object(p) < 16) {
    boat_active = true;
    image_speed = 0.2;  // inicia animação
    image_index = 0;
    boat_timer = 0;
}

// Se já ativado, conta o delay e muda de cena
if (boat_active) {
    boat_timer++;
    if (boat_timer >= room_speed * 3) { // 3 segundos
		instance_destroy(obj_player);
		instance_destroy(obj_ui);
		instance_destroy(obj_light);
		audio_stop_all();
        room_goto(rm_credits);
    }
}