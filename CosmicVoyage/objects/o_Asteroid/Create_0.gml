/// @description Insert description here
// Good huntin' to ya ^^

enum asteroidTypes
	{
		single,
		row,
		column,
		cwasant
	};
currentAsteroid = asteroidTypes.single;


_lives = 1;
alarm[0] = 500;
z = 0;

xSpin = 0;
ySpin = 0;

spinSpeed = random_range(1.0,3.25);
