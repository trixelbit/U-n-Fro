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
}