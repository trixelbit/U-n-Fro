/// @description Insert description here
// Good huntin' to ya ^^

// for some reason, the draw begin event only works in here /shrug
if y < 1024
	{
if y > 0
	{
draw_set_lighting(true)	

draw_light_define_ambient(make_color_hsv(0,0,fadeIn))
fadeIn = lerp(fadeIn,255,0.015);
	}
gpu_set_zwriteenable(false)
//matrix_set(matrix_world,matrix_build(o_Player.x,o_Player.y,0,0,0,0,50,50,50))
matrix_set(matrix_world,matrix_build(o_Player.x,o_Player.y-400,-256,0,0,0,600,600,600))
vertex_submit(o_GameManager.skyboxBuff,pr_trianglelist,sprite_get_texture(spr_skybox_space,0))
matrix_set(matrix_world,matrix_build_identity())
gpu_set_zwriteenable(true)
draw_set_lighting(false)
	}; 