if(instance_exists(obj_dialog)) exit;
    
if(instance_exists(obj_power_up)) exit;
    

//destroys bullet if it goes off screen
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}