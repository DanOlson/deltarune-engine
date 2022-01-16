if (place_meeting(x,y,soul)) {
	with (soul) {
		_inv=60;
		var _damage=ui._monster_damage;
		global.hp-=_damage;
		
		var hero=turn0_lancer.target;
		if (hero.hp > 0) {
			var new_hp = hero.hp - _damage;
			hero.hp = max(new_hp, 0);
			var inst_damage=instance_create_depth(hero.x+100,hero.y+80,0,damage);
			inst_damage._damage=_damage;
			inst_damage.color=c_white;
			audio_play_sound(snd_hurt,0,false);
			Camera_Shake(2,2,3,3);
			hero.sprite_index=hero.hurt_sprite;
			hero.alarm[7]=45;
		} else {
			hero.sprite_index=hero.down_sprite;
		}
	}
	instance_destroy();
}