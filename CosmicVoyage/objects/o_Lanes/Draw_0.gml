gpu_set_alphatestenable(true);
gpu_set_tex_repeat(true);



for(i = 0; i < 6; i ++)
{
	matrix_set(matrix_world,matrix_build(0,-32000*i,0,0,0,0,1,1,1));
	vertex_submit(testPlane,pr_trianglelist,sprite_get_texture(spr_Lanes,0));
	matrix_set(matrix_world,matrix_build_identity());
}
gpu_set_tex_repeat(false);
