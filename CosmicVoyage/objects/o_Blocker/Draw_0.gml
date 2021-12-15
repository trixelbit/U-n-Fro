/// @description Insert description here
// Good huntin' to ya ^^
y --;


if assigned == false
		{
			assigned = true
			curTex = sprite_get_texture(spr_testuv,0); curModel = o_GameManager.m_testBeam;
			height_ = 0
			m_rot = laneDegree*currentLane

			// data assignment
			switch(currentBlocker)
				{
					
					case blockerTypes.cube: curModel = o_GameManager.m_testCube; x = 256+lengthdir_x(256,currentLane*laneDegree);
											z = 256+lengthdir_y(256,currentLane*laneDegree);  height_ = 64 break;
					case blockerTypes.cliff: curModel = o_GameManager.m_testBeam; x = 256+lengthdir_x(256,currentLane*laneDegree)
											z = -256; height_ = 4*100; m_rot = 0; break;
					case blockerTypes.strut: curModel = o_GameManager.m_testStrut; x = 256+lengthdir_x(256,currentLane*laneDegree);
											z = 256+lengthdir_y(256,currentLane*laneDegree);  height_ = 64; bID = instance_create_layer(0,y,"Instances",o_Blocker);
											bID.currentBlocker = blockerTypes.invisible; bID.currentLane = cWrap(currentLane-6,0,11); global.count ++; break;
					case blockerTypes.invisible: curModel = 0; x = 256+lengthdir_x(256,currentLane*laneDegree);
											z = 256+lengthdir_y(256,currentLane*laneDegree);  height_ = 64; m_rot = 0; break;
				}
			if currentBlocker == blockerTypes.invisible { draw_set_color(c_red) } else { draw_set_color(c_green) }
			bbox = draw_bbox_3D(0,0,0,height_)	
			
		}
	

	mat = matrix_build(x,y,-z,0,m_rot-90,0,50,50,50);
	assigned = true


//matrix_set(matrix_world,mat2)
//gpu_set_zwriteenable(false)
//shader_set(sh_Outline)
//vertex_submit(curModel,pr_trianglelist,curTex)
//gpu_set_zwriteenable(true)
gpu_set_zwriteenable(true)
gpu_set_ztestenable(true)
matrix_set(matrix_world,mat)
//shader_set(sh_Depth)
	if currentBlocker != blockerTypes.invisible
		{
vertex_submit(curModel,pr_linelist,curTex);
		}
render_BBOX(bbox)
//shader_reset();
matrix_set(matrix_world,matrix_build_identity());


