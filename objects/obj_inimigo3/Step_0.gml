if (global.hitstop) exit

maquina_de_estados();

desfaz_efeito_mola();
timer_efeito_dano();



y += velv;
x += velh;