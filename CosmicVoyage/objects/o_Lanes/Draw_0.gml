gpu_set_alphatestenable(true);
gpu_set_tex_repeat(true);

// draws the lanes
// draws the planet surface
if instance_exists(o_Player) && o_GameManager.currentLevel == levelState.env_Space
	{
z = 0

matrix_set(matrix_world,matrix_build(room_width*2,o_Player.y-256,1024-z,0,0,0,38,38,38))
vertex_submit(mPlane,pr_trianglelist,sprite_get_texture(t_SurfacePlanet,0))
shader_set(sh_Scrolling)
shader_set_uniform_f(shader_get_uniform(sh_Scrolling,"u_Offset"),0.0,-(current_time/5600)*0.25);
matrix_set(matrix_world,matrix_build(room_width*2,o_Player.y-256,1022-z,0,0,0,38,38,38))
vertex_submit(mPlane,pr_trianglelist,sprite_get_texture(t_Clouds,0))
matrix_set(matrix_world,matrix_build_identity())

shader_reset()
	};

// draws the lanes 

gpu_set_tex_repeat(false);
