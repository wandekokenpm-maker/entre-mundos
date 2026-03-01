//SALVA STATUS DO PLAYER

// Vida
global.player_vida = other.vida_atual;

// Energia (obj_controle_mundo)
var controle = instance_find(obj_controle_mundo, 0);
if (controle != noone)
{
    global.player_energia = controle.energia_atual;
}

// Cargas da lanterna
var lanterna = instance_find(obj_lanterna, 0);
if (lanterna != noone)
{
    global.player_cargas = lanterna.cargas;
}

// TROCA DE ROOM 
if (!instance_exists(obj_transicao))
{
    instance_create_layer(0, 0, "layer_constante", obj_transicao);
}

with (obj_transicao)
{
    estado = "fade_out";
    proxima_room = room_next(room); 
}