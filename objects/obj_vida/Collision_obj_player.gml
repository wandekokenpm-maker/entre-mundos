if (other.vida_atual < other.vida_maxima)
{
    other.vida_atual += 1;

    if (other.vida_atual > other.vida_maxima)
    {
        other.vida_atual = other.vida_maxima;
    }
audio_play_sound(snd_coleta, 1, false);
    instance_destroy(); 
}