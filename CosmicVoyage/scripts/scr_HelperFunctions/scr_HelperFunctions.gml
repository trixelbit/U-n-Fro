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
	
	objFormat = vertex_format_end();
	objBuffer = vertex_create_buffer();
	var objFile = file_text_open_read(filename);
	
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
			strCnt[0] = 0; // array containing the length of each vector for splitting up the line
			strCounter = 0; // the counter for the array
			var strPos = string_copy(str, 3, string_length(str) - 3);
			
			for(j = 0; j < string_length(strPos); j++)
			{
				if(string_char_at(strPos, j + 1) == " ")
				{
					strCnt[strCounter] = j;
					strCounter++;
				}
			}
			
			var xxx = string_copy(strPos, 1, strCnt[0]);
			vvData[vvCount].x = real(xxx);						 
			vvData[vvCount].y = real(string_copy(strPos, strCnt[0] + 1, strCnt[1]));		
			vvData[vvCount].z = real(string_copy(strPos, strCnt[1] + 1, string_length(strPos)));	
			vvCount++;
			array_resize(strCnt, 1);
		}
		
		if (string_char_at(str, 1) == "v" && string_char_at(str, 2) == "t")   // vertex textures
		{
			vtData[vtCount] = { u: 0, v: 0 };
			strCnt[0] = 0;
			strCounter = 0;
			var strPos = string_copy(str, 4, string_length(str) - 4);
			
			for(j = 0; j < string_length(strPos); j++)
			{
				if(string_char_at(strPos, j + 1) == " ")
				{
					strCnt[strCounter] = j;
					strCounter++;
				}
			}
			
			var u = string_copy(strPos, 1, strCnt[0]);
			vtData[vtCount].u = real(u);
			vtData[vtCount].v = real(string_copy(strPos, strCnt[0] + 1, string_length(strPos) - strCnt[0]));
			vtCount++;
			array_resize(strCnt, 1);
		}
		
		if (string_char_at(str, 1) == "v" && string_char_at(str, 2) == "n")   // vertex normals
		{
			vnData[vnCount] = { x: 0, y: 0, z: 0 };
			strCnt[0] = 0;
			strCounter = 0;
			var strPos = string_copy(str, 4, string_length(str) - 4);
			
			for(j = 0; j < string_length(strPos); j++)
			{
				if(string_char_at(strPos, j + 1) == " ")
				{
					strCnt[strCounter] = j;
					strCounter++;
				}
			}
			
			var xxx = string_copy(strPos, 1, strCnt[0]);
			vnData[vnCount].x = real(xxx);
			vnData[vnCount].y = real(string_copy(strPos, strCnt[0] + 1, strCnt[1]));
			vnData[vnCount].z = real(string_copy(strPos, strCnt[1] + 1, string_length(strPos)));	
			vnCount++;
			array_resize(strCnt, 1);
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
				
		// all the necessary data now has been collected :)
		// now it is time to construct the model using the face instructions D:
			
	}

	vertex_begin(objBuffer, objFormat);
	
	for(i = 0; i < array_length(vfData) - 1; i++)
	{
		//show_debug_message("TEST 1: " + string(i))
		ftData = vfData[i]				
		{
			for(c = 0; c < 3; c++)
			{
				show_debug_message("TEST 2: " + string(ds_list_size(ftData)));
				show_debug_message("TEST 3: " + string(c));
				faceIndices = StringSplit(ftData[|c], "/");
							
				var vertPos = vvData[real(faceIndices[0]) - 1];
				var vertTex = vtData[real(faceIndices[1]) - 1];
				var vertNor = vnData[real(faceIndices[2]) - 1];
							
				vertex_position_3d(objBuffer, vertPos.x, vertPos.y, vertPos.z);
				//show_debug_message(string(vertPos.x)+", "+string(vertPos.y)+", "+string(vertPos.z))
				vertex_color(objBuffer, c_white, 1);
				vertex_texcoord(objBuffer, vertTex.u, vertTex.v);
				vertex_normal(objBuffer, vertNor.x, vertNor.y, vertNor.z);
			}
		}		
	}
				
	vertex_end(objBuffer);
				
	return objBuffer;
}

/// @function						DrawSpriteBillboard(sprite, subimage, xx, yy, zz)
function DrawSpriteBillboard(sprite, subimage, xx, yy, zz)
{
	shader_set(sh_Billboard);
	matrix_set(matrix_world, matrix_build(xx, yy, zz, 0, 0, 0, 1, 1, 1));
	draw_sprite(sprite, subimage, 0, 0);
	matrix_set(matrix_world, matrix_build_identity());
	shader_reset();
}