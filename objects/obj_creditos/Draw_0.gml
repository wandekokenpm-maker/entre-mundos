draw_clear(c_black);

draw_set_font(fnt_dialogo);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// CREDITOS SUBINDO

if (!mostrando_logo)
{
    var espacamento = 60;

    for (var i = 0; i < array_length(creditos); i++)
    {
        draw_text(room_width/2, y_texto + (i * espacamento), creditos[i]);
    }
}
else
{

    draw_sprite_ext(
        spr_logo,
        0,
        room_width/2,
        room_height/2 - 130,
        0.7, 0.7,
        0,
        c_white,
        1
    );

    draw_sprite_ext(
        spr_wandegames,
        0,
        room_width/2,
        room_height/2 + 100,
        0.6, 0.6,
        0,
        c_white,
        1
    );
}


if (fade_alpha > 0)
{
    draw_set_alpha(fade_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
}


if (fade_final > 0)
{
    draw_set_alpha(fade_final);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
}