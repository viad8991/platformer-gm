var btn_spr_width = obj_button_exit.sprite_width
var btn_spr_height = obj_button_exit.sprite_height

_scale = window_get_width() / room_width

x = room_width - btn_spr_width * _scale * 2
y = btn_spr_height * _scale

image_xscale *= _scale
image_yscale *= _scale
