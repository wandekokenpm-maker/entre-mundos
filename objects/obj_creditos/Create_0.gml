audio_stop_all();
audio_play_sound(mus_end, 1, true);

// TEXTO
y_texto = room_height + 100;
vel_subida = 1.2;

// CONTROLE FINAL
mostrando_logo = false;
tempo_logo = 0;
fade_final = 0;
timer_logo = 0;

fade_alpha = 1;

tempo_total_logo = room_speed * 5; 
// CREDITOS
creditos = [
"JOGO DESENVOLVIDO PARA A NONEJAM 12",
"",
"Programação",
"Diego Wandekoken Passos",
"",
"Design",
"Diego Wandekoken Passos",
"",
"Arte",
"Diego Wandekoken Passos",
"timy tower free pack - site Opengameart.org",
"boss stephen challener free pack - site Opengameart.org",
"chibi-monsters-files free pack - site Opengameart.org",
" Grotto-escape-2 free pack -site Opengameart.org", 
"",
"Música",
"My Very Own Dead Ship - site Opengameart.org ",
"End CreditsTheme ogg - site Opengameart.org",
" Heroic Demise - site Opengameart.org",

"",
"Efeitos sonoros",
"Diego Wandekoken Passos",
"SoundPack01 - - site Opengameart.org",
"",
"Obrigado por jogar!"
];