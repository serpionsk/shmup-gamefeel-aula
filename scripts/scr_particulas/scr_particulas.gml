function cria_particulas(_x = 0, _y = 0, _velh = 0, _velv = 0)
{
	if (!instance_exists(obj_part_manager)) instance_create_depth(0, 0, 0, obj_part_manager);
	
	with(obj_part_manager)
	{
		var _qtd = irandom_range(10, 50);
		var _vel = abs(_velh) + abs(_velv);
		var _dir = point_direction(0, 0, _velh, _velv);
		var _tam = random_range(0.2, .5);
		repeat(_qtd)
		{
			var _part = instance_create_layer(_x, _y, "Particles", obj_partzinha);
			
			var _dir_part = _dir + random_range(-30, 30);
			
			_part.velh = lengthdir_x(_vel, _dir_part);
			_part.velv = lengthdir_y(_vel, _dir_part);
			_part.image_xscale = _tam;
			_part.image_yscale = _tam;
			_part.image_angle = _dir_part;
		}
	}
}