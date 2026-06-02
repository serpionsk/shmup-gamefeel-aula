velv = 0
velh = 0
vel = 4


morrendo = function()
{
	instance_destroy();
	instance_create_layer(x, y, layer, obj_explosao_tiro);
}