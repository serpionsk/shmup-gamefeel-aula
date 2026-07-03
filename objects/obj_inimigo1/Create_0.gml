
randomise();
tempo_tiro = 120;
timer_tiro = tempo_tiro;



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
	audio_stop_sound(sfx_enemy_shoot);
	var _tiro_inimigo = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo);
	_tiro_inimigo.vel = 4;
}

morrendo = function()
{
	efeito_mola(1.3, 0.8);
	contador_efeito_dano(2);
	screanshake(5);
	destroi_unidade(obj_explosao_inimigo);
	power_up(90);

	snd_effect(sfx_enemy_explosion);
}

estou_em_sequencia = in_sequence;