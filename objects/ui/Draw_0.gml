//TP
draw_sprite(spr_tp,0,8+_tp_offset_x,75);
draw_sprite(spr_tp_bar,0,38+_tp_offset_x,40);

draw_set_font(font_determination_sans);

if(_tp_show<100){
	draw_sprite_part_ext(spr_tp_bar,1,0,5+187/100*(100-_tp_bar_line),sprite_get_width(spr_tp_bar),sprite_get_height(spr_tp_bar),38+_tp_offset_x,40+5+187/100*(100-_tp_bar_line),1,1,c_red,1);
	draw_sprite_part(spr_tp_bar,1,0,5+187/100*(100-_tp_bar_show),sprite_get_width(spr_tp_bar),sprite_get_height(spr_tp_bar),38+_tp_offset_x,40+5+187/100*(100-_tp_bar_show));
	draw_sprite_part_ext(spr_tp_bar,1,0,5+187/100*(100-_tp_bar_overlay),sprite_get_width(spr_tp_bar),sprite_get_height(spr_tp_bar),38+_tp_offset_x,40+5+187/100*(100-_tp_bar_overlay),1,1,make_color_rgb(255,160,64),1);
	draw_sprite_part(spr_tp_bar,1,0,5+187/100*(100-_tp_bar_line),sprite_get_width(spr_tp_bar),2,38+_tp_offset_x,40+5+187/100*(100-_tp_bar_line));
	
	draw_set_color(c_white);
	draw_text_transformed(6+_tp_offset_x,109,string(floor(_tp_show)),2,2,0);
	draw_text_transformed(11+_tp_offset_x,134,"%",2,2,0);
}else{
	draw_sprite_ext(spr_tp_bar,1,38+_tp_offset_x,40,1,1,0,make_color_rgb(255,208,32),1);
	
	draw_set_color(c_yellow);
	draw_text_transformed(6+_tp_offset_x,109,"M",2,2,0);
	draw_text_transformed(11+_tp_offset_x,134,"A",2,2,0);
	draw_text_transformed(16+_tp_offset_x,159,"X",2,2,0);
}

//Player
draw_sprite_ext(spr_pixel,0,0,326+_offset_y,640,36,0,c_black,1);
draw_sprite_ext(spr_pixel,0,0,326+_offset_y,640,3,0,make_color_rgb(51,32,51),1);
draw_sprite_ext(spr_pixel,0,0,326+_offset_y+36,640,118,0,c_black,1);
draw_sprite_ext(spr_pixel,0,0,362+_offset_y,640,3,0,make_color_rgb(51,32,51),1);

var offset_x=2*106;
var offset_y=326+_offset_y;

var offset_x_2=6;
var offset_x_3=4*106;

var hero = find_next_hero(_heros);
var data = variable_struct_get(hero_data, hero);

// HP Bar Kris
var kris_offset_y = (hero == kris ? data.offset_y : 0) + offset_y;
draw_sprite(spr_icon_kris,0,offset_x_2+15,kris_offset_y+6);
draw_sprite(spr_name_kris,0,offset_x_2+51,kris_offset_y+8);

draw_sprite(spr_hp,0,offset_x_2+110,kris_offset_y+21);
draw_sprite_ext(spr_pixel,0,offset_x_2+110+18,kris_offset_y+21,76,9,0,make_color_rgb(128,0,0),1);
draw_sprite_ext(spr_pixel,0,offset_x_2+110+18,kris_offset_y+21,76/kris.max_hp*kris.hp,9,0,make_color_rgb(3,254,255),1);
draw_sprite(spr_hp_slash,0,offset_x_2+118+43,kris_offset_y+21-13);

draw_set_font(global.font_hp);
draw_set_color(c_white);
draw_text_transformed(offset_x_2+110+18+8+45,kris_offset_y+21-13,string(kris.max_hp),2,2,0);
draw_set_halign(fa_right);
draw_text_transformed(offset_x_2+110+18+8+45-21,kris_offset_y+21-13,string(kris.hp),2,2,0);
draw_set_halign(fa_left);

if (hero == kris && data.show_buttons) {
	draw_sprite(Fight,_active_button_index == 0 ? 1 : 0,offset_x_2+15,offset_y+6);
	draw_sprite(Act,_active_button_index == 1 ? 1 : 0,offset_x_2+48,offset_y+6);
	draw_sprite(Item,_active_button_index == 2 ? 1 : 0,offset_x_2+83,offset_y+6);
	draw_sprite(Spare,_active_button_index == 3 ? 1 : 0,offset_x_2+117,offset_y+6);
	draw_sprite(Defend,_active_button_index == 4 ? 1 : 0,offset_x_2+150,offset_y+6);
}
if (_phase == 1 && kris.action_choice == 0 && !_choosing) {
	var kris_data = variable_struct_get(hero_data, kris);
	if (kris_data.fight_bar_x > 10) {
		// main fight bar
		draw_sprite_ext(
			spr_pixel,
			0,
			kris_data.fight_bar_x,
			366,
			9,
			34,
			0,
			make_color_rgb(255,255,255),
			1
		);
		
		// loop over fight_bar_trail_steps in reverse
		for (i = array_length(fight_bar_trail_steps) - 1; i > 0; i--) {
			var x_pos = fight_bar_trail_steps[i];
			if (x_pos > kris_data.fight_bar_x) {
				var alpha_value = kris_data.fight_bar_x / x_pos - 0.6;
				draw_sprite_ext(
					spr_pixel,
					0,
					x_pos,
					366,
					9,
					34,
					0,
					make_color_rgb(255,255,255),
					alpha_value
				);
			}
		}
	}
}

// HP Bar Susie
var susie_offset_y = (hero == susie ? data.offset_y : 0) + offset_y;
draw_sprite(spr_icon_susie,0,offset_x+27,susie_offset_y +21);
draw_sprite(spr_name_susie,0,offset_x+51,susie_offset_y +13);

draw_sprite(spr_hp,0,offset_x+110,susie_offset_y +21);
draw_sprite_ext(spr_pixel,0,offset_x+110+18,susie_offset_y +21,76,9,0,make_color_rgb(128,0,0),1);
draw_sprite_ext(spr_pixel,0,offset_x+110+18,susie_offset_y +21,76/susie.max_hp*susie.hp,9,0,make_color_rgb(255,0,255),1);
draw_sprite(spr_hp_slash,0,offset_x+118+43,susie_offset_y +21-13);

draw_set_font(global.font_hp);
draw_set_color(c_white);
draw_text_transformed(offset_x+110+18+8+45,susie_offset_y +21-13,string(susie.max_hp),2,2,0);
draw_set_halign(fa_right);
draw_text_transformed(offset_x+110+18+8+45-21,susie_offset_y +21-13,string(susie.hp),2,2,0);
draw_set_halign(fa_left);

if (hero == susie && data.show_buttons) {
	draw_sprite(Fight,_active_button_index == 0 ? 1 : 0,offset_x+15,offset_y+6);
	draw_sprite(Magic,_active_button_index == 1 ? 1 : 0,offset_x+48,offset_y+6);
	draw_sprite(Item,_active_button_index == 2 ? 1 : 0,offset_x+83,offset_y+6);
	draw_sprite(Spare,_active_button_index == 3 ? 1 : 0,offset_x+117,offset_y+6);
	draw_sprite(Defend,_active_button_index == 4 ? 1 : 0,offset_x+150,offset_y+6);
}

// HP Bar Ralsei
var ralsei_offset_y = (hero == ralsei ? data.offset_y : 0) + offset_y;
draw_sprite(spr_icon_ralsei,0,offset_x_3+10,ralsei_offset_y+4);
draw_sprite(spr_name_ralsei,0,offset_x_3+46,ralsei_offset_y+8);

draw_sprite(spr_hp,0,offset_x_3+110,ralsei_offset_y+21);
draw_sprite_ext(spr_pixel,0,offset_x_3+110+18,ralsei_offset_y+21,76,9,0,make_color_rgb(128,0,0),1);
draw_sprite_ext(spr_pixel,0,offset_x_3+110+18,ralsei_offset_y+21,76/ralsei.max_hp*ralsei.hp,9,0,make_color_rgb(1,254,0),1);
draw_sprite(spr_hp_slash,0,offset_x_3+118+43,ralsei_offset_y+21-13);

draw_set_font(global.font_hp);
draw_set_color(c_white);
draw_text_transformed(offset_x_3+110+18+8+45,ralsei_offset_y+21-13,string(ralsei.max_hp),2,2,0);
draw_set_halign(fa_right);
draw_text_transformed(offset_x_3+110+18+8+45-21,ralsei_offset_y+21-13,string(ralsei.hp),2,2,0);
draw_set_halign(fa_left);

if (hero == ralsei && data.show_buttons) {
	draw_sprite(Fight,_active_button_index == 0 ? 1 : 0,offset_x_3+15,offset_y+6);
	draw_sprite(Magic,_active_button_index == 1 ? 1 : 0,offset_x_3+48,offset_y+6);
	draw_sprite(Item,_active_button_index == 2 ? 1 : 0,offset_x_3+83,offset_y+6);
	draw_sprite(Spare,_active_button_index == 3 ? 1 : 0,offset_x_3+117,offset_y+6);
	draw_sprite(Defend,_active_button_index == 4 ? 1 : 0,offset_x_3+150,offset_y+6);
}

if (_monster_glow==true){
	if (_monster_glow_alpha < 1) and (_monster_alpha_complete==false) {
		_monster_glow_alpha+=0.025;
	}
	else {
		_monster_alpha_complete=true;
	}
	if (_monster_glow_alpha > 0) and (_monster_alpha_complete==true) {
		_monster_glow_alpha-=0.025;
	}
	else {
		_monster_alpha_complete=false;
	}
	draw_sprite_ext(global.monster.glow_sprite_index,global.monster.image_index,global.monster.x,global.monster.y, 2, 2, 0, c_white, _monster_glow_alpha);
}