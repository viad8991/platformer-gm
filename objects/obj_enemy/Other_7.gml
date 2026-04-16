if (sprite_index == spr_enemy_attack) {
    with (obj_player) { // so so, double check "instance_place"
        if ((instance_place(x, y, other) != noone) or instance_place(other.x, other.y, obj_enemy)) {
            global.hp -= 10	
        }	
    }
    
    sprite_index = spr_enemy_idle
}