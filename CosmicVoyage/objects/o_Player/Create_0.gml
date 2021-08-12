// Player Properties
_lives = 3;

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

// For Debug
isDebug = false;

// Scoring
flashTick = 0;
oldKills = 0;
newScore = 0;
currentRow = 0;

// skybox code
fadeIn = 0;
maxFade = 255;