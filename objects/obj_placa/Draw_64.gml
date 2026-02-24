if (dialogo_ativo)
{
    draw_set_font(fnt_dialogo);

    var margem = 60;
    var largura = display_get_gui_width() - margem * 2;
    var altura = 140;
    var y_pos = display_get_gui_height() - altura - 40;

    // Fundo externo
    draw_set_color(c_black);
    draw_roundrect(margem, y_pos, margem + largura, y_pos + altura, false);

    // Fundo interno
    draw_set_color(c_white);
    draw_roundrect(margem+4, y_pos+4, margem + largura-4, y_pos + altura-4, false);

    // Texto
    draw_set_color(c_black);

    draw_text_ext(
        margem + 20,
        y_pos + 20,
        linhas[linha_atual],
        20,
        largura - 40
    );

   
// Indicador de prossequir

draw_set_font(fnt_dialogo); // crie uma fonte maior
draw_set_color(c_black);
draw_set_alpha(0.9);

draw_text(
    margem + largura - 110,
    y_pos + altura - 35,
    "PRESS [L]"
);

draw_set_alpha(1);
}