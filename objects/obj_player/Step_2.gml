//Activar la gravedad
if (!collision_rectangle(x-1,y,x+1,y+1,obj_muro,false,false)) {
	gravity = 0.3;
}

if (vspeed > 0) {
	var ground = collision_rectangle(x-1,y,x+1,y-vspeed,obj_muro,false,false);
	if (ground) {
		y = ground.y;
		vspeed = 0;
		gravity = 0;
	}
}