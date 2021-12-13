gpu_set_alphatestenable(true);
gpu_set_tex_repeat(true);
if instance_exists(o_Player)
	{
		gpu_set_zwriteenable(false)
		
		matrix_set(matrix_world,matrix_build(room_width*4,o_Player.y-2048*4,512+256,0,0,0,128,128,128))	
		vertex_submit(o_GameManager.skyboxBuff,pr_trianglelist,sprite_get_texture(o_GameManager.currentSkybox,0))
		matrix_set(matrix_world,matrix_build_identity());
		
		gpu_set_zwriteenable(true);
		draw_set_lighting(false);	
			
	}
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
else if o_GameManager.currentLevel == levelState.env_Space && !instance_exists(o_Player) && o_GameManager.currentState != GameState.Intro
	{
z=0

matrix_set(matrix_world,matrix_build(room_width*2,-256,1024-z,0,0,0,38,38,38))
vertex_submit(mPlane,pr_trianglelist,sprite_get_texture(t_SurfacePlanet,0))
shader_set(sh_Scrolling)
shader_set_uniform_f(shader_get_uniform(sh_Scrolling,"u_Offset"),0.0,-(current_time/7600)*0.25);
matrix_set(matrix_world,matrix_build(room_width*2,-256,1022-z,0,0,0,38,38,38))
vertex_submit(mPlane,pr_trianglelist,sprite_get_texture(t_Clouds,0))
matrix_set(matrix_world,matrix_build_identity())	
shader_reset()
	}
	
if o_GameManager.currentLevel == levelState.env_Planet && instance_exists(o_Player)
	{
z=0

matrix_set(matrix_world,matrix_build(room_width*2,o_Player.y-256,500,0,0,0,38,38,38))
vertex_submit(mPlane,pr_trianglelist,sprite_get_texture(t_SurfaceOcean,0))
shader_set(sh_Scrolling)
shader_set_uniform_f(shader_get_uniform(sh_Scrolling,"u_Offset"),0.0,-(current_time/7600)*0.25);
matrix_set(matrix_world,matrix_build(room_width*2,o_Player.y-256,-1022-z,0,0,0,38,38,38))
//vertex_submit(mPlane,pr_trianglelist,sprite_get_texture(t_Clouds,0))
matrix_set(matrix_world,matrix_build_identity())	
shader_reset()
	}
if instance_exists(o_Player)
	{
		// draws the background

		// draws the lanes 
		y = o_Player.y
		currentLane = o_Player.currentLane
		laneDegree = o_Player.laneDegree
		for(i = 0; i < 12; i++)
			{
				laneOffset -= o_Player.finalSpd/8
				laneOffset = wrap(laneOffset,-2048-1024,4096)
				laneAlpha = 0.7 
				
				if currentLane*laneDegree == i*laneDegree
					{
				DrawSpriteBillboardRotA(spr_TestLane,1,256+lengthdir_x(256+32,i*laneDegree),y-512,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,0.7)	
				DrawSpriteBillboardRotA(spr_TestLane,1,256+lengthdir_x(256+32,i*laneDegree),y-512-laneOffset,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,laneAlpha)	
				DrawSpriteBillboardRotA(spr_TestLane,1,256+lengthdir_x(256+32,i*laneDegree),y-512-(laneOffset-2048),-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,laneAlpha)	
					};
				else
					{
				DrawSpriteBillboardRotA(spr_TestLane,0,256+lengthdir_x(256+32,i*laneDegree),y-512-laneOffset-4096,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,laneAlpha)	
				DrawSpriteBillboardRotA(spr_TestLane,0,256+lengthdir_x(256+32,i*laneDegree),y-512-laneOffset-2048,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,laneAlpha)	
				DrawSpriteBillboardRotA(spr_TestLane,0,256+lengthdir_x(256+32,i*laneDegree),y-512-laneOffset,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,laneAlpha)	
				DrawSpriteBillboardRotA(spr_TestLane,0,256+lengthdir_x(256+32,i*laneDegree),y-512,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,0.7)	
					};
			};
	}
else if o_GameManager.currentState != GameState.Intro
	{
gpu_set_zwriteenable(false)

matrix_set(matrix_world,matrix_build(room_width*4,-2048*4,512+256,0,0,0,128,128,128))	
vertex_submit(o_GameManager.skyboxBuff,pr_trianglelist,sprite_get_texture(o_GameManager.currentSkybox,0))
matrix_set(matrix_world,matrix_build_identity());

gpu_set_zwriteenable(true);
draw_set_lighting(false);			
	}
// draws the lanes 


gpu_set_tex_repeat(false);
