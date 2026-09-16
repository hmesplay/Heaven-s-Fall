//dialog check
if(instance_exists(obj_dialog)){
    exit;
} 
//powerup check
if(instance_exists(obj_power_up)){
    exit;
} 
//facing
var hor = real(keyboard_check(ord("D")) - keyboard_check(ord("A")));
var ver = real(keyboard_check(ord("S")) - keyboard_check(ord("W")));

//dash method
if (keyboard_check_pressed(vk_shift) && !is_dashing && stamina >= stamina_use) {
    is_dashing = true;
    stamina -= stamina_use;
    alarm[1] = room_speed * dash_cooldown;
}
//movement
if (is_dashing) {
    if (!place_meeting(x + hor * dash_speed, y, obj_solid) && !place_meeting(x + hor * dash_speed, y, obj_enemy_minion_leader)) {
        x += hor * dash_speed; // move only if there's no collision in the x direction
    }
    if (!place_meeting(x, y + ver * dash_speed, obj_solid) && !place_meeting(x, y + ver * dash_speed, obj_enemy_minion_leader)) {
        y += ver * dash_speed; // move only if there's no collision in the y direction
    }
}else{
    if (!place_meeting(x + hor * move_speed, y, obj_solid) && !place_meeting(x + hor * move_speed, y, obj_enemy_minion_leader)) {
        x += hor * move_speed; // move only if there's no collision in the x direction
    }
    if (!place_meeting(x, y + ver * move_speed, obj_solid) && !place_meeting(x, y + ver * move_speed, obj_enemy_minion_leader)) {
        y += ver * move_speed; // move only if there's no collision in the y direction
    }
}

//sprite
if (hor != 0 or ver != 0){
    if (ver > 0) sprite_index = spr_player_walk_down;
    else if (ver < 0) sprite_index = spr_player_walk_up;
    else if (hor > 0) sprite_index = spr_player_walk_right;
    else if (hor < 0) sprite_index = spr_player_walk_left;
        
    facing = point_direction(0,0,hor,ver);
}else{
    if (sprite_index = spr_player_walk_down) sprite_index = spr_player_idle_down;
        else if (sprite_index = spr_player_walk_up) sprite_index = spr_player_idle_up;
        else if (sprite_index = spr_player_walk_right) sprite_index = spr_player_idle_right;
        else if (sprite_index = spr_player_walk_left) sprite_index = spr_player_idle_left;
}
//Attack Method
if (keyboard_check_pressed(vk_space)){
    var _inst = instance_create_depth(x, y, depth, obj_attack);
    _inst.image_angle = facing;
    _inst.damage *= damage;
    audio_play_sound(hit_swing_sword_small,0,false);
}
//stamina regen
stamina_regen_timer += 1;
if (stamina_regen_timer >= room_speed){
    stamina = min(stamina + stamina_regen, stamina_max);
    stamina_regen_timer = 0;
}