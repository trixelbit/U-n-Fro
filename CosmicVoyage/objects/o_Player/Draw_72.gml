/// @description Insert description here
// Good huntin' to ya ^^

// for some reason, the draw begin event only works in here /shrug
gpu_set_zwriteenable(true)
	//matrix_set(matrix_world,matrix_build(o_Player.x,o_Player.y,0,0,0,0,50,50,50))
	matrix_set(matrix_world,matrix_build(o_Player.x,o_Player.y-900,100,0,0,0,1100,1100,1100))
	//matrix_set(matrix_world,matrix_build(o_Player.x,o_Player.y-400,0,0,0,0,600,600,600))
	vertex_submit(o_GameManager.skyboxBuff,pr_trianglelist,sprite_get_texture(spr_skybox_space,0))
	matrix_set(matrix_world,matrix_build_identity());
	gpu_set_zwriteenable(true);
	draw_set_lighting(false);