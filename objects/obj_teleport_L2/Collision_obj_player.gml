if (can_teleport) { // check if teleportation is allowed
    //show_debug_message("Teleporting to room: " + string(targetRoom));

    // teleport the player to the new room
    room_goto(targetRoom);
    global.room = 1;

    // wait for the room to change then set the player's position
    if (instance_exists(obj_player)) {
        obj_player.x = target_x; // Set the player's x position
        obj_player.y = target_y; // Set the player's y position
    }

    // prevent further teleportation until the next step
    can_teleport = false; 
}