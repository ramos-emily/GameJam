switch (global.spawn_dir) {

    case "up":
        x = room_width / 2;
        y = 20;
        break;

    case "down":
        x = room_width / 2;
        y = room_height - 20;
        break;

    case "left":
        x = 20;
        y = room_height / 2;
        break;

    case "right":
        x = room_width - 20;
        y = room_height / 2;
        break;
}

if (room == rm_Crossroad && !global.dialogue_crossroad) {
    dialogue_start([
        "...Daniel?",
        "O que você está fazendo aqui?",
        "Sereias? Que jeito idiota de perder seu barco.",
        "Tanto faz. Já que você está aqui, temos bastante tempo para conversar.",
        "Cuidado com a escuridão. Você não sabe o que se esconde nela."
    ]);

    global.dialogue_crossroad = true;
}




if (room == rm_Flowers) {
    flowers_steps = 0;
    flowers_dead = false;
    flowers_kill_pending = false;

    dialogue_start([
        "Não se mova.",
        "Cuidado onde pisa. As flores. Elas são minhas."
    ]);
	
	 global.dialogue_flowers = true;
}


