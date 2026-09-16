if(instance_exists(obj_dialog)) exit;
    
if(instance_exists(obj_power_up)) exit;
    
if (!instance_exists(obj_player)) exit;
    
var player_subroom = tilemap_get_at_pixel(roommap, obj_player.x, obj_player.y);
var enemy_subroom = tilemap_get_at_pixel(roommap, x, y);

if (enemy_subroom != player_subroom) exit;
    
if (alarm[1] >= 0){
    target_x = x + kb_x;
    target_y = y + kb_y;
}

target_x = obj_player.x + random_range(-2, 2);
target_y = obj_player.y + random_range(-2, 2);

while (tilemap_get_at_pixel(roommap, target_x, target_y) != enemy_subroom) {
    target_x = obj_player.x + random_range(-16, 16);
    target_y = obj_player.y + random_range(-16, 16);
}

var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);

if (!place_meeting(x + _hor * move_speed, y, obj_solid) && !place_meeting(x + _hor * move_speed, y, obj_enemy_parent)) {
    x += _hor * move_speed; // move only if there's no collision in the x direction
}
if (!place_meeting(x, y + _ver * move_speed, obj_solid) && !place_meeting(x, y + _ver * move_speed, obj_enemy_parent)) {
    y += _ver * move_speed; // move only if there's no collision in the y direction
}
//move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap, obj_enemy_parent]);