depth=DEPTH_BATTLE.UI;

_tp_old=0;
_tp_show=0;
_tp_bar_show=0;
_tp_bar_line=0;
_tp_bar_overlay=0;
_tp_offset_x=-100;
_offset_y=255;

// Player ui offset 
_kris_offset_y = 0;
_ralsei_offset_y = 0;
_susie_offset_y = 0;

_choosing = false;

_show_kris_buttons = false;
_show_susie_buttons = false;
_show_ralsei_buttons = false;
_kris_action_choice = undefined;
_susie_action_choice = undefined;
_ralsei_action_choice = undefined;
_active_button_index = 0;

_phase=-1;
cooldown=false;
cooldown2=false;
alarm[0]=25;

Battle_FindMonsterIndex();

_monster_glow=false;
_monster_glow_alpha=0;
_monster_alpha_complete=false;

_hero_action_choice = undefined;
_heros = array_create(3);
array_insert(_heros,0,kris);
array_insert(_heros,1,susie);
array_insert(_heros,2,ralsei);

find_next_hero = function(heros) {
	var len = array_length(heros);
	for (var i = 0; i < len; i++) {
		var candidate = heros[i];
		if (candidate.action_choice == undefined) {
			return candidate;
		}
	}
	return "derp";
}

hero_data = {};
variable_struct_set(hero_data, kris, {
	show_buttons: false,
	offset_y: 0,
	fight_bar_x: 600
});
variable_struct_set(hero_data, susie, {
	show_buttons: false,
	offset_y: 0,
	fight_bar_x: 600
});
variable_struct_set(hero_data, ralsei, {
	show_buttons: false,
	offset_y: 0,
	fight_bar_x: 600
});

fight_bar_trail_steps = array_create(10);
for (i = 60; i < 600; i += 60) {
	array_push(fight_bar_trail_steps, i);
}


GMU_Anim_New(self,"_offset_y",GMU_ANIM.CUBIC,GMU_ANIM.OUT,225,-225,25);
GMU_Anim_New(self,"_tp_offset_x",GMU_ANIM.CUBIC,GMU_ANIM.OUT,-100,100,30);