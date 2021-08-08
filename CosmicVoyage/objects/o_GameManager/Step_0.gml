// Check if game is running
switch (currentState) 
{
	// Singleplayer
    case GameState.Game:
		if(canSpawn) && o_Player._lives > 0
		{
	        if(!hasSpawned)
			{
				var index = random(10);
				if(index >= enemy_chanceUFO)
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
				alarm[1] = enemy_spawnRate;
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
				
				switch(currentLevel) // the spawning chances for UFOs, the higher the value, the less they spawn, and the lower the value, the more they spawn
					{
						case levelState.env_Space:		enemy_chanceUFO = 5; enemy_spawnRate = 125; break;
						case levelState.env_Asteroid:   enemy_chanceUFO = 8; enemy_spawnRate = 75; break;
						case levelState.env_Planet:		enemy_chanceUFO = 2; enemy_spawnRate = 75; break;
						case levelState.env_Warp:		enemy_chanceUFO = 10; break;
					};
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
		
		global.scoreTotal = global.scoreDist + (500 * (global.scoreKills))
        break;
	
	// Multiplayer
	case GameState.Multiplayer:
	    // code here
	    break;
}