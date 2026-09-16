if (keyboard_check_pressed(vk_up)) selection = max(0, selection - 1);
if (keyboard_check_pressed(vk_down)) selection = min(2, selection + 1);

if (keyboard_check_pressed(vk_enter)) {
    apply_powerup(selection);
    instance_destroy(); // Close menu
}

// function to apply the selected power-up
function apply_powerup(index) {
    switch (index) {
        case 0: // speed boost
            obj_player.move_speed += 0.5;
            break;
        case 1: // damage boost
            obj_player.damage += 3;
            break;
        case 2: // hp boost
            obj_player.hp_total += 15;
            obj_player.hp = obj_player.hp_total;
            break;
    }
}