// Player Properties
lives = 3;

// Instance camera
camera = instance_create_layer(x, (y + 100), "Camera", o_Camera);
camera.z = 0;
camera.targetObject = self;

// Movement
targetX = x;
currentLane = 0;

// For Multiplayer
isPlayerOne = true;

// For Debug
isDebug = false;