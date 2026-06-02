desfaz_hitstop();

if (keyboard_check_pressed(vk_numpad5))
{
	global.hitstop = true;
	timer_hitstop = 60;
}
