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
					var eID = instance_create_layer(256, o_Player.y - spawnDist, "Instances", o_Asteroid);
					eID.currentAsteroid = choose(asteroidTypes.single,asteroidTypes.row,asteroidTypes.column,asteroidTypes.cwasant);
					var eLane = eID.currentLane;
					var eRow = eID.currentRow;
					var eLen = eID.laneLength;
					var eHgt = eID.rowHeight;
					// the asteroid property assignment 'table'
					switch(eID.currentAsteroid)
						{
							case asteroidTypes.single: eLane = choose(1,0,-1); eRow = 0; eID.x = 256 + (128*eLane); eLen = 1; eHgt = 1 break;
							case asteroidTypes.row   : eID.x = 256; currentLane = 0; currentRow = choose(0,1); eLen = 3; eHgt = 1; break;
							case asteroidTypes.column: eLane = choose(1,0,-1); eRow = 0; eID.x = 256 + (128*eLane); eLen = 1; eHgt = 2; break;
							case asteroidTypes.cwasant: eLane = 0; eRow = 0; eID.x = 256; eLen = 3; eHgt = 2; break;
						};
						


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
						case levelState.env_Space:		enemy_chanceUFO = 5; enemy_spawnRate = 20; break;
						case levelState.env_Asteroid:   enemy_chanceUFO = 8; enemy_spawnRate = 20; break;
						case levelState.env_Planet:		enemy_chanceUFO = 2; enemy_spawnRate = 20; break;
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