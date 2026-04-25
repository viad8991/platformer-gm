if (hp > 0) {
    instance_create_layer(obj_player.x , obj_player.y, global.InstancesUpper, obj_boss_tiny_spike)
    alarm[0] = game_get_speed(gamespeed_fps) * 3;	
}
