show_debug_overlay(true)

if(_lives > 0) && o_GameManager.currentState == GameState.Game
{
	if y > 0
		{
		finalSpd = lerp(finalSpd,16,0.05);	
		};
	else
		{
	finalSpd = 16
		};
	
	// If singleplayer or player one in multiplayer
	if(isPlayerOne)
	{
		// Move Left
		if(keyboard_check_pressed(ord("A")))
		{
			if(currentLane > -1)
			{
				
				targetX -= 128;
				currentLane--;
				o_Camera.targetTilt = lerp(o_Camera.targetTilt, 1.50, 0.030);
				
			}
		}

		// Move Right
		if(keyboard_check_pressed(ord("D")))
		{
			if(currentLane < 1)
			{
				targetX += 128;
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
				proj.z		= targetZ
				proj.baseSpd = finalSpd
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
				targetX -= 128;
				currentLane--;
				o_Camera.targetTilt = lerp(o_Camera.targetTilt, 1.50, 0.030);
			}
		}

		// Move Right
		if(keyboard_check_pressed(vk_right))
		{
			if(currentLane < 1)
			{
				targetX += 128;
				currentLane++;
				o_Camera.targetTilt = lerp(o_Camera.targetTilt, -1.50, 0.030);
			}
		}

		// Shoot projectile
		if(keyboard_check_pressed(vk_up))
		{
			var proj = instance_create_layer(x, y - 20, "Instances", o_Projectile);
			proj.parentObject = self;
			proj.destX = targetX;
			proj.z		= z
			proj.baseSpd = finalSpd;
		}
	}

	// Debug
	if(keyboard_check_pressed(vk_f3))
	{
		isDebug = !isDebug;
	}
	z = lerp(z,targetZ,0.075);
	x = lerp(x,targetX,0.075);
	y -= finalSpd;
	
	// distance incerementing
	if o_GameManager.levelTrans == false && y < 0 
	{
		global.scoreDist ++;
	}
	
	if(y < -150000)
	{
		y = -500;
	}
}