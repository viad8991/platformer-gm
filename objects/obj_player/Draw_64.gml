draw_set_font(font_ru_28);
draw_set_color(c_red);
draw_set_halign(fa_left);

var _y = 0;
draw_text(0, _y, "hp: " +  string(global.hp));

_y += 30
draw_text(0, _y, "dmg: " + string(global.damage));

_y += 30
draw_text(0, _y, $"jmp cont: {string(global.jump_count)} ({jump_current_count})");

_y += 30
draw_text(0, _y, "Q - open all chest, R - restart")

_y += 30
draw_text(0, _y, "F1 - full screen, F2 - visible areas");

_y += 30
draw_text(0, _y, $"x: {x}, y: {y} | {get_name(area)}");