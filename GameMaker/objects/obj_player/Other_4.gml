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

if (room == rm_Crossroad) {
    dialogue_start([
        "...Daniel?",
        "O que você está fazendo aqui?",
        "Sereias? Que jeito idiota de perder seu barco.",
        "Tanto faz. Já que você está aqui, temos bastante tempo para conversar.",
        "Cuidado com a escuridão. Você não sabe o que se esconde nela."
    ]);
}
