// Se o player não estiver já morrendo
if (other.estado != "morrendo")
{
    other.vida_atual = 0;
    other.estado = "morrendo";
    other.timer_morte = other.duracao_morte;

    other.vel_x = 0;
    other.vel_y = 0;

    other.sprite_index = spr_morto;
    other.image_index = 0;
audio_play_sound(snd_morte, 1, false);
}