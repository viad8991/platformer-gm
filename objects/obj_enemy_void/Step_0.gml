if (hp <= 0) {
    if (sprite_index != spr_enemy_void_dead and scale > 0.75) { 
        with (instance_create_layer(x - 3, y, "Instances", obj_enemy_void)) { 
            face = other.face
            scale = other.scale - 0.25
        }
        
        with (instance_create_layer(x + 3, y, "Instances", obj_enemy_void)) { 
            face = other.face
            scale = other.scale - 0.25
        }
    }
    
    sprite_index = spr_enemy_void_dead
	return;
}

var _is_see_player = !collision_line(x, y - (sprite_height), obj_player.x, obj_player.y - obj_player.sprite_height, obj_ground, false, true)
var _distance_to_player = abs(obj_player.x - x + _rand_value_1)
var _direction_to_player = sign(obj_player.x - x);

if (attack_delay >= 0) {
    attack_delay -= 1;
}


/*if (id == "100014") {
    show_debug_message(string(attack_delay))
    show_debug_message(string(sprite_index))
}*/

if (_is_see_player and _distance_to_player < (16 * scale)) {  
    h_spd = 0;
    
    if (sprite_index != spr_enemy_void_attack) {
        rotate_to_player(_direction_to_player);
    }
    
    if (sprite_index == spr_enemy_void_walk) {
    	sprite_index = spr_enemy_void_idle
    }
    
    if (attack_delay <= 0) {
        sprite_index = spr_enemy_void_attack
        image_index = 0
        attack_delay = game_get_speed(gamespeed_fps) * 6
    }
} else if (_is_see_player and _distance_to_player < 120 and sprite_index != spr_enemy_void_attack) {
    h_spd = _direction_to_player
    
    rotate_to_player(_direction_to_player);
    
    sprite_index = spr_enemy_void_walk
} else { 
    h_spd = 0;
    
    sprite_index = spr_enemy_void_idle
}

if (place_meeting(x, y + 1, obj_ground)) {
    v_spd = 0
} else if (v_spd > global.max_fall_speed) {
	v_spd = global.max_fall_speed;
} else {
    v_spd += global.grav
}

move_and_collide(h_spd, v_spd, obj_ground, 10, 0, 0, move_spd, global.max_fall_speed)