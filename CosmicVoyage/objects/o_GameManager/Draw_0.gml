/// @description Insert description here
// Good huntin' to ya ^^

if currentState != GameState.Intro
	{
		matrix_set(matrix_world,matrix_build(256,room_height-1400,0,0,0,90,50,50,50));
		vertex_submit(m_Hangar,pr_trianglelist,sprite_get_texture(t_Hangar,0));
		matrix_set(matrix_world,matrix_build_identity());
		shader_set(sh_HangarShip)
		if currentState == GameState.Menu
			{
		matrix_set(matrix_world,matrix_build(256,room_height-512,0,0,0,270,20,20,20))
		vertex_submit(m_PlayerShip,pr_trianglelist,sprite_get_texture(spr_Ship3D,0))
		matrix_set(matrix_world,matrix_build_identity())
			}
		shader_reset()
	}
/*
if currentState == GameState.Game || currentState == GameState.Multiplayer
	{
		if random(100) > 75
			{
				starSide = choose(0,1)
				if starSide = 0
					{
						instance_create_layer(0+random(-256),o_Player.y-4096,"Instances",o_Stars)	
					}
				else
					{
						instance_create_layer((256+128)+random(256),o_Player.y-4096,"Instances",o_Stars)	
					}
				}
		
	}