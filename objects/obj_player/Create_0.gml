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
vida_atual = 3;

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

//tteste

function tomar_dano(valor)
{
    if (!invencivel && estado != "morrendo")
    {
        vida -= valor;

        if (vida <= 0)
        {
            estado = "morrendo";
        }

        invencivel = true;
        tempo_invencivel = room_speed; // 1 segundo invencível
    }
}
