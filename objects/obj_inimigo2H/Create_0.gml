vidas = 8;
estado = "chegando"
timer_tiro = game_get_speed(gamespeed_fps) * 1;
contador_tiro = 0;
decidi_direcao = false;
inicia_efeito_mola();
inicia_efeito_dano();
randomise();

local_random1 = random_range(25, 125)
local_random2 = random_range(160, 265)

velv = 0;
velh = 0;
vel = 2;
dir_fuga = 0;

spawn = choose(local_random1, local_random2);

maquina_de_estados = function()
{
	switch(estado)
	{
		case "chegando":
		{
			if (x <= spawn)
			{	
				velh = 4;
			}
			else
			{
				estado = "carregando";
				
			}
		}
		break;
		case "carregando":
		{
			if (timer_tiro > 0)
			{
				velh = 0;
				timer_tiro--;
			}
			else
			{
				estado = "atirando2"
				contador_tiro++;
				timer_tiro = game_get_speed(gamespeed_fps) * .5;
				
			}
		}
		break;
		case "atirando":
		{
			if (instance_exists(obj_player))
			{
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo3_Hard);
				_tiro.velv = 2;
				_tiro.direction = _dir;
				_tiro.image_angle = _dir+90;
				if (contador_tiro < 3)
				{
					estado = "carregando";
				}
				else
				{
					estado = "fugindo";
				}
			}
		}
		break;
		case "atirando2":
		{
			if (instance_exists(obj_player))
			{
				var _dir2 = 255;
				repeat(3)
				{
					var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo3_Hard);
					var _vel = _tiro.vel;
					var _velh = lengthdir_x(_vel, _dir2)
					var _velv = lengthdir_y(_vel, _dir2)
					
					_tiro.velh = _velh
					_tiro.velv = _velv
					
					_tiro.direction = _dir2;
					_dir2 += 15;
				}
				if (contador_tiro < 4)
				{
					estado = "carregando";
				}
				else
				{
					estado = "fugindo";
				}
			}
		}
		break;
		case "fugindo":
		{
			if (decidi_direcao == false)
			{
				velh = choose(-1, 1);
				decidi_direcao = true;
			}
			velv = -1;
			if (y <= -100 || y >= room_height + 100 || x >= room_width + 100 || x <= -100)
			{
				instance_destroy();
			}
		}
		break;
	}
}


morrendo = function()
{
	efeito_mola(1.3, 0.8);
	contador_efeito_dano(2);
	vidas--;
	screanshake(5);
	if (vidas < 1)
	{
		power_up(80);
		global.pontos += 8;
		destroi_unidade(obj_explosao_inimigo);
		screanshake(10);
	}
}