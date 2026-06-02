vidas = 8;

estado = "chegando"

timer_tiro = game_get_speed(gamespeed_fps) * 3;
contador_tiro = 0;

decidi_direcao = false;

velv = 0;
velh = 0;
vel = 2;
dir_fuga = 0;

inicia_efeito_mola();
inicia_efeito_dano();

maquina_de_estados = function()
{
	switch(estado)
	{
		case "chegando":
		{
			if (y < random_range(113, 180))
			{
				velv = 1;
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
				timer_tiro--;
			}
			else
			{
				estado = choose("atirando", "atirando2");
				contador_tiro++;
				timer_tiro = game_get_speed(gamespeed_fps) * 2;
				
			}
		}
		break;
		case "atirando":
		{
			if (instance_exists(obj_player))
			{
				var _dir2 = 240;
				repeat(5)
				{
					var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo2b);
					
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
					dir_fuga = random(359);
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
					var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo2H);
					
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
					dir_fuga = random(359);
				}
			}
		}
		break;
		case "fugindo":
		{
			if (decidi_direcao == false)
			{
				velh = lengthdir_x(vel, dir_fuga);
				velv = lengthdir_y(vel, dir_fuga);
				decidi_direcao = true;
			}
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