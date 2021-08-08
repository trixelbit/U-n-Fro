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
function LoadObj(filename)
{
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_color();
	vertex_format_add_texcoord();
	vertex_format_add_normal();
	
	var objFormat = vertex_format_end();
	objBuffer = vertex_create_buffer();
	var objFile = file_text_open_read(filename);
	var i, a, c, j // incerementor vars
	var vvData, vtData, vnData, vfData, vfdData, strCnt // arrays 
	
	vvData[0] = 0; // vertex position data (vec3 xyz)
	vtData[0] = 0; // vertex texture data (vec2 uv)
	vnData[0] = 0; // vertex normal data (vec3 xyz)
	vfData[0] = 0; // face data (complex);
	vfdData[0] = 0; // face indices
	
	var vvCount = 0;
	var vtCount = 0;
	var vnCount = 0;
	var vfCount = 0;
	
	while(!file_text_eof(objFile))
	{
		var str = file_text_readln(objFile);
		if ((string_char_at(str, 1) == "v") && string_char_at(str, 2) == " ") // vertex positions
		{		
			vvData[vvCount] = { x : 0, y : 0, z : 0};
			var strPos = string_copy(str, 3, string_length(str) - 3);
			
			strCnt = StringSplit(strPos, " ") // returns the split up vectors
			
			vvData[vvCount].x = real(strCnt[0]);
			vvData[vvCount].y = real(strCnt[1]);
			vvData[vvCount].z = real(strCnt[2]);	
			vvCount++;
		}
		
		if (string_char_at(str, 1) == "v" && string_char_at(str, 2) == "t")   // vertex textures
		{
			vtData[vtCount] = { u: 0, v: 0 };
			var strPos = string_copy(str, 4, string_length(str) - 4);
			
			strCnt = StringSplit(strPos, " ");
			
			vtData[vtCount].u = real(strCnt[0]);
			vtData[vtCount].v = real(strCnt[1]);
			vtCount++;
		}
		
		if (string_char_at(str, 1) == "v" && string_char_at(str, 2) == "n")   // vertex normals
		{
			vnData[vnCount] = { x: 0, y: 0, z: 0 };
			var strPos = string_copy(str, 4, string_length(str) - 4);
			
			strCnt = StringSplit(strPos, " ");

			vnData[vnCount].x = real(strCnt[0]);
			vnData[vnCount].y = real(strCnt[1]);
			vnData[vnCount].z = real(strCnt[2]);
			vnCount++;
		}
				
		if(string_char_at(str, 1) == "f")  // face instructions
		{
			var faceStr = string_copy(str, 3, string_length(str) - 2);
					
			vfdData = 0;
			vfdData = StringSplit(faceStr, " ");
			vfd2 = ds_list_create();
			
			for(j = 0; j < array_length(vfdData); j++)
			{
				ds_list_add(vfd2, vfdData[j]);
			}
			
			vfData[vfCount] = vfd2;
			vfCount++;
			vfData[vfCount] = "";
					
		}	
	} // end of file reading.

	// vertex buffer construction
	vertex_begin(objBuffer, objFormat);
	
	for(i = 0; i < array_length(vfData) - 1; i++)
	{
		//show_debug_message("TEST 1: " + string(i))
		var ftData = vfData[i]				
		{
			for(c = 0; c < 3; c++) // 3 is the hard coded limit here as the importer only cares about vertex position, vertex texcoords, and the normals (3 things)
			{
				var faceIndices = StringSplit(ftData[|c], "/");
							
				var vertPos = vvData[real(faceIndices[0]) - 1];
				var vertTex = vtData[real(faceIndices[1]) - 1];
				var vertNor = vnData[real(faceIndices[2]) - 1];
							
				vertex_position_3d(objBuffer, vertPos.x, vertPos.y, vertPos.z);
				vertex_color(objBuffer, c_white, 1);
				vertex_texcoord(objBuffer, vertTex.u, vertTex.v);
				vertex_normal(objBuffer, vertNor.x, vertNor.y, vertNor.z);
			}
		}		
	}
				
	vertex_end(objBuffer);
	
	// this part deals with cleaning up the ds_lists created
	
	for(a = 0; a < array_length(vfData)-1; a++)
		{
			var listID = vfData[a]
			ds_list_destroy(listID);
		};
	
	return objBuffer;
}

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
	matrix_set(matrix_world, matrix_build(xx, yy, zz, 0, 0, 0, -1, 1, 1));
	draw_sprite_ext(sprite, subimage, 0, 0, rot, 1, 0, c_white, 1);
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
	