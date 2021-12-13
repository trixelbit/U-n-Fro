/// @description Insert description here
// Good huntin' to ya ^^
mOffset = 0;
currentAsteroid = asteroidTypes.single;
currentLane = irandom(11);
currentRow = 0;
laneLength = 1;
rowHeight = 1;

laneDegree = 360/12;

x = 256+lengthdir_x(256,currentLane*laneDegree)
z = -256

_lives = 1;
alarm[0] = 500;


xSpin = 0;
ySpin = 0;

spinSpeed = random_range(1.0,3.25);


t_AstSng = sprite_get_texture(t_asteroid1,0);
t_AstRow = sprite_get_texture(t_asteroid_row,0);
t_AstCol = sprite_get_texture(t_asteroid_col,0); 
height_ = 4*100
bbox = draw_bbox_3D(0,0,0,height_)


