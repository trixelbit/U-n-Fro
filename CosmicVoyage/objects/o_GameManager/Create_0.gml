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
// textboxes
txtCount = 0;
slideTime = 0;
introTextInd = 0;
introTexts = [ "Once upon a time, there was a bunch of nerds, who came together...\nThey were pretty stinky and smelly.", "Until one day they had their wifi shit broke, \nso they went out and they walked into their ship, rolls of fat shaking\n the ground quaked under their small feet and massive bellies.", "Hello My Name is Kieron and i cope by shitting peeing myself :(((", "They flew and shit, lookin' at Virgin Chad vs Chad Virgin memes \nthey done took a wrong turn somewhere...", "oh no they get SUCC'd, evil mark ZUCCKERBERG strikes again!", "[screaming sounds]", "[AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA]" ];
flavorText = introTexts[0];
introSlideInd = 0;
introSlides = [ spr_intro_1, spr_intro_2, spr_intro_3, spr_intro_4, spr_intro_5, spr_intro_6, spr_intro_7 ]
	
// Skybox model
skyboxBuff = LoadObj("m_skybox.obj",vertex_create_buffer())

// hanger model
m_Hangar = LoadObj("m_hanger.obj",vertex_create_buffer());
