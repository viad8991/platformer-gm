if (state == StateAltar.IDLE and place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("E"))) {
    state = StateAltar.RELOAD
    
    with (obj_boss_tiny) {
        if (hp <= 0) {
            instance_destroy()
        }
    }
    
    instance_create_layer(x, y, "InstancesLower", obj_boss_tiny)
    
    alarm[0] = game_get_speed(gamespeed_fps) * 60
}
