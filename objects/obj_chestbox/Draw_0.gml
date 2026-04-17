draw_self();

if (!is_open and place_meeting(x, y, obj_player)) {
    draw_set_font(font_ru_8);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    
    draw_text(x, y - (sprite_width / 4), "E - open");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}