depth=DEPTH_BATTLE.PLAYER;

x=92;
y=185;

hp=70;
max_hp=70;
hurt_sprite = spr_ralsei_hurt;
down_sprite = spr_ralsei_down;
action_choice = undefined;
name = "ralsei";

sprite_index=spr_ralsei_idle;
image_speed=1/2.5;
image_xscale=2;
image_yscale=2;

_damage=irandom_range(200,250);

alarm[0]=1;

instance_create_depth(0,0,0,camera);