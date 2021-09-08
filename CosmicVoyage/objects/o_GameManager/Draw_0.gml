/// @description Insert description here
// Good huntin' to ya ^^

if currentState != GameState.Intro
	{
		matrix_set(matrix_world,matrix_build(256,room_height-600,48,-90,0,90,70,50,50));
		vertex_submit(m_Hangar,pr_trianglelist,sprite_get_texture(t_Hangar,0));
		matrix_set(matrix_world,matrix_build_identity());
	}
	
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