///@arg lang_id
///@arg default*
function GMU_Lang_GetName() {
	var ID=argument[0];
	var DEF="";
	if(argument_count>=2){
		DEF=argument[1];
	}

	return (GMU_Lang_IsExists(ID) ? ds_list_find_value(global._gmu_lang_list,ID) : DEF);


}
