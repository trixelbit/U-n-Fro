/// @description Insert description here
// Good huntin' to ya ^^
//ufoBuff = LoadObj("m_asteroid.obj");
_lives = 3;
fireTick = 0;
alarm[0] = 100;
alarm[1] = 1800;
spd = 1;

currentLane = irandom(11);
laneDegree = 360/12
currentRot = currentLane*laneDegree;
currentMROT =  currentLane*laneDegree;



targetX = 256+lengthdir_x(256,currentLane*laneDegree)
targetZ = 256+lengthdir_y(256,currentLane*laneDegree)
z = targetZ;
x = targetX; 


max_player_distance = random_range(500,700 )
movement_xspeed = random_range(2, 3.5 )
acceleration = random_range(.15, .4);
targetObject = o_Player.id;	
pursue = true;
pursueAlarmSet = false;

if o_GameManager.currentState == GameState.Multiplayer
	{
		targetObject = choose(o_GameManager.p1,o_GameManager.p2);	
	}
