if (vida <= 0 && !morrendo)
{
    morrendo = true;
    fase_morte = 1;
    timer_morte = room_speed * 3;

    sprite_index = spr_boss_dano;
    
    audio_stop_sound(mus_boss);

    // iniciar tremor da tela
    shake_timer = room_speed * 3;
    shake_forca = 8;

    var cam = view_camera[0];
    cam_x_original = camera_get_view_x(cam);
    cam_y_original = camera_get_view_y(cam);
}
    

 
    // MORTE DO BOSS
 
    if (vida <= 0 && !morrendo)
{
    morrendo = true;
    fase_morte = 1;
    timer_morte = room_speed * 3;

    sprite_index = spr_boss_dano;
 
    audio_stop_sound(mus_boss);

    // iniciar tremor da tela
    shake_timer = room_speed * 3;
    shake_forca = 8;

    var cam = view_camera[0];
    cam_x_original = camera_get_view_x(cam);
    cam_y_original = camera_get_view_y(cam);
}
    
   if (morrendo)
{
    var cam = view_camera[0];

    
    // TREMOR DE TELA
    
    if (shake_timer > 0)
    {
        shake_timer--;

        var offset_x = random_range(-shake_forca, shake_forca);
        var offset_y = random_range(-shake_forca, shake_forca);

        camera_set_view_pos(cam, cam_x_original + offset_x, cam_y_original + offset_y);
    }
    else
    {
        camera_set_view_pos(cam, cam_x_original, cam_y_original);
    }

    
    // FASE 1 – ESPERA 3s
  
    if (fase_morte == 1)
    {
        timer_morte--;

        if (timer_morte <= 0)
        {
            audio_play_sound(snd_morte_boss, 1, false);

            repeat (1500)
            {
                part_particles_create(global.ps, x, y, global.par_explosao, 1);
            }

            instance_create_layer(x, y, layer, obj_chave);

            visible = false;

            fase_morte = 2;
            timer_morte = room_speed * 1.5;
        }
    }
    
    // FASE 2 – FINAL
    
    else if (fase_morte == 2)
    {
        timer_morte--;

        if (timer_morte <= 0)
        {
            audio_play_sound(mus_end, 1, true);
            instance_destroy();
        }
    }

    exit;
}


// =========================
// DETECTAR PLAYER
// =========================
var _player = instance_nearest(x, y, obj_player);

if (instance_exists(_player))
{
    var dist = point_distance(x, y, _player.x, _player.y);

    if (estado == "esperando" && dist < raio_visao)
    {
        estado = "perseguindo";
        timer = room_speed * 3;
    }
}
if (instance_exists(_player))
{
    if (_player.x > x)
        image_xscale = 0.5;   // olhando para direita
    else
        image_xscale = -0.5;  // olhando para esquerda
}


// =========================
// ESTADOS
// =========================
switch (estado)
{
    case "perseguindo":

        if (instance_exists(_player))
        {
            var dir = point_direction(x, y, _player.x, _player.y);
            var dx = lengthdir_x(vel, dir);
            var dy = lengthdir_y(vel, dir);

            x += dx;
            y += dy;
        }

        timer--;
        if (timer <= 0)
        {
            estado = "parado1";
            timer = room_speed * 5;
        }

    break;


    case "parado1":

        timer--;
        if (timer <= 0)
        {
            // ATAQUE CIRCULAR
            var qtd = 12;
            for (var i = 0; i < qtd; i++)
            {
                var ang = i * (360 / qtd);
                var b = instance_create_layer(x, y, layer, obj_bola_de_fogo);
                b.direction = ang;
                b.speed = 3;
            }

            estado = "parado2";
            timer = room_speed * 5;
			audio_play_sound(snd_boss_voz, 1, false)
        }

    break;


    case "parado2":

        timer--;
        if (timer <= 0)
        {
            estado = "perseguindo";
            timer = room_speed * 3;
        }

    break;
}


/// =========================
// DANO DA LANTERNA
// =========================

var _lanterna = instance_nearest(x, y, obj_lanterna);

if (instance_exists(_lanterna))
{
    if (_lanterna.ativo && point_distance(x, y, _lanterna.x, _lanterna.y) < 120)
    {
        timer_dano++;

        if (timer_dano >= room_speed)
        {
            vida -= 1;
            tempo_dano_sprite = room_speed / 2;
            timer_dano = 0;
        }
    }
    else
    {
        timer_dano = 0;
    }
}

// =========================
// DANO AO PLAYER
// =========================
if (cooldown_dano > 0) cooldown_dano--;

if (place_meeting(x, y, obj_player) && cooldown_dano <= 0)
{
    with (obj_player)
    {
        tomar_dano(1);
			audio_play_sound(snd_dano, 1, false);
    }

    cooldown_dano = room_speed; // 1 segundo entre danos
}


if (tempo_dano_sprite > 0)
{
    tempo_dano_sprite--;
    sprite_index = spr_boss_dano;
}
else
{
    sprite_index = spr_boss;
}