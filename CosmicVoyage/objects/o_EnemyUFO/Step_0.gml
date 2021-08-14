/// @description Insert description here
// Good huntin' to ya ^^


distance = distance_to_point(x, targetObject.y);
// Move until in player range
if(distance > max_player_distance)
{
	y = lerp(y, targetObject.y - max_player_distance, 0.05);
}
else
{
	y = targetObject.y - max_player_distance;
}

// Lerp to player X
/*if(targetX != x)
{
	x = lerp(x, targetX, 0.05);
}*/
if(abs(targetObject.x - x) > movement_xspeed * 1.5 )
{
	if(pursue)
	{
		hspeed = x > targetObject.x ? lerp(hspeed, -movement_xspeed, acceleration): lerp(hspeed, movement_xspeed, acceleration);
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
	x = lerp(x, targetObject.x, .5);
	pursue = false; 
	
}

if(y = targetObject.y - max_player_distance)
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
	if(targetObject.hasSimone)
	{
		global.scoreKills += 2;
	}
	else
	{
		global.scoreKills ++;
	}
	audio_play_sound(sfx_crash,1,0);
	var vfx = instance_create_layer(x, y - 10, "Instances", o_vfx_enemyhit);
	instance_destroy(id);	
};