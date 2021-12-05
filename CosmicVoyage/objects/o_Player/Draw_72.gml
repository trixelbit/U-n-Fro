/// @description Insert description here
// Good huntin' to ya ^^

// for some reason, the draw begin event only works in here /shrug
gpu_set_zwriteenable(false)

matrix_set(matrix_world,matrix_build(room_width*2,o_Player.y-2048*4,512+256,0,0,0,128,128,128))	
vertex_submit(o_GameManager.skyboxBuff,pr_trianglelist,sprite_get_texture(o_GameManager.currentSkybox,0))
matrix_set(matrix_world,matrix_build_identity());

gpu_set_zwriteenable(true);
draw_set_lighting(false);