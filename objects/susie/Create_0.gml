depth=DEPTH_BATTLE.PLAYER;

x=45;
y=100; 

hp=110;
max_hp=110;
hurt_sprite = spr_susie_hurt;
down_sprite = spr_susie_down;
action_choice = undefined;
name = "susie";

sprite_index=spr_susie_idle;
image_speed=1/2.5;
image_xscale=2;
image_yscale=2;

_damage=irandom_range(200,250);


alarm[0]=1;

instance_create_depth(0,0,0,camera);