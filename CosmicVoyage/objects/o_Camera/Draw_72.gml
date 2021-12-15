// Get camera for rendering
camera = camera_get_active();

// the distance to follow our target from.
xD = lengthdir_x(300,90)
yD = lengthdir_y(150,90);
currntTilt = lerp(currntTilt,targetTilt,0.05)
targetTilt = lerp(targetTilt,0,0.075)

// Enable z-testing
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

// Matrices for 3D perspective
// Small note here: Z- is world space up, so in short: Z+ down, Z- Up

if o_GameManager.currentState == GameState.Menu
	{
		projMat = matrix_build_projection_perspective_fov(fov, window_get_width() / window_get_height(), 1, 32000);
		lookMat = matrix_build_lookat(256 - xD, room_height - yD, -250-(0), 256, 300, 0, 0, 0, 1);
		if transCam == true
			{
				cuX = lerp(cuX,tgX,tSpeed)
				cuY = lerp(cuY,tgY,tSpeed)
				cuZ = lerp(cuZ,tgZ,tSpeed)
				cu2X = lerp(cu2X,tg2X,tSpeed)
				cu2Y = lerp(cu2Y,tg2Y,tSpeed)
				cu2Z = lerp(cu2Z,tg2Z,tSpeed)
				lookMat = matrix_build_lookat(cuX, cuY, cuZ, cu2X, cu2Y, cu2Z, 0, 0, 1);
			}
	}
else if o_GameManager.currentState == GameState.Game
	{
		if instance_exists(o_Player)
			{
				// Camera tilting code
				zUP = cos((o_Player.currentLane-3) / 12 * 2 * pi );
				xUP = cos((o_Player.currentLane) / 12 * 2 * pi );
				// this is the speed that the camera tilts at, 0.035 is default
				cZUP = lerp(cZUP,zUP,0.015);
				cXUP = lerp(cXUP,xUP,0.015);
				// the distance to track the player from
				camDist = 60;
			};
		
		projMat = matrix_build_projection_perspective_fov(fov, window_get_width() / window_get_height(), 1, 32000);
		lookMat = matrix_build_lookat((cXUP*-camDist)+targetObject.x - xD, targetObject.y - yD, ((cZUP*camDist)*-1)-(o_Player.z), (cXUP*-camDist)+targetObject.x, targetObject.y, ((cZUP*camDist)*-1)-(o_Player.z), cXUP, 0, cZUP);
	};
else
	{
		projMat = matrix_build_projection_perspective_fov(fov, window_get_width() / window_get_height(), 1, 32000);
		lookMat = matrix_build_lookat(256 - xD, room_height - yD, -50-(0), 256, 300, -0-(0), 0, 0, 1);
	}

	
// Set perspective viewpoint
camera_set_proj_mat(camera, projMat);

// Set view matrix
camera_set_view_mat(camera, lookMat);

// Clear buffer
draw_clear(c_BG3);

// Apply camera settings
camera_apply(camera);