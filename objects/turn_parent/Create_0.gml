// potato
visible=false;
global.board_time=420;

var targets = ds_list_create();
if (susie.hp > 0) {
	ds_list_add(targets, susie);
}
if (kris.hp > 0) {
	ds_list_add(targets, kris);
}
if (ralsei.hp > 0) {
	ds_list_add(targets, ralsei);
}
randomize();
ds_list_shuffle(targets);

target=targets[| 0];

ds_list_destroy(targets);

