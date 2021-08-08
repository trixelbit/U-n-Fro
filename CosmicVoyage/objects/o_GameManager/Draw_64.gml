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
		draw_set_halign(fa_center)
		draw_text(browser_width*0.5,browser_height*0.5,"the among us crewmates have breached containment. Run.")
		draw_text(browser_width*0.5,browser_height*0.75,"Press any key to start.")
		if keyboard_check_pressed(vk_anykey)
			{
				currentState = GameState.Menu;	
			};
		draw_set_halign(fa_left)
		break;
		
	case GameState.Menu:
		draw_set_halign(fa_center)
		draw_text(browser_width*0.5,browser_height*0.5,"A Lightspeed Odyssey")
		draw_text(browser_width*0.5,browser_height*0.75,"Press W to launch!")
		draw_set_halign(fa_left);
		if keyboard_check_pressed(ord("W"))
			{
				currentState = GameState.Game;	
				if !instance_exists(o_Player) { instance_create_layer(256,room_height,"Instances",o_Player) }
				
			};
		break;
}