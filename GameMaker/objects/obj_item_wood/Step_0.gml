var p = instance_find(obj_player, 0);

if (p != noone && distance_to_object(obj_player) < 16) {
    if (keyboard_check_pressed(vk_space)) {

        switch (item_type) {
            case "wood":
                p.inv_wood = 1;

                dialogue_start([
                    "Hey, Daniel.",
                    "Why did you kill your wife?",
                    "I mean, I get it.",
                    "You told her to stay away from your money.",
                    "You were just trying to protect your daughter.",
                    "Sofia had a huge gambling addiction...",
                    "But I didn't expect you to give up on her so soon.",
                    "Especially after she saved you from that."
                ]);
            break;

            case "sail":
                p.inv_sail = 1;

                dialogue_start([
                    "Daniel, aren't you tired?",
                    "Work, work, drink, work...",
                    "Maybe you want to spend the rest of your days here with me.",
                    "Rachel will manage.",
                    "She's managed all this time.",
                    "She loves you.",
                    "And you love her... I guess."
                ]);
            break;

            case "rope":
                p.inv_rope = 1;

                dialogue_start([
                    "There it is. The rope.",
                    "Funny, isn't it?",
                    "A tool to bind things together...",
                    "Or to end things forever.",
                    "Do you remember the knot you tied that night, Daniel?",
                    "It was perfect.",
                    "Just like this one."
                ]);
            break;
        }

        instance_destroy();
    }
}
