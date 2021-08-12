switch (currentState) 
{
	// Singleplayer
    case GameState.Game:
        // code here
		if levelTrans == true
			{
			fadeOut = lerp(	fadeOut, 1.0, 0.016);
			draw_set_alpha(fadeOut)
			draw_rectangle_color(0,0,browser_width,browser_height,c_white, c_white, c_white, c_white ,false)
			draw_set_alpha(1);
			if fadeOut >= 0.95
				{
					levelTrans = false;
					canSpawn = true;
				}
			};
		
		
        break;
	
	// Multiplayer
	case GameState.Multiplayer:
	    // code here
	    break;
		
	case GameState.Intro:
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
		
		
		txtCount += 0.4;
			if introSlideInd != 1 // if not crewmate intro
				{
		draw_sprite_ext(introSlides[introSlideInd],0,browser_width*0.5,browser_height*0.40,4,4,0,c_white,1)
		draw_sprite_ext(spr_textbox,0,browser_width*0.5,browser_height*0.80,4,4,0,c_white,1)
				};
			if introSlideInd == 1 // if crewmate intro
				{
		loopCount -= 16;
		
		for(j = 0; j < 200; j++) // the moving bg
			{
		draw_sprite_ext(introSlides[introSlideInd],0,0+(((sprite_get_width(introSlides[1])*4)*j))+loopCount,browser_height*0.40,4,4,0,c_white,1)
		
			};
		for(n = 0; n < charCount; n++) // draws the characters in order but darkened
			{
			draw_sprite_ext(introCharacters[n],0,-256+browser_width*0.001+((128*2)*n),browser_height*0.20,3,3,0,c_gray,1)
			};
		if charProg > (-256+(128*2)*charCount+1)-6 // slides the characters in
			{
		charProg = lerp(charProg,-256+((128*2)*charCount+1),0.018); // character position
			};
		draw_sprite_ext(introCharacters[charCount],0,charProg,browser_height*0.20,3,3,0,c_white,1);

		
		draw_sprite_ext(spr_textbox,0,browser_width*0.5,browser_height*0.80,4,4,0,c_white,1) // textbox	
				};
		if introSlideInd != 1 // normal slide
			{
		if drawTextPart(browser_width*0.15,browser_height*0.70,string_upper(flavorText),txtCount) == true
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
		if drawTextPart(browser_width*0.15,browser_height*0.70,string_upper(flavorText),txtCount) == true
			{
		slideTime ++;
		if slideTime > 200
				{
					{
						if introTextInd < 4
							{
						introTextInd ++;
								charCount++;
		charProg = browser_width;
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
		break;
		
	case GameState.Menu:
	
		if !instance_exists(o_Camera)
			{
			instance_create_layer(256,room_height,"Instances",o_Camera);	
			};
		draw_set_halign(fa_center)
		draw_text(browser_width*0.5,browser_height*0.5,string_upper("A Lightspeed Odyssey"))
		draw_text(browser_width*0.5,browser_height*0.75,string_upper("Press W to launch!"))
		draw_set_halign(fa_left);
		if keyboard_check_pressed(ord("W"))
			{
				currentState = GameState.Game;	
				if !instance_exists(o_Player) { instance_create_layer(256,room_height,"Instances",o_Player) }
				
			};
		break;
}