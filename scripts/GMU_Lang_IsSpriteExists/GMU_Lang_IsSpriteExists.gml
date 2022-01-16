///@arg sprite_name
function GMU_Lang_IsSpriteExists() {
	var KEY=argument[0];

	var VALUE=ds_map_find_value(global._gmu_lang_sprite,KEY);
	return sprite_exists(is_real(VALUE) ? VALUE : -1);


}
