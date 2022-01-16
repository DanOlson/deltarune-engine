///@arg lang_name
function GMU_Lang_GetID() {
	return ds_list_find_index(global._gmu_lang_list,argument[0]);


}
