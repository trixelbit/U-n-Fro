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





if(currentLane != o_Player.currentLane)
{
	if(pursue)
	{
	currentTROT = o_Player.currentLane*laneDegree;
	if currentMROT > 359 || currentMROT < 0	
		{
			currentMROT = wrap(currentMROT,0,359);
			currentTROT = o_Player.currentLane*laneDegree;
		}
	
	
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


	pursue = false; 
	
}
currentRot = point_direction(256,256,x,z)
currentMROT = lerp(currentMROT,currentTROT,0.075);
	
	z = 256+lengthdir_y(256,currentMROT);
	x = 256+lengthdir_x(256,currentMROT);
	
//if(y = targetObject.y - max_player_distance)
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
	vfx.z = z;
	instance_destroy(id);	
};