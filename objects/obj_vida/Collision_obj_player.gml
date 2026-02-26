if (other.vida_atual < other.vida_maxima)
{
    other.vida_atual += 1; // concede 1 de vida

    if (other.vida_atual > other.vida_maxima)
    {
        other.vida_atual = other.vida_maxima;
    }
audio_play_sound(snd_coleta, 1, false);
    instance_destroy(); // some após coletar
}