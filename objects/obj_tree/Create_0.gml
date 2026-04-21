is_before = (layer_get_name(layer) == global.InstancesUpper);

if (room_get_name(room) == "level1") {
    switch (get_area()) {
    	case Area.WINTER:
            sprite_index = spr_tree_winter
            break;
        case Area.FOREST: 
            sprite_index = spr_tree
            break;
        case Area.DESERT:
            sprite_index = spr_tree
            break;
        case Area.NONE:
            sprite_index = spr_tree
            break;
    } 
}  else {
    sprite_index = 	spr_tree
}
