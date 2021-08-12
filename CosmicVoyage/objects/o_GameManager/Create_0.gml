// Current State of the Game
gpu_set_tex_filter(false)
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
enemy_spawnRate = 300;

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

// Model Loading


	vertex_format_begin()
	vertex_format_add_position_3d()
	vertex_format_add_color()
	vertex_format_add_texcoord()
	vertex_format_add_normal()
	 objFormat = vertex_format_end();

// Asteroids
m_AstSng = LoadObj("m_asteroid.obj",vertex_create_buffer());
m_AstRow = LoadObj("m_asteroid_row.obj",vertex_create_buffer());
m_AstCaw = LoadObj("m_asteroid_cwasant.obj",vertex_create_buffer());
m_AstCol = LoadObj("m_asteroid_column.obj",vertex_create_buffer());
// test model
m_testCube = LoadObj("m_cube.obj",vertex_create_buffer());

//sprite_get_texture(t_asteroid1,0); break;
rawText = "In a time of great expansion across the cosmos, there was a legendary\nwell reowned team of bounty hunters...#" 
+"There's Jobo, the arms and brawn of this well renowned team, a man with\nan impressive phyisque and... highly dangerous 'guns'#"
+"Coco, the engineer... a brilliant mind from the halls of academia,\nhowever due to some drama, she was ousted out of academia and now\nfinds refugee in the bounty hunting business.#"
+"Simone, the accountant... Once had a great job, wonderful family and\nan all around good life...until he was framed in a scandal and\nbecame a criminal in many systems. Yet, he managed to make a\ndeal with the team with helping them avoid taxes.#"
+"Bunbi, the navigator... a veteran luxury cruiser captain, and the\nleader of this team, she decided to go into the business not for any\nserious reason but because she was bored of her\njob and wanted more action in her life.#"+
"and finally Kat, the newest of the crew! A fresh recruit just boarded\non to perform mission critical tasks like...\ncleaning up the ship's hallways and systems.#"
+"One day, the WiFi on the ship suddenly goes out, annoyed that their\nintake of fresh cat videos ceased, they go orbit a planet\nin hopes of finding another WiFi signal...#"
+"A UFO suddenly comes out of the blue, begins to pull the ship in...#"
+"Alarms blare out, as the UFO not only pulled in the ship, \nbut the crew on board as well...#"
+"The crew had been all but sucked up except for Kat.\nwho had managed hold on for dear life amidst the chaos...#"
+"With the abduction concluding, she realizes that her\n mates had been kidnapped and decides to venture out to them...#"
+"And to bring justice to the aliens who had so ruthlessly taken her\n friends away without warning!"
storyText = StringSplit(rawText,"#")


// textboxes
txtCount = 0;
slideTime = 0;
introTextInd = 0;
introTexts = storyText
flavorText = introTexts[0];
introSlideInd = 0;
introSlides = [ spr_intro_1, spr_intro_2, spr_intro_3, spr_intro_4, spr_intro_5, spr_intro_6, spr_intro_7, spr_Intro_8, spr_Intro_9 ]
loopCount = 0;
introCharacters = [ spr_jobo, spr_coco, spr_simone, spr_bunbi ];
charCount = 0;
charProg = browser_width;
// Skybox model
skyboxBuff = LoadObj("m_plane.obj",vertex_create_buffer())

// hanger model
m_Hangar = LoadObj("m_hanger.obj",vertex_create_buffer());
t_skybox = sprite_get_texture(spr_skybox_space,0);