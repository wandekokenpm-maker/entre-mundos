// ======================================
// // SEGUE PLAYER PERFEITAMENTE
// ======================================
if (instance_exists(obj_player))
{
    var p = obj_player;

    // offset fixo lateral
    var offset_x = 14;
    var offset_y = -8;

    x = p.x + (p.facing * offset_x);
    y = p.y + offset_y;

    image_xscale = p.facing;
}

// ======================================
// ATIVA / DESATIVA COM R
// ======================================
if (keyboard_check_pressed(ord("R")) && cargas > 0)
{
    ativo = !ativo;
}

// ======================================
// VISIBILIDADE
// ======================================
visible = ativo;

// ======================================
// CONSUMO DE BATERIA (1 carga a cada 2 segundos)
// ======================================
if (ativo)
{
    timer_bateria++;

    if (timer_bateria >= room_speed * 2)
    {
        cargas--;
        timer_bateria = 0;

        if (cargas <= 0)
        {
            ativo = false;
            cargas = 0;
        }
    }
}
else
{
    timer_bateria = 0;
}
if (!place_meeting(x, y, obj_inimigo))
{
    timer_dano = 0;
}