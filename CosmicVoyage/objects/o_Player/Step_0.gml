// Move Left
if(keyboard_check_pressed(ord("A")))
{
	if(x != origin - 128)
	{
		x -= 128;
	}
}

// Move Right
if(keyboard_check_pressed(ord("D")))
{
	if(x != origin + 128)
	{
		x += 128;
	}
}

camera.x = origin;

y -= spd;
camera.y = y + 500;