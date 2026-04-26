if (layer_instance_get_instance(event_data[? "element_id"]) == id) {
	if (event_data[? "message"] == "hit") { 
        with (obj_player) {
            if (instance_place(x, y, other)) {
                global.hp -= other.damage
            }	
        }
    }
}
