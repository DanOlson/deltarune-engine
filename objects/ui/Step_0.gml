var TP=global.tp;
if(_tp_old!=TP){
	GMU_Anim_New(self,"_tp_show",0,0,_tp_old,TP-_tp_old,4);
	GMU_Anim_New(self,"_tp_bar_line",0,0,_tp_old,TP-_tp_old,20);
	GMU_Anim_New(self,"_tp_bar_overlay",GMU_ANIM.SINE,GMU_ANIM.OUT,_tp_old,TP-_tp_old,30);
	GMU_Anim_New(self,"_tp_bar_show",0,0,_tp_old,TP-_tp_old,4);
	_tp_old=TP;
}

if (_phase==0) {
	cooldown=false;
	if (cooldown2==false) {
		if (alarm[2] < 0) {
			alarm[2] = 1;
		}
	}
	if (!instance_exists(text_typer)) {
		var _typer=instance_create_depth(30, 379, DEPTH_UI.TEXT, text_typer);
		_typer._shadow=true;
		_typer.text="{scale 2}{font 1}{voice 1}{speed 2}"+string(_encounter_dialog);
	}
	_monster_glow=false;
}

else if (_phase == 1) {
	if (_choosing) {
		var hero = find_next_hero(_heros);
		if (hero != "derp") {
			var data = variable_struct_get(hero_data, hero);
			if (data.offset_y > -40 && _hero_action_choice == undefined) {
				// raise button menu
				data.offset_y -= 2;
			} else {
				if (_hero_action_choice == undefined) {
					data.show_buttons = true;
				}
				if(keyboard_check_pressed(vk_right)) {
					_active_button_index = (_active_button_index + 1) % 5;
					audio_play_sound(snd_menu_switch,1,false);
				}
				if(keyboard_check_pressed(vk_left)) {
					if (_active_button_index == 0) {
						_active_button_index = 4;
					} else {
						_active_button_index = (_active_button_index - 1) % 5;
					}
					audio_play_sound(snd_menu_switch,1,false);
				}
				if(keyboard_check_pressed(vk_enter) && _hero_action_choice == undefined) {
					audio_play_sound(snd_menu_confirm,1,false);
					_hero_action_choice = _active_button_index;
					data.show_buttons = false;
				}
				if (_hero_action_choice != undefined) {
					if (data.offset_y < 0) {
						// lower button menu
						data.offset_y += 2;
					} else {
						hero.action_choice = _hero_action_choice;
						_hero_action_choice = undefined;
					}
				}
			}
		} else {
			_choosing = false;
			if (kris.action_choice == 0) { // Fight
				alarm[6] = 1;
			}
		}
	} else {
		// kris is fighting
		if (kris.action_choice == 0) {
			var kris_data = variable_struct_get(hero_data, kris);
			var actual_damage = 0; // start with zero and adjust as needed
			if (!kris.did_attack && keyboard_check_pressed(vk_enter)) {
				// calculate how close the fight bar was, derived from kris.max_damage
				// and the fight_bar_x compared to target
				var target = 57;
				var position = kris_data.fight_bar_x - target;
				if (position >= 0 && position < 100) {
					var damage_percent = (100 - position) / 100;
					actual_damage = kris.max_damage * damage_percent;
					kris._damage = actual_damage;
					kris.alarm[2] = 1;
				} else if (position < 0) {
					kris._damage = actual_damage;
					kris.alarm[2] = 1;
				}
				kris.did_attack = true;
			}
			// move the fight bar to the left
			if (kris_data.fight_bar_x > 6) {
				kris_data.fight_bar_x -= 6;
			} else if (!kris.did_attack) {
				kris.action_choice = undefined;
				kris._damage = actual_damage;
				kris.alarm[2] = 1;
			}
		}
	}
}

else if (_phase==2) {
	cooldown2=false;
	if (cooldown==false) {
		if (alarm[1] < 0) {
			alarm[1] = 1;
		}
	}
	if (!instance_exists(text_typer)) {
		var _typer=instance_create_depth(80, 378, DEPTH_UI.TEXT, text_typer);
		_typer._shadow=false;
		_typer.text="{scale 2}{font 2}{voice 1}{speed 2}{skippable false}{instant true}"+string(_monster_name);
	}
	_monster_glow=true;
}
else if (_phase==3) {
	randomize();
	global.status=random_range(0, array_length_1d(_monster_text)+1);
	if (!instance_exists(dialog)) {
	var inst=instance_create_depth(global.monster.x-150,global.monster.y+40,0,dialog);
		inst.text=_monster_text[global.status-1];
	}
	_monster_glow=false;
}
else if (_phase==4) {
	if (!instance_exists(board)) {
		instance_create_depth(0,0,0,board);
	}
}


if (global.debug==true) {
	if(keyboard_check_pressed(vk_numpad5)){
		alarm[3]=1; // Check
    }
	if(keyboard_check_pressed(vk_numpad3)){
		alarm[4]=1; // kinda working items
	}
	if(keyboard_check_pressed(vk_numpad4)){
		alarm[6]=1; // fight
	}
	if (keyboard_check_pressed(vk_add))
		_phase++;
	else if (keyboard_check_pressed(vk_subtract))
		_phase--;
}