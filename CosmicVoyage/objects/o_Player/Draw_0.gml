
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
				DrawSpriteBillboardRot(sprite_index, image_index, x, y, -z, currentRot-90,true);
			}
		else if(targetX < x)
			{
				DrawSpriteBillboardRot(sprite_index, image_index, x, y, -z, currentRot-90,false);
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
			DrawSpriteBillboardRot(sprite_index, image_index, x, y, -z, currentRot-90,false);
		}
	}
for(a = 0; a < 30; a++)
	{
for(i = 0; i < 12; i++)
	{
		if currentLane*laneDegree == i*laneDegree
			{
		DrawSpriteBillboardRot(spr_TestLane,1,256+lengthdir_x(256+32,i*laneDegree),a*-1024,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0)	
			};
		else
			{
		DrawSpriteBillboardRot(spr_TestLane,0,256+lengthdir_x(256+32,i*laneDegree),a*-1024,-256-lengthdir_y(256+32,i*laneDegree),(laneDegree*i)+90,0)	
			};
	};
	};