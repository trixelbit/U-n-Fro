/// @description Insert description here
// Good huntin' to ya ^^
y --;
xSpin += spinSpeed;
ySpin += spinSpeed;
xSpin = wrap(xSpin,0,359);
ySpin = wrap(ySpin,0,359);

switch(currentAsteroid)
	{
	case asteroidTypes.single: curTex = t_AstSng; curModel = o_GameManager.m_AstSng;break;
	case asteroidTypes.column: curTex = t_AstCol; curModel = o_GameManager.m_AstCol;break;
	case asteroidTypes.row   : curTex = t_AstRow; curModel = o_GameManager.m_AstRow;break;
	case asteroidTypes.cwasant: curTex = t_AstCol; curModel = o_GameManager.m_AstCaw;break;
	}

matrix_set(matrix_world,matrix_build(x,y,sin(current_time/700)*20,0,0,0,50,50,50))
shader_set(sh_Depth)
vertex_submit(curModel,pr_trianglelist,curTex);
shader_reset();
matrix_set(matrix_world,matrix_build_identity());

