// Aumentar los puntos
global.puntos += 10;

// Destruir tanto el proyectil como el enemigo
instance_destroy(); // Destruir el proyectil
with (other) {
    instance_destroy(); // Destruir el enemigo con el que colisionó el proyectil
}