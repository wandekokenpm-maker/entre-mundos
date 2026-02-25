
if (place_meeting(x, y, obj_player))
{
    with (obj_player)
    {
        tomar_dano(1);
    }

    instance_destroy();
}