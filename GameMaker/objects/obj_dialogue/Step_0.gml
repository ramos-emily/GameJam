if (!active) exit;

timer++;

if (timer >= delay) {
    timer = 0;

    if (current_index < array_length(lines)) {
        array_push(visible_lines, lines[current_index]);
        current_index++;
    }

    if (array_length(visible_lines) > max_lines_on_screen) {
        array_delete(visible_lines, 0, 1);
    }

    if (current_index >= array_length(lines) && array_length(visible_lines) == 0) {
        active = false;
    }
}
