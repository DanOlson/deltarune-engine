function Battle_FindMonsterIndex() {
	switch (global.monster) {
		default:
			_encounter_dialog="* If you see this,{sleep 24} I messed&  something up.";
		break;
	
		case 0:
			_monster_name="Test Monster";
			_encounter_dialog="* You encountered Ultimate Final Doot!";
			_monster_text[0]="Doot Doot!";
			_monster_text[1]="Doot,{sleep 24} &Doot Doot.";
			_monster_damage=16;
			_enemy=instance_create_depth(470, 160, DEPTH_BATTLE.ENEMY, obj_testenemy);
			global.monster_defense=16;
			global.monster_hp=500;
			global.turn=turn0_testmonster;
		break;
		
		case 1:
			_monster_name="Lancer";
			_encounter_dialog="* You encountered Lancer!";
			_monster_text[0]="test stuff!";
			_monster_text[1]="test,{sleep 24} &stuff.";
			_monster_damage=16;
			_enemy=instance_create_depth(470, 160, DEPTH_BATTLE.ENEMY, lancer);
			global.monster_defense=16;
			global.monster_hp=500;
			global.turn=turn0_lancer;
			_monster_check_desc="&* He tries to be scary but can't seem&  to manage it.";
		break;
	}

	_monster_check_stats="* " + string(_monster_name)+" - AT "+string(_monster_damage)+" DF "+string(global.monster_defense);
	_monster_check_text = _monster_check_stats + _monster_check_desc;

}