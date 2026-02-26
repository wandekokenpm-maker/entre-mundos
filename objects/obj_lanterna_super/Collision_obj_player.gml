// Procura a lanterna
var l = instance_find(obj_lanterna, 0);

if (l != noone)
{
    l.sprite_index = spr_lanterna_super;
    l.upgrade = true; // flag para futuras melhorias
}
audio_play_sound(snd_coleta, 1, false);
instance_destroy();