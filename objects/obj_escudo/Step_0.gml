if (global.hitstop) exit


if (image_speed = -1 && image_index <= 0.2)
{
	instance_destroy();
}


timer_escudo--;

if (timer_escudo <= 0)
{
	image_speed = -1;
}