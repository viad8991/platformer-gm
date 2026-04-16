draw_set_font(font_ru);
draw_set_color(c_red);
draw_set_halign(fa_left);
draw_text(0, 0, "hp: " +  string(global.hp));
draw_text(0, 30, "dmg: " + string(global.damage));
draw_text(0, 60, "jmp cont: " + string(global.jump_count));