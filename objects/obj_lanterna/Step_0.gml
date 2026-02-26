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

// ==========================
// DETECTAR COLISÃO COM INIMIGO OU BOSS
// ==========================

var hit_inimigo = place_meeting(x, y, obj_inimigo);
var hit_boss    = place_meeting(x, y, Obj_boss);

if (ativo && (hit_inimigo || hit_boss))
{
    if (!atingindo)
    {
        // começa som em loop
        som_lanterna_id = audio_play_sound(snd_lanterna, 1, true)
		audio_sound_gain(som_lanterna_id, 0.3, 0);
        atingindo = true;
    }
	// FAÍSCAS
   
    if (irandom(8) == 0) // controla quantidade
    {
        part_particles_create(global.ps_faisca, x, y, global.par_faisca, 2);
    }
}
else
{
    if (atingindo)
    {
        // para imediatamente
        if (som_lanterna_id != -1)
        {
            audio_stop_sound(snd_lanterna);
        }

        atingindo = false;
        som_lanterna_id = -1;
    }
}