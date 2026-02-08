if (!instance_exists(player)) exit;

switch (state) {

    case "INTRO":
        if (!player.flashlight_on) {
            player.can_move = true; 
            state = "PLAYING";      
        }
        break;

    case "PLAYING":
        
        if (player.inv_rope == 1) {
            state = "CLEARED";
            break;
        }
        if (player.flashlight_on) {
            dialogue_start(["I said no eyes."]); 
            state = "PUNISH"; 
            player.can_move = false; 
            player.hsp = 0;
            player.vsp = 0;
            alarm[0] = 120; 
        }
        break;
        
    case "PUNISH":
        break;
    case "CLEARED":
        break;
}