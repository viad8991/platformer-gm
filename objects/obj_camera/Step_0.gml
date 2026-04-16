if (keyboard_check_pressed(vk_f1)) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (!instance_exists(obj_player)) {
	exit;
}

var _camera_width = camera_get_view_width(view_camera[0]);
var _camera_height = camera_get_view_height(view_camera[0]);

var _camera_x = obj_player.x - _camera_width / 2;
var _camera_y = obj_player.y - _camera_height / 2;

_camera_x = clamp(_camera_x, 0, room_width - _camera_width);
_camera_y = clamp(_camera_y, 0, room_height - _camera_height);

final_camera_x += (_camera_x - final_camera_x) * camera_speed;
final_camera_y += (_camera_y - final_camera_y) * camera_speed;

camera_set_view_pos(view_camera[0], final_camera_x, final_camera_y);
