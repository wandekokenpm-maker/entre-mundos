
// PROCESSA TEXTO (após Creation Code)


if (!texto_processado)
{
    linhas = string_split(texto, "#");
    texto_processado = true;
}

var p = instance_nearest(x, y, obj_player);

// animação flutuar
offset_anim += 0.1;

if (p != noone && point_distance(x, y, p.x, p.y) < dist_interacao)
{
    jogador_perto = true;

    if (keyboard_check_pressed(ord("L")))
    {
        if (!dialogo_ativo)
        {
            dialogo_ativo = true;
            linha_atual = 0;
        }
        else
        {
            linha_atual++;

            if (linha_atual >= array_length(linhas))
            {
                dialogo_ativo = false;
                linha_atual = 0;
            }
        }
    }
}
else
{
    jogador_perto = false;
}