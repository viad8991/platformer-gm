if (is_before and place_meeting(x, y, obj_player)) {
    image_alpha = clamp(image_alpha - 0.07, 0.4, 1);
} else {
    image_alpha = 1;
}