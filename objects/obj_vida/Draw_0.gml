draw_set_color(c_black);
draw_set_font(fnt_default); // Establecer la fuente de texto

var life_text = "Vida: " + string(obj_player.vida);
draw_text(x, y, life_text);
