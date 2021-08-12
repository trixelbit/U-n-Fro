/// @description Insert description here
// Good huntin' to ya ^^




if currentState != GameState.Intro
	{
	matrix_set(matrix_world,matrix_build(256,room_height-400,48,-90,0,90,70,50,50));
	vertex_submit(m_Hangar,pr_trianglelist,sprite_get_texture(t_Hangar,0));
	matrix_set(matrix_world,matrix_build_identity());
	}
	
