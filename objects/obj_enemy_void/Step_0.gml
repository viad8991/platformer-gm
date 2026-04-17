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

v_spd += grav

var _sub_pixel = 0.5;
var _is_see_player = !collision_line(x, y - (sprite_height), obj_player.x, obj_player.y - obj_player.sprite_height, obj_ground, false, true)
var _distance_to_player = abs(obj_player.x - x + _rand_value_1)
var _direction_to_player = sign(obj_player.x - x);

if (attack_delay >= 0) {
    attack_delay -= 1;
}

// horizonatal

/*if (id == "100014") {
    show_debug_message(string(attack_delay))
    show_debug_message(string(sprite_index))
}*/

if (_is_see_player and _distance_to_player < (16 * scale)) {  
	// in range attack:
    //  stay and attack
    
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
    rotate_to_player(_direction_to_player);
    sprite_index = spr_enemy_void_walk
    
	h_spd = _direction_to_player * move_spd;
    if (place_meeting(x + h_spd, y, obj_ground)) {  
        var _pixel_check = _sub_pixel * sign(h_spd);

        while (!place_meeting(x + _pixel_check, y, obj_ground)) {
            x += _pixel_check;
        } 
        h_spd = 0; 
        sprite_index = spr_enemy_void_idle
    }
} else { 
    h_spd = 0; 
    sprite_index = spr_enemy_void_idle
    image_index = 0
}

x += h_spd

// verticval

if (v_spd > fall_max_speed) {
	v_spd = fall_max_speed;
}
  
if (place_meeting(x, y + v_spd, obj_ground)) {
	var _pixel_check = _sub_pixel * sign(v_spd);
    while (!place_meeting(x, y + _pixel_check, obj_ground)) {
    	y += _pixel_check;
    }
    
	v_spd = 0;
}

y += v_spd;

// other