var _enemy = instance_place(x, y, obj_enemy_void)

with (_enemy) {
    hp -= global.damage
}

instance_destroy()