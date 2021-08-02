// Move Left
if(keyboard_check_pressed(ord("A")))
{
	if(currentLane > -1)
	{
		targetX -= 128;
		currentLane --;
		o_Camera.targetTilt = lerp(o_Camera.targetTilt,1.50,0.030);
	}
}

// Move Right
if(keyboard_check_pressed(ord("D")))
{
	if(currentLane < 1)
	{
		targetX += 128;
		currentLane ++;
		o_Camera.targetTilt = lerp(o_Camera.targetTilt,-1.50,0.030);
	}
}

x = lerp(x,targetX,0.25)





// commented out because 

/*
y -= spd;
camera.y = y + 500;
*/
//camera.targetX = x;
//camera.targetY = y;
//camera.targetZ = z;