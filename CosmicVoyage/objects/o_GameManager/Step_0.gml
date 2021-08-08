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
					instance_create_layer(256 + choose(-128,128,0), o_Player.y - spawnDist, "Instances", o_EnemyUFO);
				}
				else
				{
					show_debug_message("Asteroid");
					instance_create_layer(256 + choose(-128,128,0), o_Player.y - spawnDist, "Instances", o_Asteroid);
				}
	
				hasSpawned = true;
				alarm[1] = 300;
			}
		}
		// level switches
		// to-do: check in with trix about the order of levels
		if global.scoreDist >= goalDist
			{
			lvlCounter ++;
			lvlCounter = wrap(lvlCounter, 0, 3);
			currentLevel = levelArray[lvlCounter]
			goalDist = global.scoreDist + goalInc;
			levelTrans = true;
			fadeOut = 0.0;
			canSpawn = false;
			};

		
		
		// changes the environment based on the level
		// this will eventually include, skyboxes, palletes, and potentially songs? 
		switch(currentLevel)
			{
				case levelState.env_Space   :	break;
				case levelState.env_Planet  :	break;
				case levelState.env_Asteroid: 	break;
				case levelState.env_Warp    :	break;
			};
		
		
        break;
	
	// Multiplayer
	case GameState.Multiplayer:
	    // code here
	    break;
}