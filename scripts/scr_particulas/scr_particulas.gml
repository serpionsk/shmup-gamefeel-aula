function cria_particulas(_vida_min = 30, _vida_max = 60, _x = 0, _y = 0, _velh = 0, _velv = 0, _cor = c_white)
{
	if (!instance_exists(obj_part_manager)) instance_create_depth(0, 0, 0, obj_part_manager);
	
	with(obj_part_manager)
	{
		var _qtd = irandom_range(10, 50);
		var _vel = abs(_velh) + abs(_velv);
		var _dir = point_direction(0, 0, _velh, _velv);

		repeat(_qtd)
		{
			var _x1 = _x + random_range(-12, 12);
			var _y1 = _y + random_range(_velv, _velv * 4);
			
			var _part = instance_create_layer(_x, _y, "Particles", obj_partzinha);
			
			var _vel_final = _vel + random_range(0, 5);
			
			with(_part)
			{
				var _tam = random_range(0.2, .5);
				var _dir_part = _dir + random_range(-30, 30);
			
				var _vida = random_range(_vida_min, _vida_max);
				
				velh_original = lengthdir_x(_vel_final, _dir_part);
				velv_original = lengthdir_y(_vel_final, _dir_part);
				
				escala_original = _tam;
				image_angle = _dir_part;
				vida_max = _vida;
				vida_atual = _vida;
				cor_original = _cor
				sprite_index = choose(spr_part_linha, spr_part_triang);
			}
		}
	}
}