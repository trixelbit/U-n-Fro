/// @description Insert description here
// Good huntin' to ya ^^

// Y distance check
if(distance_to_point(x, o_Player.id.y) > 500)
{
	y = lerp(y, o_Player.id.y - 500, 0.05);
}
else
{
	y = o_Player.id.y - 500;
}

// Lerp to player X
if(targetX != x)
{
	x = lerp(x, targetX, 0.05);
}

if(y = o_Player.id.y - 500)
{
	if fireTick <= 0
	{
		sprite_index = spr_enemy_shoot
		var proj = instance_create_layer(x, y - 10, "Instances", o_EnemyBullet);
		proj.bulletSpeed = 1;
		//proj.parentObject = id;
		//proj.baseSpd = spd/4;
		proj.z = z;
		fireTick = choose(50,100,350);
		alarm[2] = image_number;
	};	
	fireTick --;
}

if _lives < 1
{
	
	global.scoreKills ++;
	
	instance_destroy(id);	
};