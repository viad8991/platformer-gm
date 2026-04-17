draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * face * scale, image_yscale * scale, image_angle, image_blend, image_alpha)

if (hp > 0) {
    var _percent = (hp / max_hp) * 100
    draw_healthbar(x - 6, y - 20, x + 6, y - 22, _percent, c_black, c_red, c_green, 0 , true, true)	
}

// else {
//    mask_index = -1;
//    draw_sprite(spr_enemy_void_dead, -1, x, y)
//}