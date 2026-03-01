
// VIDA COM SPR_VIDA 

var margem_x = 15;
var margem_y = 25;
var espacamento = 35;

for (var i = 0; i < vida_atual; i++)
{
    draw_sprite_ext(
        spr_vida,
        0,
        margem_x + (i * espacamento),
        margem_y,
		        4,  
		        4,  
                0,
		        c_white,
		        1
    );
}
