gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);

if(isDebug)
{
	draw_set_color(c_white);
	if(isPlayerOne)
	{
		draw_text_ext_transformed(25, 10, "Player One", 10, 300, 0.75, 0.75, 0);
	}
	else
	{
		draw_text_ext_transformed(25, 10, "Player Two", 10, 300, 0.75, 0.75, 0);
	}
	draw_text_ext_transformed(25, 20, "X: " + string(x), 10, 300, 0.75, 0.75, 0);
	draw_text_ext_transformed(25, 30, "Y: " + string(y), 10, 300, 0.75, 0.75, 0);
	draw_text_ext_transformed(25, 40, "Z: " + string(z), 10, 300, 0.75, 0.75, 0);
}

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);