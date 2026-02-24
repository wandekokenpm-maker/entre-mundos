

// ==============================
// TEXTO BASE (PADRÃO DA PLACA)
// ==============================

texto =
"Você está preso em um mundo onde as realidades estão se misturando. Para conseguir escapar, precisará transitar entre dois mundos que se chocam e se sobrepõem a cada instante.#" +

"No seu pulso, você carrega uma pequena máquina capaz de alternar entre essas realidades com um simples pressionar da tecla [Q].#"+

"Pressionar a tecla [Q] é sua única esperança de saída desse lugar.#" +

"Mas cuidado essa tecnologia é instável. Se as recargas chegarem a zero, a máquina pode explodir, e levar você junto com ela.";


// ==============================
// CONTROLE INTERNO
// ==============================

linhas = [];
texto_processado = false;

dist_interacao = 48;
jogador_perto = false;
dialogo_ativo = false;
linha_atual = 0;
offset_anim = 0;