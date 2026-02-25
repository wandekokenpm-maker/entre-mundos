draw_self();

// BARRA DE VIDA
var largura = 40;
var altura = 6;
var xx = x - largura/2;
var yy = y - sprite_height/2 - 12;

draw_set_color(c_black);
draw_rectangle(xx-1, yy-1, xx+largura+1, yy+altura+1, false);

draw_set_color(c_red);
draw_rectangle(xx, yy, xx + (largura * (vida / vida_max)), yy + altura, false);