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
//flash
if (flash_alpha > 0)
{
    draw_set_color(c_white);
    draw_set_alpha(flash_alpha);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
}