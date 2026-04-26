// вариант 1
/*if (growing) {
    target = max_scale;
} else {
    target = min_scale;
}

image_xscale = lerp(image_xscale, target, pulse_speed);
image_yscale = lerp(image_yscale, target, pulse_speed);

if (growing and image_xscale >= max_scale - 0.01) {
    growing = false;
} else if (!growing and image_xscale <= min_scale + 0.01) {
    growing = true;
}*/

// вариант 2
timer += speed_factor;
var scale = base_scale + (sin(timer) * 0.5 + 0.5) * amplitude;

image_xscale = lerp(image_xscale, scale, 0.2);
image_yscale = lerp(image_yscale, scale, 0.2);

// ------------------------------------

if (keyboard_check_pressed(vk_enter)) {
	room_goto(level1)
}
