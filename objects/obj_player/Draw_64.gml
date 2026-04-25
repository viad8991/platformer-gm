for (var i = 0; i < global.keys; i++) {
    draw_sprite_ext(spr_key, 1, 20 + (i * 15),  display_get_gui_height() - 10 * 4, image_xscale * 4, image_yscale * 4, image_angle, image_blend, 0.9)	
}

draw_set_font(font_ru_28);
draw_set_color(c_red);
draw_set_halign(fa_left);

var _y = 0;
draw_text(0, _y, "hp: " +  string(global.hp));

_y += 30
draw_text(0, _y, "dmg: " + string(global.damage));

_y += 30
draw_text(0, _y, $"v_speed: {round(v_spd)}, h_speed: {round(h_spd)}");

_y += 30
draw_text(0, _y, $"x: {x}, y: {y} | {get_area_name(area)}");

_y += 30
draw_text(0, _y, $"jmp cont: {string(global.jump_count)} ({jump_current_count})");

_y += 30
draw_text(0, _y, "Q - open all chest, R - restart")

_y += 30
draw_text(0, _y, "F1 - full screen, F2 - visible areas");

_y += 30
var bees_alive = 0;
var bees_dead = 0;
for (var i = 0; i < instance_number(obj_enemy_bees); i++) { if(instance_find(obj_enemy_bees, i).hp > 0) { bees_alive++ } else { bees_dead++ } }
var void_alive = 0;
var void_dead = 0;
for (var i = 0; i < instance_number(obj_enemy_void); i++) { if(instance_find(obj_enemy_void, i).hp > 0) { void_alive++ } else { void_dead++ } }
draw_text(0, _y, $"(al+de) voids: {void_alive}+{void_dead}, bees's: {bees_alive}+{bees_dead}");
