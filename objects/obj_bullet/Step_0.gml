if (place_meeting(x, y, global.ground_tiles)) {
    instance_destroy()
}


var enemy = instance_place(x, y, enemies)
if (enemy != noone) {
	enemy.hp -= global.damage
    
    instance_destroy()
}
