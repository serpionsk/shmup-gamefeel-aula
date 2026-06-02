if (global.hitstop) exit

if (y < -30)
{
	instance_destroy();
}

image_xscale = lerp(image_xscale, 1, .1);
image_yscale = lerp(image_yscale, 1, .1);



velv = lerp(velv, vel, .1);
y += velv;


var _rastro = instance_create_depth(x, y , depth, obj_rastro_tiro);
_rastro.cor = rainbow;