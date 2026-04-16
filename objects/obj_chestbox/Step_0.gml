if (is_open) {
	return;
}

if (
    (place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("E")))
        or keyboard_check_pressed(ord("Q"))
) {
	is_open = true
    image_index = item.rare
    
    instance_create_layer(x, y - 4, "InstancesUpper", item.obj)
}