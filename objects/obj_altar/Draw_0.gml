draw_self();

if (state == StateAltar.IDLE and place_meeting(x, y, obj_player)) {
    draw_set_font(font_ru_8);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    
    draw_text(x, y - sprite_width / 3, "Press E");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
} else if (state == StateAltar.RELOAD) {
    draw_set_font(font_ru_8);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    
    draw_text(x, y - sprite_width / 2, string(ceil(alarm[0] / game_get_speed(gamespeed_fps))));
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
