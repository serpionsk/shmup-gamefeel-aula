vidas = 4;

tempo_tiro = 120;
timer_tiro = tempo_tiro;
randomise();

inicia_efeito_mola();
inicia_efeito_dano();

tempo_para_atirar = function()
{
	timer_tiro--;
	if (timer_tiro <= 0)
	{
		atirando();
		timer_tiro = (tempo_tiro/2) * random_range(1, 1.6);
	}
	
}

atirando = function()
{
	var _dir2 = 263;
	repeat(3)
	{
		var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo_hard);
					
		var _vel = _tiro.vel;
		var _velh = lengthdir_x(_vel, _dir2)
		var _velv = lengthdir_y(_vel, _dir2)
				
		_tiro.velh = _velh
		_tiro.velv = _velv
					
		_tiro.direction = _dir2;
		_dir2 += 7;
	}

	
}

morrendo = function()
{
	efeito_mola(1.3, 0.8);
	contador_efeito_dano(2);
	vidas--;
	show_debug_message("perdi 1hp")
	screanshake(5);
	if (vidas < 1)
	{
		show_debug_message("morri")
		power_up(85);
		global.pontos += 8;
		destroi_unidade(obj_explosao_inimigo);
		screanshake(10);
		snd_effect(sfx_enemy_explosion);
	}

	
}

estou_em_sequencia = in_sequence;