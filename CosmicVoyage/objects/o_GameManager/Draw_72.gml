/// @description Insert description here
// Good huntin' to ya ^^


// skybox code
gpu_set_zwriteenable(false)
matrix_set(matrix_world,matrix_build(o_Player.x,o_Player.y,0,0,0,0,50,50,50))
vertex_submit(skyboxBuff,pr_trianglelist,sprite_get_texture(spr_skybox_space,0))
gpu_set_zwriteenable(true)
