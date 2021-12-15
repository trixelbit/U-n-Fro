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

currentLevel = levelState.env_Asteroid;
currentSkybox = spr_skybox_asteroids;
#macro LANE_RADIUS 256
global.count = 0;

goalInc = 5000; // the incerement to set the goal dist to 
goalDist = goalInc;


// level order (array)
levelArray = [ levelState.env_Space, levelState.env_Asteroid, levelState.env_Planet, levelState.env_Planet ]
lvlCounter = 0

// transitions
levelTrans = false;
gameStart = false;
gameCountdown = 0;

// enemy spawning chances
enemy_chanceUFO = 3;
enemy_spawnRate = 220;

fadeOut = 0;

#region Rand Spawner Initialization
// @description: 
yDisplacement = 0;
rate_empty = new rate(100,0, 0, SpawnObject.empty );
rate_ufo = new rate(10,0, 0, SpawnObject.ufo );
rate_heart = new rate(5,0, 0, SpawnObject.heart );
rate_asteroid = new rate(30,0, 0, SpawnObject.asteroid);
rate_boost = new rate(5,0, 0, SpawnObject.boost);
rate_bullet = new rate(5,0, 0, SpawnObject.bullet);

rates = [rate_empty, rate_ufo, rate_heart, rate_asteroid, rate_boost, rate_bullet];
rate_sum = 0;

for(var i = 0; i < array_length(rates); i++)
{
	rates[i].start = rate_sum;
	rate_sum += rates[i].val;
	rates[i].finish = rate_sum;	
}

/*
@description: Recalculates respawn rates
@param: _arr An array of spawn point values in order of: {empty, ufo, heart, asteroid}
*/
function recalculateRates(_arr)
{
	rate_sum = 0;
	for(var i = 0; i < array_length(rates); i++)
	{
		rates[i].val = _arr[i];
		
		rates[i].start = rate_sum;
		rate_sum += rates[i].val;
		rates[i].finish = rate_sum;	
	}
}

/*
@description: Generates random number from 0 to rate_sum and selects object from list. 
@returns: SpawnObject enum of selected object to spawn
*/
function selectObjectToSpawn()
{
	var selection = random_range(0, rate_sum);
	
	for(i = 0; i < array_length(rates); i++)
	{
		if(rates[i].start <= selection and rates[i].finish > selection)
		{
			return rates[i].object;
		}
	}
}




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
m_PlayerShip = LoadObj("m_player_ship.obj",vertex_create_buffer());
m_EnemyDrone = LoadObj("m_enemy_drone.obj",vertex_create_buffer());

// test model
m_testCube = LoadObj("m_cube.obj",vertex_create_buffer());
m_testBeam = LoadObj("m_beam.obj",vertex_create_buffer());
m_testTube = LoadObj("m_tube.obj",vertex_create_buffer());
m_testStrut = LoadObj("m_strut.obj",vertex_create_buffer());

// the intro text
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
charProg = view_wport[0];

// Skybox model
skyboxBuff = LoadObj("m_sky_plane.obj",vertex_create_buffer())

// hanger model
m_Hangar = LoadObj("m_hangar.obj",vertex_create_buffer());
m_HangarScreen = LoadObj("m_hangar_screen.obj",vertex_create_buffer())
t_skybox = sprite_get_texture(spr_skybox_space,0);
s_screen = surface_create(1024,512)
// palettes

pal_Main = palette_Create(make_color_rgb(255,194,147),
						  make_color_rgb(255,109,132),
						  make_color_rgb(184,56,130 ),
						  make_color_rgb(93,35,91   ));
							  
pal_GameBoy = palette_Create(make_color_rgb(136,220,60 ),
			   				 make_color_rgb(58,170,106 ),
							 make_color_rgb(76,103,120 ),
							 make_color_rgb(37,75,73   ));
				
pal_Frost = palette_Create(make_color_rgb(151,250,255), 			
						   make_color_rgb(15,133,255 ),
						   make_color_rgb(56,73,184  ),
						   make_color_rgb(0,35,82   ));
						   
pal_Main2 = palette_Create(make_color_rgb(255,194,147),
						   make_color_rgb(190,120,147),
						   make_color_rgb(154,93,146),
						   make_color_rgb(36,35,93))
	

// palette colors
global.keyCol1 = pal_Main[0];
global.keyCol2 = pal_Main[1];
global.keyCol3 = pal_Main[2];
global.keyCol4 = pal_Main[3];

global.dstCol1 = pal_Main[0];
global.dstCol2 = pal_Main[1];
global.dstCol3 = pal_Main[2];
global.dstCol4 = pal_Main[3];

// shader uniforms

#macro sCol1 shader_get_uniform(sh_Palette,"u_KeyCol1")
#macro sCol2 shader_get_uniform(sh_Palette,"u_KeyCol2")
#macro sCol3 shader_get_uniform(sh_Palette,"u_KeyCol3")
#macro sCol4 shader_get_uniform(sh_Palette,"u_KeyCol4")

#macro dCol1 shader_get_uniform(sh_Palette,"u_SetCol1")
#macro dCol2 shader_get_uniform(sh_Palette,"u_SetCol2")
#macro dCol3 shader_get_uniform(sh_Palette,"u_SetCol3")
#macro dCol4 shader_get_uniform(sh_Palette,"u_SetCol4")


palette_Swap(pal_Main2) // the palette to start the game with