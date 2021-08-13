// Current State of the Game
audio_play_sound(intro_music,1,1)
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
enemy_chanceUFO = 3;
enemy_spawnRate = 220;

#region Spawn Rates
rate_ufo = 50;
rate_heart = 2;
rate_asteroid = 30;
rate_boost = 20;


#endregion


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
rawText = "In a time of great expansion across the cosmos, there was\na legendary team of bounty hunters... #" 
+"There's Jobo, the arms and brawn of the team, with an impressive \nphyisque and... highly dangerous 'guns'#"
+"Coco, the engineer... a brilliant mind from the halls of academia,\nnow finds refuge in the bounty hunting business.#"
+"Simone, the accountant... Once held a prestigious job until he was\nframed in a scandal and became a criminal over night.#"
+"Bunbi, the navigator... a veteran luxury cruiser captain. Bunbi\n became a bounty hunter not out of need, but out of sheer boredom.#"+
"and finally Kat, the newest of the crew! A fresh recruit brought on \nto perform extremely important and challenging tasks like... \ncleaning up the ship.#"
+"One day, while sitting in orbit..#"
+"a UFO suddenly warped over head...#"
+"Alarms blared out, as the UFO not only pulled in the ship, but the \ncrew on board as well...#"
+"The crew had been all but sucked up except for Kat, who held on \nfor dear life...#"
+"With the abduction concluding, and the realization that her crew \nwas gone, she brought it onto herself to find her friends...#"
+"and to bring justice to the aliens who had so ruthlessly taken them!"
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