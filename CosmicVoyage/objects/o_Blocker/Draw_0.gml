/// @description Insert description here
// Good huntin' to ya ^^
y --;

	curTex = sprite_get_texture(spr_testuv,0); curModel = o_GameManager.m_testBeam;
	mat = matrix_build(x,y,-z,0,0,0,50,50,100);



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

render_BBOX(bbox)
