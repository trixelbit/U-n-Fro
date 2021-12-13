/// @description Insert description here
// Good huntin' to ya ^^
//DrawSpriteBillboardRotExt(sprite_index, image_index, x, y, -z, currentRot-90, 0,2,2);
uni = shader_get_uniform(sh_EnemyDrone,"u_Charge")
shader_set(sh_EnemyDrone)
shader_set_uniform_f(uni,1.0-(fireTick/maxTick))
matrix_set(matrix_world,matrix_build(x,y,-z-sin(current_time/200)*16,currentRot-90,0,270,8,8,8))
vertex_submit(model_index,pr_trianglelist,sprite_get_texture(spr_enemy_drone,0))
matrix_set(matrix_world,matrix_build_identity())
shader_reset()