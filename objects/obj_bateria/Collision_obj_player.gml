// Verifica se a lanterna existe
if (instance_exists(obj_lanterna))
{
    var l = obj_lanterna;

    // Recarrega totalmente
    l.cargas = l.cargas_max;
}

// Destroi a bateria depois de pegar
audio_play_sound(snd_coleta, 1, false);
instance_destroy();