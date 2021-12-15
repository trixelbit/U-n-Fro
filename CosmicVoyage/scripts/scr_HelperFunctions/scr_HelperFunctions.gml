// Functions for assisting with game systems or mechanics

/// @function						StringSplit(str, seperator)
/// @param {string} str				String to split
/// @param {string} seperator		Char to split string by
function StringSplit(str, seperator)
{
	splitArray = [];
	splitArray[0] = "";
	var splitCnt = 0;
	for(a = 0; a < string_length(str); a++)
	{
		if(string_char_at(str,a+1) == seperator)
		{
			splitCnt++;
			array_resize(splitArray,splitCnt);
			splitArray[splitCnt] = "";
		}
		else
		{
			splitArray[splitCnt] = string(splitArray[splitCnt]) + string_char_at(str,a+1);
		}
	}
			
	return splitArray;	
}

/// @function						LoadObj(filename)
/// @param {string} filename		Filename of the model .obj file
function LoadObj(filename,buffer)
    {
    var objBuffer = buffer;
	

	var objFile = 0;
    var objFile = file_text_open_read(filename);
    
	var vpCollection, vtCollection, vnCollection, fgCollection
	
    vpCollection[0] = 0; // vertex position
    vtCollection[0] = 0; // vertex texcoord
    vnCollection[0] = 0; // vertex normals
    fgCollection[0] = 0; // face groups 
	
	array_resize(vpCollection,1)
	array_resize(vtCollection,1)
	array_resize(vnCollection,1)
	array_resize(fgCollection,1)

    while(!file_text_eof(objFile))
        {
            var str = file_text_readln(objFile);
            
            if string_char_at(str,1) == "v" && string_char_at(str,2) == " " // vertex position
                {
                    var vpstr = string_copy(str,3,string_length(str));
                    vpstr = StringSplit(vpstr," ");
                    
                    var vpData = { x: real(vpstr[0]), y: real(vpstr[1]), z: real(vpstr[2]) };
                    array_push(vpCollection,vpData);
                }
            if string_char_at(str,1) == "v" && string_char_at(str,2) == "t" // vertex texcoords
                {
                    var vtstr = string_copy(str,4,string_length(str));
                    vtstr = StringSplit(vtstr," ");
                    
                    var vtData = { u: real(vtstr[0]), v: real(vtstr[1]) };
                    array_push(vtCollection,vtData);
                    
                }
            if string_char_at(str,1) == "v" && string_char_at(str,2) == "n" // vertex normals
                {
                    var vnstr = string_copy(str,4,string_length(str));
                    vnstr = StringSplit(vnstr," ");
                    
                    var vnData = { x: real(vnstr[0]), y: real(vnstr[1]), z: real(vnstr[2]) };
                    array_push(vnCollection,vnData);
                }
            if string_char_at(str,1) == "f" && string_char_at(str,2) == " " // face groups
                {
                    var fgstr = string_copy(str,3,string_length(str));
                    fgstr = StringSplit(fgstr," ");
                    
                    var fgData = { x: (fgstr[0]), y: (fgstr[1]), z: (fgstr[2]) };
                    array_push(fgCollection,fgData);    
                }    
            
        };
	file_text_close(objFile);
	
    vertex_begin(objBuffer,objFormat)
    var i = 1;
    for(i = 1; i < array_length(fgCollection); i++) // vertex construction
        {
            var facegroup = fgCollection[i];
            var faceset1 = 0;faceset2 = 0; faceset3 = 0;

                                faceset1 = StringSplit(facegroup.x,"/");
                                faceset2 = StringSplit(facegroup.y,"/");
                                faceset3 = StringSplit(facegroup.z,"/");

                    var vertexPos = vpCollection[faceset1[0]]
                    var vertexTex = vtCollection[faceset1[1]]
                    var vertexNor = vnCollection[faceset1[2]]
                    
                    vertex_position_3d(objBuffer,vertexPos.x,vertexPos.y,vertexPos.z);
                    vertex_color(objBuffer,c_white,1);
                    vertex_texcoord(objBuffer,vertexTex.u,vertexTex.v);
                    vertex_normal(objBuffer,vertexNor.x,vertexNor.y,vertexNor.z);
					
					var vertexPos = vpCollection[faceset2[0]]
                    var vertexTex = vtCollection[faceset2[1]]
                    var vertexNor = vnCollection[faceset2[2]]
                    
                    vertex_position_3d(objBuffer,vertexPos.x,vertexPos.y,vertexPos.z);
                    vertex_color(objBuffer,c_white,1);
                    vertex_texcoord(objBuffer,vertexTex.u,vertexTex.v);
                    vertex_normal(objBuffer,vertexNor.x,vertexNor.y,vertexNor.z);
					
					var vertexPos = vpCollection[faceset3[0]]
                    var vertexTex = vtCollection[faceset3[1]]
                    var vertexNor = vnCollection[faceset3[2]]
                    
                    vertex_position_3d(objBuffer,vertexPos.x,vertexPos.y,vertexPos.z);
                    vertex_color(objBuffer,c_white,1);
                    vertex_texcoord(objBuffer,vertexTex.u,vertexTex.v);
                    vertex_normal(objBuffer,vertexNor.x,vertexNor.y,vertexNor.z);
                   
                
        }
        vertex_end(objBuffer)
		vertex_freeze(objBuffer)
        return objBuffer
        };

/// @function						DrawSpriteBillboard(sprite, subimage, xx, yy, zz, flip)
function DrawSpriteBillboard(sprite, subimage, xx, yy, zz, flip)
{
	shader_set(sh_Billboard);
	var rot = 0;
	if(flip)
	{
		rot = -1;
	}
	else
	{
		rot = 1;
	}
	matrix_set(matrix_world, matrix_build(xx, yy, zz, 0, 0, 0, 1, 1, 1));
	draw_sprite_ext(sprite, subimage, 0, 0, rot, 1, 0, c_white, 1);
	matrix_set(matrix_world, matrix_build_identity());
	shader_reset();
}

function DrawSpriteBillboardRotExt(sprite, subimage, xx, yy, zz, rot, flip, xscale, yscale)
	{
		shader_set(sh_Billboard);
		if flip == true
			{
				xScale = -1*xscale;
			}
		else
			{
				xScale = 1*xscale;	
			}
		matrix_set(matrix_world, matrix_build(xx, yy, zz, 0, 0, 0, 1, 1, 1));
		draw_sprite_ext(sprite, subimage, 0, 0, xScale, yscale, rot, c_white, 1);
		matrix_set(matrix_world, matrix_build_identity());
		shader_reset();
	}
function DrawSpriteBillboardRotA(sprite, subimage, xx, yy, zz, rot, flip, alpha)
	{
		shader_set(sh_Billboard);
		if flip == true
			{
				xScale = -1;
			}
		else
			{
				xScale = 1;	
			}
		matrix_set(matrix_world, matrix_build(xx, yy, zz, 0, 0, 0, 1, 1, 1));
		draw_sprite_ext(sprite, subimage, 0, 0, xScale, 1, rot, c_white, alpha);
		matrix_set(matrix_world, matrix_build_identity());
		shader_reset();
	}
function DrawSpriteBillboardRot(sprite, subimage, xx, yy, zz, rot, flip)
	{
		shader_set(sh_Billboard);
		if flip == true
			{
				xScale = -1;
			}
		else
			{
				xScale = 1;	
			}
		matrix_set(matrix_world, matrix_build(xx, yy, zz, 0, 0, 0, 1, 1, 1));
		draw_sprite_ext(sprite, subimage, 0, 0, xScale, 1, rot, c_white, 1);
		matrix_set(matrix_world, matrix_build_identity());
		shader_reset();
	}

/// @function						wrap(val, min, max)
/// @param {real} val				value to wrap
/// @param {real} min				minimum value to wrap to
/// @param {real} max				maximum value to wrap to
function wrap(val, min, max)
	{
	if val > max { return min };
	if val < min { return max };
	return val;
	}
	
function run_reset() // used to reset the run back to the main menu state
	{
		global.scoreDist = 0;
		global.scoreKills = 0;
		global.scoreTotal = 0;
		global.gameOver = false;
		o_Player.scoreP1 = 0;
		o_Player.scoreP2 = 0;
		o_Player.killsP1 = 0;
		o_Player.killsP2 = 0;
		
		o_Player.y = room_height;
		o_Player.x = 256;
		o_Player._lives = 3;
		o_Player.targetX = 256;
		o_Player.currentLane = 0;
		o_Player.hasJobro = false;
		o_Player.hasSimone = false;
		o_Player.hasBunbi = false;
		o_Player.isInvincible = false;
		
		
		
		instance_destroy(o_Asteroid);
		instance_destroy(o_EnemyUFO);
		instance_destroy(o_Projectile);
		
		o_GameManager.currentLevel = levelState.env_Space
		o_GameManager.lvlCounter = 0;
		o_GameManager.levelTrans = false;
		o_GameManager.canSpawn = true;
		o_GameManager.currentState = GameState.Menu;
		o_GameManager.gameStart = false;
		instance_destroy(o_Stars)
	
		
	};

/// @function						collision_sphere(x,y,z,radius,obj,notme)
/// @param {real} x					x position to check
/// @param {real} y					y position to check
/// @param {real} z					z position to check
/// @param {real} radius			radius to check within
/// @param {object} obj				object to check for
/// @param {boolean} notme			to include the object calling this function in the collision
function collision_sphere(x,y,z,radius,obj,notme)
	{
		var col = collision_circle(x,y,10,obj,false,notme) 
		if col != noone
			{
				if col.z > z - radius && col.z < z + radius 
					{
					return col;
					}
			}
		else
			{
				return noone;	
			}
	}
	
function cWrap(val,min,max)
	{
		var cVal = val;
		if val > max { cVal = min + (max-val) } 
		if val < min { cVal = max + (val-min) + 1 } 
		return cVal;
	}

function draw_bbox_3D(x,y,z,height)
	{
		var boxBuff = vertex_create_buffer()
		var col = draw_get_color()
		vertex_begin(boxBuff,o_GameManager.objFormat)
		
		// x length
		vertex_position_3d(boxBuff,x,y,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x+sprite_width,y,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// x+y length
		vertex_position_3d(boxBuff,x,y+sprite_height,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x+sprite_width,y+sprite_height,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// x+z length
		vertex_position_3d(boxBuff,x,y,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x+sprite_width,y,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// x+y+z length
		vertex_position_3d(boxBuff,x,y+sprite_height,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x+sprite_width,y+sprite_height,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// y width
		vertex_position_3d(boxBuff,x,y,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x,y+sprite_height,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// y+x width
		vertex_position_3d(boxBuff,x+sprite_width,y,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x+sprite_width,y+sprite_height,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// y+z width
		vertex_position_3d(boxBuff,x,y,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x,y+sprite_height,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// y+x+z width
		vertex_position_3d(boxBuff,x+sprite_width,y,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x+sprite_width,y+sprite_height,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// z height
		vertex_position_3d(boxBuff,x,y,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x,y,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// z+x height
		vertex_position_3d(boxBuff,x+sprite_width,y,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x+sprite_width,y,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// z+y height
		vertex_position_3d(boxBuff,x,y+sprite_height,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x,y+sprite_height,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		// z+x+y height
		vertex_position_3d(boxBuff,x+sprite_width,y+sprite_height,-z);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		vertex_position_3d(boxBuff,x+sprite_width,y+sprite_height,-z-height);
		vertex_color(boxBuff,col,1);
		vertex_texcoord(boxBuff,0,0);
		vertex_normal(boxBuff,0,0,0);
		
		
		
		vertex_end(boxBuff)
		var iBuff = buffer_create_from_vertex_buffer(boxBuff,buffer_vbuffer,1)
		vertex_delete_buffer(boxBuff)
		var fBuff = vertex_create_buffer_from_buffer(iBuff,o_GameManager.objFormat)
		buffer_delete(iBuff)
		vertex_freeze(fBuff)
		return fBuff;
	}
function render_BBOX(m_bbox)
	{
		matrix_set(matrix_world,matrix_build(x-(sprite_width/2),y-(sprite_height/2),-z,0,0,0,1,1,1))
		shader_set(sh_BBOX)
		vertex_submit(m_bbox,pr_linelist,-1)
		matrix_set(matrix_world,matrix_build_identity())
		shader_reset()
	}	
function instance_place3D(x,y,z,height,obj)
	{
		var cz = 0
		var ch = 0
		var col_id = instance_place(x,y,obj)
		if col_id != noone
			{
				cz = col_id.z;
				ch = col_id.height_;
				if z > cz || z+height > cz
					{
						
						if z < ch+cz
							{
						return col_id
							}
						
					}
				else
					{
						return noone	
					}
			}
		else
			{
				return noone	
			}
	}
function drawTextBox(x,y,width,height,text) // not used currently
	{
		var textSpeed = 0.25;
		var strTotal = "";
		for(i = 0; i < string_length(text); i++)
			{
		
				draw_text(x,y,strTotal)	
				audio_play_sound(sfx_text_tick,10, false)	
				
			}
			
			

	};


// palette functions

/// @function palette_SetUniforms()
/// @desc sets the shader uniforms for the palette shader.
function palette_SetUniforms()
	{
		shader_set_uniform_f(sCol1,color_get_red(global.keyCol1)/255,color_get_green(global.keyCol1)/255,color_get_blue(global.keyCol1)/255);
		shader_set_uniform_f(sCol2,color_get_red(global.keyCol2)/255,color_get_green(global.keyCol2)/255,color_get_blue(global.keyCol2)/255);
		shader_set_uniform_f(sCol3,color_get_red(global.keyCol3)/255,color_get_green(global.keyCol3)/255,color_get_blue(global.keyCol3)/255);
		shader_set_uniform_f(sCol4,color_get_red(global.keyCol4)/255,color_get_green(global.keyCol4)/255,color_get_blue(global.keyCol4)/255);
		
		shader_set_uniform_f(dCol1,color_get_red(global.dstCol1)/255,color_get_green(global.dstCol1)/255,color_get_blue(global.dstCol1)/255);
		shader_set_uniform_f(dCol2,color_get_red(global.dstCol2)/255,color_get_green(global.dstCol2)/255,color_get_blue(global.dstCol2)/255);
		shader_set_uniform_f(dCol3,color_get_red(global.dstCol3)/255,color_get_green(global.dstCol3)/255,color_get_blue(global.dstCol3)/255);
		shader_set_uniform_f(dCol4,color_get_red(global.dstCol4)/255,color_get_green(global.dstCol4)/255,color_get_blue(global.dstCol4)/255);
	}
	
/// @function						palette_Swap(dstCols)
/// @param {array} dstCols			array to get the new palette colors 
function palette_Swap(dstCols)
	{
		global.dstCol1 = dstCols[0];
		global.dstCol2 = dstCols[1];
		global.dstCol3 = dstCols[2];
		global.dstCol4 = dstCols[3];
	}

/// @function						palette_Create(col_0,col_1,col_2,col_3)
/// @param {color} col_0			color 1
/// @param {color} col_1			color 2
/// @param {color} col_2			color 3
/// @param {color} col_3			color 4
function palette_Create(col_0,col_1,col_2,col_3)
	{
		var palArr = array_create(4,0);
		
		palArr[0] = col_0;
		palArr[1] = col_1;
		palArr[2] = col_2;
		palArr[3] = col_3;
		
		// returns an array containg all the newly made colors
		return palArr;
	}
	
/// @function						palette_TextureOverride(overrideState)
/// @param {bool} overrideState		overrideState
function palette_TextureOverride(overrideState)
	{
		if overrideState == false // use baseTex 
			{
				shader_set_uniform_f(shader_get_uniform(sh_Palette,"u_texBase"),true)
			}
			
		if overrideState == true // use appTex
			{
				shader_set_uniform_f(shader_get_uniform(sh_Palette,"u_texBase"),false)
				texture_set_stage(shader_get_sampler_index(sh_Palette,"u_AppTex"),surface_get_texture(application_surface))
			}
	}