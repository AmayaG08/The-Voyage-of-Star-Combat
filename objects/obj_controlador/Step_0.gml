// Actualizar el temporizador
timer -= 1;

// Generar un nuevo enemigo cuando el temporizador llegue a cero
if (timer <= 0) {
    // Generar un enemigo en una posición aleatoria del mapa
    var enemy_instance = instance_create_layer(random(room_width), random(room_height), "Instances", obj_enemigo);
    
    // Reiniciar el temporizador
    timer = tiempo_espera;
}