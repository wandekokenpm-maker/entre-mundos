// ======================================
// MOVIMENTO
// ======================================
vel_x = 0;
vel_y = 0;

velocidade = 2;
gravidade = 0.3;
forca_pulo = -5;

no_chao = false;
facing = 1;


// ======================================
// VIDA
// ======================================
vida_maxima = 10;
vida_atual = 5;

if (variable_global_exists("player_vida"))
{
    vida_atual = global.player_vida;
}

// ======================================
// INVULNERABILIDADE
// ======================================
invulneravel = false;
duracao_invulneravel = room_speed * 2; // 2 segundos
timer_invulneravel = 0;


// ======================================
// SISTEMA DE DANO / KNOCKBACK
// ======================================
estado_dano = false;
duracao_dano = 15; // frames sem controle
timer_dano = 0;


// ======================================
// SISTEMA DE MORTE
// ======================================
estado = "normal";
duracao_morte = room_speed * 2; 
timer_morte = 0


// ======================================
// CONTROLE DE SEGURANÇA
// ======================================
verificar_prisao = false;


// ======================================
// SPRITE PADRÃO
// ======================================
sprite_normal = sprite_index;
lanterna = instance_create_layer(x, y, layer, obj_lanterna);

// SISTEMA DE CHAVE
tem_chave = false;

vida_max = 5;
vida = vida_max;

invencivel = false;
tempo_invencivel = 0;


function tomar_dano(valor)
{
    if (invulneravel) return;

    vida_atual -= valor;

    invulneravel = true;
    timer_invulneravel = duracao_invulneravel;

    sprite_index = spr_invulneravel;
    image_index = 0;
    image_speed = 1;

    estado_dano = true;
    timer_dano = duracao_dano;

    var empurrao = 3;

    if (other.x < x)
        vel_x = empurrao;
    else
        vel_x = -empurrao;

    vel_y = -4;
}
estava_no_chao = false;