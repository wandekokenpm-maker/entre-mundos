
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

// sistema de particulas
global.ps = part_system_create();

global.par_explosao = part_type_create();
part_type_shape(global.par_explosao, pt_shape_pixel);
part_type_size(global.par_explosao, 0.5, 1, 0, 0);
part_type_speed(global.par_explosao, 2, 5, 0, 0);
part_type_direction(global.par_explosao, 0, 360, 0, 0);
part_type_color1(global.par_explosao, c_red);
part_type_life(global.par_explosao, 30, 60);

// FLASH
flash_alpha = 0;
flash_timer = 0;
