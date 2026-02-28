switch (estado)
{
    case "fade_out":

        alpha += velocidade;

        if (alpha >= 1)
        {
            alpha = 1;
            room_goto(proxima_room);
            estado = "fade_in";
        }

    break;


    case "fade_in":

        alpha -= velocidade;

        if (alpha <= 0)
        {
            alpha = 0;
            estado = "idle";
        }

    break;
}