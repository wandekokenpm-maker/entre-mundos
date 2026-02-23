draw_text(20, 20, "Energia: " + string(energia_atual));

// ===== MOSTRADOR DE BATERIA =====
var lanterna = instance_find(obj_lanterna, 0);

if (lanterna != noone)
{
    draw_set_color(c_white);
    draw_set_font(-1);

    draw_text(20, 80, "Bateria: " + string(lanterna.cargas));
}