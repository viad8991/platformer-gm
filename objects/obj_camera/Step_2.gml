if (!instance_exists(obj_player)) {
	exit;
}

var _camera_width = camera_get_view_width(view_camera[0])
var _camera_height = camera_get_view_height(view_camera[0])

var current_camera_x = camera_get_view_x(view_camera[0])
var current_camera_y = camera_get_view_y(view_camera[0])

var _camera_x = obj_player.face == 1 ? obj_player.x - (_camera_width / 4) : obj_player.x - (_camera_width * 3 / 4);
var _camera_y = obj_player.y - _camera_height / 2

final_camera_x = lerp(current_camera_x, _camera_x, camera_speed)
final_camera_y = lerp(current_camera_y, _camera_y, camera_speed)

final_camera_x = clamp(final_camera_x, 0, room_width - _camera_width)
final_camera_y = clamp(final_camera_y, 0, room_height - _camera_height)

camera_set_view_pos(view_camera[0], final_camera_x, final_camera_y)