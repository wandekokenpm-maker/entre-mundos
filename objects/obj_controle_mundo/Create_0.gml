/*global.mundo = 1;

energia_max =20;
energia_atual = 10; // coloque valor fixo para teste

if (variable_global_exists("player_energia"))
{
    energia_atual = global.player_energia;
}
custo_troca = 1;

maquina_quebrada = false;
timer_morte = -1; // importante começar negativo


instance_activate_layer("Layer_Mundo1");
instance_deactivate_layer("Layer_Mundo2");

global.dialogo_ativo = false;
global.texto_atual = "";
*/
global.mundo = 1;

energia_max = 20;
energia_atual = 10;

custo_troca = 1;

maquina_quebrada = false;
timer_morte = -1;

// Camadas iniciais
instance_activate_layer("Layer_Mundo1");
instance_deactivate_layer("Layer_Mundo2");

layer_set_visible("bc_mundo_1", true);
layer_set_visible("bc_mundo_2", false);

// Dialogo
global.dialogo_ativo = false;
global.texto_atual = "";