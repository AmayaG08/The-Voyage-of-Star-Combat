// Evento Step del enemigo
// Movimiento horizontal continuo
if (!place_meeting(x + sign(speed), y, obj_player)) {
    x += speed;
} else {
    // Si choca con el jugador, hacer algo, como matar al jugador
    instance_destroy(obj_player); // Destruir al jugador
    // Aquí puedes agregar más lógica, como restar vidas al jugador, mostrar un mensaje de game over, etc.
}

// Cambiar de dirección cuando alcanza los límites del mapa
if (x <= room_width - sprite_width || x >= 0) {
    speed *= -1; // Cambiar la dirección del movimiento
}