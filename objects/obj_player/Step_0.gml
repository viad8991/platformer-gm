is_up = keyboard_check(ord("W"));
is_down = keyboard_check(ord("S"));
is_left = keyboard_check(ord("A"));
is_right = keyboard_check(ord("D"));

is_space_pressed = keyboard_check_pressed(vk_space);

/* ver 2
move_dir = is_right - is_left 

if (move_dir != 0) {
	face = move_dir;
}

if (!place_meeting(x, y + move_spd, obj_ground)) {
	v_spd += grav;
} else {
    v_spd = 0;
    if (is_space_pressed) {
    	v_spd = jump_max_speed
    }
}

move_and_collide(move_dir * move_spd, v_spd, obj_ground, 5, 0, 0, move_spd, fall_max_speed);

x = round(x);
y = round(y);
*/ 

var _sub_pixel = 0.5;

// x (horizontal) move -----

move_dir = is_right - is_left;

if (move_dir != 0) {
	face = move_dir;
}

h_spd = move_dir * move_spd;
if (place_meeting(x + h_spd, y, obj_ground)) { 
    var _pixel_check = _sub_pixel * sign(h_spd);
    while (!place_meeting(x + _pixel_check, y, obj_ground)) {
    	x += _pixel_check;
    }
    
	h_spd = 0;
}

x += h_spd;

x = round(x);

// y (vertical) move ----

v_spd += grav;

if (place_meeting(x, y + 1, obj_ground)) {
	jump_current_count = 0;
}

if (is_space_pressed && (place_meeting(x, y + 1, obj_ground) or jump_current_count < global.jump_count)) {
	v_spd = jump_max_speed;
    jump_current_count += 1
}

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
y = round(y);

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
        with (instance_create_layer(x, y - 9, "InstancesUpper", obj_bullet)) { 
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