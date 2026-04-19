var is_up = keyboard_check(ord("W"));
var is_down = keyboard_check(ord("S"));
var is_left = keyboard_check(ord("A"));
var is_right = keyboard_check(ord("D"));

var is_space_pressed = keyboard_check_pressed(vk_space);

var move_dir = is_right - is_left;

var sub_pixel = 0.5;

if (move_dir != 0) {
	face = move_dir;
}

// horizontal
h_spd = move_dir * move_spd;
if (place_meeting(x + h_spd, y, obj_ground)) {
    var pixel_check = sub_pixel * sign(h_spd)
    while (!place_meeting(x + pixel_check, y, obj_ground)) {
    	x += pixel_check
    }
    h_spd = 0;
}

x += round(h_spd)

// vertival
v_spd += global.grav

if (place_meeting(x, y + 1, obj_ground)) {
	jump_current_count = 0;
}

if (is_space_pressed && (place_meeting(x, y + 1, obj_ground) or jump_current_count < global.jump_count)) {
	v_spd = jump_max_speed;
    jump_current_count += 1
}

if (v_spd > global.max_fall_speed) {
	v_spd = global.max_fall_speed
}

if (place_meeting(x, y + v_spd, obj_ground)) {
	var pixel_check = sub_pixel * sign(v_spd);
    while (!place_meeting(x, y + pixel_check, obj_ground)) {
    	y += pixel_check;
    }
	v_spd = 0
}

y += round(v_spd)

// sprite ----- 
if ((h_spd < 0 or h_spd > 0) and v_spd > -1) {
	sprite_index = spr_player_run
} else if (v_spd < -1) {
	sprite_index = spr_player_jump
} else {
	sprite_index = spr_player_idle
}

// ----- стрельба
if (mouse_check_button(mb_left)) {
    if (shoot_cooldown <= 0) {
        with (instance_create_layer(x, y - 9, global.InstancesUpper, obj_bullet)) { 
            image_xscale = other.image_xscale * other.face; 
            
            if (!other.face) {
                direction = 180;
            }
        }
        shoot_cooldown = 10;	
    } else {
    	shoot_cooldown--;
    }
}

if (keyboard_check(ord("R"))) {
	room_restart()
}

if (keyboard_check_pressed(vk_f1)) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check_pressed(vk_f2)) {
    var lay_id = layer_get_id("Areas");
    var is_visible = layer_get_visible(lay_id);
    layer_set_visible(lay_id, !is_visible);	
}

area = get_area()