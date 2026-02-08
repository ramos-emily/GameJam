if (other.flowers_dead) exit;

// impede múltiplas flores no mesmo frame
if (other.flowers_cooldown > 0) exit;

// ativa cooldown (0.3 segundos)
other.flowers_cooldown = room_speed * 0.3;

other.flowers_steps += 1;

switch (other.flowers_steps) {

    case 1:
        dialogue_start([
            "Eu pedi para você não pisar nas flores."
        ]);
        break;

    case 2:
        dialogue_start([
            "Você está forçando a barra. Fique longe das MINHAS flores."
        ]);
        break;

	case 3:
	    dialogue_start([
	        "Tudo bem. Faça do seu jeito então. Eu avisei.",
			"Agora você se junta a elas."
	    ]);
		global.dialogue_beach_after_death = true;

	    other.flowers_kill_pending = true;
	    other.alarm[0] = room_speed * 2;
	    break;

}
