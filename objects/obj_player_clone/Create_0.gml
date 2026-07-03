#region variaveis
//deslocamento da formação em relação ao player (definido na criação)
offset_x = 0;
offset_y = 0;

//tempo de espera para atirar novamente
espera_tiro = 18;
//valor que permite atirar ou não se esta zerado
timer_tiro = 0
//inicia a alteraçãop nas escalas visuais do efeito mola(sem alterar colisao)
inicia_efeito_mola();
//variavel que checa se tomei dano ou não (0 = não)
inicia_efeito_dano();
#endregion
#region metodos
//função que controla o tiro do clone
controla_player = function()
{
	var _atirar;
	_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);
	
	//segue a posição do player, mantendo a formação
	x = obj_player.x + offset_x;
	y = obj_player.y + offset_y;
	
	//diminui o timer do tiro ao executar a propria função do tiro
	timer_tiro--;
	
	//se atirar e o timer tiro forem true
	if (_atirar and timer_tiro <=0)
	{
		audio_stop_sound(sfx_shoot1);
		snd_effect(sfx_shoot1);
		//instancia a função do efeito mola (x, y)
		efeito_mola(2, .8);
		
		tiro_1();
		
		timer_tiro = espera_tiro;
	}
}
//metodos de tiro
tiro_1 = function()
{
	var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro);
}
#endregion