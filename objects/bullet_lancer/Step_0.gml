if(instance_exists(_inst)){
	_inst.x=x;
	_inst.y=y;
	_inst.image_angle=image_angle;
}

// TODO: if we're close enough to soul, assign
// global.grazebullet to self
if (collision_circle( x, y, 20, soul, false, false )) {
	global.grazebullet = _inst;
}
//if (place_meeting(x,y,soul)) {
//	instance_destroy();
//}

event_inherited();

if(y>500){
	instance_destroy();
}