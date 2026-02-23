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

// Destrói a recarga
instance_destroy();