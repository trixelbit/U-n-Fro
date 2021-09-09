
if(_lives > 0) && o_GameManager.currentState != GameState.Menu && global.gameOver == false // if the game is in gameplay and the player is alive
{
	// smoothly flying out of the hangar
	if y > 0 // if the player hasnt moved yet, it'll be greater than zero
		{
			finalSpd = lerp(finalSpd,16,0.05);	
		}
	else
		{
			finalSpd = 16;
		}
		
	#region movement controls
	// If singleplayer or player one in multiplayer
	if(isPlayerOne)
	{
		// Move Left
		if(keyboard_check_pressed(ord("A")))
			{
				if(currentLane > -1)
					{
						targetX -= moveSize;
						currentLane--;
						o_Camera.targetTilt = lerp(o_Camera.targetTilt, 1.50, 0.030);
					}
			}

		// Move Right
		if(keyboard_check_pressed(ord("D")))
			{
				if(currentLane < 1)
					{
						targetX += moveSize
						currentLane++;
						o_Camera.targetTilt = lerp(o_Camera.targetTilt, -1.50, 0.030);
					}
			}
		

		targetZ = currentRow*64;

		// Shoot projectile
		if(keyboard_check_pressed(ord("W")))
			{
				if(currentBullets> 0)
					{
						audio_play_sound(sfx_shot, 1,0);
						var proj = instance_create_layer(x, y - 20, "Instances", o_Projectile);
						proj.parentObject = id;
						proj.destX = targetX;
						proj.z		= targetZ;
						proj.baseSpd = finalSpd;
						proj.playerWho = 0;
						
						if(hasJobro)
							{
								proj.dmg = 3;
							}
						
						currentBullets--;
						alarm[0] = bulletIncrementWindow;
					}
			}
	}
	// If player two in multiplayer
	else
	{
		// Move Left
		if(keyboard_check_pressed(vk_left))
			{
				if(currentLane > -1)
					{
						targetX -= moveSize
						currentLane--;
						o_Camera.targetTilt = lerp(o_Camera.targetTilt, 1.50, 0.030);
					}
			}

		// Move Right
		if(keyboard_check_pressed(vk_right))
			{
				if(currentLane < 1)
					{
						targetX += moveSize
						currentLane++;
						o_Camera.targetTilt = lerp(o_Camera.targetTilt, -1.50, 0.030);
					}
			}

		// Shoot projectile
		if(keyboard_check_pressed(vk_up))
			{
				if(currentBullets> 0)
					{
						audio_play_sound(sfx_shot, 1,0);
						var proj = instance_create_layer(x, y - 20, "Instances", o_Projectile);
						proj.parentObject = id;
						proj.destX = targetX;
						proj.z		= targetZ;
						proj.baseSpd = finalSpd;
						proj.playerWho = 1;
						currentBullets--;
						alarm[0] = bulletIncrementWindow;
					}
			}
	}
	
	// movement smoothing (the movement in between lanes)
	z = lerp(z,targetZ,0.075);
	x = lerp(x,targetX,0.075);
	
	// advance the player's y position by the final spd
	y -= finalSpd;
	#endregion
	
	// distance incerementing
	if o_GameManager.levelTrans == false && y < 0 
		{
			global.scoreDist ++;
			// score calculation
			if o_GameManager.currentState == GameState.Multiplayer
				{
					scoreP1 = global.scoreDist + (500 * killsP1);
					scoreP2 = global.scoreDist + (500 + killsP2);
				}
		}
	

	
	if(y < -150000) // resets the y position to back to y -500 (for looping) 
		{
			y = -500;
		}
	

}

if _lives == 0 // if dead
	{
		global.gameOver = true;
		if isPlayerOne == true
			{
				global.winnerName = "PLAYER 1!";
			}
		else
			{
				global.winnerName = "PLAYER 2!";	
			}
	}