
// ======================================
// MORTE
// ======================================
if (vida <= 0)
{
	 repeat (500)
    {
        var p = part_particles_create(global.ps, x, y, global.par_explosao, 1);
    }
    instance_destroy();
    exit;
}

// ======================================
// PARALISAÇÃO
// ======================================
if (timer_parado > 0)
{
    timer_parado--;
    exit;
}

// ======================================
// MOVIMENTO COM PREVISÃO (CORRETO)
// ======================================

// Verifica antes de andar
if (!place_meeting(x + velocidade * direcao, y, obj_chao))
{
    x += velocidade * direcao;
}
else
{
    // Se vai bater, vira antes de entrar
    direcao *= -1;
}

// Atualiza sprite
image_xscale = direcao;