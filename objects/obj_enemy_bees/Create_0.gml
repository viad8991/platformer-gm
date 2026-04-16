h_spd = 0;
v_spd = 0;

max_hp = 5;
hp = max_hp;

move_dir = 0;
move_spd = 4;

attack_delay = 0;

face = 1;

function rotate_to_player(_direction_to_player) {
   if (_direction_to_player != 0) { 
       face = _direction_to_player;
   }
}