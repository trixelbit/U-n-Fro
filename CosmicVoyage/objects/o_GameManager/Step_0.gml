// Check if game is running
switch (currentState) 
{
	// Singleplayer
    case GameState.Game:

		if o_Player.y < -200 && o_Player._lives > 0
		{
			space_increment = 200;
			yDisplacement += o_Player.finalSpd;
			

			if(yDisplacement > space_increment)
			{
				yDisplacement = 0;
				var spawnObject = selectObjectToSpawn();
				
				
				switch(spawnObject)
				{
					case SpawnObject.ufo:
						if(instance_number(o_EnemyUFO) < 3)
						{
							eID = instance_create_layer(0, o_Player.y - spawnDist, "Instances", o_EnemyUFO);
							eID.currentLane = irandom(11);
							
						}
					break;
					
					case SpawnObject.asteroid:
						var eID = instance_create_layer(0, o_Player.y - spawnDist, "Instances", o_Asteroid);
						eID.currentAsteroid = asteroidTypes.single
						eID.currentLane = irandom(11);
						// the asteroid property assignment 'table'

					break;
					
					case SpawnObject.heart:
						//instance_create_layer(256 + choose(-120,120,0), o_Player.y - spawnDist, "Instances", o_item_heart);
					break;
					
					case SpawnObject.bullet:
						//instance_create_layer(256 + choose(-120,120,0), o_Player.y - spawnDist, "Instances", o_item_bullet);
					break;
					
					case SpawnObject.boost:
						//instance_create_layer(256 + choose(-120,120,0), o_Player.y - spawnDist, "Instances", o_item_boostpad);
					break;
					
				}
			}

			#region Old Spawn
			/*
	        if(!hasSpawned)
			{
				/*
				var index = random(10);
				if(index >= enemy_chanceUFO and instance_number(o_EnemyUFO) <= 3)
				{
					show_debug_message("UFO");
					instance_create_layer(256 + choose(-128,128,0), o_Player.y - spawnDist, "Instances", o_EnemyUFO);
				}
				else
				{
					var eID = instance_create_layer(256, o_Player.y - spawnDist, "Instances", o_Asteroid);
					eID.currentAsteroid = asteroidTypes.single
					var eLane = eID.currentLane;
					var eRow = eID.currentRow;
					var eLen = eID.laneLength;
					var eHgt = eID.rowHeight;
					// the asteroid property assignment 'table'
					switch(eID.currentAsteroid)
						{
							case asteroidTypes.single: eLane = choose(1,0,-1); eRow = 0; eID.x = 256 + (128*eLane); eLen = 1; eHgt = 1 break;
						};	
				}
	
				hasSpawned = true;
				alarm[1] = enemy_spawnRate;
			}*/#endregion
		}
		// level switches
		
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
				case levelState.env_Space:		enemy_chanceUFO = 3; enemy_spawnRate = 220; break;
				case levelState.env_Asteroid:   enemy_chanceUFO = 8; enemy_spawnRate = 70; break;
				case levelState.env_Planet:		enemy_chanceUFO = 2; enemy_spawnRate = 120; break;
				case levelState.env_Warp:		enemy_chanceUFO = 10; break;
			};
			switch(currentLevel)
			{
				case levelState.env_Space:	
				currentSkybox = spr_skybox_space;
				palette_Swap(pal_Main2)
				break;
				
				case levelState.env_Planet:
				currentSkybox = spr_skybox_sky;
				palette_Swap(pal_Main2)
				break;
				
				case levelState.env_Asteroid: 	
				currentSkybox = spr_skybox_asteroids;
				palette_Swap(pal_Main2)
				break;
				
				case levelState.env_Warp:	
				currentSkybox = spr_skybox_sky;
				palette_Swap(pal_GameBoy)
				break;
			}
		}
		
		
		
		// changes the environment based on the level
		// this will eventually include, skyboxes, palletes, and potentially songs? 
		
		
		global.scoreTotal = global.scoreDist + (500 * (global.scoreKills))
        break;
	
	// Multiplayer
	case GameState.Multiplayer:
	    // code here
		if global.gameOver == false
			{
		if o_Player.y < -200 && o_Player._lives > 0
		{
			space_increment = 200;
			yDisplacement += o_Player.finalSpd;
			
			
			if(yDisplacement > space_increment)
				{
					yDisplacement = 0;
					var spawnObject = selectObjectToSpawn();
					
					
					switch(spawnObject)
						{
							case SpawnObject.ufo:
								if(instance_number(o_EnemyUFO) < 3)
									{
										instance_create_layer(256 + choose(-128,128,0), o_Player.y - spawnDist, "Instances", o_EnemyUFO);
									}
							break;
							
							case SpawnObject.asteroid:
								var eID = instance_create_layer(256, o_Player.y - spawnDist, "Instances", o_Asteroid);
								eID.currentAsteroid = asteroidTypes.single
								var eLane = eID.currentLane;
								var eRow = eID.currentRow;
								var eLen = eID.laneLength;
								var eHgt = eID.rowHeight;
								// the asteroid property assignment 'table'
								if currentState == GameState.Game
									{
										switch(eID.currentAsteroid)
											{
												case asteroidTypes.single: eLane = choose(1,0,-1); eRow = 0; eID.x = 256 + (128*eLane); eLen = 1; eHgt = 1 break;
											}
									}
									
								if currentState == GameState.Multiplayer
									{
										switch(eID.currentAsteroid)
											{
												case asteroidTypes.single: eLane = choose(1,0,-1); eRow = 0; eID.x = 256 + (64*eLane); eLen = 1; eHgt = 1 break;
											}
									}
							
							break;
							
							case SpawnObject.heart:
								instance_create_layer(256 + choose(-120,120,0), o_Player.y - spawnDist, "Instances", o_item_heart);
							break;
							
							case SpawnObject.bullet:
								instance_create_layer(256 + choose(-120,120,0), o_Player.y - spawnDist, "Instances", o_item_bullet);
							break;
							
							case SpawnObject.boost:
								instance_create_layer(256 + choose(-120,120,0), o_Player.y - spawnDist, "Instances", o_item_boostpad);
							break;
							
						}
			}
		
		}
			};


		
	    break;
}