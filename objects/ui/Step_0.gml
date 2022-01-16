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
		if (kris.action_choice == 0) {
			var kris_data = variable_struct_get(hero_data, kris);
			if (kris_data.fight_bar_x > 1) {
				kris_data.fight_bar_x -= 6;
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