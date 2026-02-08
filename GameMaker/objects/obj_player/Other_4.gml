x = room_width / 2;
y = room_height / 2;


switch (global.spawn_dir) {

    case "up":
        y = 20;
        break;

    case "down":
        y = room_height - 20;
        break;

    case "left":
        x = 20;
        break;

    case "right":
        x = room_width - 20;
        break;
}
