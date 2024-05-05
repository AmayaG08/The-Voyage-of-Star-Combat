#region Movimiento Horizontal
//para saber si el jugador se mueve para alguna direccion
var hor =keyboard_check(vk_right) - keyboard_check(vk_left);

if (hor != 0) {
	if (place_free(x + hor, y)){
		x += hor * 2;
	}
	
	image_xscale = hor;
	sprite_index = spr_JCD;
} else {
	sprite_index = spr_jugador;
}
#endregion

if (keyboard_check_pressed(vk_space)) {
	vspeed = -5;
}