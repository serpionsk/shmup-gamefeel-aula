speed_variavel = 2
vidas = 5;
randomise();

if (x < room_width/2)
{
	estado = "chegando_esquerda"
}
else if (x > room_width/2)
{
	estado = "chegando_direita"
}

timer_tiro = game_get_speed(gamespeed_fps) * .5;
contador_tiro = 0;
decidi_direcao = false;
inicia_efeito_mola();
inicia_efeito_dano();

velv = 0;
velh = 0;
vel = 2;
dir_fuga = 0;

maquina_de_estados = function()
{
	switch(estado)
	{
		case "chegando_esquerda":
		{
			if (x < random_range(30, 260))
			{
				velh = speed_variavel;
			}
			else
			{
				estado = "carregando";
				velh = 0
			}
		}
		break;
		case "chegando_direita":
		{
			if (x > random_range(30, 260))
			{
				x -= speed_variavel;
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
				estado = "atirando";
				contador_tiro++;
				timer_tiro = game_get_speed(gamespeed_fps) * 1;
				
			}
		}
		break;
		case "atirando":
		{
			if (instance_exists(obj_player))
			{
				var _dir2 = 255;
				repeat(3)
				{
					var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo3);
					var _vel = _tiro.vel;
					var _velh = lengthdir_x(_vel, _dir2)
					var _velv = lengthdir_y(_vel, _dir2)
					
					_tiro.velh = _velh
					_tiro.velv = _velv
					
					_tiro.direction = _dir2;
					_dir2 += 15;
				}
				if (contador_tiro < 2)
				{
					estado = "carregando";
				}
				else
				{
					estado = "fugindo";
					dir_fuga = random(180);
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
		power_up(87);
		global.pontos += 4;
		destroi_unidade(obj_explosao_inimigo);
		snd_effect(sfx_enemy_explosion);
		screanshake(10);
	}
}