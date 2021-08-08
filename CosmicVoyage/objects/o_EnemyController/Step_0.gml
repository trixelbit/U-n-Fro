/// @description Insert description here
// Good huntin' to ya ^^

if(!hasSpawned)
{
	var index = random(10);
	if(index >= 5)
	{
		show_debug_message("UFO");
		instance_create_layer(256 + choose(-128,128,0), o_Player.y - spawnDist, "Instances", o_EnemyUFO);
	}
	else
	{
		show_debug_message("Asteroid");
		instance_create_layer(256 + choose(-128,128,0), o_Player.y - spawnDist, "Instances", o_Asteroid);
	}
	
	hasSpawned = true;
	alarm[0] = 300;
}