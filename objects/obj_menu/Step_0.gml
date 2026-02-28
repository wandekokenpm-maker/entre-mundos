if (transicionando)
{
    fade_alpha += 0.02;

    if (fade_alpha >= 1)
    {
        audio_stop_sound(mus_menu);
        room_goto(proxima_room);
    }
}