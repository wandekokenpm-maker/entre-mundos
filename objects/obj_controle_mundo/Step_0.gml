
// =====================================
// SE MÁQUINA ESTÁ FUNCIONANDO
// =====================================
if (!maquina_quebrada)
{
    if (keyboard_check_pressed(ord("Q")) && energia_atual > 0)
{
    energia_atual -= custo_troca;

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


    // Energia acabou?
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
    }
}
    }
}
else
{
    if (timer_morte > 0)
    {
        timer_morte--;

        // Quando faltar 1 segundo
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