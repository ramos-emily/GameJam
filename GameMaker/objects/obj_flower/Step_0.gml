var _player = instance_place(x, y, obj_player);

if (_player != noone) {
    

    if (_player.inv_wood == 1) exit;
    if (_player.flowers_dead) exit;

    if (!triggered) {
        
        triggered = true;
        _player.flowers_steps += 1;

        switch (_player.flowers_steps) {
            case 1:
                dialogue_start(["I asked you not to step on the flowers."]);
                break;

            case 2:
                dialogue_start(["You are pushing it. Stay away from MY flowers."]);
                break;

            case 3:
                dialogue_start([
                    "Fine. Have it your way then. I warned you.",
                    "Now you join them."
                ]);
                
                global.dialogue_beach_after_death = true;
                _player.flowers_kill_pending = true;
                _player.alarm[0] = room_speed * 2;
                break;
        }
    }
} 
else {
    triggered = false;
}