hover = position_meeting(mouse_x, mouse_y, id);

if (hover)
{
    image_index = 1;
    escala_target = escala_hover;

    
        if (mouse_check_button_pressed(mb_left))
{
    game_end();
}
    }

else
{
    image_index = 0;
    escala_target = escala_base;
}

// animação suave
escala_atual = lerp(escala_atual, escala_target, 0.2);

image_xscale = escala_atual;
image_yscale = escala_atual;