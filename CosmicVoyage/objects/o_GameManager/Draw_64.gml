
shader_set(sh_Palette)

switch (currentState) 
{
	// Singleplayer
    case GameState.Game:
        // code here
		if levelTrans == true
		{
			fadeOut = lerp(	fadeOut, 1.0, 0.016);
			o_Camera.fov = lerp(o_Camera.fov, 80, 0.05);
			draw_set_alpha(fadeOut);
			draw_sprite_ext(spr_vfx_speedlines,image_index,0,0,4,4,0,c_white,fadeOut);
			image_speed = .6;
			//draw_rectangle_color(0,0,browser_width,browser_height,c_white, c_white, c_white, c_white ,false)
			draw_set_alpha(1);
			if fadeOut >= 0.95
			{
				levelTrans = false;
				canSpawn = true;
			}
			
			
		}
		else
		{
		
			fadeOut = lerp(	fadeOut, 0, 0.016);
			o_Camera.fov = lerp(o_Camera.fov, o_Camera.orginalFov, 0.05);
			if fadeOut < 0.7
				{
			//draw_set_alpha(fadeOut);
			draw_sprite_ext(spr_vfx_speedlines,image_index,0,0,4,4,0,c_white,1);
			image_speed = .6;
				};
			//draw_rectangle_color(0,0,browser_width,browser_height,c_white, c_white, c_white, c_white ,false)
			//draw_set_alpha(1);
		
		}
        break;
	
	// Multiplayer
	case GameState.Multiplayer:
	    // code here
	    break;
		
	case GameState.Intro:
		#region Intro
		draw_set_font(f_Temp)
		function drawTextPart(x,y, text, count)
			{
		var txtTotal = "";
		for(a = 0; a < count; a++)
			{
				txtTotal = txtTotal + string_char_at(text,1+a)
			};
		draw_text(x,y,txtTotal)
		
		if count > string_length(text)
			{
				return true	
			}
		else
			{
				return false	
			}
			};
		
		
		txtCount += 0.45;
		if introSlideInd != 1 // if not crewmate intro
		{
			draw_sprite_ext(introSlides[introSlideInd],0,view_wport[0]*0.5,view_hport[0]*0.40,4,4,0,c_white,1)
			draw_sprite_ext(spr_textbox,0,view_wport[0]*0.5,view_hport[0]*0.80,4,4,0,c_white,1)
		};
			if introSlideInd == 1 // if crewmate intro
			{
				loopCount -= 16;
		
				for(j = 0; j < 200; j++) // the moving bg
				{
					draw_sprite_ext(introSlides[introSlideInd],0,0+(((sprite_get_width(introSlides[1])*4)*j))+loopCount,view_hport[0]*0.40,4,4,0,c_white,1)
		
				};
				for(n = 0; n < charCount; n++) // draws the characters in order but darkened
				{
					draw_sprite_ext(introCharacters[n],0,-256+view_wport[0]*0.001+((128*2)*n),view_hport[0]*0.20,3,3,0,c_gray,1)
				};
				if charProg > (-256+(128*2)*charCount+1)-6 // slides the characters in
				{
					charProg = lerp(charProg,-256+((128*2)*charCount+1),0.018); // character position
				};
				draw_sprite_ext(introCharacters[charCount],0,charProg,view_hport[0]*0.20,3,3,0,c_white,1);

		
				draw_sprite_ext(spr_textbox,0,view_wport[0]*0.5,view_hport[0]*0.80,4,4,0,c_white,1) // textbox	
			};
		if introSlideInd != 1 // normal slide
			{
		if drawTextPart(view_wport[0]*0.15,view_hport[0]*0.70,string_upper(flavorText),txtCount) == true
			{
		slideTime ++;
		if slideTime > 100
				{
					{
						if introSlideInd < array_length(introSlides)-1
							{
						introSlideInd ++;
						introTextInd ++;
							}
						else
							{
							currentState = GameState.Menu;	
							}
						flavorText = introTexts[introTextInd];
						txtCount = 0;
						slideTime = 0;
					}
				}
			}
			};
		
		
		if introSlideInd == 1 // the crew introduction slide
			{
		if drawTextPart(view_wport[0]*0.15,view_hport[0]*0.70,string_upper(flavorText),txtCount) == true
			{
		slideTime ++;
		if slideTime > 150
				{
					{
						if introTextInd < 4
							{
						introTextInd ++;
								charCount++;
								
		charProg = view_wport[0];
							}
						else
							{
						introSlideInd ++;
						introTextInd++;
							}
						flavorText = introTexts[introTextInd];
						txtCount = 0;
						slideTime = 0;
					}
				}
			}
			};
		
		if keyboard_check_pressed(vk_anykey)
			{
				currentState = GameState.Menu;	
			};
		draw_set_halign(fa_left)
		#endregion
		break;
		
	case GameState.Menu:
	
		if (!instance_exists(o_Camera))
		{
			instance_create_layer(256,room_height,"Instances",o_Camera);	
		};
		
		draw_set_halign(fa_center)
		draw_sprite_ext(spr_TitleCard,0,view_wport[0]*0.5,view_hport[0]*0.35,2,2,(sin(current_time/700)*1),-1,1);
		//draw_text(view_wport[0]*0.5,view_hport[0]*0.75,string_upper("Press W to launch!"))
		draw_sprite_ext(spr_1player,0,view_wport[0]*0.25,view_hport[0]*0.8+(sin(current_time/700)*20),3,3,0,-1,1);
		draw_sprite_ext(spr_2player,0,view_wport[0]*0.75,view_hport[0]*0.8+(sin(current_time/700)*-20),3,3,0,-1,1);
		
		draw_set_halign(fa_left);
		instance_destroy(o_Player)
		
		
		if mouse_check_button_pressed(mb_left)
			{
				
			};
		if keyboard_check_pressed(ord("W"))
		{
			currentState = GameState.Game;	
			if !instance_exists(o_Player) { instance_create_layer(256,room_height,"Instances",o_Player) }		
		};
		
		if keyboard_check_pressed(ord("D"))
		{
			currentState = GameState.Multiplayer;
			if (instance_number(o_Player) < 1)
			{
				p1 = instance_create_layer(256,room_height,"Instances",o_Player)
				p2 = instance_create_layer(256,room_height,"Instances",o_Player)
				p2.isPlayerOne = false;
			};
			else
			{
				p2 = instance_create_layer(256,room_height,"Instances",o_Player)
				p2.isPlayerOne = false;	
			};
		};
		break;
}

shader_set_uniform_f(sCol1,color_get_red(global.keyCol1)/255,color_get_green(global.keyCol1)/255,color_get_blue(global.keyCol1)/255);
shader_set_uniform_f(sCol2,color_get_red(global.keyCol2)/255,color_get_green(global.keyCol2)/255,color_get_blue(global.keyCol2)/255);
shader_set_uniform_f(sCol3,color_get_red(global.keyCol3)/255,color_get_green(global.keyCol3)/255,color_get_blue(global.keyCol3)/255);
shader_set_uniform_f(sCol4,color_get_red(global.keyCol4)/255,color_get_green(global.keyCol4)/255,color_get_blue(global.keyCol4)/255);

shader_set_uniform_f(dCol1,color_get_red(global.dstCol1)/255,color_get_green(global.dstCol1)/255,color_get_blue(global.dstCol1)/255);
shader_set_uniform_f(dCol2,color_get_red(global.dstCol2)/255,color_get_green(global.dstCol2)/255,color_get_blue(global.dstCol2)/255);
shader_set_uniform_f(dCol3,color_get_red(global.dstCol3)/255,color_get_green(global.dstCol3)/255,color_get_blue(global.dstCol3)/255);
shader_set_uniform_f(dCol3,color_get_red(global.dstCol4)/255,color_get_green(global.dstCol4)/255,color_get_blue(global.dstCol4)/255);


shader_reset();