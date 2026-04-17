if (layer_instance_get_instance(event_data[? "element_id"]) == id) {
	if (event_data[? "message"] == "hit") {
    	with (obj_player) { // so so, double check "instance_place"
            if (instance_place(x, y, other) != noone or instance_place(other.x, other.y, obj_enemy_void)) {
                global.hp -= 10 //damage
            }	
        }
    }
}