draw_set_color(c_black);
draw_set_font(fnt_default); // Establecer la fuente de texto (fnt_default es un ejemplo, puedes usar la fuente que desees)

var points_text = "Puntos: " + string(global.puntos);
draw_text(x, y, points_text);