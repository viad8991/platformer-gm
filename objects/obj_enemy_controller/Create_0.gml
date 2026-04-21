alarm[0] = game_get_speed(gamespeed_fps) * 2;

function Enemy(_obj, _alive, _dead) constructor {
    obj =_obj
    alive =_alive
    dead = _dead
}

void = new Enemy(obj_enemy_void, 7, 10)
bees = new Enemy(obj_enemy_bees, 4, 10)

/// @function               spanw(x, y, enemy);
/// @param {real} _x        description
/// @param {real} _y        description
/// @param {Enemy} _enemy   description
function spanw(_x, _y, _enemy) {
    mask_index = object_get_sprite(_enemy.obj);
    var all_count = instance_number(_enemy.obj)
    
    var dead_instants = []
    for (var i = 0; i < all_count; i++) {
        var _inst = instance_find(_enemy.obj, i)
    	if(_inst.hp <= 0) {
            var _distance_to_player = point_distance(_inst.x, _inst.y, obj_player.x, obj_player.y)
            array_push(dead_instants, {id: _inst, dist: _distance_to_player})
        }
    }
    
    array_sort(dead_instants, function(a, b) { return a.dist < b.dist; });
    
    while (array_length(dead_instants) > _enemy.dead) {
        var first_val = array_shift(dead_instants)
    	instance_destroy(first_val.id);
    }
    
    var _alive_count = all_count - array_length(dead_instants)
    if (_alive_count < _enemy.alive) {
        while (place_meeting(_x, _y, global.ground_tiles)) { _y-- } 
        
        instance_create_layer(_x, _y, global.Instances, _enemy.obj);
        // show_debug_message($"x: {_x}, y: {_y} ({get_area_name(get_area_in(_x, _y))}): {_enemy.obj}")    	
    }
}

spanw_forest = function (_x, _y) {
    var enemy = choose(void, bees)
    spanw(_x, _y, enemy)
}

spanw_desert = function (_x, _y) {
    spanw(_x, _y, void)
}

spawn_winter = function (_x, _y) {
    show_debug_message($"x: {_x}, y: {_y}: какой дурак тут будет спавнится?")
}
