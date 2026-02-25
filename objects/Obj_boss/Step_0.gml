// =========================
// MORTE
// =========================
if (vida <= 0)
{
    instance_create_layer(x, y, "layer_constante", obj_chave);

    repeat (40)
    {
        var p = part_particles_create(global.ps, x, y, global.par_explosao, 1);
    }

    instance_destroy();
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
            timer = room_speed * 3;
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
                var b = instance_create_layer(x, y, "layer_constante", obj_bola_de_fogo);
                b.direction = ang;
                b.speed = 4;
            }

            estado = "parado2";
            timer = room_speed * 2;
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


// =========================
// DANO DA LANTERNA
// =========================
if (instance_exists(obj_player))
{
    var _p = obj_player;

    // Só toma dano se lanterna estiver ligada
    if (_p.lanterna_ativa)
    {
        if (point_distance(x, y, _p.x, _p.y) < 100)
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
    }

    cooldown_dano = room_speed; // 1 segundo entre danos
}