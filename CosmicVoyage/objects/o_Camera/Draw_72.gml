// Get camera for rendering
camera = camera_get_active();

// the distance to follow our target from.
xD = lengthdir_x(300,90)
yD = lengthdir_y(150,90);
currntTilt = lerp(targetTilt,0,0.075)
targetTilt = lerp(targetTilt,0,0.075)

// Enable z-testing
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

// Matrices for 3D perspective
// Small note here: Z- is world space up, so in short: Z+ down, Z- Up

projMat = matrix_build_projection_perspective_fov(60, window_get_width() / window_get_height(), 1, 32000);
lookMat = matrix_build_lookat(targetObject.x - xD, targetObject.y - yD, -50-(o_Player.z), targetObject.x, targetObject.y, -50-(o_Player.z), currntTilt, 0, 1);

// Set perspective viewpoint
camera_set_proj_mat(camera, projMat);

// Set view matrix
camera_set_view_mat(camera, lookMat);

// Clear buffer
draw_clear(c_black);

// Apply camera settings
camera_apply(camera);