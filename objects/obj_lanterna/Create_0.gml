ativo = false;

cargas_max = 10;
cargas = 10;

if (variable_global_exists("player_cargas"))
{
    cargas = global.player_cargas;
}

timer_bateria = 0;
timer_dano = 0;

dano_por_segundo = 1.5;

