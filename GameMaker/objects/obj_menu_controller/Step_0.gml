var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
var _confirm = keyboard_check_pressed(vk_enter);


if (_up) {
    selected_index -= 1;
    if (selected_index < 0) {
        selected_index = array_length(options) - 1;
    }
}

if (_down) {
    selected_index += 1;
    if (selected_index >= array_length(options)) {
        selected_index = 0;
    }
}

if (_confirm) {
    var _destino = target_rooms[selected_index];

    if (_destino == rm_Beach) {
        audio_stop_sound(snd_menu);
    }
    room_goto(_destino);
}