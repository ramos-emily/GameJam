function dialogue_start(_lines) {
    if (!instance_exists(obj_dialogue)) {
        instance_create_layer(0, 0, "Instances", obj_dialogue);
    }

    var d = instance_find(obj_dialogue, 0);

    d.lines = _lines;
    d.visible_lines = [];
    d.current_index = 0;
    d.timer = 0;
    d.active = true;
}
