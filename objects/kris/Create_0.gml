depth=DEPTH_BATTLE.PLAYER;

x=65;
y=25;

hp=90;
max_hp=90;
hurt_sprite = spr_kris_hurt;
down_sprite = spr_kris_down;
action_choice = undefined;
name = "kris";
max_damage = 100;
did_attack = false;

sprite_index=spr_kris_idle;
image_speed=1/2.5;
image_xscale=2;
image_yscale=2;

_damage=irandom_range(200,250);

alarm[0]=1;

instance_create_depth(0,0,0,camera);