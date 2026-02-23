if (!other.invulneravel)
{
    // Tirar vida
    other.vida_atual -= 1;

    // Ativar invulnerabilidade
    other.invulneravel = true;
    other.timer_invulneravel = room_speed * 1; // 1 segundo

    // Knockback (empurrão)
    var empurrao = 6;

    if (other.x < x)
    {
        other.vel_x = -empurrao;
    }
    else
    {
        other.vel_x = empurrao;
    }

    other.vel_y = -4; // pequeno impulso pra cima

    // Parar inimigo por 1 segundo
    parado = true;
    timer_parado = room_speed * 1;
}