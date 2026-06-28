if (global.hitstop) exit

x += velh
y += velv

velh *= 0.96;
velv *= 0.96;

if (image_alpha <= 0) 
{
	instance_destroy();
}
else
{
	image_alpha -= 0.06
}

