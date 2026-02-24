draw_self();

if (jogador_perto && !dialogo_ativo)
{
    draw_set_font(fnt_press);
    draw_set_color(c_yellow);
    draw_set_alpha(0.85);

    var flutuar = sin(offset_anim) * 3;

    draw_text(
        x - 25,
        y - 30 + flutuar,
        "Press [L]"
    );

    draw_set_alpha(1);
}