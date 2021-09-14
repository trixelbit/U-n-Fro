
if o_GameManager.currentState != GameState.Menu
	{
	// player sprites

	if(distance_to_point(targetX, y) > 10) // changing the player sprites to the turning sprites when moving
		{
		if isPlayerOne == true
			{
				sprite_index = spr_player_left;
			}
		else
			{
				sprite_index = spr_player2_left;
			}
		if(targetX > x)
			{
				DrawSpriteBillboard(sprite_index, image_index, x, y, sin(current_time/700)*5, true);
			}
		else if(targetX < x)
			{
				DrawSpriteBillboard(sprite_index, image_index, x, y, sin(current_time/700)*5, false);
			}
		}
	else // swtiches the player sprite to the idle one when not moving between lanes
		{
			if isPlayerOne == true
				{
					sprite_index = spr_player_idle;
				}
			else
				{
					sprite_index = spr_player2_idle;	
				}
			DrawSpriteBillboard(sprite_index, image_index, x, y, sin(current_time/700)*5, false);
		}
	}