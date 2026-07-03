if (global.hitstop) exit

x += velh
y += velv


vida_atual--;
var _val = vida_atual / vida_max;

image_alpha = _val;

var _nova_cor = merge_colour(c_white, cor_original, _val);
image_blend = _nova_cor;

if (vida_atual <= 0) instance_destroy();

velh = _val * velh_original * _val;
velv = _val * velv_original * _val;