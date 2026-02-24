/*draw_text(20, 20, "Energia: " + string(energia_atual));

// ===== MOSTRADOR DE BATERIA =====
var lanterna = instance_find(obj_lanterna, 0);

if (lanterna != noone)
{
    draw_set_color(c_white);
    draw_set_font(-1);

    draw_text(20, 80, "Bateria: " + string(lanterna.cargas));
}
if (global.dialogo_ativo)
{
    var margem = 40;
    var largura = display_get_gui_width() - margem * 2;
    var altura = 100;
    var y_pos = display_get_gui_height() - altura - 20;

    draw_set_color(c_black);
    draw_rectangle(margem, y_pos, margem + largura, y_pos + altura, false);

    draw_set_color(c_white);
    draw_text(margem + 20, y_pos + 20, global.texto_atual);
}*/
// =====================================
// ENERGIA (MUNDO) - spr_recarga
// =====================================

var margem_x = 20;
var margem_y = 60;
var espacamento = 15; // ajuste se precisar

for (var i = 0; i < energia_atual; i++)
{
    draw_sprite_ext(
        spr_recarga,
        0,
        margem_x + (i * espacamento),
        margem_y,
        2, 2, 0,
        c_white,
        1
    );
}


// =====================================
// BATERIA LANTERNA - spr_bateria
// =====================================

var lanterna = instance_find(obj_lanterna, 0);

if (lanterna != noone)
{
    var bateria_y = margem_y + 30;

    for (var j = 0; j < lanterna.cargas; j++)
    {
        draw_sprite_ext(
            spr_bateria,
            0,
            margem_x + (j * espacamento),
            bateria_y,
            2, 2, 0,
            c_white,
            1
        );
    }
}