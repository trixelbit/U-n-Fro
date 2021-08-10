/// @description Insert description here
// Good huntin' to ya ^^
y --;
xSpin += spinSpeed;
ySpin += spinSpeed;
xSpin = wrap(xSpin,0,359);
ySpin = wrap(ySpin,0,359);

switch(currentAsteroid)
	{
	case asteroidTypes.single:	curModel = o_GameManager.m_AstSng;
								curTex = sprite_get_texture(t_asteroid1,0);break;
	case asteroidTypes.row:		curModel = o_GameManager.m_AstRow;
								curTex = sprite_get_texture(t_asteroid_row,0);break;
	case asteroidTypes.column:	curModel = o_GameManager.m_AstCol; 
								curTex = sprite_get_texture(t_asteroid_col,0); break;
	case asteroidTypes.cwasant: curModel = o_GameManager.m_AstCaw;
								curTex = sprite_get_texture(t_asteroid1,0); break;
	};

matrix_set(matrix_world,matrix_build(x,y,sin(current_time/700)*20,0,0,0,50,50,50))
shader_set(sh_Depth)
vertex_submit(curModel,pr_trianglelist,curTex);
shader_reset();
matrix_set(matrix_world,matrix_build_identity());

