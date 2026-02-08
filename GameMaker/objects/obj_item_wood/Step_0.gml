var p = instance_find(obj_player, 0);

if (p != noone && distance_to_object(obj_player) < 16) {
    if (keyboard_check_pressed(vk_space)) {

        switch (item_type) {
            case "wood":
                p.inv_wood = 1;

                dialogue_start([
                    "Ei, Daniel.",
                    "Por que você matou sua esposa?",
                    "Quer dizer, eu entendo.",
                    "Você disse para ela ficar longe do seu dinheiro.",
                    "Você só estava tentando proteger sua filha.",
                    "Sofia tinha um vício enorme em jogos de azar...",
                    "Mas eu não esperava que você desistisse dela tão cedo.",
                    "Principalmente depois que ela te salvou daquilo."
                ]);
            break;

            case "sail":
                p.inv_sail = 1;

                dialogue_start([
                    "Daniel, você não está cansado?",
                    "Trabalha, trabalha, bebe, trabalha...",
                    "Talvez você queira passar o resto dos seus dias aqui comigo.",
                    "Rachel vai conseguir se virar.",
                    "Ela sempre conseguiu.",
                    "Ela te ama.",
                    "E você ama ela... eu acho."
                ]);
            break;

            case "rope":
                p.inv_rope = 1;

                dialogue_start([
                    "Lá está. A corda.",
                    "Engraçado, não é?",
                    "Uma ferramenta para unir coisas...",
                    "Ou para acabar com tudo.",
                    "Você lembra do nó que fez naquela noite, Daniel?",
                    "Ele era perfeito.",
                    "Assim como este."
                ]);
            break;
        }

        instance_destroy();
    }
}
