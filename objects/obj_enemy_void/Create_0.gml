grav = 0.2;

h_spd = 0;
v_spd = 0;

max_hp = 10;
hp = max_hp;

fall_max_speed = 2;

move_dir = 0;
move_spd = 0.8;

attack_delay = 0

face = 1;

function rotate_to_player(_direction_to_player) {
   if (_direction_to_player != 0) { 
       face = _direction_to_player;
   }
}