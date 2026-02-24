// ======================================
// SISTEMA DE ANIMAÇÃO (PRIORIDADE)
// ======================================

if (estado == "morrendo")
{
    sprite_index = spr_morto;
}
else if (invulneravel)
{
    sprite_index = spr_invulneravel;
}
else if (lanterna.ativo)
{
    if (!no_chao)
        sprite_index = spr_pulo;
    else if (abs(vel_x) > 0)
        sprite_index = spr_run_lanterna;
    else
        sprite_index = spr_usa_lanterna;
}

else
{
    if (!no_chao)
        sprite_index = spr_pulo;
    else if (abs(vel_x) > 0)
        sprite_index = spr_run;
    else
        sprite_index = spr_idle;
}

image_xscale = facing;


// ======================================
// SISTEMA DE MORTE
// ======================================

if (estado == "morrendo")
{
    vel_x = 0;
    vel_y = 0;

    timer_morte--;

    if (timer_morte == 60)
    {
        sprite_index = spr_morto;
        image_index = 0;
        image_speed = 1;
    }

    if (timer_morte <= 0)
        room_restart();

    exit;
}



// ======================================
// CONTROLE DO EMPURRÃO (DANO)
// ======================================

if (estado_dano)
{
    timer_dano--;

    vel_x *= 0.9; // desaceleração suave

    if (timer_dano <= 0)
        estado_dano = false;
}


// ======================================
// VERIFICA SE NÃO ESTÁ PRESO
// ======================================

if (verificar_prisao)
{
    if (place_meeting(x, y, obj_chao))
    {
        while (place_meeting(x, y, obj_chao))
        {
            y -= 1;
        }

        vel_y = -4;
    }

    verificar_prisao = false;
}


// ======================================
// GRAVIDADE
// ======================================

vel_y += gravidade;


// ======================================
// MOVIMENTO
// ======================================

var dir = 0;

if (keyboard_check(vk_right)) dir = 1;
if (keyboard_check(vk_left))  dir = -1;

if (!estado_dano) // 👈 IMPEDIR CANCELAR KNOCKBACK
{
    vel_x = dir * velocidade;

    if (dir != 0)
        facing = dir;
}


// ======================================
// COLISÃO HORIZONTAL
// ======================================

if (place_meeting(x + vel_x, y, obj_chao))
{
    while (!place_meeting(x + sign(vel_x), y, obj_chao))
    {
        x += sign(vel_x);
    }
    vel_x = 0;
}
x += vel_x;


// ======================================
// COLISÃO VERTICAL
// ======================================

if (place_meeting(x, y + vel_y, obj_chao))
{
    while (!place_meeting(x, y + sign(vel_y), obj_chao))
    {
        y += sign(vel_y);
    }

    if (vel_y > 0)
        no_chao = true;

    vel_y = 0;
}
else
{
    no_chao = false;
}
y += vel_y;



// ======================================
// PULO
// ======================================

if (keyboard_check_pressed(vk_space) && no_chao && !estado_dano)
{
    vel_y = forca_pulo;

   //DESLIGA A LANTERNA AO PULAR
    with (obj_lanterna)
    {
        ativo = false;
    }
}


// ======================================
// COLISÃO COM INIMIGO
// ======================================

var inimigo = instance_place(x, y, obj_inimigo);

if (inimigo != noone && !invulneravel)
{
    vida_atual -= 1;

    invulneravel = true;
    timer_invulneravel = duracao_invulneravel;

    sprite_index = spr_invulneravel;
    image_index = 0;
    image_speed = 1;

    estado_dano = true;
    timer_dano = duracao_dano;

    var empurrao = 3;

    if (x < inimigo.x)
        vel_x = -empurrao;
    else
        vel_x = empurrao;

    vel_y = -4; // impulso vertical forte

    inimigo.timer_parado = room_speed; // para inimigo 1s

    // evita ficar preso no chão
    if (place_meeting(x, y, obj_chao))
    {
        while (place_meeting(x, y, obj_chao))
        {
            y -= 1;
        }
    }
}


// ======================================
// INVULNERABILIDADE
// ======================================

if (invulneravel)
{
    timer_invulneravel--;

    if (timer_invulneravel <= 0)
    {
        invulneravel = false;
    }
}


// ======================================
// ATIVA MORTE
// ======================================

if (vida_atual <= 0 && estado != "morrendo")
{
    estado = "morrendo";
    timer_morte = duracao_morte;

    vel_x = 0;
    vel_y = 0;
}

