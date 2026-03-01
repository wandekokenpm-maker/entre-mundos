function trocar_mundo()
{
    if (global.mundo_atual == 1)
    {
        global.mundo_atual = 2;
        
        instance_deactivate_layer("Layer_Mundo1");
        instance_activate_layer("Layer_Mundo2");
        
       
    }
    else
    {
        global.mundo_atual = 1;
        
        instance_deactivate_layer("Layer_Mundo2");
        instance_activate_layer("Layer_Mundo1");
        
       
    }
}