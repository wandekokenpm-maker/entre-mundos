if (ativo)
{
    // Para imediatamente
    other.timer_parado = room_speed; 
    
    // Dano por segundo
    timer_dano++;

    if (timer_dano >= room_speed)
    {
        other.vida -= 1;
        timer_dano = 0;
    }
}