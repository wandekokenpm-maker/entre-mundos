
if (!maquina_quebrada)
{
    if (keyboard_check_pressed(ord("Q")) && energia_atual > 0)
    {
        energia_atual -= custo_troca;
		audio_play_sound(snd_troca_mundo, 1, false);	
        // ATIVA FLASH
        flash_alpha = 0.4;
        flash_timer = 2.5; // duração forte do flash

        if (global.mundo == 1)
        {
            global.mundo = 2;
            instance_deactivate_layer("Layer_Mundo1");
            instance_activate_layer("Layer_Mundo2");

            layer_set_visible("bc_mundo_1", false);
            layer_set_visible("bc_mundo_2", true);
        }
        else
        {
            global.mundo = 1;
            instance_deactivate_layer("Layer_Mundo2");
            instance_activate_layer("Layer_Mundo1");

            layer_set_visible("bc_mundo_2", false);
            layer_set_visible("bc_mundo_1", true);
        }

        with (obj_player)
        {
            verificar_prisao = true;
        }
    }

    if (energia_atual <= 0)
    {
        maquina_quebrada = true;
        timer_morte = room_speed * 2;

        with (obj_player)
        {
            if (estado != "morrendo")
            {
                estado = "morrendo";
                timer_morte = duracao_morte;
                vel_x = 0;
                vel_y = 0;	
				audio_play_sound(snd_morte, 1, false);
            }
        }
    }
}
else
{
    if (timer_morte > 0)
    {
        timer_morte--;

        if (timer_morte == room_speed)
        {
            with (obj_player)
            {
                sprite_index = spr_morto;
                image_index = 0;
                image_speed = 1;
            }
        }
    }
}

// =========================
// SISTEMA DE FLASH (FORA DE TUDO)
// =========================
if (flash_timer > 0)
{
    flash_timer--;
}
else if (flash_alpha > 0)
{
    flash_alpha -= 0.05;

    if (flash_alpha < 0)
        flash_alpha = 0;
}
// ========================
// CONTROLE DE MÚSICA POR ROOM
// ========================

var nova_musica;

if (room == rm_boss)
{
    nova_musica = mus_boss;
}
else
{
    nova_musica = mus_fase1;
}

// Se mudou a música
if (musica_atual != nova_musica)
{
    // Para música antiga
    if (musica_atual != -1)
    {
        audio_stop_sound(musica_atual);
    }

    // Toca nova música
    audio_play_sound(nova_musica, 0, true);

    musica_atual = nova_musica;
}