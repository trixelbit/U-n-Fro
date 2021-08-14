// Player Properties
_lives = 3;
maxLives = 3;

maxBullets = 3;
currentBullets = 3;
bulletIncrementWindow = 60;

isInvincible = false;
invincTime = 1800;

hasJobro = false;
hasSimone = false;
hasBunbi = false;

// Instance camera
camera = instance_create_layer(x, (y + 100), "Camera", o_Camera);
camera.z = 0;
camera.targetObject = self;

// Movement
targetX = x;
currentLane = 0;
finalSpd = 0;
z = 0;
targetZ = z;

// For Multiplayer
isPlayerOne = true;
moveSize = 128-16;
if o_GameManager.currentState == GameState.Multiplayer
	{
	moveSize = 64;	
	};

// For Debug
isDebug = false;

// Scoring
flashTick = 0;
oldKills = 0;
newScore = 0;
currentRow = 0;

// MP
scoreP1 = 0;
scoreP2 = 0;
killsP1 = 0;
killsP2 = 0
global.gameOver = false;
global.winnerName = "Null"

// skybox code
fadeIn = 0;
maxFade = 255;



// uniforms

#macro sCol1 shader_get_uniform(sh_Palette,"u_KeyCol1")
#macro sCol2 shader_get_uniform(sh_Palette,"u_KeyCol2")
#macro sCol3 shader_get_uniform(sh_Palette,"u_KeyCol3")
#macro sCol4 shader_get_uniform(sh_Palette,"u_KeyCol4")

#macro dCol1 shader_get_uniform(sh_Palette,"u_SetCol1")
#macro dCol2 shader_get_uniform(sh_Palette,"u_SetCol2")
#macro dCol3 shader_get_uniform(sh_Palette,"u_SetCol3")
#macro dCol4 shader_get_uniform(sh_Palette,"u_SetCol4")

