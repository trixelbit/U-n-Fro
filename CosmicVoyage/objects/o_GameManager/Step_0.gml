// Check if game is running
switch (currentState) 
{
	// Singleplayer
    case GameState.Game:
		if(canSpawn)
		{
	        if(!hasSpawned)
			{
				var index = random(10);
				if(index >= 5)
				{
					show_debug_message("UFO");
					instance_create_layer(256 + choose(-128,128,0), o_Player.y - 2048, "Instances", o_EnemyUFO);
				}
				else
				{
					show_debug_message("Asteroid");
					instance_create_layer(256 + choose(-128,128,0), o_Player.y - 2048, "Instances", o_Asteroid);
				}
	
				hasSpawned = true;
				alarm[1] = 300;
			}
		}
        break;
	
	// Multiplayer
	case GameState.Multiplayer:
	    // code here
	    break;
}