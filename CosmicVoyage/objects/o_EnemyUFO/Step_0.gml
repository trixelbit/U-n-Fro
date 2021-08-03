/// @description Insert description here
// Good huntin' to ya ^^

if fireTick <= 0
	{
		var proj = instance_create_layer(x, y - 10, "Instances", o_Projectile);
		proj.parentObject = id;
		fireTick = choose(50,100,350);
	};
	
fireTick --;

if _lives < 1
{
	instance_destroy(id);	
};