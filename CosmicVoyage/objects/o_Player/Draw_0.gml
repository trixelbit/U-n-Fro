
if o_GameManager.currentState != GameState.Menu
	{
	// player sprites

		matrix_set(matrix_world,matrix_build(x,y,-z,currentMROT,0,270,10,10,10))
		vertex_submit(m_PlayerShip,pr_trianglelist,sprite_get_texture(spr_Ship3D,0))
		matrix_set(matrix_world,matrix_build_identity())
		
	}
	
for(a = 0; a < 1; a++)
	{
for(i = 0; i < 12; i++)
	{
		if currentLane*laneDegree == i*laneDegree
			{
		DrawSpriteBillboardRot(spr_TestLane,1,256+lengthdir_x(256+32,i*laneDegree),y-512,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0)	
			};
		else
			{
		DrawSpriteBillboardRot(spr_TestLane,0,256+lengthdir_x(256+32,i*laneDegree),y-512,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0)	
			};
	};
	};