if (place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("E"))) { 
    if (room_get_name(room) == "level1") { 
        room_goto(level2) 
    } else { 
        room_goto(level1) 
    }
}