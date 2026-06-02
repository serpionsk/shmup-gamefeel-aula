 //muda o processamento de cores
gpu_set_blendmode(bm_add);
//sobrepondo o tiro com uma versao dele mesmo de cor diferente para gerar iluminação
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, cor, 0.5)

gpu_set_blendmode(bm_normal);