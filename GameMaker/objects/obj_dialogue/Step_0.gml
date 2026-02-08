if (!active) exit;

timer++;

if (timer >= delay) {
    timer = 0;

    // adiciona nova linha
    if (current_index < array_length(lines)) {
        array_push(visible_lines, lines[current_index]);
        current_index++;
    }

    // se passar do limite de linhas visíveis, remove a primeira
    if (array_length(visible_lines) > max_lines_on_screen) {
        array_delete(visible_lines, 0, 1);
    }

    // terminou tudo? encerra diálogo
    if (current_index >= array_length(lines) && array_length(visible_lines) == 0) {
        active = false;
    }
}
