options = ["PLAY", "CREDITS"];
target_rooms = [rm_Beach, rm_credits];
selected_index = 0; 

if (!audio_is_playing(snd_menu)) {
    audio_play_sound(snd_menu, 10, true);
}