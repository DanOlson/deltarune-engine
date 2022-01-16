var inst=instance_create_depth(520,220,0,damage);
_damage+=irandom_range(10,30) - global.monster_defense;
inst._damage=_damage;
global.monster_hp = global.monster_hp - _damage;

if (global.monster_hp < 1) {
	global.monster.alarm[0] = 25;
} else {
	instance_create_depth(0,0,0,board);
	alarm[4]=40;
}

