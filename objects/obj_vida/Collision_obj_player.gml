if (other.vida_atual < other.vida_maxima)
{
    other.vida_atual += 1; // concede 1 de vida

    if (other.vida_atual > other.vida_maxima)
    {
        other.vida_atual = other.vida_maxima;
    }

    instance_destroy(); // some após coletar
}