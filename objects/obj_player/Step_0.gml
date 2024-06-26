#region Movimiento Horizontal
// Para saber si el jugador se mueve para alguna dirección
var hor = keyboard_check(vk_right) - keyboard_check(vk_left);

if (hor != 0) {
    if (place_free(x + hor * move_speed, y)) {
        x += hor * move_speed;
    }

    image_xscale = hor; // Voltear la imagen del sprite según la dirección
    sprite_index = spr_JCD; // Cambiar al sprite de movimiento
} else {
    sprite_index = spr_jugador; // Cambiar al sprite de reposo
}
#endregion

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

    // Permitir el salto si el jugador está en el suelo
    if (keyboard_check_pressed(vk_up)) {
        vspeed = jump_speed;
        // Añadir impulso horizontal durante el salto
        if (hor != 0) {
            x += hor * (move_speed / 3); // Aumenta el impulso horizontal
        }
    }
} else {
    y += vspeed;
}

// Verificar si el personaje se ha hundido en el suelo y ajustarlo
if (!place_free(x, y)) {
    while (!place_free(x, y)) {
        y -= 1;
    }
}
#endregion

// Controlar la invulnerabilidad
if (invulnerable) {
    invulnerable_timer -= 1;
    if (invulnerable_timer <= 0) {
        invulnerable = false;
    }
}

// Actualizar el contador de vida del jugador
vida = clamp(vida, 0, 3); // Asegura que la vida esté dentro del rango válido

if (keyboard_check_pressed(vk_space)) {
    // Disparar un proyectil
    var bullet = instance_create_layer(x, y, "Instances", obj_proyectil);
    
    // Configurar la velocidad y dirección del proyectil
    bullet.direction = image_xscale > 0 ? 0 : 180; // Cambiar la dirección según la orientación del jugador
    bullet.speed = 10; // Velocidad del proyectil
}

if (vida <= 0) {
    // Crear un objeto de Game Over
    instance_create(0, 0, obj_game_ove);
    
    // Detener el jugador u otras acciones adicionales que desees realizar cuando se pierden todas las vidas
}