/// @description Insert description here
// Good huntin' to ya ^^


distance = distance_to_point(x, o_Player.id.y);
// Move until in player range
if(distance > max_player_distance)
{
	y = lerp(y, o_Player.id.y - max_player_distance, 0.05);
}
else
{
	y = o_Player.id.y - max_player_distance;
}

// Lerp to player X
/*if(targetX != x)
{
	x = lerp(x, targetX, 0.05);
}*/
if(abs(o_Player.x - x) > movement_xspeed * 1.5 )
{
	if(pursue)
	{
		hspeed = x > o_Player.x ? lerp(hspeed, -movement_xspeed, acceleration): lerp(hspeed, movement_xspeed, acceleration);
		pursueAlarmSet = false;
	}
	else if(!pursueAlarmSet)
	{
		alarm[3] = random_range(0,60)
		pursueAlarmSet = true
	}
	
}
else
{
	hspeed = 0;
	x = lerp(x, o_Player.x, .5);
	pursue = false; 
	
}

if(y = o_Player.id.y - max_player_distance)
{
	if fireTick <= 0
	{
		sprite_index = spr_enemy_shoot
		var proj = instance_create_layer(x, y - 10, "Instances", o_EnemyBullet);
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