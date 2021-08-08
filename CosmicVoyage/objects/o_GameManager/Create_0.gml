// Current State of the Game

enum GameState
{
	Intro,
	Game,
	Menu,
	Multiplayer,
}
currentState = GameState.Intro;

// setup for different enviroments/levels
enum levelState
	{
		env_Space,
		env_Planet,
		env_Warp,
		env_Asteroid
	}

currentLevel = levelState.env_Space;
currentSkybox = spr_skybox_space;

goalInc = 2500; // the incerement to set the goal dist to 
goalDist = goalInc;


// level order (array)
levelArray = [ levelState.env_Space, levelState.env_Asteroid, levelState.env_Space, levelState.env_Warp ]
lvlCounter = 0

// transitions
levelTrans = false;

// enemy spawning chances
enemy_chanceUFO = 5;
enemy_spawnRate = 125;

// Spawn players
if(currentState == GameState.Game)
{
	instance_create_layer(room_width/2, room_height, "Instances", o_Player);
}
else if currentState == GameState.Multiplayer
{
	var pOne = instance_create_layer(room_width/2, room_height, "Instances", o_Player);
	var pTwo = instance_create_layer(room_width/2, room_height, "Instances", o_Player);
	pTwo.isPlayerOne = false;
}

// Global variables
global.scoreKills = 0;
global.scoreDist = 0;
global.scoreTotal = 0;

// high score (just the last highest recorded score for now
scoreRecord = 0;
scoreArray = array_create(10,0)

// Is in Event?
inEvent = false;

// Spawn Delay
canSpawn = false;
hasSpawned = false;
alarm[0] = 300;

// Enemy Spawning Distance
spawnDist = 4096;

// Skybox model
skyboxBuff = LoadObj("m_skybox.obj")