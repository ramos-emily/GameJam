if (other.flowers_dead) exit;

// impede múltiplas flores no mesmo frame
if (other.flowers_cooldown > 0) exit;

// ativa cooldown (0.3 segundos)
other.flowers_cooldown = room_speed * 0.3;

other.flowers_steps += 1;

switch (other.flowers_steps) {

    case 1:
        dialogue_start([
            "I asked you not to step on the flowers."
        ]);
        break;

    case 2:
        dialogue_start([
            "You are pushing it. Stay away from MY flowers."
        ]);
        break;

	case 3:
	    dialogue_start([
	        "Fine. Have it your way then. I warned you.",
			"Now you join them."
	    ]);
		global.dialogue_beach_after_death = true;

	    other.flowers_kill_pending = true;
	    other.alarm[0] = room_speed * 2;
	    break;

}
