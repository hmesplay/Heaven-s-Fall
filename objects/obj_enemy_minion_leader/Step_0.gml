if (instance_exists(obj_dialog)) exit;
if (instance_exists(obj_power_up)) exit;
if (!instance_exists(obj_player)) exit;

var player_subroom = tilemap_get_at_pixel(roommap, obj_player.x, obj_player.y);
var enemy_subroom = tilemap_get_at_pixel(roommap, x, y);

if (enemy_subroom != player_subroom) exit;


var min_distance = 30;
var max_distance = 60;

var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y);

// if too close, pick a new target position further away
if (dist_to_player < min_distance) {
    var new_dir = point_direction(obj_player.x, obj_player.y, x, y); // Move away from player
    var move_dist = random_range(min_distance, max_distance);

    // calculate a new target position
    target_x = obj_player.x + lengthdir_x(move_dist, new_dir);
    target_y = obj_player.y + lengthdir_y(move_dist, new_dir);

    // ensure target is inside sub-room
    while (tilemap_get_at_pixel(roommap, target_x, target_y) != enemy_subroom) {
        new_dir += random_range(-30, 30); // Adjust direction slightly
        target_x = obj_player.x + lengthdir_x(move_dist, new_dir);
        target_y = obj_player.y + lengthdir_y(move_dist, new_dir);
    }
}

var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);

if (!place_meeting(x + _hor * move_speed, y, obj_solid)) {
    x += _hor * move_speed; // move only if there's no collision in the x direction
}
if (!place_meeting(x, y + _ver * move_speed, obj_solid)) {
    y += _ver * move_speed; // move only if there's no collision in the y direction
}

// shooting logic
var dir = point_direction(x, y, obj_player.x, obj_player.y);
if (fire_timer <= 0) {
    var bullet = instance_create_depth(x, y, 0, obj_enemy_bullet);
    bullet.direction = dir;
    bullet.speed = bullet_speed;
    bullet.image_angle = dir;
    
    fire_timer = fire_rate; // Reset timer
} else {
    fire_timer--;
}