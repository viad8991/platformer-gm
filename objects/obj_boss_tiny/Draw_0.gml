draw_self()

if (hp > 0) {
    var _percent = (hp / max_hp) * 100
    draw_healthbar(x - 6, y - 22, x + 6, y - 24, _percent, c_black, c_red, c_green, 0 , true, true)	
}
