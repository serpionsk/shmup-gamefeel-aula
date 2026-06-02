timer_hitstop = 60;

lista_backgrounds = pega_backgrounds();

bgs_vspeed = [];
bgs_hspeed = [];

desfaz_hitstop = function()
{
	if (!global.hitstop) return;
	with(all)
	{
		image_speed = 0;
	}
	timer_hitstop--;
	if (timer_hitstop <= 0)
	{
		global.hitstop = false
		destrava_backgrounds(lista_backgrounds, bgs_hspeed, bgs_vspeed);
		with(all)
		{
			image_speed = 1;
		}
	}
}