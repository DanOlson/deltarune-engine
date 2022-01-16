depth=DEPTH_BATTLE.BULLET_OUTSIDE;
sprite_index=spr_bullet;
bullet_graze=bullet_graze_lancer;
_inst=instance_create_depth(x,y,0,bullet_graze);
_inst.grazed = false;
global.bullet=bullet_lancer;
