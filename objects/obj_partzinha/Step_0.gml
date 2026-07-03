if (global.hitstop) exit

x += velh
y += velv


vida_atual--;
var _val = vida_atual / vida_max;

image_alpha = _val;

var _nova_cor = merge_colour(c_white, cor_original, _val);
image_blend = _nova_cor;

if (vida_atual <= 0) instance_destroy();

velh = (_val * _val) * velh_original;
velv = (_val * _val) * velv_original;

image_xscale = _val * escala_original;
image_yscale = image_xscale;