// Verifica se a lanterna existe
if (instance_exists(obj_lanterna))
{
    var l = obj_lanterna;

    // Recarrega totalmente
    l.cargas = l.cargas_max;
}

// Destroi a bateria depois de pegar
instance_destroy();