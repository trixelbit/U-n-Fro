
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
		laneOffset -= 2
		laneOffset = wrap(laneOffset,0,2048)
		laneAlpha = 1.0 - laneOffset/2048 
		
		if currentLane*laneDegree == i*laneDegree
			{
		DrawSpriteBillboardRotA(spr_TestLane,1,256+lengthdir_x(256+32,i*laneDegree),y-512,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,0.7)	
		DrawSpriteBillboardRotA(spr_TestLane,1,256+lengthdir_x(256+32,i*laneDegree),y-512-laneOffset,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,laneAlpha)	
		DrawSpriteBillboardRotA(spr_TestLane,1,256+lengthdir_x(256+32,i*laneDegree),y-512-(laneOffset*2),-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,laneAlpha/2)	
			};
		else
			{
		DrawSpriteBillboardRotA(spr_TestLane,0,256+lengthdir_x(256+32,i*laneDegree),y-512-laneOffset,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,laneAlpha)	
		DrawSpriteBillboardRotA(spr_TestLane,0,256+lengthdir_x(256+32,i*laneDegree),y-512,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0,0.7)	
			};
	};
	};