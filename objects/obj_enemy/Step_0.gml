if (hp <= 0) {
    sprite_index = spr_enemy_dead
	return;
}

v_spd += grav

var _sub_pixel = 0.5;

// horizonatal

var _distance_to_player = distance_to_object(obj_player);
var _direction_to_player = sign(obj_player.x - x);

if (_distance_to_player < 10) {
    // in range attack:
    //  stay and attack
    
    rotate_to_player(_direction_to_player);
    
    h_spd = 0;
    if (attack_delay <= 0) {
        is_attack = true
        attack_delay = game_get_speed(gamespeed_fps) * 2
        
        sprite_index = spr_enemy_attack
    } else {
        attack_delay -= 1;
    }
} else if (_distance_to_player < 100) {
    // in range view:
    //  just walk
    
    rotate_to_player(_direction_to_player);
    
	h_spd = _direction_to_player * move_spd;
    if (place_meeting(x + h_spd, y, obj_ground)) {  
        var _pixel_check = _sub_pixel * sign(h_spd);

        while (!place_meeting(x + _pixel_check, y, obj_ground)) {
            x += _pixel_check;
        } 
        h_spd = 0; 
    }
    
    sprite_index = spr_enemy_walk
} else {
    // out of range attack:
    //   stay and idle
    h_spd = 0;
    sprite_index = spr_enemy_idle
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