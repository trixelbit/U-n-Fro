gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
draw_set_font(f_Temp)
if(isDebug)
{
	draw_set_color(c_white);
	if(isPlayerOne)
	{
		draw_text_ext_transformed(25, 50, "Player One", 10, 300, 0.75, 0.75, 0);
	}
	else
	{
		draw_text_ext_transformed(25, 50, "Player Two", 10, 300, 0.75, 0.75, 0);
	}
	draw_text_ext_transformed(25, 70, "X: " + string(x), 10, 300, 0.75, 0.75, 0);
	draw_text_ext_transformed(25, 90, "Y: " + string(y), 10, 300, 0.75, 0.75, 0);
	draw_text_ext_transformed(25, 110, "Z: " + string(z), 10, 300, 0.75, 0.75, 0);
}

if o_GameManager.currentState == GameState.Game
	{
// Score Display
finalScore = global.scoreTotal;

// Death State
if _lives < 1 // something in here is causing the HTML5 version to crash
	{
		var scArr = o_GameManager.scoreArray;
		// setting the new highest score
		if global.scoreTotal > o_GameManager.scoreRecord && newScore != true
			{
				o_GameManager.scoreRecord = global.scoreTotal;
				newScore = true;	
				array_insert(scArr,0,o_GameManager.scoreRecord)
				
			};
		draw_set_halign(fa_center)
		var hOffset = 20;
		
		draw_text(browser_width*0.5,browser_height*0.20,"HIGH SCORES!")
		// draws the high score board
		for(i = 0; i < array_length(scArr)-1; i++)
			{
				if newScore == true && i = 0 { draw_set_color(c_yellow) };
				
				draw_text(browser_width*0.5,browser_height*0.25+(i*hOffset),string(scArr[i])+ " POINTS");	
				draw_set_color(c_white)
			};

			
		// restart text and resetting the run
		draw_text(browser_width*0.5,browser_height*0.75,"PRESS SPACE TO RESTART")
		if keyboard_check_pressed(vk_space)
			{
			newScore = false;
			run_reset();
			};
		draw_set_halign(fa_left)
	};
	
// Alive State
if _lives > 0
	{
		if o_GameManager.levelTrans == false
		{
			draw_text(25,20,"SCORE: " + string(finalScore) + " PTS.")
			for(i = 0; i < _lives; i++)
			{
				draw_sprite(spr_Heart,0,25+(i*sprite_get_width(spr_Heart)),60);	
			};
			
			draw_set_halign(fa_center)
			draw_text(browser_width*0.5,20,string(global.scoreDist) + "M");
			draw_set_halign(fa_left);
			if (oldKills != global.scoreKills)
			{
				targetY = 20
				currentY = 60;
				currentAlpha = 1;
				newKill = global.scoreDist * 1
				flashTick = 100;
			};
			if (flashTick > 0)
			{
				draw_text_color(25,currentY,"+" + string(newKill),c_yellow,c_yellow,c_yellow,c_yellow,currentAlpha)	
				currentY = lerp(currentY,targetY,0.01);
				currentAlpha = lerp(currentAlpha,0,0.01);
			};
			flashTick --;
			
			//bullet gauge
			for(i = 0; i < maxBullets; i++)
			{
				draw_sprite_ext(spr_bulletgauge_empty,0, 0, 200 + (i*64),4,4,0,c_white,1)
			}
			for(i = 0; i < currentBullets; i++)
			{
				draw_sprite_ext(spr_bulletgauge_full,0, 0, 200 + (i*64),4,4,0,c_white,1)
			}
			
		};
	};


gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

oldKills = global.scoreKills
	};

