draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * face, image_yscale, image_angle, image_blend, image_alpha)

if (hp > 0) { 
    var _percent = (hp / max_hp) * 100
    draw_healthbar(x - 6, y - 10, x + 6, y - 12, _percent, c_black, c_red, c_green, 0 , true, true)	
} /* else {
    draw_sprite(spr_enemy_bees_dead, image_index, x, y)
} */