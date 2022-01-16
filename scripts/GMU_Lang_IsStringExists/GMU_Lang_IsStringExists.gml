///@arg string_name
function GMU_Lang_IsStringExists() {
	var KEY=argument[0];

	return is_string(ds_map_find_value(global._gmu_lang_string,KEY));


}
