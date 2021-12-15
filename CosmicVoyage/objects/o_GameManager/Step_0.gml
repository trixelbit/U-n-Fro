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
					/*
					if currentLevel != levelState.env_Planet
						{
							var eID = instance_create_layer(0, o_Player.y - spawnDist, "Instances", o_Asteroid);
							eID.currentAsteroid = asteroidTypes.single
							eID.currentLane = irandom(11);
							// the asteroid property assignment 'table'
						}
					*/
					eID = instance_create_layer(0, o_Player.y - spawnDist, "Instances", o_Blocker);
					eID.currentBlocker = blockerTypes.strut
					if eID.currentBlocker == blockerTypes.cliff && currentLevel != levelState.env_Planet
						{
							eID.currentBlocker = blockerTypes.cube;	
						}
					eID.currentLane = irandom(11);
					

					break;
					
					case SpawnObject.heart:
						var eID = instance_create_layer(256, o_Player.y - spawnDist, "Instances", o_item_heart);
						eID.currentLane = irandom(11)
					break;
					
					case SpawnObject.bullet:
						//instance_create_layer(256 + choose(-120,120,0), o_Player.y - spawnDist, "Instances", o_item_bullet);
					break;
					
					case SpawnObject.boost:
						//instance_create_layer(256 + choose(-120,120,0), o_Player.y - spawnDist, "Instances", o_item_boostpad);
					break;
					
				}
			}

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
				break;
				
				case levelState.env_Planet:
				currentSkybox = spr_skybox_sky;
				break;
				
				case levelState.env_Asteroid: 	
				currentSkybox = spr_skybox_asteroids;
				break;
				
				case levelState.env_Warp:	
				currentSkybox = spr_skybox_sky;
				break;
			}
		}
		
		
		
		// changes the environment based on the level
		// this will eventually include, skyboxes, palletes, and potentially songs? 
		
		
		global.scoreTotal = global.scoreDist + (500 * (global.scoreKills))
        break;

}