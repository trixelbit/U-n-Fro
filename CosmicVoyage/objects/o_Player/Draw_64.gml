gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
draw_set_font(f_Temp)
if(isDebug)
{
	draw_set_color(c_white);
	if(isPlayerOne)
	{
		draw_text_ext_transformed(25, 10, "Player One", 10, 300, 0.75, 0.75, 0);
	}
	else
	{
		draw_text_ext_transformed(25, 10, "Player Two", 10, 300, 0.75, 0.75, 0);
	}
	draw_text_ext_transformed(25, 20, "X: " + string(x), 10, 300, 0.75, 0.75, 0);
	draw_text_ext_transformed(25, 30, "Y: " + string(y), 10, 300, 0.75, 0.75, 0);
	draw_text_ext_transformed(25, 40, "Z: " + string(z), 10, 300, 0.75, 0.75, 0);
}


// Score Display
finalScore = global.scoreDist + (500 * (global.scoreKills))

// Death State
if _lives < 1 // something in here is causing the HTML5 version to crash
	{
		draw_set_halign(fa_center)
		draw_text(browser_width*0.5,browser_height*0.25,"Your final score is: " + string(finalScore) + " points")
		draw_text(browser_width*0.5,browser_height*0.35,"Press Space to Restart")
		if keyboard_check_pressed(vk_space)
			{
			game_restart(); // to-do: add in a proper run reset	
			};
		draw_set_halign(fa_left)
	};
	
// Alive State
if _lives > 0
	{
		draw_text(25,20,"Score: " + string(finalScore) + " pts.")
		if oldKills != global.scoreKills
			{
				targetY = 20
				currentY = 60;
				currentAlpha = 1;
				newKill = global.scoreDist * 1
				flashTick = 100;
			};
		if flashTick > 0
			{
		
		draw_text_color(25,currentY,"+" + string(newKill),c_yellow,c_yellow,c_yellow,c_yellow,currentAlpha)	
		currentY = lerp(currentY,targetY,0.01);
		currentAlpha = lerp(currentAlpha,0,0.01);
			};
		flashTick --;
	};
	
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

oldKills = global.scoreKills