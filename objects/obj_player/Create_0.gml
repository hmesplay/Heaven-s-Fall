move_speed = 1;
xSpeed = 0;
ySpeed = 0;

global.room = 0;
persistent = true;

mask_index = sprite_index;

hp = 10;
hp_total = hp;
damage = 2;

facing = 0;

level = 1;
xp = 0;
xp_require = 100;

//dash var
is_dashing = false;

dash_speed = 4;

dash_cooldown = 0.2;

//stamina
stamina = 100;
stamina_max = 100;
stamina_regen = 10;
stamina_use = 25;
stamina_regen_timer = 0;

//level up function
function add_xp(_xp_to_add){
    xp += _xp_to_add;
    if (xp >= xp_require){
        level++;
        xp -= xp_require;
        xp_require *= 1.2;
        
        hp_total += 4;
        hp = hp_total;
        damage += 0.5;
        stamina_max += 5;
        stamina = stamina_max;
        //power up menu
        instance_create_depth(x,y,0,obj_power_up)
    }
}
