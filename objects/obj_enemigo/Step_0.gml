// Evento Step del enemigo
#region Gravedad y Salto}
// Aplicar gravedad
vspeed += gravity_force;

// Limitar la velocidad de caída
if (vspeed >= max_fall_speed) {
    vspeed = max_fall_speed;
}

// Mover verticalmente y manejar colisiones
if (!place_free(x, y + vspeed)) {
    // Ajustar vspeed para detener el personaje justo en el suelo
    while (place_free(x, y + sign(vspeed))) {
        y += sign(vspeed);
    }
    vspeed = 0; // Detener movimiento vertical

   }
 
   

// Verificar si el personaje se ha hundido en el suelo y ajustarlo
if (!place_free(x, y)) {
    while (!place_free(x, y)) {
        y -= 1;
    }
}
#endregion

// Encontrar la posición del jugador
var player = instance_nearest(x, y, obj_player);

// Cambiar el estado del enemigo a "persiguiendo" si está cerca del jugador
if (player != noone && estado != "persiguiendo") {
    if (distance_to_object(player) < 200) { // Rango de detección
        estado = "persiguiendo";
    }
}

// Manejar el movimiento basado en el estado
switch (estado) {
    case "moviendo":
        // Movimiento horizontal automático
        x += move_speed;

        

        // Cambiar el sprite a caminando
        sprite_index = spr_enemigocaminando;
        break;

    case "persiguiendo":
        // Perseguir al jugador horizontalmente
        if (x < player.x) {
            x += move_speed;
        } else if (x > player.x) {
            x -= move_speed;
        }

        // Verificar colisión con el jugador
        if (place_meeting(x, y, obj_player)) {
            // Restar una vida al jugador si no está en invulnerabilidad
            if (player.invulnerable == false) {
                player.vida -= 1;
                player.invulnerable = true; // Hacer al jugador invulnerable temporalmente
                player.invulnerable_timer = 60; // Duración de la invulnerabilidad en frames

                // Si el jugador se queda sin vidas, destruir al jugador
                if (player.vida <= 0) {
                    instance_destroy(player); // Destruir al jugador
                }
            }
        }

        // Cambiar el sprite a caminando
        sprite_index = spr_enemigocaminando;
        break;
}

// Cambiar la dirección del sprite según el movimiento
if (move_speed > 0) {
    image_xscale = 1;
} else {
    image_xscale = -1;
}
