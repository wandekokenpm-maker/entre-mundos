// Fade inicial
if (fade_alpha > 0)
{
    fade_alpha -= 0.02;
    if (fade_alpha < 0) fade_alpha = 0;
}

if (!mostrando_logo)
{
    y_texto -= vel_subida;

    if (y_texto < - (array_length(creditos) * 60))
    {
        mostrando_logo = true;
        timer_logo = tempo_total_logo;
    }
}
else
{
    timer_logo--;

    if (timer_logo <= 0)
    {
        fade_final += 0.01;

        if (fade_final >= 1)
        {
            room_goto(rm_menu);
        }
    }
}

// Permitir pular
if (keyboard_check_pressed(vk_space))
{
    room_goto(rm_menu);
}