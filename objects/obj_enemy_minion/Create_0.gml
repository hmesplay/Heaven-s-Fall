target_x = x;
target_y = y;

alarm[0] = 60;

kb_x = 0;
kb_y = 0;

//subroom detection
roommap = layer_tilemap_get_id("Tiles_SubRooms");

//stats increase based on level
hp = 6 + (10 * global.room);
damage = 1 + (5 * global.room);
move_speed = 1 + (.2 * global.room);
xp_value = 30 + (15 * global.room);