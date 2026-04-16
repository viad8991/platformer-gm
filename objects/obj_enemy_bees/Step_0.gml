if (hp <= 0) {
    speed = 0;
    sprite_index = spr_enemy_bees_dead
	return;
}

var _temp_y = obj_player.y - obj_player.sprite_height / 2;

var _distance_to_player = point_distance(x, y, obj_player.x, _temp_y);
var _direction_to_player_x = sign(round(obj_player.x) - round(x));
var _direction_to_player_y = sign(round(_temp_y) - round(y));

// in range attack:
//  stay and attack
if (_distance_to_player < 2) { 
    // speed = 0;
    
    rotate_to_player(_direction_to_player_x); 
    
    if (attack_delay <= 0) {
        global.hp -= 1;
        attack_delay = game_get_speed(gamespeed_fps);
    } else {
        attack_delay -= 1;
    }
} else if (_distance_to_player < 100) {
    rotate_to_player(_direction_to_player_x);
    
    if (sprite_index != spr_enemy_bees_walk) {
        sprite_index = spr_enemy_bees_walk	
    }
    
    move_towards_point(obj_player.x, obj_player.y - (obj_player.sprite_height / 2), move_spd)
} else {
    // out of range attack:
    //   stay and idle
    
    h_spd = 0;
    v_spd = 0;
    
    if (sprite_index != spr_enemy_bees_idle) {
        sprite_index = spr_enemy_bees_idle;
    }
}