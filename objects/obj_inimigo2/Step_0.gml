if (global.hitstop) exit

maquina_de_estados();

desfaz_efeito_mola();

timer_efeito_dano();

if (global.gamemode == "hard") instance_destroy();

y += velv;
x += velh;