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


t_AstSng = sprite_get_texture(t_asteroid1,0);
t_AstRow = sprite_get_texture(t_asteroid_row,0)
t_AstCol = sprite_get_texture(t_asteroid_col,0); 



