ativo = false;

cargas_max = 10;
cargas = 10;

if (variable_global_exists("player_cargas"))
{
    cargas = global.player_cargas;
}

timer_bateria = 0;
timer_dano = 0;

dano_por_segundo = 1.5;

// Controle do som contínuo
som_lanterna_id = -1;
atingindo = false;

// PARTÍCULAS DE FAÍSCA

if (!variable_global_exists("ps_faisca"))
{
    global.ps_faisca = part_system_create();
    part_system_depth(global.ps_faisca, -50);

    global.par_faisca = part_type_create();

    part_type_shape(global.par_faisca, pt_shape_spark);
    part_type_size(global.par_faisca, 0.1, 0.1, 0.0, 0.0);
    part_type_color1(global.par_faisca, make_color_rgb(255, 220, 40));
    part_type_alpha2(global.par_faisca, 3, 1);
    part_type_life(global.par_faisca, 10, 20);
    part_type_speed(global.par_faisca, 2, 3, 0, 0);
    part_type_direction(global.par_faisca, 0, 360, 0, 0);
    part_type_gravity(global.par_faisca, 0.1, 270);
}

