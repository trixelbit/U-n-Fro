
shader_set(sh_Palette); // the shader has to be called for every GUI event.
palette_SetUniforms();
switch (currentState) 
	{
		// Singleplayer
		case GameState.Game:
		    // the white fade in for level transition
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
			else // the line streaking effect for level transitioning
				{
					fadeOut = lerp(	fadeOut, 0, 0.016);
					o_Camera.fov = lerp(o_Camera.fov, o_Camera.orginalFov, 0.05);
					if fadeOut >= 0.95
						{
							//draw_set_alpha(fadeOut);
							draw_sprite_ext(spr_vfx_speedlines,image_index,0,0,4,4,0,c_white,1);
							image_speed = .6;
						}
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
		function drawTextPart(x,y, text, count) // utilized for drawing the textboxes 
			{
				var txtTotal = "";
				for(a = 0; a < count; a++)
					{
						txtTotal = txtTotal + string_char_at(text,1+a)
					}
					
				draw_text(x,y,txtTotal)
		
				if count > string_length(text)
					{
						return true	
					}
				else
					{
						return false	
					}
			}
		
		
		txtCount += 0.45;
		if introSlideInd != 1 // if not crewmate intro
			{
				// draw the slide sprite 
				draw_sprite_ext(introSlides[introSlideInd],0,view_wport[0]*0.5,view_hport[0]*0.40,4,4,0,c_white,1)
				// draw the textbox bg itself
				draw_sprite_ext(spr_textbox,0,view_wport[0]*0.5,view_hport[0]*0.80,4,4,0,c_white,1)
			}
		if introSlideInd == 1 // if crewmate intro (This is this for drawing the characters and bg)
			{
					loopCount -= 16;
					
					for(j = 0; j < 200; j++) // the moving bg
						{
							draw_sprite_ext(introSlides[introSlideInd],0,0+(((sprite_get_width(introSlides[1])*4)*j))+loopCount,view_hport[0]*0.40,4,4,0,c_white,1);
						}
						
					for(n = 0; n < charCount; n++) // draws the characters in order but darkened
						{
							draw_sprite_ext(introCharacters[n],0,-256+view_wport[0]*0.001+((128*2)*n),view_hport[0]*0.20,3,3,0,c_gray,1)
						}
						
					if charProg > (-256+(128*2)*charCount+1)-6 // slides the characters in
						{
							charProg = lerp(charProg,-256+((128*2)*charCount+1),0.018); // character position
						}
					// draw the current character (sliding)	
					draw_sprite_ext(introCharacters[charCount],0,charProg,view_hport[0]*0.20,3,3,0,c_white,1);
					// draw the textbox bg itself
					draw_sprite_ext(spr_textbox,0,view_wport[0]*0.5,view_hport[0]*0.80,4,4,0,c_white,1)	
			}
				
		if introSlideInd != 1 // normal slide (drawing text and advancing the slide)
			{
				if drawTextPart(view_wport[0]*0.15,view_hport[0]*0.70,string_upper(flavorText),txtCount) == true
					{
						slideTime ++;
						if slideTime > 100
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
		
		if introSlideInd == 1 // the crew introduction slide (This deals with advancing the text in the crew introductions)
			{
				if drawTextPart(view_wport[0]*0.15,view_hport[0]*0.70,string_upper(flavorText),txtCount) == true
					{
						slideTime ++;
						if slideTime > 150
								{
									
									if introTextInd < 4 // if all crewmates have not been shown yet
										{
											introTextInd ++;
											charCount++;
												
											charProg = view_wport[0];
										}
									else // if all crewmates have been shown (the introduction is complete)
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
			
		if keyboard_check_pressed(vk_anykey) or mouse_check_button(mb_any) // if any key is pressed, skip the intro
			{
				currentState = GameState.Menu;
			}
			
		draw_set_halign(fa_left)
		#endregion
			break;
			
		case GameState.Menu:
		
			if (!instance_exists(o_Camera))
				{
					instance_create_layer(256,room_height,"Instances",o_Camera);	
				}
			
			draw_set_halign(fa_center)
			draw_sprite_ext(spr_TitleCard,0,view_wport[0]*0.5,view_hport[0]*0.125,2,2,(sin(current_time/700)*1),-1,1);
			
			// Singleplayer Text + Button
			if(point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), view_wport[0]*0.325, view_hport[0]*0.8) < 150)
				{
					draw_sprite_ext(spr_1player,0,view_wport[0]*0.325,view_hport[0]*0.75+(sin(current_time/100)*1),3,3,0,c_white,1);
					draw_sprite_ext(spr_controls, 0, view_wport[0]*0.325,view_hport[0]*0.9+(sin(current_time/100)*1), 2, 2, 0, c_white, 1);
				}
			else
				{
					draw_sprite_ext(spr_1player,0,view_wport[0]*0.325,view_hport[0]*0.75+(sin(current_time/100)*1),3,3,0,c_grey,1);
					draw_sprite_ext(spr_controls, 0, view_wport[0]*0.325,view_hport[0]*0.9+(sin(current_time/100)*1), 2, 2, 0, c_grey, 1);
				}
				
			/* 2 PLAYER TEXT + BUTTON
			if(point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), view_wport[0]*0.675, view_hport[0]*0.8) < 150)
				{
					draw_sprite_ext(spr_2player,0,view_wport[0]*0.675,view_hport[0]*0.75+(sin(current_time/100)*-1),3,3,0,c_white,1);	
					draw_sprite_ext(spr_controls, 0, view_wport[0]*0.6,view_hport[0]*0.9+(sin(current_time/100)*-1), 2, 2, 0, c_white, 1);
					draw_sprite_ext(spr_controls_2, 0, view_wport[0]*0.75,view_hport[0]*0.9+(sin(current_time/100)*-1), 2, 2, 0, c_white, 1);
				}
			else
				{
					draw_sprite_ext(spr_2player,0,view_wport[0]*0.675,view_hport[0]*0.75+(sin(current_time/100)*-1),3,3,0,c_grey,1);
					draw_sprite_ext(spr_controls, 0, view_wport[0]*0.6,view_hport[0]*0.9+(sin(current_time/100)*-1), 2, 2, 0, c_grey, 1);
					draw_sprite_ext(spr_controls_2, 0, view_wport[0]*0.75,view_hport[0]*0.9+(sin(current_time/100)*-1), 2, 2, 0, c_grey, 1);
				}
			*/
			// drawing the misc text
			draw_set_halign(fa_left);
			draw_set_valign(fa_bottom);
			draw_text_color(view_wport[0] * 0.01, view_hport[0] * 0.99, "TRIXELBIT ARCADE", c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
			draw_set_halign(fa_right);
			draw_text_color(view_wport[0] * 0.99, view_hport[0] * 0.99, "NO INTERNET", c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
			
			draw_set_valign(fa_center);
			instance_destroy(o_Player);
			
			
			if mouse_check_button_pressed(mb_left) // button checking
				{
					// player 1 mode
					if(point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), view_wport[0]*0.375, view_hport[0]*0.75) < 100)
						{
							currentState = GameState.Game;	
							if !instance_exists(o_Player) { instance_create_layer(256,room_height,"Instances",o_Player) }	
						}
					// player 1 + 2 mode (DEPRECATED)
					/*else if(point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), view_wport[0]*0.625, view_hport[0]*0.75) < 100)
						{
							currentState = GameState.Multiplayer;
					
							p1 = instance_create_layer(256,room_height,"Instances",o_Player);
							p2 = instance_create_layer(256,room_height,"Instances",o_Player);
							p2.isPlayerOne = false;
					
						}*/
				}
		
			break;
	}

shader_reset();