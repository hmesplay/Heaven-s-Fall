if(instance_exists(obj_power_up)){
    return;
} 
if (alarm[0] < 0){
    hp -= other.damage;
    alarm[0] = 60;
    image_blend = c_red;
    
    if (hp <= 0){
        game_restart();
    }
}