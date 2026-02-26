
if (place_meeting(x, y, obj_player))
{
    with (obj_player)
    {
        tomar_dano(1);
			audio_play_sound(snd_dano, 1, false);
    }
  
    instance_destroy();
}