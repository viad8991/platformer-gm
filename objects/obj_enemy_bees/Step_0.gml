if (hp <= 0) { 
    if (!place_meeting(x, y - grav, obj_ground)) {
        v_spd += grav	
        move_and_collide(0, v_spd, obj_ground, 5, 0, 0, 0, 2)
    } else {
        v_spd = 0
    }
    
    sprite_index = spr_enemy_bees_dead
    
	return;
}

var _obj_player_y = obj_player.y - obj_player.sprite_height / 2;

var _is_see_player = !collision_line(x, y, obj_player.x, _obj_player_y, obj_ground, false, true)
var _distance_to_player = point_distance(x, y, obj_player.x, _obj_player_y);

if (_is_see_player and _distance_to_player > 4 and _distance_to_player < 100) {
    var _direction_to_player_x = sign(obj_player.x - x);
    rotate_to_player(_direction_to_player_x);
    
    if (sprite_index != spr_enemy_bees_walk) {
        sprite_index = spr_enemy_bees_walk	
    }
    
    move_towards_point(obj_player.x + _rand_value_1, _obj_player_y + _rand_value_2, move_spd)
} else { 
    speed = 0   
    
    if (sprite_index != spr_enemy_bees_idle) {
        sprite_index = spr_enemy_bees_idle;
    }
}

if (_is_see_player and place_meeting(x, y, obj_player)) { // если _is_see_player - false, не вычислять place_meeting
    if (attack_delay <= 0) { 
        global.hp -= 1;
        attack_delay = game_get_speed(gamespeed_fps);
    } else {
        attack_delay -= 1;
    }	
}