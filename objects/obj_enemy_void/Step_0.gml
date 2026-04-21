if (hp <= 0) {
    if (sprite_index != spr_enemy_void_dead and scale > 0.75) { 
        with (instance_create_layer(x - 3, y - 3, global.Instances, obj_enemy_void)) { 
            face = other.face
            scale = other.scale - 0.25
        }
        
        with (instance_create_layer(x + 3, y - 3, global.Instances, obj_enemy_void)) { 
            face = other.face
            scale = other.scale - 0.25
        }
    }
    
    if (!place_meeting(x, y, global.ground_tiles)) {
        v_spd += global.grav	
        move_and_collide(0, v_spd, global.ground_tiles, 4, 0, 0, 0, global.max_fall_speed)
        y = round(y)
    }
    
    sprite_index = spr_enemy_void_dead
	return;
}

var _is_see_player = !collision_line(x, y - (sprite_height), obj_player.x, obj_player.y - obj_player.sprite_height, global.ground_tiles, false, true)
var _distance_to_player = abs(obj_player.x - x + _rand_value_1)
var _direction_to_player = sign(obj_player.x - x);

if (attack_delay > 0) {
    attack_delay -= 1;
}


/*if (id == "100011") {
    show_debug_message($"attDel: {attack_delay}, dis: {_distance_to_player}, see: {_is_see_player}, sprite: {sprite_index}")
}*/

if (_is_see_player) {
	if (sprite_index == spr_enemy_void_attack) {
    	h_spd = 0;
    } else if ((16 * scale) < _distance_to_player and _distance_to_player < 120) {
    	h_spd = _direction_to_player * move_spd
    } else {
    	h_spd = 0;
    }
} else {
	h_spd = 0;
}

if (place_meeting(x, y + 1, global.ground_tiles)) {
    v_spd = 0
} else if (v_spd > global.max_fall_speed) {
	v_spd = global.max_fall_speed;
} else {
    v_spd += global.grav
}

move_and_collide(h_spd, v_spd, global.ground_tiles, 10, 0, 0, move_spd, global.max_fall_speed)
y = round(y)

if (_is_see_player and _distance_to_player < 120 and sprite_index != spr_enemy_void_attack) {
	rotate_to_player(_direction_to_player)
}

if (_is_see_player and _distance_to_player < (16 * scale) and attack_delay <= 0) {
	sprite_index = spr_enemy_void_attack
    image_index = 0
    attack_delay = game_get_speed(gamespeed_fps) * 6
} else if (h_spd != 0) {
    sprite_index = spr_enemy_void_walk
} else if (sprite_index != spr_enemy_void_attack) {
    sprite_index = spr_enemy_void_idle
}
