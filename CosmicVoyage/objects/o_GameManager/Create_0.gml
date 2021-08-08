// Current State of the Game
enum GameState
{
	Game,
	Multiplayer,
}
currentState = GameState.Game;

// Spawn players
if(currentState == GameState.Game)
{
	instance_create_layer(room_width/2, room_height, "Instances", o_Player);
}
else
{
	var pOne = instance_create_layer(room_width/2, room_height, "Instances", o_Player);
	var pTwo = instance_create_layer(room_width/2, room_height, "Instances", o_Player);
	pTwo.isPlayerOne = false;
}

// Global variables
global.scoreKills = 0;
global.scoreDist = 0;

// Is in Event?
inEvent = false;

// Spawn Delay
canSpawn = false;
hasSpawned = false;
alarm[0] = 300;