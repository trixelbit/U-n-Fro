gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);

draw_set_color(c_white);
draw_text(25, 25, "X: " + string(x));
draw_text(25, 50, "Y: " + string(y));
draw_text(25, 75, "Z: " + string(z));

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);