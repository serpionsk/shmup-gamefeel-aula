if (global.hitstop) exit

if (!in_sequence && estou_em_sequencia)
{
	instance_destroy();
}

desfaz_efeito_mola();
tempo_para_atirar();
timer_efeito_dano();