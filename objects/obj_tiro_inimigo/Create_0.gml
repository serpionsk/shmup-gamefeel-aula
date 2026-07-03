velv = 0
velh = 0
vel = 4

cor = c_red;

morrendo = function()
{
	instance_destroy();
	instance_create_layer(x, y, layer, obj_explosao_tiro);
	cria_particulas( , , x, y, velh, velv, cor);
}