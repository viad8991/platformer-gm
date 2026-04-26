var btn_spr_width  = obj_button_start.sprite_width
var btn_spr_height = obj_button_start.sprite_height

_scale = window_get_width() / room_width

x = room_width / 2
y = room_height * 3 / 4

image_xscale *= _scale
image_yscale *= _scale

original_scale = image_xscale

// вариант 1
max_scale   = original_scale * 1.2
min_scale   = original_scale * 0.8
pulse_speed = 0.01
growing = true

// вариант 2
timer = 0
base_scale = original_scale
amplitude = 0.2
speed_factor = 0.05
