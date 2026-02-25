if (x < 0 || x > room_width || y < 0 || y > room_height)
{
    instance_destroy();
}

if (place_meeting(x, y, obj_player))
{
    with (obj_player)
    {
        tomar_dano(1);
    }
    instance_destroy();
}