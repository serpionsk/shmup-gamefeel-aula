global.hitstop = false;


function ativa_hitstop(_tempo = 60)
{
	_existe = instance_exists(obj_hitstop_manager);
	
	if (!_existe)
	{
		instance_create_depth(0, 0, 0, obj_hitstop_manager);
	}
	
	global.hitstop = true;
	obj_hitstop_manager.timer_hitstop = _tempo;
	
	trava_backgrounds(obj_hitstop_manager.lista_backgrounds);
}


function pega_backgrounds()
{
	//variavel que pega todas as layers
	var _layers = layer_get_all();
	
	//quantifica o tamanho da array _layers
	var _qtd = array_length(_layers);
	var _bgs = [];
	
	//laço for para aumentar o indice até chegar ao valor de _qtd
	for(var i = 0; i < _qtd; i++)
	{
		//atual é o indice atual da layer
		var _atual = _layers[i];
		
		//recebe o id do background
		var _teste = layer_background_get_id(_atual);
		//show_message(_teste)
		
		//valida se a array atual é de background
		if (_teste != -1)
		{
			var _nome = layer_get_name(_atual);
			
			//pega a layer atual e guarda no array "_bgs"
			array_push(_bgs, _nome);
			//show_message(_nome)
		}
	}
	return _bgs;
}

function trava_backgrounds(_lista_backgrounds)
{
	var _tamanho = array_length(_lista_backgrounds);
	
	for(i = 0; i < _tamanho; i++)
	{
		var _atual = _lista_backgrounds[i];
		
		var _vspeed = layer_get_vspeed(_atual);
		var _hspeed = layer_get_hspeed(_atual);
		
		array_push(obj_hitstop_manager.bgs_vspeed, _vspeed);
		array_push(obj_hitstop_manager.bgs_hspeed, _hspeed);

		
		layer_hspeed(_atual, 0);
		layer_vspeed(_atual, 0);
	}
}
function destrava_backgrounds(_lista_backgrounds, _bgs_hspeed, _bgs_vspeed)
{
	var _qtd = array_length(_lista_backgrounds)
	for ( i = 0; i < _qtd; i++)
	{
		var _atual = _lista_backgrounds[i];
		var _hspeed = _bgs_hspeed[i];
		var _vspeed = _bgs_vspeed[i];
		
		
	}
}