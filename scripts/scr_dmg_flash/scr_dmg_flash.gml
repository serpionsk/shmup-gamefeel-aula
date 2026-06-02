function ativa_damage_flash(_cor = c_white)
{
	var _flash = instance_create_depth(0, 0, 0, obj_dmg_flash)
	
	var _xscale = room_width / _flash.sprite_width;
	var _yscale	= room_height / _flash.sprite_height;
	_flash.image_xscale = _xscale + 1;
	_flash.image_yscale = _yscale + 1;
	_flash.image_blend = _cor;
}