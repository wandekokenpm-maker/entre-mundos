
if (abrindo)
{
    // Toca o som uma única vez
    if (!som_tocado)
    {
        audio_play_sound(snd_porta, 1, false);
        som_tocado = true;

        shake_timer = room_speed * 0.3; // tremor curto
        shake_forca = 1; // tremor leve
    }

    // Movimento normal (lógica real)
    if (y > y_inicial - altura_aberta)
    {
        y -= vel_subida;
    }
}


// ======================
// TREMOR VISUAL
// ======================
if (shake_timer > 0)
{
    shake_timer--;
    y_visual = y + random_range(-shake_forca, shake_forca);
}
else
{
    y_visual = y;
}

// Aplica posição final
y = y_visual;