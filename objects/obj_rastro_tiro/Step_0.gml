if (global.hitstop) exit;

image_alpha -= 0.1;

image_xscale -= 0.1;
//image_yscale -= 0.1;

image_xscale = clamp(image_xscale, 0, image_xscale);

if (image_alpha <= 0) instance_destroy();