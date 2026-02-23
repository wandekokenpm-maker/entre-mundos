global.mundo = 1;

energia_max = 10;
energia_atual = 10; // coloque valor fixo para teste

custo_troca = 1;

maquina_quebrada = false;
timer_morte = -1; // importante começar negativo


instance_activate_layer("Layer_Mundo1");
instance_deactivate_layer("Layer_Mundo2");