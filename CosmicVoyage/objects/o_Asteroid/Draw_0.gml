/// @description Insert description here
// Good huntin' to ya ^^
y --;
xSpin += spinSpeed;
ySpin += spinSpeed;
xSpin = wrap(xSpin,0,359);
ySpin = wrap(ySpin,0,359);
scale1= 50;
scale2= scale1+5.5;
if o_GameManager.currentState == GameState.Multiplayer
	{
		mOffset = currentLane*32
	};

	curTex = t_AstSng; curModel = o_GameManager.m_AstSng;
	mat = matrix_build(x+mOffset,y,-z,xSpin,ySpin,0,50,50,50);
	mat2 = matrix_build(x,y,-z,-90,0,0,scale2,scale2,scale2);



//matrix_set(matrix_world,mat2)
//gpu_set_zwriteenable(false)
//shader_set(sh_Outline)
//vertex_submit(curModel,pr_trianglelist,curTex)
//gpu_set_zwriteenable(true)
gpu_set_zwriteenable(true)
gpu_set_ztestenable(true)
matrix_set(matrix_world,mat)
//shader_set(sh_Depth)
vertex_submit(curModel,pr_trianglelist,curTex);
//shader_reset();
matrix_set(matrix_world,matrix_build_identity());

