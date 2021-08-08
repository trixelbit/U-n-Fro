/// @description Insert description here
// Good huntin' to ya ^^
y -= spd;

if fireTick <= 0
{
	var proj = instance_create_layer(x, y - 10, "Instances", o_Projectile);
	proj.parentObject = id;
	proj.baseSpd = spd;
	fireTick = choose(50,100,350);
};
	
fireTick --;

if _lives < 1
{
	global.scoreKills ++;
	instance_destroy(id);	
};

var col = collision_circle(x,y,10,o_Entity,false,true);

if(col != noone && col.object_index != object_index)
{
	show_debug_message(string(col));
	col._lives--;
}