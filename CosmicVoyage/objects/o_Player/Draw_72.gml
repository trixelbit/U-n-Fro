/// @description Insert description here
// Good huntin' to ya ^^

// for some reason, the draw begin event only works in here /shrug
gpu_set_zwriteenable(false)
	//matrix_set(matrix_world,matrix_build(o_Player.x,o_Player.y,0,0,0,0,50,50,50))
	if o_GameManager.currentState != GameState.Multiplayer
		{
		if o_GameManager.currentSkybox = spr_skybox_asteroids
			{
			matrix_set(matrix_world,matrix_build(o_Player.x+650,o_Player.y-700,-300,0,0,0,1800,1100,1100))
			}
		if o_GameManager.currentSkybox = spr_skybox_space
			{
			matrix_set(matrix_world,matrix_build(o_Player.x,o_Player.y-700,-300,0,0,0,1100,1100,1100))	
			}
		if o_GameManager.currentSkybox = spr_skyplane_3
			{
			matrix_set(matrix_world,matrix_build(o_Player.x+300,o_Player.y-700,200,0,0,0,1100,1100,1100))
			}
		if o_GameManager.currentSkybox = spr_skybox_sky
			{
			matrix_set(matrix_world,matrix_build(room_width*0.5,o_Player.y-2048,-1000,0,0,0,5100,1100,1100))	
			}
			
		}
	else
		{
	matrix_set(matrix_world,matrix_build(256,o_Player.y-700,-300,0,0,0,1100,1100,1100))	
		};
	//matrix_set(matrix_world,matrix_build(o_Player.x,o_Player.y-400,0,0,0,0,600,600,600))
	vertex_submit(o_GameManager.skyboxBuff,pr_trianglelist,sprite_get_texture(o_GameManager.currentSkybox,0))
	show_debug_message(o_GameManager.currentSkybox)
	matrix_set(matrix_world,matrix_build_identity());
	gpu_set_zwriteenable(true);
	draw_set_lighting(false);