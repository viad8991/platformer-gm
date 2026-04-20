var camera_x = camera_get_view_x(view_camera[0])
var camera_y = camera_get_view_y(view_camera[0])

var camera_width = camera_get_view_width(view_camera[0])
var camera_height = camera_get_view_height(view_camera[0])

var random_x = random_range(camera_x - 20, camera_x + camera_width + 20)
var random_y = random_range(camera_y - 20, camera_y + camera_height + 20)

random_x = clamp(random_x, 20, room_width - 20)
random_y = clamp(random_y, 20, room_height - 20)

switch (get_area_in(random_x, random_y)) {
    case Area.NONE:
        spanw_forest(random_x, random_y)
        break
	case Area.FOREST:
        spanw_forest(random_x, random_y)
        break
    case Area.DESERT:
        spanw_desert(random_x, random_y)
        break
    case Area.WINTER:
        spawn_winter(random_x, random_y)
        break
}

alarm[0] = game_get_speed(gamespeed_fps) * random_range(2, 4);
