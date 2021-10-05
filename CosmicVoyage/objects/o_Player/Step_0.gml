
if(_lives > 0) && o_GameManager.currentState != GameState.Menu && global.gameOver == false // if the game is in gameplay and the player is alive
{
	// smoothly flying out of the hangar
	currentRot = (currentLane)*laneDegree;
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
					{
						currentLane++;
						currentLane = wrap(currentLane,0,11);
						currentTROT += laneDegree;
					}
			}

		// Move Right
		if(keyboard_check_pressed(ord("D")))
			{
					{
						currentLane--;
						currentLane = wrap(currentLane,0,11);
						currentTROT -= laneDegree;
					}
			}
		


		// Shoot projectile
		if(keyboard_check_pressed(ord("W")))
			{
				if(currentBullets> 0)
					{
						audio_play_sound(sfx_shot, 1,0);
						var proj = instance_create_layer(x, y - 20, "Instances", o_Projectile);
						proj.parentObject = id;
						proj.destX = targetX;
						proj.z		= z;
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
			
		if(!isInvincible)
			{
				var col = collision_sphere(x,y,z,16,o_EnemyBullet,true)
				if col != noone && col != undefined
					{
						if col.object_index == o_EnemyBullet
							{
								_lives--;
								audio_play_sound(sfx_playerhit,1,false);
								var vfx = instance_create_layer(x, y - 10, "Instances", o_vfx_enemyhit);
								with(col)
								{
									instance_destroy();
								}
							}
					}
			}
	}

	
	// movement smoothing (the movement in between lanes)
	if currentMROT > 359 || currentMROT < 0	
		{
			currentMROT = wrap(currentMROT,0,359);
			currentTROT = currentLane*laneDegree;
		}
	currentMROT = lerp(currentMROT,currentTROT,0.075);
	
	z = 256+lengthdir_y(256,currentMROT);
	x = 256+lengthdir_x(256,currentMROT);
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
					scoreP1 = global.scoreDist + (500 * killsP1)
					scoreP2 = global.scoreDist + (500 + killsP2)
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