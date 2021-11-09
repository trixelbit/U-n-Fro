gpu_set_alphatestenable(true);
gpu_set_tex_repeat(true);

// draws the lanes
// draws the planet surface
if instance_exists(o_Player) && o_GameManager.currentLevel == levelState.env_Space
	{
shader_set(sh_Scrolling)
shader_set_uniform_f(shader_get_uniform(sh_Scrolling,"u_Offset"),0.0,-(current_time/1600)*0.25);
matrix_set(matrix_world,matrix_build(o_Player.x-2048,o_Player.y-2048,90,0,0,0,4096,4096,2048))
vertex_submit(vertexQuad,pr_trianglelist,sprite_get_texture(t_SurfacePlanet,0))

matrix_set(matrix_world,matrix_build(o_Player.x-2048,o_Player.y-2048,72,0,0,0,4096,4096,2048))
vertex_submit(vertexQuad,pr_trianglelist,sprite_get_texture(t_Clouds,0))
matrix_set(matrix_world,matrix_build_identity())

shader_reset()
	};

// draws the lanes 

for(i = 0; i < 6; i ++)
{

	matrix_set(matrix_world,matrix_build(0,-32000*i,0,0,0,0,1,1,1));
	vertex_submit(testPlane,pr_trianglelist,sprite_get_texture(spr_Lanes,0));
	matrix_set(matrix_world,matrix_build_identity());
	
}
gpu_set_tex_repeat(false);
