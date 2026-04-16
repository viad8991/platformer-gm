var _enemy = instance_place(x, y, obj_enemy)

with (_enemy) {
    hp -= other.damage
}

instance_destroy()