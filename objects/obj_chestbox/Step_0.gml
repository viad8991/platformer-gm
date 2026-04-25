if (is_open) {
	return;
}

if (place_meeting(x, y, obj_player) && global.keys > 0 && keyboard_check_pressed(ord("E"))) {
    global.keys -= 1
	is_open = true
    image_index = item.rare
    
    instance_create_layer(x, y - 4, global.InstancesUpper, item.obj)
}

if (keyboard_check_pressed(ord("Q"))) {
	is_open = true
    image_index = item.rare
    
    instance_create_layer(x, y - 4, global.InstancesUpper, item.obj)
}
    