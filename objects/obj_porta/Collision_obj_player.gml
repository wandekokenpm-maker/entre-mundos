if (fechada && other.tem_chave)
{
    fechada = false;
    abrindo = true;

    other.tem_chave = false; // consome chave
}