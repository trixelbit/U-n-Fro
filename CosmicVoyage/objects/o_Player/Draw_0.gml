
if o_GameManager.currentState != GameState.Menu
	{
	// player sprites

		matrix_set(matrix_world,matrix_build(x,y,-z,currentMROT-90,0,270,10,10,10))
		vertex_submit(m_PlayerShip,pr_trianglelist,sprite_get_texture(spr_Ship3D,0))
		
		render_BBOX(bbox)
	}
	
