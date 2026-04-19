if (room_get_name(room) == "level1") {
    switch (get_area()) {
    	case Area.WINTER:
            sprite_index = spr_ground_earth_winter
            break;
        case Area.FOREST: 
            sprite_index = spr_ground_earth
            break;
        case Area.DESERT:
            sprite_index = spr_ground_earth_desert
            break;
        case Area.NONE:
            sprite_index = spr_ground_earth
            break;
    } 
}  else {
    sprite_index = 	spr_ground_moon
}