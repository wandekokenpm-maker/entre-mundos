// Só adiciona energia se não estiver no máximo
if (obj_controle_mundo.energia_atual < obj_controle_mundo.energia_max)
{
    obj_controle_mundo.energia_atual += valor_recarga;
    
    // Limita para não ultrapassar o máximo
    if (obj_controle_mundo.energia_atual > obj_controle_mundo.energia_max)
    {
        obj_controle_mundo.energia_atual = obj_controle_mundo.energia_max;
    }
}

audio_play_sound(snd_coleta, 1, false);
instance_destroy();